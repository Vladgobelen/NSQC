local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
local myNome = GetUnitName("player")
if testQ[myNome]["инст_начат"] == nil and string.find (message, "#npcOff") then
	testQ[myNome]["нельзя_стартовать"] = 1

end
if testQ[myNome]["инст_начат"] == nil and string.find (message, "#npcDie") then
	testQ[myNome]["нельзя_стартовать"] = 1

end

if string.find (message, "#dNm") then
	myNome = GetUnitName("player")
	if pM(sender) == 1 or sender == myNome then
		if dnStart ~= nil then
			dnStart = dnStart + 1
		end
		if pMnum ~=nil then
			if dnStart >= pMnum then
				testQ[myNome]["инст_начат"] = 1
				numMobI = GetInstanceInfo()
				mobKNum = mmList[numMobI]["количество_мобов"]
				WatchFrame:Hide()
				testQ[myNome]["проверка_завершения"] = 0
				btnMM[2]:SetText(mmList[numMobI]["количество_мобов"])
				local myNome = GetUnitName("player")
				hshChiavi=hshSenderNomeC(myNome)
			end
		end
	end
end


end)
testInf=0
btnMM = {}
local myNome = GetUnitName("player")
function btnMM:configure(id,posex,posey,sizex,sizey,zzid,message)
    self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
    if id ~= 99 then
		self[id]:SetPoint("TOPLEFT", WatchFrame, "TOPLEFT",posex, posey)
    else
		self[id]:SetPoint("CENTER",posex, posey)
    end
    self[id]:SetSize(sizex, sizey)
    self[id]:Hide();
    self[id]:SetScript("OnClick",function(self, button)
		if id == 1 then
			if testInf == 0 then
				if testQ[myNome]["зона_старта"] ~= nil then
					local inst = testQ[myNome]["зона_старта"]
					print (inst .. " fdsa")
					btnMM[1]:SetText(inst)
					bossNum = mmList[inst]["количество_боссов"]
					testNpc(mmList[inst]["testNpc"])
					btnMM[2]:Show()
					for i = 3, bossNum+2 do
						j=i-2
						j = tostring(j)
						btnMM[i]:SetText(mmList[inst][j])
						btnMM[i]:Show()

					end
				end
				testInf=1
			else
				for i=2,10 do
					if btnMM[i] ~= nil then
						btnMM[i]:Hide()
					end
				end
				testInf=0
			end
		end
		if id == 99 then
			testGroupNum = GetNumPartyMembers()
			if testGroupNum == 0 then
				testQ[myNome]["инст_начат"] = 1
				numMobI = GetInstanceInfo()
				mobKNum = mmList[numMobI]["количество_мобов"]
				WatchFrame:Hide()
				testQ[myNome]["проверка_завершения"] = 0
				btnMM[2]:SetText(mmList[numMobI]["количество_мобов"])
				local myNome = GetUnitName("player")
				hshChiavi=hshSenderNomeC(myNome)
			else
				SendAddonMessage("NSGadd", "#dNm", "guild")
				if dnStart == nil then
					dnStart = 0
				end
				partyStart = 1
				pMnum = GetNumPartyMembers()
				pMnum = pMnum+1
				btn[99]:Hide()
			end
		end
    end)
end

btnMM:configure(1,0,0,200,30,"#zzs","");
btnMM:configure(2,0,-30,200,30,"#zzs","");
btnMM:configure(3,0,-60,200,30,"#zzs","");
btnMM:configure(4,0,-90,200,30,"#zzs","");
btnMM:configure(5,0,-120,200,30,"#zzs","");
btnMM:configure(6,0,-150,200,30,"#zzs","");
btnMM:configure(7,0,-180,200,30,"#zzs","");
btnMM:configure(8,0,-210,200,30,"#zzs","");
btnMM:configure(9,0,-240,200,30,"#zzs","");
btnMM:configure(10,0,-270,200,30,"#zzs","");
btnMM:configure(99,0,100,100,50,"#zzs","СТАРТ");

local UpdateSpeed = 0.01
local f = CreateFrame("Frame")

f.UpdateSpeed = UpdateSpeed
f:SetScript("OnUpdate", function(self, elapsed)
	self.UpdateSpeed = self.UpdateSpeed - elapsed
	if self.UpdateSpeed > 0 then
		return
	end
	self.UpdateSpeed = UpdateSpeed

	testGroupNum = GetNumPartyMembers()
	testMM = GetInstanceInfo()
	if mmList[testMM] ~= nil then

		testQ[myNome]["chiavi"] = testMM
		testQ[myNome]["groupNum"] = testGroupNum

		local x,y = GetPlayerMapPosition("player")
		local mioX = mmList[testMM]["x"]
		mioX = tonumber(mioX)
		local mioY = mmList[testMM]["y"]
		mioY = tonumber(mioY)
		local rasstoyanieSch=sqrt((mioX-x)^2+(mioY-y)^2)
		if rasstoyanieSch < 0.01 and testQ[myNome]["инст_начат"] == nil then
			testQ[myNome]["зона_старта"] = mmList[testMM]["название"]
			btnMM[1]:Show()
			btnMM[1]:SetText(testQ[myNome]["зона_старта"])

		else
			testQ[myNome]["зона_старта"] = nil
			btnMM[1]:Hide()

		end

	else
		testQ[myNome]["chiavi"] = nil
		testQ[myNome]["groupNum"] = nil
		testQ[myNome]["инст_начат"]=nil
		testQ[myNome]["нельзя_стартовать"]=nil
		testQ[myNome]["время_кнопки"] = nil
		btnMM[1]:Hide()
		partyStart = nil
		dnStart = 0
	end

	if WorldMapFrameSizeDownButton:IsVisible() then
	else
		if btnMM[1]:IsVisible() and testQ[myNome]["инст_начат"] ~= nil then
			WatchFrame:Hide()
		elseif btnMM[1]:IsVisible() == nil and testQ[myNome]["инст_начат"] == nil then
			btnMM[99]:Hide()
			for i=2,10 do
				if btnMM[i] ~= nil then
					btnMM[i]:Hide()
				end
				testInf=0
			end
			partyStart = nil
			testQ[myNome]["chiavi"] = nil
			testQ[myNome]["groupNum"] = nil
			testQ[myNome]["инст_начат"]=nil
			testQ[myNome]["нельзя_стартовать"]=nil
			testQ[myNome]["время_кнопки"] = nil
			partyStart = nil
			dnStart = 0
		end
	end

	if WorldMapFrameSizeDownButton:IsVisible() then
	else
		if btnMM[2]:IsVisible() and testQ[myNome]["нельзя_стартовать"] == nil and partyStart ~= 1 then
			btnMM[99]:Show()
			btnMM[99]:SetText("СТАРТ")
		else
			btnMM[99]:Hide()
		end
	end

	if WorldMapFrameSizeDownButton:IsVisible() then
	else
		if btnMM[1]:GetText() ~= testMM and btnMM[2]:IsVisible() == nil then
			if testQ[myNome]["нельзя_стартовать"] == nil then
				testQ[myNome]["chiavi"] = nil
				testQ[myNome]["groupNum"] = nil
				testQ[myNome]["инст_начат"]=nil
				testQ[myNome]["нельзя_стартовать"]=nil
				testQ[myNome]["время_кнопки"] = nil
				btnMM[1]:Hide()
				partyStart = nil
			end
		end
	end

	if testQ[myNome]["инст_начат"] == 1 then
		btnMM[99]:Hide()
		testInf=1
		btnMM[1]:Show()
		if testQ[myNome]["инст_время"] == nil then
			testQ[myNome]["инст_время"] = time()
			timeMMtestI = GetInstanceInfo()
			testQ[myNome]["время_кнопки"] = mmList[timeMMtestI]["время_прохождения_1"]
		end
		curTime = time()
		curTime = curTime - testQ[myNome]["инст_время"]
		btnTime = testQ[myNome]["время_кнопки"] - curTime

		btnMM[1]:SetText(btnTime)
	elseif testQ[myNome]["инст_начат"] == nil then
		testQ[myNome]["инст_время"] = nil
	end

	if mobKNum ~= nil then
		if mobKNum <= 0 then
			btnMM[2]:Disable()
			if testQ[myNome]["проверка_завершения"] ~= nil then
				testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
			end
		end
	end

	if btnTime == 0 then
		testMM = GetInstanceInfo()
		if testQ[myNome]["проверка_завершения"] == mmList[testMM]["успешно"] then
			SendChatMessage(hshChiavi .. " " .. testMM .. ": пройдено за " .. curTime .. " секунд", "guild", nil, 1);
			testQ[myNome]["chiavi"] = nil
			testQ[myNome]["groupNum"] = nil
			testQ[myNome]["инст_начат"]=nil
			testQ[myNome]["нельзя_стартовать"]=nil
			testQ[myNome]["время_кнопки"] = nil
			btnMM[1]:Hide()
			btnTime = 999999
			testQ[myNome]["проверка_завершения"] = nil
			partyStart = nil
			dnStart = 0
		else
			testQ[myNome]["chiavi"] = nil
			testQ[myNome]["groupNum"] = nil
			testQ[myNome]["инст_начат"]=nil
			testQ[myNome]["нельзя_стартовать"]=nil
			testQ[myNome]["время_кнопки"] = nil
			btnMM[1]:Hide()
			btnTime = 999999
			testQ[myNome]["проверка_завершения"] = nil
			partyStart = nil
			dnStart = 0
			SendChatMessage(testMM .. ": попытка провалилась", "guild", nil, 1);
		end

	end
	testMM = GetInstanceInfo()
	if mmList[testMM] ~= nil then
		if testQ[myNome]["проверка_завершения"] == mmList[testMM]["успешно"] then
			if btnTime > 0 then
				SendChatMessage(hshChiavi .. " " .. testMM .. ": пройдено за " .. curTime .. " секунд", "guild", nil, 1);
				testQ[myNome]["chiavi"] = nil
				testQ[myNome]["groupNum"] = nil
				testQ[myNome]["инст_начат"]=nil
				testQ[myNome]["нельзя_стартовать"]=nil
				testQ[myNome]["время_кнопки"] = nil
				btnMM[1]:Hide()
				btnTime = 999999
				testQ[myNome]["проверка_завершения"] = nil
				partyStart = nil
				dnStart = 0
			else
				testQ[myNome]["chiavi"] = nil
				testQ[myNome]["groupNum"] = nil
				testQ[myNome]["инст_начат"]=nil
				testQ[myNome]["нельзя_стартовать"]=nil
				testQ[myNome]["время_кнопки"] = nil
				btnMM[1]:Hide()
				btnTime = 999999
				testQ[myNome]["проверка_завершения"] = nil
				partyStart = nil
				dnStart = 0
				SendChatMessage(testMM .. ": попытка провалилась", "guild", nil, 1);
			end
		end
	end

end)
