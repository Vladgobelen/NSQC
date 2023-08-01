local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)

--команды для управления квестами
local nik=sender
local neobhodimo="необходимо_сделать"
local str = string.gsub(message, "%s+", "")
local myNome = GetUnitName("player")
if testQ[myNome]==nil then
	testQ[myNome]={}
end
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)
msg3=mysplit(message)
if string.find (message, "покажи мне ачивку")  and string.find(message, myNome) and msg3[2]~="#aaa" and nachalo~="*" then
	msg1 = mysplit(message)
	if msg1[2]=="покажи" then
		msg1 = msg1[5]
		msg1 = tonumber(msg1)

		id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
		if completed == true then
			SendChatMessage("*" .. sender .. ", эта уже выполнена: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
		else
			SendChatMessage("*" .. sender .. ", эту еще не делал: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
		end
	end
end

if string.find (message, "testGroup") then


memberCount = 0
for groupindex = 1,MAX_PARTY_MEMBERS do
 if (GetPartyMember(groupindex)) then
  memberCount = memberCount + 1
 end
end
end
if string.find (message, "покажи ачивку") and string.find(message, myNome) and msg3[2]~="#aaa" and nachalo~="*" then
	msg2 = mysplit(message)
	msg2 = msg2[4]
	msg2 = tonumber(msg2)
	j=0
	k=0
	count = GetAchievementNumCriteria(msg2)
	for i=1, count do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msg2, i);
		prov=completed
		if prov == true then
			j=j+1
		else
			k=k+1
		end
		i=i+1
	end
	if k==0 then
		SendChatMessage(hshStran3 .. " #aai " .. "уже выполнена полностью: " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	else
		SendChatMessage("*" .. "доступно пунктов ачивки: " .. k .. " из " .. count  .. " " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	end


end

if string.find (message, "покажи статистику") and string.find(message, myNome) and nachalo~="*" then
	msgStat=mysplit(message)
	msgStat=msgStat[4]
	SendChatMessage("* " ..  GetAchievementLink(msgStat) .. " " .. GetStatistic(msgStat), "OFFICER", nil, 1)
end



if string.find (message, "покажи предмет") and string.find(message, myNome) and nachalo~="*" then
	lenCosa=mysplit(message)
	tblLensCosa=tablelength(lenCosa)
	predmet=table.concat(lenCosa, " ", 4,tblLensCosa)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice =
    GetItemInfo(predmet)
    if itemLink~=nil then
		SendChatMessage("* " ..  itemLink, "OFFICER", nil, 1)
	else
		SendChatMessage("* предмет " .. predmet .. " не существует", "OFFICER", nil, 1)
	end
end

if string.find (message, "!ачивка") and nachalo~="*" then
	lenShow=mysplit(message)
	if lenShow[1]==myNome then
		tblLensShow=tablelength(lenShow)
		achShow=table.concat(lenShow, " ", 3,tblLensShow)
		for i=1,10000 do
			IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText, isGuildAch = GetAchievementInfo(i)

			if Name==achShow then
			prov1=Completed
			j=0
			k=0
			countShow = GetAchievementNumCriteria(i)
			testShow=1
			for shoCount=1,countShow do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(i, shoCount);
				if completed~=true then
					testShow="000"
				end
				provShow=completed
				quantityShow=quantity
				reqQuantityShow=reqQuantity
				quantityShow=tonumber(quantityShow)
				reqQuantityShow=tonumber(reqQuantityShow)
			if provShow == true then
				j=j+1
			else
				k=k+1
			end
			end

			if provShow~=true and countShow~=1 and countShow~=0 then
				cmpltd1=j
				cmpltd2=" пунктов ачивки выполненно: "
				cmpltd22=" из "
				cmpltd=cmpltd2 .. cmpltd1 .. cmpltd22 .. countShow
			elseif provShow==true or prov1==true and testShow~="000" then
				cmpltd=" выполнена"
			elseif provShow~=true then
				cmpltd1=" "
				cmpltd=cmpltd1 .. GetStatistic(i)
			end

			if quantityShow~=0 and reqQuantityShow~=0 and reqQuantityShow~=nil and testShow=="000" then
				cmpltd1=" выполненно пунктов ачивки "
				cmpltd2=j
				cmpltd3=" из "
				cmpltd4=countShow
				cmpltd= cmpltd1 .. cmpltd2 .. cmpltd3 .. cmpltd4
			end
			if quantityShow~=0 and quantityShow~=1 and reqQuantityShow~=0 and reqQuantityShow~=nil and testShow=="000" then
				cmpltd1=" выполненно пунктов ачивки "
				cmpltd2=quantityShow
				cmpltd3=" из "
				cmpltd4=reqQuantityShow
				cmpltd= cmpltd1 .. cmpltd2 .. cmpltd3 .. cmpltd4
			end
			if quantityShow~=0 and reqQuantityShow==0 and quantityShow~=nil then
				print(i)
				cmpltd1=" выполненно пунктов ачивки "
				cmpltd2=quantityShow
				cmpltd=cmpltd1 .. cmpltd2
			end

				SendChatMessage(GetAchievementLink(i)..cmpltd, "OFFICER", nil, 1)
				quantityShow=nil
				reqQuantityShow=nil
				quantityShow=nil
				cmpltd=nil
				provShow=nil
				prov1=nil
				Completed=nil
				completed=nil
				break
			end

		end
	end
end

ltrC=mysplit(message)
if string.find (message, "получает лотерейный билет") and ltrC[1]==myNome and testGM~=nil then
	ltrNikC=ltrC[1]
	if testQ[ltrNikC]["лотерея"]==nil then
		testQ[ltrNikC]["лотерея"]=3
	else
		lotereyaC=testQ[ltrNikC]["лотерея"]
		lotereyaC=lotereyaC+3
		testQ[ltrNikC]["лотерея"]=lotereyaC
	end
end

krtKus=mysplit(message)
if string.find (message, "получает кусок карты") and krtKus[1]==myNome and testGM~=nil then
	krtKusNikC=krtKus[1]
	if krt==nil then
		krt={}
	end
	if krt ~= nil then
		if krt[777] == nil then
			if krt == nil then
				krt = {}
				x = math.random(1, 15)
				krt[x] = true
			else
				for i = 1, 15 do
					x = math.random(1, 15)
					if krt[x] == nil or krt[x] ~= true then
						krt[x] = true
						break
					else
					end
				end
			end
		end
	end
	if krt[777] == 2 then
		if krt == nil then
			krt = {}
			x = math.random(21, 34)
			krt[x] = true
		else
			for i = 21, 34 do
				x = math.random(21, 34)
				if krt[x] == nil or krt[x] ~= true then
					krt[x] = true
					break
				else
				end
			end
		end
	end
end

if string.find (message, "!карта") and krtKus[1]==myNome and testGM~=nil then
	krtKus[3] = tonumber(krtKus[3])
	if krtKus[3] == 1 then
		krt[1] = true
	end
	if krtKus[3] == 2 then
		krt[2] = true
	end
	if krtKus[3] == 3 then
		krt[3] = true
	end
	if krtKus[3] == 4 then
		krt[4] = true
	end
	if krtKus[3] == 5 then
		krt[5] = true
	end
	if krtKus[3] == 6 then
		krt[6] = true
	end
	if krtKus[3] == 7 then
		krt[7] = true
	end
	if krtKus[3] == 8 then
		krt[8] = true
	end
	if krtKus[3] == 9 then
		krt[9] = true
	end
	if krtKus[3] == 10 then
		krt[10] = true
	end
	if krtKus[3] == 11 then
		krt[11] = true
	end
	if krtKus[3] == 12 then
		krt[12] = true
	end
	if krtKus[3] == 13 then
		krt[13] = true
	end
	if krtKus[3] == 14 then
		krt[14] = true
	end
	if krtKus[3] == 15 then
		krt[15] = true
	end
	if krtKus[3] == 21 then
		krt[21] = true
	end
	if krtKus[3] == 22 then
		krt[22] = true
	end
	if krtKus[3] == 23 then
		krt[23] = true
	end
	if krtKus[3] == 24 then
		krt[24] = true
	end
	if krtKus[3] == 25 then
		krt[25] = true
	end
	if krtKus[3] == 26 then
		krt[26] = true
	end
	if krtKus[3] == 27 then
		krt[27] = true
	end
	if krtKus[3] == 28 then
		krt[28] = true
	end
	if krtKus[3] == 29 then
		krt[29] = true
	end
	if krtKus[3] == 30 then
		krt[30] = true
	end
	if krtKus[3] == 30 then
		krt[30] = true
	end
	if krtKus[3] == 31 then
		krt[31] = true
	end
	if krtKus[3] == 32 then
		krt[32] = true
	end
	if krtKus[3] == 33 then
		krt[33] = true
	end
	if krtKus[3] == 34 then
		krt[34] = true
	end
	if krtKus[3] == 35 then
		krt[35] = true
	end
	if krtKus[3] == 36 then
		krt[36] = true
	end
end

if string.find (message, "получает чернила") and krtKus[1]==myNome and testGM~=nil then
	if krt[999] == nil then
		krt[999] = 1
	else
		krt[999] = krt[999] + 1
	end
end

if string.find (message, "!сброс") and string.find (message, myNome) and testGM~=nil then
	if testQ[myNome]["сброс"] == nil then
		testQ[myNome]["сброс"] = 1
	else
		testQ[myNome]["сброс"] = nil
	end
end

if string.find (message, "!отмена") and string.find (message, myNome) and testGM~=nil then
	if testQ[myNome]["отмена"] == nil then
		testQ[myNome]["отмена"] = 1
	else
		testQ[myNome]["отмена"] = nil
	end
end





--for key, val in pairs(npcScan[npcSK][npcSL]["Борто"]["1"]) do
--	print (key)
--	print (val)
--end
--GetPlayerMapPosition("player")

lotTest=mysplit(message)

if string.find (message, "#ltr111") and testGM~=nil and lotTest[3]==myNome then
	minusLrt=testQ[myNome]["лотерея"]
	minusLrt=tonumber(minusLrt)
	minusLrt=minusLrt-1
	testQ[myNome]["лотерея"]=minusLrt
end

if string.find (message, "#marsh") and testGM~=nil and sender == myNome then
	print ("1")
	if testQ["marsh"] == nil then
		testQ["marsh"] = 1
	else
		testQ["marsh"] = nil
	end
end

if string.find (message, "#ltr333") and testGM~=nil and lotTest[3]==myNome then
	minusLrt=testQ[myNome]["лотерея"]
	minusLrt=tonumber(minusLrt)
	minusLrt=minusLrt-3
	testQ[myNome]["лотерея"]=minusLrt
end
if string.find (message, "эвент") and string.find (message, "СТАРТ") and testGM~=nil then
	testQ["start"] = lotTest[3]
	testQ["старт"] = 0
end
if string.find (message, "СТОП") and string.find (message, "эвент") and testGM~=nil then
	testQ["старт"] = nil
	testQ["num"] = nil
	testQ["marshF"] = nil
end

if string.find (message, "покажи сиськи") and string.find(message, myNome) and nachalo~="*" then
	local x = math.random(1, 10)
	if x == 1 then
		SendChatMessage("(  .   Y   .  )" , "OFFICER", nil, 1)
	elseif x == 2 then
		SendChatMessage("[  .   Y   .  ]" , "OFFICER", nil, 1)
	elseif x == 3 then
		SendChatMessage("[__o__]" , "OFFICER", nil, 1)
	elseif x == 4 then
		SendChatMessage("[__*__]" , "OFFICER", nil, 1)
	elseif x == 5 then
		SendChatMessage("(__o__)" , "OFFICER", nil, 1)
	elseif x == 6 then
		SendChatMessage("(__*__)" , "OFFICER", nil, 1)
	elseif x == 7 then
		SendChatMessage("( >  ) (  <  )" , "OFFICER", nil, 1)
	elseif x == 8 then
		SendChatMessage("( ,  Y  , )" , "OFFICER", nil, 1)
	elseif x == 9 then
		SendChatMessage("(.)(.)" , "OFFICER", nil, 1)
	elseif x == 10 then
		SendChatMessage("(,)(,)" , "OFFICER", nil, 1)
	end
end

if string.find (message, myNome) and testGM~=nil and string.find (message, "версия") and string.find (message, "1234567890")  and nachalo~="*" then
        SendChatMessage(hshStran3 .." текущая версия " .. versAdd, "OFFICER", nil, 1)
end

if testGM~=nil and string.find (message, "версия") and string.find (message, "1234567890")  and lotTest[3] == nil then
        SendAddonMessage("NSGadd", myNome .. " " .. versAdd, "guild")
end

if string.find (message, myNome) and testGM~=nil and string.find (message, "покажимне") then
	SendChatMessage(hshStran3, "OFFICER", nil, 1)
end
end
)
