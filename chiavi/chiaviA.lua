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
				for i=2,6 do
					btnMM[i]:Hide()
				end
				testInf=0
			end
		end
		if id == 99 then
			testQ[myNome]["инст_начат"] = 1
			mobKNum = 0
		end
    end)
end

btnMM:configure(1,0,0,200,30,"#zzs","");
btnMM:configure(2,0,-30,200,30,"#zzs","");
btnMM:configure(3,0,-60,200,30,"#zzs","");
btnMM:configure(4,0,-90,200,30,"#zzs","");
btnMM:configure(5,0,-120,200,30,"#zzs","");
btnMM:configure(6,0,-150,200,30,"#zzs","");
btnMM:configure(99,0,100,100,50,"#zzs","СТАРТ");

local UpdateSpeed = 0.1
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
		if testGroupNum == 0 then

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

		end
	else
		testQ[myNome]["chiavi"] = nil
		testQ[myNome]["groupNum"] = nil
		testQ[myNome]["инст_начат"]=nil
		testQ[myNome]["нельзя_стартовать"]=nil
		btnMM[1]:Hide()
	end

	if btnMM[1]:IsVisible() and testQ[myNome]["инст_начат"] ~= nil then

	elseif btnMM[1]:IsVisible() == nil and testQ[myNome]["инст_начат"] == nil then
		btnMM[99]:Hide()
		for i=2,6 do
			btnMM[i]:Hide()
			testInf=0
		end
	end

	if btnMM[2]:IsVisible() and testQ[myNome]["нельзя_стартовать"] == nil then
		btnMM[99]:Show()
		btnMM[99]:SetText("СТАРТ")
	else
		btnMM[99]:Hide()
	end
	if testQ[myNome]["инст_начат"] == 1 then
		btnMM[99]:Hide()
		testInf=1
		btnMM[1]:Show()
		if testQ[myNome]["инст_время"] == nil then
			testQ[myNome]["инст_время"] = time()
		end
		curTime = time()
		curTime = curTime - testQ[myNome]["инст_время"]
		btnMM[1]:SetText(curTime)
	elseif testQ[myNome]["инст_начат"] == nil then
		testQ[myNome]["инст_время"] = nil
	end

end)
