local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
--команды для управления квестами
local nik=sender
local myNome = GetUnitName("player")
if testQ==nil then
	testQ={}
end
if testQ[myNome]==nil then
	testQ[myNome]={}
end
if testQ[myNome]["q33nik"]==nil then
	testQ[myNome]["q33nik"]={}
end
testGM=gmTest(sender)
if string.find (kod, "#q33q") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33q"] = message
	testQ[myNome]["взятый_квест"] = "q33"
end
if string.find (kod, "#q33nik1") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33nik"][1] = message
end
if string.find (kod, "#q33nik2") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33nik"][2] = message
end
if string.find (kod, "#q33nik3") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33nik"][3] = message
end
if string.find (kod, "#q33fnd") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33fnd"] = message
end
if string.find (kod, "#q33ans") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33ans"] = message
end
if kod=="NSGadd" then
if string.find (message, "#aaa") or string.find (message, "#aao") then
	if string.find (message, myNome) then
		msg1 = mysplit(message)
		msg1TestLvl=msg1[1]
		if msg1TestLvl=="#aaa" then
			msg1 = msg1[3]
			msg1 = tonumber(msg1)
			id, name, points, completed, month, day, year, description, flags, icon, rewardText, 	isGuildAch = GetAchievementInfo(msg1)
			if completed == true then
				SendAddonMessage("NSGadd", "#aab " .. msg1, "guild")
			else
				SendAddonMessage("NSGadd", "#aac " .. msg1, "guild")
			end
		elseif msg1TestLvl=="#aao" then
			msg1 = msg1[3]
			msg1 = tonumber(msg1)
			id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
			if completed == true then
				SendAddonMessage("NSGadd", "#aap " .. msg1, "guild")
			else
				SendAddonMessage("NSGadd", "#aaq " .. msg1, "guild")
			end
		end
	end
end
local myNome = GetUnitName("player")
if string.find (message, "#aaf") and string.find (message, myNome) then
	if testQ[myNome]["лвл_квестов"]~=2 and testQ[myNome]["лвл_квестов"]~=3 then
		proverka_komandy=mysplit(message)
		msg1=proverka_komandy[3]
		msg1 = tonumber(msg1)
		id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
		if completed == true then
			SendAddonMessage("NSGadd", "#aag " .. msg1, "guild")
			btn[1]:Enable()
			btn[1]:Show()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
			SendChatMessage("*Квест еще не выполнен.", "OFFICER", nil, 1)
		end
	elseif testQ[myNome]["лвл_квестов"]==2 then
		proverka_komandy=mysplit(message)
		msg1=proverka_komandy[3]
		msg1=tonumber(msg1)
		if testQ[myNome]["квест_лвл2"][msg1] ~= nil then
			mozhnoLiSdatChislo11=testQ[myNome]["квест_лвл2"][msg1]
		else
			msg1=tostring(msg1)
			mozhnoLiSdatChislo11=testQ[myNome]["квест_лвл2"][msg1]
		end
		msg1=tonumber(msg1)
		mozhnoLiSdatChislo11=tonumber(mozhnoLiSdatChislo11)
		j=0
		k=0

		count = GetAchievementNumCriteria(msg1)
		for i=1, count do
			local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msg1, i);
			prov=completed
			if prov == true then
				j=j+1
			else
				k=k+1
			end
			i=i+1
		end
		print(j .. " j")
		print(mozhnoLiSdatChislo11 .. " mozhnoLiSdatChislo11")
		if j>=mozhnoLiSdatChislo11 then
			SendAddonMessage("NSGadd", "#zzk " .. j .. " " .. msg1 .. " " .. mozhnoLiSdatChislo11, "guild")
			--SendChatMessage(hshStran3C .. " #zzk " .. " Я сделал " .. j .. msg1" пунктов ачивки " .. msg1 .. " " ..  GetAchievementLink(msg1) .. " из " .. mozhnoLiSdatChislo, "OFFICER", nil, 1)
			btn[1]:Enable()
			btn[1]:Show()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
		end
	elseif testQ[myNome]["лвл_квестов"]==3 then
		if testQ[myNome]["взятый_квест3_2"] == "vzyat" then
			proverka_komandy=mysplit(message)
			msg1=proverka_komandy[3]
			msg1 = tonumber(msg1)
			if testQ[myNome]["квест_лвл3"][msg1] ~= nil then
				mozhnoLiSdatChislo=testQ[myNome]["квест_лвл3"][msg1]
			else
				msg1 = tostring(msg1)
				mozhnoLiSdatChislo=testQ[myNome]["квест_лвл3"][msg1]
			end
			msg1 = tonumber(msg1)
			mozhnoLiSdatChislo=tonumber(mozhnoLiSdatChislo)
			j=0
			k=0
			count = GetAchievementNumCriteria(msg1)
			for i=1, count do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msg1, i);
				prov=completed
				if prov == true then
					j=j+1
				else
					k=k+1
				end
				i=i+1
			end

			if j>=mozhnoLiSdatChislo then
				SendAddonMessage("NSGadd", "#zzk " .. j .. " " .. msg1 .. " " .. mozhnoLiSdatChislo, "guild")
				--SendChatMessage(hshStran3C .. " #zzk " .. " Я сделал " .. j .. msg1" пунктов ачивки " .. msg1 .. " " ..  GetAchievementLink(msg1) .. " из " .. mozhnoLiSdatChislo, "OFFICER", nil, 1)
				btn[1]:Enable()
				btn[1]:Show()
				btn[1]:SetText("Взять квест")
				testQ[myNome]["взятый_квест"]="9999"
			else
			end
		elseif testQ[myNome]["взятый_квест3_1"] == "vzyat" then
			proverka_komandy=mysplit(message)
			msg1=proverka_komandy[3]
			msg1 = tonumber(msg1)
			id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
			if completed == true then
				SendAddonMessage("NSGadd", "#aag " .. msg1, "guild")
				btn[1]:Enable()
				btn[1]:Show()
				btn[1]:SetText("Взять квест")
				testQ[myNome]["взятый_квест"]="9999"
			else
				SendChatMessage("*Квест еще не выполнен.", "OFFICER", nil, 1)
			end
		end
	end
end

if string.find (message, "#aa3") and string.find (message, myNome) then
	testQ[myNome]["лвл_квестов"]=3
end

if string.find (message, "!crtb") then
	print("1")
	if rangeGen == nil then
		rangeGen = {}
	end
	local uni = UnitGUID("Target")
	uni = tostring(uni)
	if rangeGen[uni] == nil then
		rangeGen[uni] = {}
	end
	rangeGen[uni] = {}
	local n,ni = UnitName("target")
	rangeGen[uni]["имя"] = n
	rangeGen[uni]["айди"] = uni

end

if string.find (message, "#aah") or string.find (message, "#aan") then
	if string.find (message, myNome) then
		msgQLVL2 = mysplit(message)
		if msgQLVL2[1] == "#aah" then
			testQ[myNome]["лвл_квестов"]=2
			msgQLVL2 = msgQLVL2[3]
			msgQLVL2 = tonumber(msgQLVL2)
			j=0
			k=0
			count = GetAchievementNumCriteria(msgQLVL2)
			for i=1, count do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgQLVL2, i);
				prov=completed
				if prov == true then
					j=j+1
				else
					k=k+1
				end
				i=i+1
			end
			if k==0 then
				SendAddonMessage("NSGadd", "#aai " .. msgQLVL2, "guild")
			else
				SendAddonMessage("NSGadd", "#aaj " .. k .. " " .. count .. " " .. msgQLVL2, "guild")
			--SendChatMessage(hshStran3C .. " #aaj " .. "доступно пунктов ачивки: " .. k .. " из " .. count  .. " " .. msgQLVL2 .. " " .. GetAchievementLink(msgQLVL2), "OFFICER", nil, 1)
			end
		elseif msgQLVL2[1] == "#aan" then
			testQ[myNome]["лвл_квестов"]=3
			msgQLVL2 = msgQLVL2[3]
			msgQLVL2 = tonumber(msgQLVL2)
			j=0
			k=0
			count = GetAchievementNumCriteria(msgQLVL2)
			for i=1, count do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgQLVL2, i);
				prov=completed
				if prov == true then
					j=j+1
				else
					k=k+1
				end
				i=i+1
			end
			if k==0 then
				SendAddonMessage("NSGadd", "#aar " .. msgQLVL2, "guild")
			else
				SendAddonMessage("NSGadd", "#aas " .. k .. " " .. count .. " " .. msgQLVL2, "guild")
				--SendChatMessage(hshStran3C .. " #aaj " .. "доступно пунктов ачивки: " .. k .. " из " .. count  .. " " .. msgQLVL2 .. " " .. GetAchievementLink(msgQLVL2), "OFFICER", nil, 1)
			end
		end
	end
end

local myNome = GetUnitName("player")
if string.find (message, "#aae") or string.find (message, "#aaq") then
	if string.find (message, myNome) then
		msg13 = mysplit(message)
		if msg13[1] == "#aae" then
			if testQ[myNome]["квест_лвл3"] == nil then
				testQ[myNome]["квест_лвл3"] = {}
			end
			msg13 = msg13[3]
			testQ[myNome]["взятый_квест"]=msg13
			table.insert(testQ[myNome]["квест_лвл3"],msg13)
			testQ[myNome]["взятый_квест3_1"]="vzyat"
			testQ[myNome]["взятый_квест3_2"]="nevzyat"
		elseif msg13[1] == "#aaq" then
			if testQ[myNome]["квест_лвл3"] == nil then
				testQ[myNome]["квест_лвл3"] = {}
			end
			msg13 = msg13[3]
			testQ[myNome]["взятый_квест"]=msg13
			table.insert(testQ[myNome]["квест_лвл3"],msg13)
			testQ[myNome]["взятый_квест3_2"]="vzyat"
			testQ[myNome]["взятый_квест3_1"]="nevzyat"
		end
	end
end

if string.find (message, "#xxx") and string.find (message, myNome) then
	btn[1]:Enable()
	btn[1]:Show()
	btn[1]:SetText("Взять квест")
	testQ[myNome]["взятый_квест"]="9999"
	testQ[myNome]["q33q"]=nil
end

if string.find (message, "#questTimerID2") and sender == myNome then
	testQ["timerID2"] = 60
	btn[2]:Disable()
	btn[1]:Disable()
end

if string.find (message, "#aak") and string.find (message, myNome) then
	msgVzyalQ2=mysplit(message)
	msgVzyalQ2=msgVzyalQ2[3]
	msgVzyalQ2=tonumber(msgVzyalQ2)
	if testQ[myNome]==nil then
		testQ[myNome]={}
	end
	if testQ[myNome]["квест_лвл2"]==nil then
		testQ[myNome]["квест_лвл2"]={}
	end
	if testQ[myNome]["квест_лвл3"]==nil then
		testQ[myNome]["квест_лвл3"]={}
	end
	if testQ[myNome]["лвл_квестов"] == 2 then
		count = GetAchievementNumCriteria(msgVzyalQ2)
		count = tonumber(count)
		testQ[myNome]["квест_лвл2"][msgVzyalQ2]=count
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
	elseif testQ[myNome]["лвл_квестов"] == 3 then
		count = GetAchievementNumCriteria(msgVzyalQ2)
		count =tonumber(count)
		testQ[myNome]["квест_лвл3"][msgVzyalQ2]=count
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
	end
end

if string.find (message, "#cls") and sender == myNome then
	testQ[myNome]["отключить_поиск"]="тру"
	testQ[myNome]["старт_поиска_нпц"] = time()

end



if string.find (message, "#krt") and sender == myNome then
	if krt == nil then
		krt = {}
	else
		if krt[777] == nil then
			local testKont = GetCurrentMapContinent()
			testKont = tonumber(testKont)
			if testKont == 1 then
				if krt[99] == nil then
					btnF:SetChecked(true)
					krt[99] = true
					if krt[1] == true then
						mostraKrtl2("Show",316,576,316,576,1,1,12)
						mostraKrtl2("Show",316,576,316,576,1,1,12)
						mostraKrtl2("Show",320,580,410,569,50,1,3)
					end
					if krt[2] == true then
						mostraKrtl2("Show",496,554,496,554,1,1,12)
						mostraKrtl2("Show",500,558,490,508,50,1,3)
					end
					if krt[3] == true then
						mostraKrtl2("Show",616,561,616,561,1,1,12)
						mostraKrtl2("Show",620,565,617,510,100,1,3)
					end
					if krt[4] == true then
						mostraKrtl2("Show",316,421,316,421,1,1,12)
						mostraKrtl2("Show",320,425,325,370,100,1,3)
					end
					if krt[5] == true then
						mostraKrtl2("Show",471,426,471,426,1,1,12)
						mostraKrtl2("Show",471,426,550,500,100,1,3)
					end
					if krt[6] == true then
						mostraKrtl2("Show",611,436,611,436,1,1,12)
						mostraKrtl2("Show",615,440,610,390,100,1,3)
					end
					if krt[7] == true then
						mostraKrtl2("Show",326,311,326,311,1,1,12)
						mostraKrtl2("Show",330,315,362,250,50,1,3)
					end
					if krt[8] == true then
						mostraKrtl2("Show",421,321,676,371,1,1,12)
						mostraKrtl2("Show",425,325,525,344,100,1,3)
					end
					if krt[9] == true then
						mostraKrtl2("Show",660,346,660,346,1,1,12)
						mostraKrtl2("Show",664,350,534,360,200,1,3)
					end
					if krt[10] == true then
						mostraKrtl2("Show",296,151,296,151,1,1,12)
						mostraKrtl2("Show",300,155,307,250,50,1,3)
					end
					if krt[11] == true then
						mostraKrtl2("Show",471,246,676,451,1,1,12)
						mostraKrtl2("Show",475,250,500,275,50,1,3)
					end
					if krt[12] == true then
						mostraKrtl2("Show",586,226,586,226,1,1,12)
						mostraKrtl2("Show",590,230,540,217,100,1,3)
					end
					if krt[13] == true then
						mostraKrtl2("Show",381,106,381,106,1,1,12)
						mostraKrtl2("Show",385,110,410,118,50,1,3)
					end
					if krt[14] == true then
						mostraKrtl2("Show",456,46,456,46,1,1,12)
						mostraKrtl2("Show",460,50,550,43,50,1,3)
					end
					if krt[15] == true then
						mostraKrtl2("Show",596,36,596,36,1,1,12)
						mostraKrtl2("Show",600,40,548,140,50,1,3)
					end

					if krt[999] ~= nil then
						local chern = krt[999]
						for i = 1, krt[999] do
							if chern >=1 then
								if krt[1] == true and krt[2] == true and chern >= 1 then
									mostraKrtl2("Show",320,580,500,558,150,1,3)
									chern = chern - 1
								end
								if krt[2] == true and krt[5] == true and chern >= 1 then
									mostraKrtl2("Show",500,558,475,430,150,1,3)
									chern = chern - 1
								end
								if krt[5] == true and krt[3] == true and chern >= 1 then
									mostraKrtl2("Show",471,426,620,565,100,1,3)
									chern = chern - 1
								end
								if krt[3] == true and krt[6] == true and chern >= 1 then
									mostraKrtl2("Show",620,565,615,440,100,1,3)
									chern = chern - 1
								end
								if krt[6] == true and krt[12] == true and chern >= 1 then
									mostraKrtl2("Show",615,440,590,230,100,1,3)
									chern = chern - 1
								end
								if krt[12] == true and krt[10] == true and chern >= 1 then
									mostraKrtl2("Show",590,230,300,155,150,1,3)
									chern = chern - 1
								end
								if krt[10] == true and krt[4] == true and chern >= 1 then
									mostraKrtl2("Show",300,155,320,425,150,1,3)
									chern = chern - 1
								end
								if krt[4] == true and krt[7] == true and chern >= 1 then
									mostraKrtl2("Show",320,425,330,315,100,1,3)
									chern = chern - 1
								end
								if krt[7] == true and krt[14] == true and chern >= 1 then
									mostraKrtl2("Show",330,315,460,50,150,1,3)
									chern = chern - 1
								end
								if krt[14] == true and krt[15] == true and chern >= 1 then
									mostraKrtl2("Show",460,50,600,40,150,1,3)
									chern = chern - 1
								end
								if krt[15] == true and krt[1] == true and chern >= 1 then
									mostraKrtl2("Show",600,40,320,580,300,1,3)
									chern = chern - 1
								end
								if krt[8] == true and chern >= 1 then
									mostraKrtl2("Show",425,325,680,375,200,1,3)
									chern = chern - 1
								end
								if krt[9] == true and chern >= 1 then
									mostraKrtl2("Show",664,350,250,381,200,1,3)
									chern = chern - 1
								end
								if krt[11] == true and chern >= 1 then
									mostraKrtl2("Show",475,250,680,455,200,1,3)
									chern = chern - 1
								end
								if krt[13] == true and chern >= 1 then
									mostraKrtl2("Show",385,110,700,210,200,1,3)
									chern = chern - 1
								end
							else
								break
							end
						end
					end
				else
					krt[99] = nil
					krtHide("Hide")
					btnF:SetChecked(false)
				end
			end
		else
			if krt[777] == 2 then
			local lok = GetCurrentMapZone()
			lok = tonumber(lok)
				if lok == 10 then
					if krt[99] == nil then
						krt[99] = true
						btnF:SetChecked(true)
						if krt[21] == true then
							mostraKrtl2("Show",96,546,96,46,1,1,12)
							mostraKrtl2("Show",96,546,96,46,1,1,12)
							mostraKrtl2("Show",100,550,132,475,50,1,3)
						end
						if krt[22] == true then
							mostraKrtl2("Show",171,371,171,371,1,1,12)
							mostraKrtl2("Show",175,375,275,435,100,1,3)
						end
						if krt[23] == true then
							mostraKrtl2("Show",446,536,446,536,1,1,12)
							mostraKrtl2("Show",450,540,500,500,50,1,3)
						end
						if krt[24] == true then
							mostraKrtl2("Show",561,446,561,446,1,1,12)
							mostraKrtl2("Show",565,450,613,500,100,1,3)
						end
						if krt[25] == true then
								mostraKrtl2("Show",671,561,671,561,1,1,12)
								mostraKrtl2("Show",675,565,750,564,50,1,3)
						end
						if krt[26] == true then
							mostraKrtl2("Show",816,559,816,559,1,1,12)
							mostraKrtl2("Show",820,563,795,500,50,1,3)
						end
							if krt[27] == true then
							mostraKrtl2("Show",621,71,621,71,1,1,12)
							mostraKrtl2("Show",625,75,750,103,50,1,3)
						end
						if krt[28] == true then
							mostraKrtl2("Show",846,121,846,121,1,1,12)
							mostraKrtl2("Show",850,125,750,122,50,1,3)
						end
						if krt[29] == true then
							mostraKrtl2("Show",71,96,71,96,1,1,12)
							mostraKrtl2("Show",75,100,250,74,100,1,3)
						end
						if krt[30] == true then
							mostraKrtl2("Show",396,46,396,46,1,1,12)
							mostraKrtl2("Show",400,50,250,150,100,1,3)
						end
						if krt[31] == true then
							mostraKrtl2("Show",96,246,96,246,1,1,12)
							mostraKrtl2("Show",100,250,250,240,100,1,3)
						end
						if krt[32] == true then
							mostraKrtl2("Show",296,361,296,361,1,1,12)
							mostraKrtl2("Show",300,365,450,346,200,1,3)
						end
						if krt[33] == true then
							mostraKrtl2("Show",371,296,371,296,1,1,12)
							mostraKrtl2("Show",375,300,500,328,100,1,3)
						end
						if krt[34] == true then
							mostraKrtl2("Show",896,246,896,246,1,1,12)
							mostraKrtl2("Show",900,250,750,285,100,1,3)
						end


						if krt[999] ~= nil then
							local chern = krt[999]
							for i = 1, krt[999] do
								if chern >=1 then
									if krt[1] == true and krt[2] == true then
										if testQ["evO0102"] == true then
											mostraKrtl2("Show",100,550,175,375,100,1,3)
										end
									end
									if krt[2] == true and krt[3] == true then
										if testQ["evO0203"] == true then
											mostraKrtl2("Show",175,375,450,540,150,1,3)
										end
									end
									if krt[3] == true and krt[4] == true then
										if testQ["evO0304"] == true then
											mostraKrtl2("Show",450,540,565,450,100,1,3)
										end
									end
									if krt[4] == true and krt[5] == true then
										if testQ["evO0405"] == true then
											mostraKrtl2("Show",565,450,675,565,100,1,3)
										end
									end
									if krt[5] == true and krt[6] == true then
										if testQ["evO0506"] == true then
											mostraKrtl2("Show",675,565,820,563,100,1,3)
										end
									end
									if krt[6] == true and krt[7] == true then
										if testQ["evO0607"] == true then
											mostraKrtl2("Show",820,563,625,75,200,1,3)
										end
									end
									if krt[7] == true and krt[8] == true then
										if testQ["evO0708"] == true then
											mostraKrtl2("Show",625,75,850,125,100,1,3)
										end
									end
									if krt[8] == true and krt[9] == true then
										if testQ["evO0809"] == true then
											mostraKrtl2("Show",850,125,75,100,300,1,3)
										end
									end
									if krt[9] == true and krt[10] == true then
										if testQ["evO0910"] == true then
											mostraKrtl2("Show",75,100,400,50,200,1,3)
										end
									end
									if krt[10] == true and krt[11] == true then
										if testQ["evO1011"] == true then
											mostraKrtl2("Show",400,50,100,250,200,1,3)
										end
									end
									if krt[11] == true then
										if testQ["evO11"] == true then
											mostraKrtl2("Show",100,250,1000,190,400,1,3)
										end
									end
									if krt[12] == true then
										if testQ["evO12"] == true then
											mostraKrtl2("Show",300,365,1000,275,400,1,3)
										end
									end
									if krt[13] == true then
										if testQ["evO13"] == true then
											mostraKrtl2("Show",375,300,1000,440,400,1,3)
										end
									end
									if krt[14] == true then
										if testQ["evO14"] == true then
											mostraKrtl2("Show",900,250,0,460,400,1,3)
										end
									end

								end
							end
						end
					else
						krt[99] = nil
						krtHide("Hide")
						btnF:SetChecked(false)
					end
				end


			end
		end
	end
end

if string.find (message, "#opn") and sender == myNome then
	testQ[myNome]["отключить_поиск"]=nil
end

if string.find (message, "#crtPoint") and sender == myNome then
	SendAddonMessage("NSGadd", "!следить", "guild")
end

if string.find (message, "#ver") and sender ~= "Витинари" then
	if myNome == "Витинари" then
		SendAddonMessage("NSGadd", "#verS " .. versAdd, "guild")
	end
end

if string.find (message, "#ahtng") and sender == myNome then
	testQ=nil
end

if string.find (message, "#verS") and sender == "Витинари" then
	local versA = mysplit(message)
	if versA[2] ~= nil then
		print ("Актуальная версия аддона: " .. versA[2] .. ". Текущая версия аддона: " .. versAdd)
	else
		print ("Вождь ушел кормить коз")
	end
end

if string.find (message, "#zz_x") and string.find (message, myNome) and testGM~=nil then
	testQ[myNome]["zzl"] = nil
	testQ[myNome]["btn3"] = 1
	if testQ[myNome]["zzlf"] ~= nil then
		testQ[myNome]["zzlf"] = testQ[myNome]["zzlf"] - bonusQuestF
	else
		testQ[myNome]["zzlf"] = 0
	end
end

if string.find (message, "#killdpoq") and string.find (message, myNome) and testGM~=nil then
	testQ[myNome]["zzl"] = nil
	testQ[myNome]["btn3"] = 1
	testQ[myNome]["zzlf"] = 0
end

if string.find (message, "#u") and sender == myNome then
	print ("1. Управление гильдией осуществляется путем прямой демократии: 1 игрок - 1 голос*.")
	print ("*глава гильдии - тот самый игрок, который имеет единственный голос.")
	print ("1.1. Орнелла Мути законодательно является лучше Моники Белуччи и любых других актрис (или альтернативных актеров")
	print ("1.2. Незнание устава не освобождает от ответственности и является отягчающим обстоятельством")
	print ("2. Торговля в гильдии запрещена")
	print ("3. Попрошайничество в гильдии запрещено. Наказание - смерть. Или исключение из гильдии до возможности исполнить приговор")
	print ("3.0. Офицеры могут исключать и понижать в звании, исходя из принципа гуманности")
	print ("3.1 Строго не рекомендуется давать деньги званиям ниже капитана")
	print ("3.2 Прохождение подземелий с новичками ниже вас на 10 уровней или с илвлом на 80 от вашего молчаливо порицается")
	print ("\(офицеры, не стесняйтесь использовать молчаливое порицание для слишком настырных\)")
	print ("4. Каждый член гильдии имеет право попросить квест и получить за выполнение этого квеста награду")
	print ("4.1. Каждый член гильдии имеет право отказаться от квеста и получить следующий квест гораздо сложнее за ту же награду. (Количество доступных квестов на сутки обнуляется)")
	print ("4.2. Гоблины имеют бонусную единицу опыта на каждый гильдлвл ")
	print ("4.2.1. Вульперы получают половину гоблинского бонуса")
	print ("4.3. Каждый член гильдии имеет право ничего не делать, если не хочет")
	print ("4.4 Запрещается навязывать другим игрокам свои ценности, насколько бы хороши они ни были. На усмотрение модерации")
	print ("4.4.1. Запрещается продолжать беседу на тему, которая не нравится любому участнику чата")
	print ("5. Каждый член гильдии имеет право на три необоснованных мата в час. Каждый последующий мат: понижение в звании до исполняющего обязанности констебля на один час")
	print ("5.1 Если женщина или прочий какой беременный ребенок младше 25 лет жалуется на мат, матерящийся понижается в звании")
	print ("до первого звания на срок пока пожаловавшийся не попросит повысить или не уйдет из гильдии")
	print ("5.1.1. За уместностью матов следят офицеры")
	print ("5.2 Грамматические ошибки считаются за половину мата")
	print ("5.2.1 Персонаж с \"правильным\" уникальным ником имеет право на бонус \(на усмотрение ГМа\): ")
	print ("- Полностью кириллический односложный ник: 5 опыта")
	print ("- Односложный ник на латинице 1 опыта")
	print ("5.3. Штрафы для офицеров утроены")
	print ("5.4. Все ушедшие в добровольный отпуск, получают запись об этом и на время отпуска понижаются в до минимального звания ")
	print ("6.1. Офицер всегда прав")
	print ("6.3. Верующих может исключать только их персональное божество или глава гильдии лично")
	print ("7. АУЕ запрещено \(Кик по желанию офицера\). \(Закон Леджаго\)")
	print ("7.1. Политика запрещена. Вся, целиком. Все что не относится к игровому миру в данном контексте")
	print ("8. Действия направленные на подрыв экономической и политической безопасности гильдии запрещены")
	print ("8.2. Необоснованные обвинения вышестоящего офицера запрещены, если вас не поддерживают еще двое игроков вашего ранга или выше")
	print ("13.4. Оскорбление члена гильдии считается клеветой, если оскорбляющего не поддержат минимум двое членов гильдии рангом не ниже оскорбляемого")
	print ("Наказание назначает оскорбляемый")
	print ("13.4.1. Если оскорбляющего поддерживают двое равных рангом оскорбляемому или выше, все трое понижаются на одно звание")
	print ("13.4.2. Провоцирующий нарушение получат наказание равное нарушившему")
	print ("13.4.3. Офицер имеет право исключить самозванца, маскирующегося под его ник")
	print ("15. Закон обратной силы не имеет")
end

if string.find (message, "#nuovoPoint") and sender ~= myNome then
print(sender)
print(myNome)
nPoint=mysplit(message)
npcXY(nPoint[2],nPoint[3],nPoint[4],nPoint[5],nPoint[6])
print ("Приняты координаты " .. nPoint[6] .. " от " .. sender)
end

if string.find (message, "!следить") and sender == myNome then
	if WorldMapFrame:IsVisible() == nil then
		if npcScan == nil then
			npcScan = {}
		end
		testNpcScanDal = nil
		npcSK=GetCurrentMapContinent()
		npcSK=tostring(npcSK)
		npcSL=GetCurrentMapZone()
		npcSL=tostring(npcSL)
		if npcScan[npcSK] == nil then
			npcScan[npcSK] = {}
		end
		if npcScan[npcSK][npcSL] == nil then
			npcScan[npcSK][npcSL] = {}
		end
		local unitNome=UnitName("target")
		if unitNome ~= nil then
			npcPX, npcPY = GetPlayerMapPosition("player")
			npcPX=tostring(npcPX)
			npcPY=tostring(npcPY)
			if npcScan[npcSK][npcSL][unitNome] == nil then
				npcCount=1
				npcCount=tostring(npcCount)
				npcScan[npcSK][npcSL][unitNome] = {}
				npcScan[npcSK][npcSL][unitNome][npcCount] = {}
				npcScan[npcSK][npcSL][unitNome][npcCount]["x"] = npcPX
				npcScan[npcSK][npcSL][unitNome][npcCount]["y"] = npcPY
				SendAddonMessage("NSGadd", "#nuovoPoint " .. npcSK .. " " .. npcSL .. " " .. npcPX .. " " .. npcPY .. " " .. unitNome, "guild")
			else
				x,y=GetPlayerMapPosition("player")
				nomeRar={}
				npcTestToch={}
				i=0
				for key, val in pairs(npcScan[npcSK][npcSL]) do
					i=i+1
					nomeRar[i] = key
				end
				for j=1, #nomeRar do
					for key, val in pairs(npcScan[npcSK][npcSL][nomeRar[j]]) do
						for key, val in pairs(npcScan[npcSK][npcSL][nomeRar[j]][key]) do
							if key == "x" then
								xRar = val
							end
							if key == "y" then
								yRar = val
							end
						end
						npcRasstoyanie=sqrt((xRar-x)^2+(yRar-y)^2)

						if npcRasstoyanie<=0.04 then
							table.insert(npcTestToch, "тру")
						end
					end
					j=j+1
				end
				for i = 1, #npcTestToch do
					if npcTestToch[i] == "тру" then
						print ("Эта точка для юнита " .. unitNome .. " уже есть в базе")
						testNpcScanDal = 0
						break
					end
				end
				if testNpcScanDal ~= 0 then
					npcCount = (tablelength(npcScan[npcSK][npcSL][unitNome])) + 1
					npcCount=tostring(npcCount)
					npcPX=tostring(npcPX)
					npcPY=tostring(npcPY)
					npcScan[npcSK][npcSL][unitNome][npcCount] = {}
					npcScan[npcSK][npcSL][unitNome][npcCount]["x"] = npcPX
					npcScan[npcSK][npcSL][unitNome][npcCount]["y"] = npcPY
					SendAddonMessage("NSGadd", "#nuovoPoint " .. npcSK .. " " .. npcSL .. " " .. npcPX .. " " .. npcPY .. " " .. unitNome, "guild")
				end
			end
		else
			print ("Выбери цель")
		end
	else
		print ("Закрой карту")
	end
end

if string.find (message, "#aal") and string.find (message, myNome) then
	if testQ[myNome]==nil then
		testQ[myNome]={}
	end
	if testQ[myNome]["квест_лвл2"]==nil then
		testQ[myNome]["квест_лвл2"]={}
	end
	if testQ[myNome]["квест_лвл3"]==nil then
		testQ[myNome]["квест_лвл3"]={}
	end
	if testQ[myNome]["лвл_квестов"] == 2 then
		msgVzyalQ2=mysplit(message)
		msgVzyalQ2=msgVzyalQ2[3]
		j=0
		k=0
		count = GetAchievementNumCriteria(msgVzyalQ2)
		for i=1, count do
			local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgVzyalQ2, i);
			prov=completed
			if prov == true then
				j=j+1
			else
				k=k+1
			end
			i=i+1
		end
		j=j+3
		testQ[myNome]["квест_лвл2"][msgVzyalQ2]=j
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
	elseif testQ[myNome]["лвл_квестов"] == 3 then
		msgVzyalQ2=mysplit(message)
		msgVzyalQ2=msgVzyalQ2[3]
		msgVzyalQ2=tonumber(msgVzyalQ2)
		j=0
		k=0
		count = GetAchievementNumCriteria(msgVzyalQ2)
		for i=1, count do
			local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgVzyalQ2, i);
			prov=completed
			if prov == true then
				j=j+1
			else
				k=k+1
			end
			i=i+1
		end
		j=j+3
		print (myNome)
		print( testQ[myNome])
		testQ[myNome]["квест_лвл3"][msgVzyalQ2]=j
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		testQ[myNome]["взятый_квест3_2"]="vzyat"
		testQ[myNome]["взятый_квест3_1"]="nevzyat"
	end
end

if testGM~=nil then
local testXY
testXY=mysplit(message)
if testXY[1]=="#zzn" then
	framePos["hshXY"]=testXY[1]


    nX={}
    nY={}

    nX[1]=string.sub(testXY[2],1,1)
    nY[1]=string.sub(testXY[2],2,2)
    nX[2]=string.sub(testXY[2],3,3)
    nY[2]=string.sub(testXY[2],4,4)
    nX[3]=string.sub(testXY[2],5,5)
    nY[3]=string.sub(testXY[2],6,6)
    nX[4]=string.sub(testXY[2],7,7)
    nY[4]=string.sub(testXY[2],8,8)
    nX[5]=string.sub(testXY[2],9,9)
    nY[5]=string.sub(testXY[2],10,10)
    nX[6]=string.sub(testXY[2],11,11)
    nY[6]=string.sub(testXY[2],12,12)
    nX[7]=string.sub(testXY[2],13,13)
    nY[7]=string.sub(testXY[2],14,14)
    nX[8]=string.sub(testXY[2],15,15)
    nY[8]=string.sub(testXY[2],16,16)
    nXres=nX[1]..nX[2]..nX[3]..nX[4]..nX[5]..nX[6]..nX[7]..nX[8]
    nYres=nY[1]..nY[2]..nY[3]..nY[4]..nY[5]..nY[6]..nY[7]..nY[8]
	nXres="0."..nXres
	nYres="0."..nYres
	mioTime=1
	testRasstoyanie=0
	nKont=testXY[3]
	nLok=testXY[4]
	framePos["X"]=nXres
	framePos["Y"]=nYres
	framePos["kont"]=nKont
	framePos["lok"]=nLok
	framePos["mapViz"]=testXY[5]
end
end

end
end
)
