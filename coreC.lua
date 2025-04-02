local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local msg = mysplit(message)
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
if message == "!кик" and sender == myNome then
	SendAddonMessage("gKick", "", "guild")
end
if msg[1] == "тест" and msg[2] == "щип" and msg[3] == myNome and testGM~=nil then
	SendChatMessage(testShip(myNome), "OFFICER", nil, 1)
end
if string.find(message,"выбери спек") and string.find(message,myNome) and testGM~=nil then
	spek1 = nBtn:new(1,nil,UIParent,328,328,30,-25,-50,13,128,64,msg[4],"CENTER","CENTER","TOPLEFT","TOPLEFT","BACKGROUND","FF8C00")
	spek2 = nBtn:new(2,nil,UIParent,328,264,30,-25,-50,13,128,64,msg[5],"CENTER","CENTER","TOPLEFT","TOPLEFT","BACKGROUND","FF8C00")
	spek3 = nBtn:new(3,nil,UIParent,328,200,30,-25,-50,13,128,64,msg[6],"CENTER","CENTER","TOPLEFT","TOPLEFT","BACKGROUND","FF8C00")
	spek1:configure()
	spek2:configure()
	spek3:configure()
	spek1:setClick(change_spek, nil, spek1)
	spek2:setClick(change_spek, nil, spek2)
	spek3:setClick(change_spek, nil, spek3)
end

if msg[1] == "ГП" and msg[2] ~= nil and msg[3] ~= nil and sender == myNome then
	SendGuildOfficerMessageWithBonus(message)
	-- for Zc=1,GetNumGuildMembers(true) do
	--     local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
	--     if name == myNome then
	--     	if rankName == "Лейтенант" or rankName == "Капитан" then
	-- 		 	SendChatMessage(msg[3] .. " плюс " .. msg[2], "OFFICER", nil, 1)
	-- 		 	SendAddonMessage("nsGP" .. " " .. msg[2],msg[3], "guild")
	-- 		end
	-- 	end
	--  end
end

if testQ[myNome]['puteshestvie'] ~= nil then
	if t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['sh'] == "вопрос" then
		if strlower(message) == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['ответ'] then
			SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
			sohranenieProgressa("обычка")
			testQ[myNome]['puteshestvie'] = t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда']
			PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
		end
	end
end
if msg[1] == "\"гс" and GS_Data[GetRealmName()].Players[msg[2]] ~= nil then
	SendChatMessage(msg[2] .. ": " .. GS_Data[GetRealmName()].Players[msg[2]].GearScore .. " гс. Обновлено: " .. string.sub(GS_Data[GetRealmName()].Players[msg[2]].Date,7,8) .. "/" .. string.sub(GS_Data[GetRealmName()].Players[msg[2]].Date,5,6) .. "/" .. string.sub(GS_Data[GetRealmName()].Players[msg[2]].Date,1,4) , "OFFICER", nil, 1)
end
if msg[1] == "\"чс" and (sender == "Дханвантари" or sender == "Хефе" or sender == "Дервин" or sender == "Люцзе" or sender == "Посети" or sender == "Витинари" or sender == "Злойкакаш" or sender == "Разбредовина" or sender == "Qoshadows" or sender == "Хилялко" or sender == "Сантанигга" or sender == "Кусяо" or sender == "Колон" or sender == "Кербес" or sender == "Аффа" or sender == "Шеф" or sender == "Нугган" or sender == "Showmeblood" or sender == "Годвар" or sender == "Совамилаха") then
	if testQ["chs"] == nil then
		testQ["chs"] = {}
	end
	local prov = nil
	for i = 1, #testQ["chs"] do
		if testQ["chs"][i] == msg[2] then
			prov = 1
		end
	end
	if prov ~= 1 then
		table.insert(testQ["chs"],msg[2])
		SendChatMessage(msg[2] .. " был добавлен в черный список" , "OFFICER", nil, 1)
	else
		SendChatMessage(msg[2] .. " уже есть в черном списке" , "OFFICER", nil, 1)
	end
end
if msg[1] == "!устав" then
	if sender == myNome or msg[3] == myNome then
		print(msg[3])
		if msg[2] == nil or msg[2] == "1" then
			SendChatMessage(ustav["1"], "OFFICER", nil, 1)
			SendChatMessage(ustav["2"], "OFFICER", nil, 1)
		end
		if msg[2] == "1.1" then
			SendChatMessage(ustav["3"], "OFFICER", nil, 1)
		end
		if msg[2] == "1.2" then
			SendChatMessage(ustav["4"], "OFFICER", nil, 1)
		end
		if msg[2] == "2" then
			SendChatMessage(ustav["5"], "OFFICER", nil, 1)
		end
		if msg[2] == "3" then
			SendChatMessage(ustav["6"], "OFFICER", nil, 1)
		end
		if msg[2] == "3.0" then
			SendChatMessage(ustav["7"], "OFFICER", nil, 1)
		end
		if msg[2] == "3.1" then
			SendChatMessage(ustav["8"], "OFFICER", nil, 1)
		end
		if msg[2] == "3.2" then
			SendChatMessage(ustav["9"], "OFFICER", nil, 1)
			SendChatMessage(ustav["10"], "OFFICER", nil, 1)
		end
		if msg[2] == "4" then
			SendChatMessage(ustav["11"], "OFFICER", nil, 1)
		end
		if msg[2] == "4.1" then
			SendChatMessage(ustav["12"], "OFFICER", nil, 1)
			SendChatMessage(ustav["13"], "OFFICER", nil, 1)
		end
		if msg[2] == "4.2" then
			SendChatMessage(ustav["14"], "OFFICER", nil, 1)
		end
		if msg[2] == "4.2.1" then
			SendChatMessage(ustav["15"], "OFFICER", nil, 1)
		end
		if msg[2] == "4.3" then
			SendChatMessage(ustav["16"], "OFFICER", nil, 1)
		end
		if msg[2] == "4.4" then
			SendChatMessage(ustav["17"], "OFFICER", nil, 1)
		end
		if msg[2] == "4.4.1" then
			SendChatMessage(ustav["18"], "OFFICER", nil, 1)
		end
		if msg[2] == "5" then
			SendChatMessage(ustav["19"], "OFFICER", nil, 1)
			SendChatMessage(ustav["20"], "OFFICER", nil, 1)
		end
		if msg[2] == "5.1" then
			SendChatMessage(ustav["21"], "OFFICER", nil, 1)
			SendChatMessage(ustav["22"], "OFFICER", nil, 1)
		end
		if msg[2] == "5.1.1" then
			SendChatMessage(ustav["23"], "OFFICER", nil, 1)
		end
		if msg[2] == "5.2" then
			SendChatMessage(ustav["24"], "OFFICER", nil, 1)
		end
		if msg[2] == "5.2.1" then
			SendChatMessage(ustav["25"], "OFFICER", nil, 1)
			SendChatMessage(ustav["26"], "OFFICER", nil, 1)
			SendChatMessage(ustav["27"], "OFFICER", nil, 1)
		end
		if msg[2] == "5.3" then
			SendChatMessage(ustav["28"], "OFFICER", nil, 1)
		end
		if msg[2] == "5.4" then
			SendChatMessage(ustav["29"], "OFFICER", nil, 1)
		end
		if msg[2] == "6.1" then
			SendChatMessage(ustav["30"], "OFFICER", nil, 1)
		end
		if msg[2] == "6.3" then
			SendChatMessage(ustav["31"], "OFFICER", nil, 1)
		end
		if msg[2] == "7" then
			SendChatMessage(ustav["32"], "OFFICER", nil, 1)
		end
		if msg[2] == "7.1" then
			SendChatMessage(ustav["33"], "OFFICER", nil, 1)
		end
		if msg[2] == "7.2" then
			SendChatMessage(ustav["34"], "OFFICER", nil, 1)
		end
		if msg[2] == "8" then
			SendChatMessage(ustav["35"], "OFFICER", nil, 1)
		end
		if msg[2] == "8.2" then
			SendChatMessage(ustav["36"], "OFFICER", nil, 1)
		end
		if msg[2] == "13.4" then
			SendChatMessage(ustav["37"], "OFFICER", nil, 1)
			SendChatMessage(ustav["38"], "OFFICER", nil, 1)
		end
		if msg[2] == "13.4.1" then
			SendChatMessage(ustav["39"], "OFFICER", nil, 1)
		end
		if msg[2] == "13.4.2" then
			SendChatMessage(ustav["40"], "OFFICER", nil, 1)
		end
		if msg[2] == "13.4.3" then
			SendChatMessage(ustav["41"], "OFFICER", nil, 1)
		end
		if msg[2] == "13.4.4" then
			SendChatMessage(ustav["42"], "OFFICER", nil, 1)
		end
		if msg[2] == "15" then
			SendChatMessage(ustav["43"], "OFFICER", nil, 1)
		end
	end
end
if msg[1] == "\"Илвл" and msg[3] then
	if msg[3] == myNome then
		if GS_Data ~= nil then
			if GS_Data[GetRealmName()].Players[msg[2]] ~= nil then
				date_update = string.utf8sub(tostring(GS_Data[GetRealmName()].Players[msg[2]]['Date']),1,4) .. "/" .. string.utf8sub(tostring(GS_Data[GetRealmName()].Players[msg[2]]['Date']),5,6) .. "/" .. string.utf8sub(tostring(GS_Data[GetRealmName()].Players[msg[2]]['Date']),7,8) .. " " .. string.utf8sub(tostring(GS_Data[GetRealmName()].Players[msg[2]]['Date']),9,10) .. ":" .. string.utf8sub(tostring(GS_Data[GetRealmName()].Players[msg[2]]['Date']),11,11)
				SendChatMessage("Илвл: " .. GS_Data[GetRealmName()].Players[msg[2]]['Average'] .. " гс: " .. GS_Data[GetRealmName()].Players[msg[2]].GearScore .. " Дата обновления: " .. date_update, "OFFICER", nil, 1)
			else
				SendChatMessage("Про игрока " .. msg[2] .. " нет информации", "OFFICER", nil, 1)
			end
		end
	end
end
if msg[1] == "\"илвл" then
	if sender == myNome then
		local test = nil
		if GS_Data ~= nil then
			if GS_Data[GetRealmName()].Players[myNome] ~= nil then
				SendChatMessage("Мой илвл: " .. string.format("%d", CalculateAverageItemLevel(myNome)) .. " гс: " .. GS_Data[GetRealmName()].Players[myNome].GearScore .. " " .. "бс: " .. bs(msg[3]), "OFFICER", nil, 1)
				test = 1
			end
		else
			SendChatMessage("Мой илвл: " .. string.format("%d", CalculateAverageItemLevel(myNome)) .. " " .. "бс: " .. bs(msg[3]), "OFFICER", nil, 1)
			test = 1
		end
		if test ~= 1 then
			SendChatMessage("Мой илвл: " .. string.format("%d", CalculateAverageItemLevel(myNome)) .. " " .. "бс: " .. bs(msg[3]), "OFFICER", nil, 1)
		end
	else
		if msg[2] == myNome then
			local test = nil
			if GS_Data ~= nil then
				if GS_Data[GetRealmName()].Players[myNome] ~= nil then
					SendChatMessage("Мой илвл: " .. string.format("%d", CalculateAverageItemLevel(myNome)) .. " гс: " .. GS_Data[GetRealmName()].Players[myNome].GearScore  .. " " .. "бс: " .. bs(msg[3]), "OFFICER", nil, 1)
					test = 1
				end
			else
				SendChatMessage("Мой илвл: " .. string.format("%d", CalculateAverageItemLevel(myNome))  .. " " .. "бс: " .. bs(msg[3]), "OFFICER", nil, 1)
				test = 1
			end
			if test ~= 1 then
				SendChatMessage("Мой илвл: " .. string.format("%d", CalculateAverageItemLevel(myNome))  .. " " .. "бс: " .. bs(msg[3]), "OFFICER", nil, 1)
			end
		end
	end
end
if msg[1] == "\"чсв" and (sender == "Хефе" or sender == "Дервин" or sender == "Люцзе" or sender == "Посети" or sender == "Витинари" or sender == "Злойкакаш" or sender == "Разбредовина" or sender == "Qoshadows" or sender == "Хилялко" or sender == "Сантанигга" or sender == "Кусяо" or sender == "Колон" or sender == "Кербес" or sender == "Аффа" or sender == "Шеф" or sender == "Нугган" or sender == "Годвар" or sender == "Совамилаха") then
	if testQ["chs"] == nil then
		testQ["chs"] = {}
	end
	for i = 1, #testQ["chs"] do
		if testQ["chs"][i] == msg[2] then
			SendChatMessage(testQ["chs"][i] .. " был удален из черного списка" , "OFFICER", nil, 1)
			testQ["chs"][i] = nil
		end
	end
end
if msg[1] == "\"кик" and sender == myNome then
	GuildUninvite(msg[2])
	SendChatMessage(msg[2] .. " был исключен  из гильдии" , "OFFICER", nil, 1)
end
if msg[1] == "\"принизить" and sender == myNome then
	GuildDemote(msg[2])
	SendChatMessage(msg[2] .. " минус звание" , "OFFICER", nil, 1)
end
if msg[1] == "\"повысить" and sender == myNome then
	GuildPromote(msg[2])
	SendChatMessage(msg[2] .. " повышен" , "OFFICER", nil, 1)
end

if testQ['sign'] ~= "1" then
	nome = GuildFrame["selectedName"]
else
	nome = myNome
end
if msg[1] == "\"построить" and testGM~=nil then
	if mioFld1[msg[2]] ~= nil then
		mioFld1[msg[2]]["объекты"][tostring(msg[4])] = msg[3]
		if fBtn[1]:IsVisible() and nome == msg[2] then
			fBtn[tonumber(msg[4])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[3] .. ".tga")
			fBtn[tonumber(msg[4])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[3] .. ".tga")
		end
	end
end
if msg[1] == "\"хп]" and testGM~=nil then
	mioFld1[msg[2]]["целостность"][tostring(msg[4])] = tonumber(msg[3])
end
if msg[1] == "локация" and msg[2]=="удалить" and msg[3] == myNome and testGM~=nil then
	mapTables["lokRasstoyanie"] = nil
	krt["chernila"] = nil
end

if msg[1] == "\"камни" and msg[2] == myNome and testGM~=nil then
	testQ["kamen"] = tonumber(testQ["kamen"])+tonumber(msg[3])
	testQ["nikQK"] = antc(testQ["kamen"])
	testQ["fRand6"] = 1
end
if msg[1] == "\"кирпич" and msg[2] == myNome and testGM~=nil then
	testQ["kirpich"] = tonumber(testQ["kirpich"])+tonumber(msg[3])
	testQ["nikQKR"] = antc(testQ["kirpich"])
	testQ["fRand6"] = 1
end
if msg[1] == "\"доска" and msg[2] == myNome and testGM~=nil then
	testQ["doska"] = tonumber(testQ["doska"])+tonumber(msg[3])
	testQ["nikQD"] = antc(testQ["doska"])
	testQ["fRand6"] = 1
end
if msg[1] == "\"бревна" and msg[2] == myNome and testGM~=nil then
	testQ["brevna"] = tonumber(testQ["brevna"])+tonumber(msg[3])
	testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
	testQ["fRand6"] = 1
end
if msg[1] == "\"трава" and msg[2] == myNome and testGM~=nil then
	testQ["stog"] = tonumber(testQ["stog"])+tonumber(msg[3])
	testQ["nikQF"] = antc(testQ["stog"])
	testQ["fRand6"] = 1
end
if msg[1] == "\"бетон" and msg[2] == myNome and testGM~=nil then
	testQ["beton"] = tonumber(testQ["beton"])+tonumber(msg[3])
	testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
	testQ["fRand6"] = 1
end
if msg[1] == "\"самогон" and msg[2] == myNome and testGM~=nil then
	testQ["smg"] = tonumber(testQ["smg"])+tonumber(msg[3])
	testQ["nikQS"] = antc(testQ["smg"])
	testQ["fRand6"] = 1
end
if msg[1] == myNome .. "," and msg[2] == "покажи" and msg[3] == "свой" then
	SendChatMessage("У меня " .. testQ[myNome]["dTimer"][tonumber(date("%d"))], "OFFICER", nil, 1)
end
if msg[1] == myNome .. "," and msg[2] == "покажи" and msg[3] == "свою" then
	if testQ[myNome]["hTimer"] ~= nil then
		SendChatMessage("У меня " .. testQ[myNome]["hTimer"], "OFFICER", nil, 1)
	else
		SendChatMessage("У меня нет...", "OFFICER", nil, 1)
	end
end
if msg[1] == "!добавить" and msg[2] == "предмет" and testGM~=nil then
	local nazvanie
	local n
	if pQuest["items"] == nil then
		pQuest["items"] = {}
	end
	if #pQuest["items"] == 0 then
		n = 1
	else
		n = #pQuest["items"]+1
	end
	pQuest["items"][n] = {}
	pQuest["items"][n]["itemNum"] = msg[3]
	pQuest["items"][n]["itemEnStuck"] = msg[4]
	nazvanie = msg[5]
	for i=6,#msg do
		nazvanie = nazvanie .. " " .. msg[i]
	end
	pQuest["items"][n]["itemName"] = nazvanie
	print(pQuest["items"][n]["itemName"] .. " успешно добавлен")
end

if msg[1] == "!добавить" and msg[2] == "квест" and testGM~=nil then
	local testIDqq
	if pQuest == nil then
		pQuest = {}
	end
	if pQuest["х"] == nil then
		pQuest["х"] = {}
	end
	for key, val in pairs(pQuest[msg[3]]) do
		if tonumber(val) == tonumber(msg[4]) then
			print("*Ачивка " .. val .. " " .. GetAchievementLink(tonumber(val)) .. " уже была добавлена.")
			testIDqq=1
		end
	end
	if testIDqq~=1 then
		table.insert(pQuest[msg[3]], msg[4])
		print("*Ачивка " .. msg[4] .. " " .. GetAchievementLink(tonumber(msg[4])) .. " была добавлена.")
	end
end
if zametki == nil then
	zametki = {}
end
if msg[1] == "!памятка" and sender == myNome then
	local zametka
	if msg[2] ~= nil then
		if zametki[msg[2]] == nil then
			zametki[msg[2]] = {}
		end
		if msg[3] ~= nil then
			if msg[3] == "###" then
				zametka = "###\n"
			else
				zametka = msg[3] .. " "
			end
			if msg[4] ~= nil then
				for i=4,#msg do
					if msg[i] == "###" then
						zametka = zametka .. " ###\n"
					else
						zametka = zametka.. " " .. msg[i]
					end
				end
			end
			zametki[msg[2]] = zametka
			SendChatMessage("Заметка о персонаже " .. msg[2] .. " добавлена", "OFFICER", nil, 1)
		else

		end
	else
		SendChatMessage("Не указано кому добавлять памятку", "OFFICER", nil, 1)
	end
end
if msg[1] == "!памятка+" and sender == myNome then
	local zametka = msg[3]
	if zametki[msg[2]] == nil then
		if msg[4] ~= nil then
			for i=4,#msg do
				zametka = zametka .. " " .. msg[i]
			end
		end
	else
		zametka = zametki[msg[2]] .. "\n" .. zametka
		if msg[4] ~= nil then
			for i=4,#msg do
				zametka = zametka .. " " .. msg[i]
			end
		end
	end
	zametki[msg[2]] = zametka
	SendChatMessage("Заметка о персонаже " .. msg[2] .. " дополнена", "OFFICER", nil, 1)
end

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

if message == "ТестГМ" then
	local MySlider = CreateFrame("Slider", "MySliderGlobalName", WorldMapFrame, "OptionsSliderTemplate")
	MySlider:SetWidth(20)
	MySlider:SetHeight(100)
	 MySlider:SetOrientation('VERTICAL')
	  MySlider:SetOrientation('HORIZONTAL')
	  MySlider:Show()
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
	local x,y
	for i = 1, 100000 do
		itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(i)
		if itemName ~= nil and string.lower(predmet) == string.lower(itemName) then
			 if itemLink ~= nil then
				SendChatMessage("* " ..  itemLink, "OFFICER", nil, 1)
				break
			else
				SendChatMessage("* предмет " .. predmet .. " не существует", "OFFICER", nil, 1)
			end
		end
	end
end

if string.find (message, "!ачивка") and nachalo~="*" then
	lenShow=mysplit(message)
	if lenShow[1]==myNome then
		tblLensShow=tablelength(lenShow)
		achShow=table.concat(lenShow, " ", 3,tblLensShow)
		achShow = string.lower(achShow)
		for i=1,100000 do
			IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText, isGuildAch = GetAchievementInfo(i)
			if Name ~= nil then
				Name1 = string.lower(Name)
				if string.find(Name1,achShow) then --Name1==achShow then
				print ("номер ачивки: ",i)
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
					if string.find(Name1,"золот") then
						countShow = tonumber(countShow)/10000
					else

					end
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
					if string.find(Name1,"золот") then
						countShow = tonumber(countShow)/10000
					else

					end
					cmpltd4=countShow
					cmpltd= cmpltd1 .. cmpltd2 .. cmpltd3 .. cmpltd4
				end
				if quantityShow~=0 and quantityShow~=1 and reqQuantityShow~=0 and reqQuantityShow~=nil and testShow=="000" then
					cmpltd1=" выполненно пунктов ачивки "
					if string.find(Name1,"золот") then
						countShow = tonumber(quantityShow)/10000
					else

					end
					cmpltd2=quantityShow
					cmpltd3=" из "
					cmpltd4=reqQuantityShow
					cmpltd= cmpltd1 .. cmpltd2 .. cmpltd3 .. cmpltd4
				end
				if quantityShow~=0 and reqQuantityShow==0 and quantityShow~=nil then
					print(i)
					cmpltd1=" выполненно пунктов ачивки "
					if string.find(Name1,"золот") then
						quantityShow = tonumber(quantityShow)/10000
					else

					end
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
					--break
				end
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
	if krt["777"] == nil then
		x = math.random(1, 15)
		x = tostring(x)
		if krt[x] == nil then
			krt[x] = true
		else
			for i = 1, 15 do
				x = math.random(1, 15)
				x = tostring(x)
				if krt[x] == nil or krt[x] ~= true then
					krt[x] = true
					break
				end
			end
		end
	end
	if krt["777"] == 2 then
		x = math.random(21, 34)
		x = tostring(x)
		if krt[x] == nil then
			krt[x] = true
		else
			for i = 21, 34 do
				x = math.random(21, 34)
				x = tostring(x)
				if krt[x] == nil or krt[x] ~= true then
					krt[x] = true
					break
				end
			end
		end
	end
end

if string.find (message, "!карта") and krtKus[1]==myNome and testGM~=nil then
	if krt == nil then
		krt = {}
	end
	local x
	x = tostring(krtKus[3])
	if krt[x] == nil then
		krt[x] = true
	else
		SendChatMessage("У " .. sender .. " уже есть " .. x .. " кусок", "OFFICER", nil, 1)
	end
end

if string.find (message, "получает чернила") and krtKus[1]==myNome and testGM~=nil then
	if krt["999"] == nil then
		krt["999"] = 1
	else
		krt["999"] = krt["999"] + 1
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
if string.find (message, "алкаш") and string.find (message, "СТАРТ") and testGM~=nil and msg[3] == nil then
	if testQ['eventAllcash'] == nil then
		testQ['eventAllcash'] = 1
	end
end
if string.find (message, "путешествие") and string.find (message, "СТАРТ") and testGM~=nil then
	if testQ[myNome]['puteshestvie'] == nil then
		testQ[myNome]['puteshestvie'] = "0"
		PlaySoundFile("Interface\\AddOns\\NSQC\\start.ogg")
		testQ[myNome]['puteshestvieTabella'] = "event1"
		testQ[myNome][testQ[myNome]['puteshestvieTabella']] = "0"
	end
	if testGM~=nil then
		sohranenieTablicRamerovLokaciy()
	end
end
if string.find (message, "зарика") and string.find (message, "СТАРТ") and testGM~=nil and msg[3] == myNome then
	if testQ[myNome]['puteshestvie'] == nil then
		testQ[myNome]['puteshestvie'] = "0"
		PlaySoundFile("Interface\\AddOns\\NSQC\\start.ogg")
		testQ[myNome]['puteshestvieTabella'] = "event1"
		testQ[myNome][testQ[myNome]['puteshestvieTabella']] = "0"
	end
	if testGM~=nil then
		sohranenieTablicRamerovLokaciy()
	end
end
if string.find (message, "феникс") and string.find (message, "СТАРТ") and testGM~=nil and msg[3] == myNome then
	if testQ[myNome]['puteshestvie'] == nil then
		testQ[myNome]['puteshestvie'] = "0"
		PlaySoundFile("Interface\\AddOns\\NSQC\\start.ogg")
		testQ[myNome]['puteshestvieTabella'] = "fenix"
		testQ[myNome][testQ[myNome]['puteshestvieTabella']] = "0"
	end
	if testGM~=nil then
		sohranenieTablicRamerovLokaciy()
	end
	testQ['edaNomeRez'] = {}
	testQ[myNome]['квест_на_эмоции_взят'] = nil
end
if string.find (message, "сизиф") and string.find (message, "СТАРТ") and testGM~=nil then
	if testQ["старт"] == nil then
		testQ["start"] = lotTest[3]
		testQ["старт"] = 0
		marshruT = {}
	end
end
if string.find (message, "фемида") and string.find (message, "СТАРТ") and testGM~=nil then
	testQ["эвент3"] = 0
	testQ["эвент3_k"] = lotTest[3]
	testQ["эвент3_l"] = lotTest[4]
	testQ["эвент3_n"] = lotTest[5]
end
if string.find (message, "буриданов_осел") and string.find (message, "СТАРТ") and testGM~=nil then
	testQ["эвент1"] = lotTest[3]
	testQ["эвент1_запущен"] = 0
	testQ["boDiam"] = tonumber(lotTest[4])
end

if string.find (message, "СТОП") and string.find (message, "эвент") and testGM~=nil then
	if testQ[testQ["start"]] ~= nil then
		testQ[testQ["start"]]=nil
	end
	testQ["старт"] = nil
	testQ["num"] = nil
	testQ["marshF"] = nil
	testQ["start"]=nil
	if marshruT ~= nil then
		for i=1,9999 do
			if marshruT[i] ~= nil then
				marshruT[i]:Hide()
			end
		end
	end
	marshruT = nil
	testQ["эвент1_запущен"]=nil
	testQ["эвент1"] = nil
	for i=1,100 do
		if iconRis[i] ~= nil then
			iconRis[i]:Hide()
		end
	end
	testQ["boDiam"] = nil
	testQ["event1"] = nil
	testQ["эвент3"] = nil
	testQ["эвент3_k"] = nil
	testQ["эвент3_l"] = nil
	testQ["эвент3_n"] = nil
	event3(1,1,"hide")
	testQ['eventAllcash'] = nil
	MoveViewRightStart(0)
	MoveViewLeftStart(0)
	testQ['acX'] = nil
	testQ['acY'] = nil
	puteshestvieHide()
	testQ[myNome]['квест_на_эмоции_взят'] = nil
	testQ['edaNomeRez'] = {}
	testQ[myNome]['edaQuest'] = nil
end

if string.find (message, "покажи сиськи") and string.find(message, myNome) and nachalo~="*" then
	local x = math.random(1, 13)
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
	elseif x == 11 then
		SendChatMessage("(. )( .)" , "OFFICER", nil, 1)
	elseif x == 12 then
		SendChatMessage("( . )( .)" , "OFFICER", nil, 1)
	elseif x == 13 then
		SendChatMessage("(. )( . )" , "OFFICER", nil, 1)
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

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_EMOTE")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
	local myNome = GetUnitName("player")
	if testQ[myNome]['квест_на_эмоции_взят'] ~= nil then
		if message == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['эмоция'] then
			if tonumber(UnitLevel('target')) == 80 then
				if testQ[myNome]['проверка_расстояния_эмоции'] == 1 then
					local locClass, engClass, locRace, engRace, gender, name, server = GetPlayerInfoByGUID(UnitGUID("target"))
					if engClass ~= nil then
						if testQ[myNome]['HumanMan'] == nil then
							if engRace == "Human" and gender == 2 then
								testQ[myNome]['HumanMan'] = 1
								SendChatMessage("Я выдираю целый пук шерсти из носа человека", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['HumanWoman'] == nil then
							if engRace == "Human" and gender == 3 then
								testQ[myNome]['HumanWoman'] = 1
								SendChatMessage("Ты смотри, тут меха то - с ладошку...", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['DworfMan'] == nil then
							if engRace == "Dwarf" and gender == 2 then
								testQ[myNome]['DworfMan'] = 1
								SendChatMessage("Я обдираю весь мех с лодыжки дворфа. Ну, ничего, там еще много...", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['DworfWoman'] == nil then
							if engRace == "Dwarf" and gender == 3 then
								testQ[myNome]['DworfWoman'] = 1
								SendChatMessage("И ЭТО ПОДМЫШКИ?! Да тут на пять фениксов хватит!!!", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['NEMan'] == nil then
							if engRace == "NightElf" and gender == 2 then
								testQ[myNome]['NEMan'] = 1
								SendChatMessage("Хм.. почему них шерсть - только на ушах растет?", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['NEWoman'] == nil then
							if engRace == "NightElf" and gender == 3 then
								testQ[myNome]['NEWoman'] = 1
								SendChatMessage("Пусть мне будет стыдно...но потом. А пока будем ощипывать на благо будущего!", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['GnomMan'] == nil then
							if engRace == "Gnome" and gender == 2 then
								testQ[myNome]['GnomMan'] = 1
								SendChatMessage("Все что происходит в квесте, должно остаться в квесте.", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['GnomWoman'] == nil then
							if engRace == "Gnome" and gender == 3 then
								testQ[myNome]['GnomWoman'] = 1
								SendChatMessage("А вы знали, что достаточно напугать гномиху и та сама сбрасывает с себя шерсть? Защитная реакция видимо...", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['DrenayMan'] == nil then
							if engRace == "Draenei" and gender == 2 then
								testQ[myNome]['DrenayMan'] = 1
								SendChatMessage("Ух!!! Какой у дренеев мохнатый..хвост!", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['DrenayWoman'] == nil then
							if engRace == "Draenei" and gender == 3 then
								testQ[myNome]['DrenayWoman'] = 1
								SendChatMessage("Странно, а дренейки совсем не такие, как на тех фото и видео...ну, мне друг рассказывал.", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['OrkMan'] == nil then
							if engRace == "Orc" and gender == 2 then
								testQ[myNome]['OrkMan'] = 1
								SendChatMessage("Ох... И зачем только орки так тщательно бреют все доступные места? Остаются труднодоступные...", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['OrkWoman'] == nil then
							if engRace == "Orc" and gender == 3 then
								testQ[myNome]['OrkWoman'] = 1
								SendChatMessage("Ну все, после такой помощи в депиляции придется жениться...", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['UndeadMan'] == nil then
							if engRace == "Scourge" and gender == 2 then
								testQ[myNome]['UndeadMan'] = 1
								SendChatMessage("Ух ты и это мех!? Ой.. Это же мох!", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['UndeaWoman'] == nil then
							if engRace == "Scourge" and gender == 3 then
								testQ[myNome]['UndeaWoman'] = 1
								SendChatMessage("Хорошо зафиксированная андедка.. в принципе ничем не отличается от обычной.", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['TaurenMan'] == nil then
							if engRace == "Tauren" and gender == 2 then
								testQ[myNome]['TaurenMan'] = 1
								SendChatMessage("Достаточно хорошенько обнять таурена и на одежде останется его шерсти столько, что можно утеплить два стандартных многоэтажных дома.", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['TaurenWoman'] == nil then
							if engRace == "Tauren" and gender == 3 then
								testQ[myNome]['TaurenWoman'] = 1
								SendChatMessage("А вы никогда не задумывались, что будет, если предложить тауренше немножко ее подоить?", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['TrollMan'] == nil then
							if engRace == "Troll" and gender == 2 then
								testQ[myNome]['TrollMan'] = 1
								SendChatMessage('Чтобы достать мех тролля, нужно спросить: "знает ли он о вуду?". Он начнет выдирать последние лохмы, клянясь, что даже не слышал.', "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['TrollWoman'] == nil then
							if engRace == "Troll" and gender == 3 then
								testQ[myNome]['TrollWoman'] = 1
								SendChatMessage('Шерсть на ушах троллихи не менее мягкая и шелквистая, чем на ушах эльфийки. Уж не родственники ли они?', "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['ElfMan'] == nil then
							if engRace == "BloodElf" and gender == 2 then
								testQ[myNome]['ElfMan'] = 1
								SendChatMessage("Как ловко у меня получилось ощипать эльфа...а главное - незаметно.", "OFFICER", nil, 1)
							end
						end
						if testQ[myNome]['ElfWoman'] == nil then
							if engRace == "BloodElf" and gender == 3 then
								testQ[myNome]['ElfWoman'] = 1
								SendChatMessage("Ух ты! Какая мягка шерсть с ушей эльфийки!", "OFFICER", nil, 1)
							end
						end
					else
						SendChatMessage("Даже пробовать не буду, видно же, что это существо не отличается шерстистостью.", "OFFICER", nil, 1)
					end
				elseif testQ[myNome]['проверка_расстояния_эмоции'] == 2 then
					if message == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['эмоция'] then
						SendChatMessage("Слишком далеко, о чем я только думаю?", "OFFICER", nil, 1)
					end
				end
			else
				SendChatMessage("Цель слишком молодая, это негуманно...", "OFFICER", nil, 1)
			end
		end
		testQ[myNome]['проверка_расстояния_эмоции'] = nil
	end
end)

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_RAID_LEADER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
	local msg = mysplit(message)
	local myNome = GetUnitName("player")
	if testQ["raidAUK"] ~= nil then
		local test = mysplit(message)
		if test[2] == nil and type(tonumber(message)) == "number" then
			if testQ["raidAUKPobeda_gp"] ~= nil and testQ["raidAUKPobeda_gp"] ~= "" then
				if tonumber(message) > tonumber(testQ["raidAUKPobeda_gp"]) then
					nsAUK(sender,msg[1],testQ[myNome]['nsAUKpredmet'])
				end
			else
				nsAUK(sender,msg[1],testQ[myNome]['nsAUKpredmet'])
			end
		end
	end
end)

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_RAID")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
	local msg = mysplit(message)
	local myNome = GetUnitName("player")
	if testQ["raidAUK"] ~= nil then
		local test = mysplit(message)
		if test[2] == nil and type(tonumber(message)) == "number" then
			if testQ["raidAUKPobeda_gp"] ~= nil and testQ["raidAUKPobeda_gp"] ~= "" then
				if tonumber(message) > tonumber(testQ["raidAUKPobeda_gp"]) then
					nsAUK(sender,msg[1],testQ[myNome]['nsAUKpredmet'])
				end
			else
				nsAUK(sender,msg[1],testQ[myNome]['nsAUKpredmet'])
			end
		end
	end
end)

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_RAID_WARNING")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
	local msg = mysplit(message)
	local myNome = GetUnitName("player")
	if msg[1] == "АУК" then
		testQ['rez'] = nsGP()
    	if sender == myNome then
			SendAddonMessage("nsAUK", lastWords(message), "RAID")
			if testQ["raidAUK"] ~= nil then
				testQ["raidAUK"] = nil
			end
		end
		testQ[myNome]['nsAUKpredmet'] = lastWords(message)
	end
	if testQ["raidAUK"] ~= nil then
		local test = mysplit(message)
		if test[2] == nil and type(tonumber(message)) == "number" then
			if testQ["raidAUKPobeda_gp"] ~= nil and testQ["raidAUKPobeda_gp"] ~= "" then
				if tonumber(message) > tonumber(testQ["raidAUKPobeda_gp"]) then
					nsAUK(sender,msg[1],testQ[myNome]['nsAUKpredmet'])
				end
			else
				nsAUK(sender,msg[1],testQ[myNome]['nsAUKpredmet'])
			end
		end
	end
end)