local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
--команды для управления квестами
local nik=sender
local myNome = GetUnitName("player")
local msg = mysplit(message)
local kodMsg = mysplit(kod)
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

if kodMsg[1] == "obgIz" then
print(sender,kod,message)
end

if kodMsg[1] == "rasstoyanie" then
	if mapTables == nil then
		mapTables = {}
	end
	if mapTables["lokRasstoyanie"] == nil then
		mapTables["lokRasstoyanie"] = {}
	end
	if mapTables["lokRasstoyanie"][tostring(kodMsg[2])] == nil then
		mapTables["lokRasstoyanie"][tostring(kodMsg[2])] = {}
	end
	mapTables["lokRasstoyanie"][tostring(kodMsg[2])][tostring(kodMsg[3])] = tonumber(message)
end
if kodMsg[1] == "event1" then
	if testQ ~= nil then
		testQ["event1"] = {}
		for i=1,100 do
			testQ["event1"][i] = msg[i]
		end
	end
end

if kodMsg[1] == "FailPointEvent1" then
	if iconRis[tonumber(testQ["event1"][tonumber(message)])] ~= nil then
		iconRis[tonumber(testQ["event1"][tonumber(message)])]:Hide()
	end
	testQ["event1"][tonumber(message)]=9999
end
if  kodMsg[1] == "NSGaddChatKL" then
	if mapTables == nil then
		mapTables = {}
	end
	mapTables[kodMsg[2]] = {}
	mapTables[kodMsg[2]][tostring(msg[1])]={}
	mapTables[kodMsg[2]][tostring(msg[1])][tostring(msg[2])]={}
	testQ["tempTabKont"] = msg[1]
	testQ["tempTabLok"] = msg[2]
end
if  kodMsg[1] == "NSGChatX" then
	local kk=1
	for i=1+(tonumber(kodMsg[2])-1)*200,tonumber(kodMsg[2])*200 do
		j = tostring(i)
		if msg[kk] ~= nil then
			if mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] == nil then
				mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] = {}
			end
			mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j]["x"] = tonumber("0." .. msg[kk])
			kk=kk+1
		else
			break
		end
	end
end

if kodMsg[1] == "shMFld" and message == myNome then
	local rez = {}
	if sender ~= myNome then
		if mioFld == nil then
			mioFld = {}
			mioFld[myNome] = {}
			mioFld[myNome]["объекты"] = {}
			mioFld[myNome]["целостность"] = {}
			for i = 1, 100 do
				j = tostring(i)
				mioFld[myNome]["объекты"][j] = "t"
				mioFld[myNome]["целостность"][j] = 999
			end
		end
		for k, v in pairs(mioFld[myNome]) do
			rez[k] = ""
			for i = 1, 100 do
				j = tostring(i)
				print(k,j,rez[k])
				rez[k] = rez[k] .. mioFld[myNome][k][j] .. " "
			end
			SendAddonMessage("MioFld " .. sender .. " " .. k .. " " .. kodMsg[2], rez[k], "guild")
		end
	else
		if mioFld == nil then
			mioFld = {}
		end
		if mioFld[myNome] == nil then
			mioFld[myNome] = {}
			mioFld[myNome]["объекты"] = {}
			mioFld[myNome]["целостность"] = {}
			mioFld[myNome]["подсказки"] = {}
			mioFld[myNome]["влияние"] = {}
			for i = 1, 100 do
				j = tostring(i)
				mioFld[myNome]["объекты"][j] = "t"
				mioFld[myNome]["целостность"][j] = 999
				mioFld[myNome]["подсказки"][j] = "Определенно это дерево..."

			end
		end
		testQ["fRand2"] = kodMsg[2]
	end
end

if kodMsg[1] == "MioFld" then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[sender] == nil then
		mioFld[sender] = {}
	end
	mioFld[sender][kodMsg[3]] = {}
	for i = 1, 100 do
		j = tostring(i)
		mioFld[sender][kodMsg[3]][j] = msg[i]
	end
	testQ["fRand2"] = kodMsg[4]
end

if kodMsg[1] == "obgIz" then
	if mioFld ~= nil then
		if mioFld[message] ~= nil then
			mioFld[message]["целостность"][tostring(kodMsg[2])] = tonumber(kodMsg[3])
			if mioFld[message]["влияние"] == nil then
				mioFld[message]["влияние"] = {}
			end
			if mioFld[message]["подсказки"] == nil then
				mioFld[message]["подсказки"] = {}
			end
			mioFld[message]["подсказки"][tostring(kodMsg[2])] = kodMsg[4]
			if kodMsg[5] ~= nil then
				local podskazka = sender .. " " .. kodMsg[5]
				mioFld[message]["влияние"][tostring(kodMsg[2])] = podskazka
			else
				mioFld[message]["влияние"][tostring(kodMsg[2])] = sender
			end
			testQ["fRand3"] = 1
			testQ["fRand3Nome"] = message
			if sender ~= myNome and message == myNome then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[message]["объекты"][tostring(kodMsg[2])] .. ".ogg")
			end
		end
	end
end
if kodMsg[1] == "travA" then
	if mioFld ~= nil then
		if mioFld[message] ~= nil then
			mioFld[message]["объекты"][tostring(kodMsg[2])] = "f"
			mioFld[message]["подсказки"] = "Густая трава. Ну видно же!"
			mioFld[message]["целостность"][tostring(kodMsg[2])] = 999
			testQ["fRand4"] = 1
			testQ["fRand4Nome"] = message
		end
	end
end
if kodMsg[1] == "podSkazka" then
	if mioFld ~= nil then
		if mioFld[kodMsg[3]] ~= nil then
			if mioFld[kodMsg[3]]["подсказки"] ~= nil then
				mioFld[kodMsg[3]]["подсказки"][tostring(kodMsg[2])] = message
			end
		end
	end
end
if  kodMsg[1] == "NSGChatY" then
	local kk=1
	for i=1+(tonumber(kodMsg[2])-1)*200,tonumber(kodMsg[2])*200 do
		j = tostring(i)
		if msg[kk] ~= nil then
			if mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] == nil then
				mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] = {}
			end
			mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j]["y"] = tonumber("0." .. msg[kk])
			kk=kk+1
		else
			SendChatMessage("Маршрут " .. kodMsg[3] .. " добавлен", "OFFICER", nil, 1)
			break
		end
	end
end

if string.find (kod, "#q33q") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33q"] = message
	testQ[myNome]["взятый_квест"] = "q33"
	btn[7]:Enable()
	btn[8]:Enable()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end
if string.find (kod, "#q33nik1") and string.find (kod, myNome) and testGM ~= nil then
	if testQ[myNome]["q33nik"][1] ~= 1 then
		testQ[myNome]["q33nik"][1] = message
	end
end
if string.find (kod, "#q33nik2") and string.find (kod, myNome) and testGM ~= nil then
	if testQ[myNome]["q33nik"][2] ~= 1 then
		testQ[myNome]["q33nik"][2] = message
	end
end
if string.find (kod, "#q33nik3") and string.find (kod, myNome) and testGM ~= nil then
	if testQ[myNome]["q33nik"][3] ~= 1 then
		testQ[myNome]["q33nik"][3] = message
	end
end
if string.find (kod, "#q33fnd") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33fnd"] = message
end
if string.find (kod, "#q33ans") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33ans"] = message
end

if kod == "#krt7772" and string.find (message, myNome) and testGM ~= nil then
	if krt == nil then
		krt = {}
	end
	krt["777"] = 2
end

if testQ ~= nil then

	if string.find (kod, "#qUpdateS1") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест"] = message
	end
	if string.find (kod, "#qUpdate2v") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["квест_лвл2"] == nil then
			testQ[myNome]["квест_лвл2"] = {}
		end
		if testQ[myNome]["квест_лвл3"] == nil then
			testQ[myNome]["квест_лвл3"] = {}
		end
		testQ[myNome]["лвл_квестов"] = tostring(message)
	end
	if string.find (kod, "#qUpdateS2") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест"] = message
	end
	if string.find (kod, "#qUpdateSqKol2") and string.find (kod, myNome) and testGM ~= nil then
		local q = testQ[myNome]["взятый_квест"]
		testQ[myNome]["квест_лвл2"][q] = message
	end
	if string.find (kod, "#qUpdateS3") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест"] = message
	end
	if string.find (kod, "#qUpdateSF") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q33q"] = message
	end
	if string.find (kod, "#qUpdateSq33q") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q33ans"] = message
	end
	if string.find (kod, "#qUpdateQ3F") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q33fnd"] = message
	end
	if testQ[myNome]["q33nik"] == nil then
		testQ[myNome]["q33nik"] = {}
	end
	if string.find (kod, "#qUpdateSNik1") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["q33nik"][1] ~= 1 then
			testQ[myNome]["q33nik"][1] = message
		end
	end
	if string.find (kod, "#qUpdateSNik2") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["q33nik"][2] ~= 1 then
			testQ[myNome]["q33nik"][2] = message
		end
	end
	if string.find (kod, "#qUpdateSNik3") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["q33nik"][3] ~= 1 then
			testQ[myNome]["q33nik"][3] = message
		end
	end
	if string.find (kod, "#qUpdateQ32") and string.find (kod, myNome) and testGM ~= nil then
		local q = message
		if q ~= "9999" then
			q=tonumber(q)
		end
		testQ[myNome]["взятый_квест"] = q
	end
	if string.find (kod, "#qUpdate3pNum") and string.find (kod, myNome) and testGM ~= nil then
		local num = message
		num = tonumber(num)
		local q = testQ[myNome]["взятый_квест"]
		if testQ[myNome]["квест_лвл3"] == nil then
			testQ[myNome]["квест_лвл3"] = {}
		end
		testQ[myNome]["квест_лвл3"][q] = num
	end
	if string.find (kod, "#qUpdate3_2vz") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест3_2"] = message
	end
	if string.find (kod, "#qUpdate3_1vz") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест3_1"] = message
	end
	if string.find (kod, "#qUpdate3rez") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["квест_лвл3"] == nil then
			testQ[myNome]["квест_лвл3"] = {}
		end
		local q = testQ[myNome]["взятый_квест"]
		testQ[myNome]["квест_лвл3"][q] = message
	end
	if string.find (kod, "#qUpq3S") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q3Stat"] = tonumber(message)
	end
	if string.find (kod, "#qUp3StatNum") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q3StatNum"] = tonumber(message)
	end

end
if string.find (kod, "#q3Stat") and string.find (kod, myNome) and testGM ~= nil then
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10 = GetAchievementCriteriaInfo(tonumber(message), 1)
	SendAddonMessage("#q3otvStat", arg4, "guild")
	SendChatMessage("У меня выполненно " .. arg4 .. " пунктов ачивки " .. GetAchievementLink(tonumber(message)), "OFFICER", nil, 1)
	testQ[myNome]["q3StatTemp"] = tonumber(message)
	testQ[myNome]["q3StatNum"] = tonumber(arg4)
end
if string.find (kod, "#q3stStart") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q3Stat"] = testQ[myNome]["q3StatTemp"]
	testQ[myNome]["взятый_квест"] = "q3Stat"
	btn[7]:Enable()
	btn[8]:Enable()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end

if string.find (kod, "#otLadkaNS") and string.find (kod, myNome) and testGM ~= nil then
	local msg = mysplit(message)
	print (message)
	local x,y=otladka(msg[1],msg[2],msg[3],msg[4],msg[5],msg[6],msg[7])
	SendAddonMessage("NSGadd", x .. " " .. y, "guild")
end
if kod == "#ch1ernilaC" and testGM ~= nil then
	if msg[6] == "chern1" then
		if krt == nil then
			krt = {}
		end
		if krt["chernila"] == nil then
			krt["chernila"] = {}
		end
		if krt["chernila"][msg[1]] == nil then
			krt["chernila"][msg[1]] = {}
		end
		if krt["chernila"][msg[1]][msg[2]] == nil then
			krt["chernila"][msg[1]][msg[2]] = {}
		end
		if krt["chernila"][msg[1]][msg[2]][msg[3]] == nil then
			krt["chernila"][msg[1]][msg[2]][msg[3]] = {}
		end
		krt["chernila"]["nomer"] = msg[1]
		krt["chernila"]["kont"] = msg[2]
		krt["chernila"]["lok"] = msg[3]
		krt["chernila"]["msg"] = 1
		krt["chernila"]["cel"] = 1
		krt["chernila"]["podskazki"] = 1
		krt["chernila"][msg[1]][msg[2]][msg[3]]["x"] = msg[4]
		krt["chernila"][msg[1]][msg[2]][msg[3]]["y"] = msg[5]
	end
	if msg[6] == "mapQuest" then
		if testQ == nil then
			testQ = {}
		end
		if testQ["mapQuest"] == nil then
			testQ["mapQuest"] = {}
		end
		if testQ["mapQuest"][msg[1]] == nil then
			testQ["mapQuest"][msg[1]] = {}
		end
		if testQ["mapQuest"][msg[1]][msg[2]] == nil then
			testQ["mapQuest"][msg[1]][msg[2]] = {}
		end
		if testQ["mapQuest"][msg[1]][msg[2]][msg[3]] == nil then
			testQ["mapQuest"][msg[1]][msg[2]][msg[3]] = {}
		end
		testQ["mapQuest"]["nomer"] = msg[1]
		testQ["mapQuest"]["kont"] = msg[2]
		testQ["mapQuest"]["lok"] = msg[3]
		testQ["mapQuestMsg"] = 1
		testQ["mapQuestCel"] = 1
		testQ["mapQuestPod"] = 1
		testQ["mapQuest"][msg[1]][msg[2]][msg[3]]["x"] = msg[4]
		testQ["mapQuest"][msg[1]][msg[2]][msg[3]]["y"] = msg[5]
	end
end
if kod == "#chernilaCMsg" and testGM ~= nil then
	if krt~= nil then
		if krt["chernila"] ~= nil then
			if krt["chernila"]["msg"] == 1 then
				krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["msg"] = txtXor(message)
			end
		end
	end
	if testQ["mapQuestMsg"] == 1 then
		testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["msg"] = txtXor(message)
	end
end
if kod == "#chernilaCel" and testGM ~= nil then
	if krt ~= nil then
		if krt["chernila"] ~= nil then
			if krt["chernila"]["cel"] == 1 then
				krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["cel"] = txtXor(message)
			end
		end
	end
	if testQ["mapQuestCel"] == 1 then
		testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["cel"] = txtXor(message)
	end
end
if kodMsg[1] == "#ch1ernilaPod" and testGM ~= nil then
	if krt ~= nil then
		if  krt["chernila"] ~= nil then
			if krt["chernila"]["podskazki"] == 1 then
				if krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"] == nil then
					krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"] = {}
				end
				kodMsgStr = tostring(kodMsg[2])
				if kodMsgStr ~= kodMsg[3] then
					krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
				end
				if kodMsgStr == kodMsg[3] then
					krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
					SendChatMessage("База чернил обновлена " .. krt["chernila"]["nomer"], "OFFICER", nil, 1)
					krt["chernila"]["nomer"] = nil
					krt["chernila"]["kont"] = nil
					krt["chernila"]["lok"] = nil
					krt["chernila"]["cel"] = nil
					krt["chernila"]["msg"] = nil
					krt["chernila"]["podskazki"] = nil
				end
			end
		end
	end
	if testQ["mapQuestPod"] == 1 then
		kodMsgStr = tostring(kodMsg[2])
		if kodMsgStr ~= kodMsg[3] then
			if testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"] == nil then
				testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"] = {}
			end
			testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
		end
		if kodMsgStr == kodMsg[3] then
			testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
			SendChatMessage("База территориальных квестов обновлена " .. testQ["mapQuest"]["nomer"], "OFFICER", nil, 1)
			testQ["mapQuest"]["nomer"] = nil
			testQ["mapQuest"]["kont"] = nil
			testQ["mapQuest"]["lok"] = nil
			testQ["mapQuestMsg"] = nil
			testQ["mapQuestCel"] = nil
			testQ["mapQuestPod"] = nil
		end
	end
end

if string.find (kod, "#qMapQuest") and string.find (message, myNome) and testGM ~= nil then
	testQ["mapQuest"]["текущий"] = msg[2]
	if testQ ~= nil then
		if testQ["mapQuest"] ~= nil then
			if testQ["mapQuest"]["список"] == nil then
				testQ["mapQuest"]["список"] = {}
			end
			if testQ["mapQuest"]["список"] ~= nil then
				if testQ["mapQuest"]["список"][msg[2]] ~= "9999" then
					testQ["mapQuest"]["список"][msg[2]] = 1
					local kont, lok, x1, y1, m, c = mapQuest(msg[2])
					SendChatMessage(txtXor(c), "OFFICER", nil, 1)
				else
					SendChatMessage("Я уже делал териториальный квест " .. msg[2], "OFFICER", nil, 1)
				end
			end
		end
	end
end
if kod == "#M1QP" and message == myNome then
	if krt ~= nil then
		if krt["777"] == nil then
			if krt["podskazki"] == nil then
				krt["podskazki"] = 1
			else
				krt["podskazki"] = krt["podskazki"] + 1
			end
		end
		if krt["777"] == 3 then
			if krt["evO3"] == nil then
				krt["evO3"] = {}
				krt["evO3"]=1
			else
				krt["evO3"] = krt["evO3"]+1
			end
		end
	end
	if testQ ~= nil then
		if testQ["mapQuest"] ~= nil then
			if testQ["mapQuest"]["текущий"] ~= nil and testQ["mapQuest"]["текущий"] ~= "9999" then
				if testQ["mapQuest"]["podskazki"] == nil then
					testQ["mapQuest"]["podskazki"] = 1
					mapQuestP(testQ["mapQuest"]["текущий"])
					local msgQ = txtXor(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
					SendChatMessage(msgQ, "SAY", DEFAULT_CHAT_FRAME.editBox.languageID);
					--print(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
				else
					mapQuestP(testQ["mapQuest"]["текущий"])
					local x = tablelength(testQ["mapQuest"]["podskazkiRez"])
					if tonumber(testQ["mapQuest"]["podskazki"]) <= tonumber(x) then
						testQ["mapQuest"]["podskazki"] = testQ["mapQuest"]["podskazki"] + 1
						local msgQ = txtXor(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
						SendChatMessage(msgQ, "SAY", DEFAULT_CHAT_FRAME.editBox.languageID);
						--print(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
						if tonumber(testQ["mapQuest"]["podskazki"]) >= tonumber(x) then
							testQ["mapQuest"]["podskazki"] = nil
						end
					end
				end
			end
		end
	end
end
if kod == "gKick" and sender == myNome then
	local kickList
	testQ["gKick"] = {}
	for Zc=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
		testQ["gKick"][Zc] = officerNote
		level = tonumber(level)
		if level <= 29 then
			if officerNote == "" and publicNote == "" then
				yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(Zc)
				if daysOffline ~= nil then
					daysOffline = tonumber(daysOffline)
					if daysOffline >= 3 then
						if yearsOffline ~= nil then
							SendChatMessage(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов", "OFFICER", nil, 1)
							--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
							if kickList == nil then
								kickList = "/guildremove " .. name .. "\n"
							else
								kickList = kickList .. "/guildremove " .. name .. "\n"
							end
						end
					end
				end
			end
		end
		if level <= 39 then
			if officerNote == "" and publicNote == "" then
				yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(Zc)
				if daysOffline ~= nil then
					daysOffline = tonumber(daysOffline)
					if daysOffline >= 4 then
						if yearsOffline ~= nil then
							SendChatMessage(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов", "OFFICER", nil, 1)
							--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
							if kickList == nil then
								kickList = "/guildremove " .. name .. "\n"
							else
								kickList = kickList .. "/guildremove " .. name .. "\n"
							end
						end
					end
				end
			end
		end
		if level <= 49 then
			if officerNote == "" and publicNote == "" then
				yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(Zc)
				if daysOffline ~= nil then
					daysOffline = tonumber(daysOffline)
					if daysOffline >= 5 then
						if yearsOffline ~= nil then
							SendChatMessage(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов", "OFFICER", nil, 1)
							--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
							if kickList == nil then
								kickList = "/guildremove " .. name .. "\n"
							else
								kickList = kickList .. "/guildremove " .. name .. "\n"
							end
						end
					end
				end
			end
		end
		if level <= 59 then
			if officerNote == "" and publicNote == "" then
				yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(Zc)
				if daysOffline ~= nil then
					daysOffline = tonumber(daysOffline)
					if daysOffline >= 6 then
						if yearsOffline ~= nil then
							SendChatMessage(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов", "OFFICER", nil, 1)
							--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
							if kickList == nil then
								kickList = "/guildremove " .. name .. "\n"
							else
								kickList = kickList .. "/guildremove " .. name .. "\n"
							end
						end
					end
				end
			end
		end
		if level <= 69 then
			if officerNote == "" and publicNote == "" then
				yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(Zc)
				if daysOffline ~= nil then
					daysOffline = tonumber(daysOffline)
					if daysOffline >= 7 then
						if yearsOffline ~= nil then
							SendChatMessage(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов", "OFFICER", nil, 1)
							--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
							if kickList == nil then
								kickList = "/guildremove " .. name .. "\n"
							else
								kickList = kickList .. "/guildremove " .. name .. "\n"
							end
						end
					end
				end
			end
		end
		if level <= 79 then
			if officerNote == "" and publicNote == "" then
				yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(Zc)
				if daysOffline ~= nil then
					daysOffline = tonumber(daysOffline)
					if daysOffline >= 8 then
						if yearsOffline ~= nil then
							SendChatMessage(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов", "OFFICER", nil, 1)
							--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
							if kickList == nil then
								kickList = "/guildremove " .. name .. "\n"
							else
								kickList = kickList .. "/guildremove " .. name .. "\n"
							end
						end
					end
				end
			end
		end
		if level == 80 then
			if officerNote == "" and publicNote == "" then
				yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(Zc)
				if daysOffline ~= nil then
					daysOffline = tonumber(daysOffline)
					if daysOffline >= 14 then
						if yearsOffline ~= nil then
							SendChatMessage(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов", "OFFICER", nil, 1)
							--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
							if kickList == nil then
								kickList = "/guildremove " .. name .. "\n"
							else
								kickList = kickList .. "/guildremove " .. name .. "\n"
							end
						end
					end
				end
			end
		end
	end
	local testMacro
	for i=1,36 do
		testMacro = GetMacroInfo(i)
		if testMacro ~= nil then
			testMacro = mysplit(testMacro)
			if testMacro[1] == "NSQC" then
				EditMacro(i, "NSQC", 134414, kickList)
			end
		end
	end
end

if kod == "gUp" and sender == myNome then
	local testMacro
	for i=1,36 do
		testMacro = GetMacroInfo(i)
		if testMacro ~= nil then
			testMacro = mysplit(testMacro)
			if testMacro[1] == "NSQC" then
				EditMacro(i, "NSQC", 134414, "пусто")
			end
		end
	end
	local kickList
	testQ["gUp"] = {}
	for Zc=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
		testQ["gUp"][Zc] = officerNote
		level = tonumber(level)
		if rankName == "И.О. Констебля" then
			if officerNote == "" and publicNote == "" then
				SendChatMessage(name .. " " .. level .. " лвл " .. rankName, "OFFICER", nil, 1)
				--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
				if kickList == nil then
					kickList = "/gpromote " .. name .. "\n"
				else
					kickList = kickList .. "/gpromote " .. name .. "\n"
				end
			end
		end
	end
	local testMacro
	for i=1,36 do
		testMacro = GetMacroInfo(i)
		if testMacro ~= nil then
			testMacro = mysplit(testMacro)
			if testMacro[1] == "NSQC" then
				EditMacro(i, "NSQC", 134414, kickList)
			end
		end
	end
end

if kod=="#prEnGD" and msg[1] == myNome and gmTest~=nil then
	if testQ ~= nil then
		if testQ[myNome] ~= nil then
			testQ[myNome]["zzlf"] = tonumber(msg[2])
		end
	end
end
if kod=="#podskNum" and msg[1] == myNome then
	if krt ~= nil then
		krt["podskazki"] = tonumber(msg[2])
	end
end
if kod=="#chd" and msg[1] == myNome then
	if testQ["chD"] == nil then
		testQ["chD"] = {}
	end
	testQ["chD"][tostring(msg[2])] = tonumber(msg[3])
end
if kodMsg[1] == "#itemQName" and kodMsg[2] == myNome then
	testQ[myNome]["itemName"] = message
end
if kodMsg[1] == "#itemQNum" and kodMsg[2] == myNome then
	testQ[myNome]["itemNum"] = message
end
if kodMsg[1] == "#itemQ" and kodMsg[2] == myNome then
	testQ[myNome]["взятый_квест"] = message
	btn[7]:Enable()
	btn[8]:Enable()
	btn[1]:Hide()
	btn[2]:Show()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end
if kodMsg[1] == "#itemQEnStuck" and kodMsg[2] == myNome then
	testQ[myNome]["itemEnStuck"] = message
end
if kodMsg[1] == "#отправить_заметку" and kodMsg[2] == myNome then
	testQ["tempZametka"] = {}
	testQ["tempZametka"][kodMsg[3]] = message
end
if kodMsg[1] == "#отправить_отзыв" and kodMsg[2] == myNome then
	testQ["tempOtzyv"] = {}
	testQ["tempOtzyv"][kodMsg[3]] = message
end
if kodMsg[1] == "pamyatkaNS" and sender == myNome then
	if zametki[kodMsg[2]] == nil then
		zametki[kodMsg[2]] = {}
	end
	zametki[kodMsg[2]] = message
	SendChatMessage("Заметка о персонаже " .. kodMsg[2] .. " добавлена", "OFFICER", nil, 1)
end
if kod == "NSVersion" then
        SendAddonMessage("Текущая версия", versAdd .. "." .. versAddDop, "guild")
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
	if testQ[myNome]["лвл_квестов"]~="2" and testQ[myNome]["лвл_квестов"]~="3" then
		proverka_komandy=mysplit(message)
		msg1=proverka_komandy[3]
		msg1 = tonumber(msg1)
		id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
		if completed == true then
			SendAddonMessage("NSGadd", "#aag " .. msg1, "guild")
			SendChatMessage("Я выполнил ачивку " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) , "OFFICER", nil, 1)
			btn[1]:Enable()
			btn[1]:Show()
			btn[7]:Disable()
			btn[7]:SetText("Нет взятых квестов")
			btn[8]:Disable()
			btn[8]:SetText("Нет взятых квестов")
			btn[2]:Hide()
			btn[2]:Disable()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
			SendChatMessage("*Квест еще не выполнен.", "OFFICER", nil, 1)
		end
	elseif testQ[myNome]["лвл_квестов"]=="2" then
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
		if j>=mozhnoLiSdatChislo11 then
			SendAddonMessage("NSGadd", "#zzk " .. j .. " " .. msg1 .. " " .. mozhnoLiSdatChislo11, "guild")
			SendChatMessage("Я сделал " .. j .. " пунктов ачивки " .. GetAchievementLink(msg1) .. " из " .. mozhnoLiSdatChislo11, "OFFICER", nil, 1)
			btn[1]:Enable()
			btn[1]:Show()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
		end
	elseif testQ[myNome]["лвл_квестов"]=="3" then
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
				SendChatMessage("Я сделал " .. j .. " пунктов ачивки " ..  GetAchievementLink(msg1) .. " из " .. mozhnoLiSdatChislo, "OFFICER", nil, 1)
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
				SendChatMessage("Я выполнил ачивку " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) , "OFFICER", nil, 1)
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
	testQ[myNome]["лвл_квестов"]="3"
end

if string.find (message, "!crtb") and sender == myNome then
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
			testQ[myNome]["лвл_квестов"]="2"
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
			end
		elseif msgQLVL2[1] == "#aan" then
			testQ[myNome]["лвл_квестов"]="3"
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
			end
		end
	end
end
if message == "#показывайАчивкуСтатУже" then
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10 = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["q3Stat"]), 1)
	SendChatMessage(sender .. ", сейчас у меня выполнено " .. arg4 .. " пунктов ачивки " .. testQ[myNome]["q3Stat"], "officer", nil, 1)
	SendAddonMessage("NSGadd", "#дайДоброНаСтат", "guild")
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
			SendAddonMessage("NSGadd", "#показать_ачивку3один", "guild")
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
		btn[7]:Enable()
		btn[8]:Enable()
		btn[7]:SetText("Отменить квест")
		btn[8]:SetText("Узнать квест")
	end
end
if msg[1] == "#показал_ачивку3один" and msg[2] == myNome then
	SendChatMessage(sender .. ", ачивка " .. GetAchievementLink(testQ[myNome]["взятый_квест"]) .. " еще не выполнена", "OFFICER", nil, 1)
	SendAddonMessage("NSGadd", "#ачивка_3один_нету", "guild")
end
if string.find (message, "#xxx") and string.find (message, myNome) then
	btn[1]:Enable()
	btn[1]:Show()
	btn[1]:SetText("Взять квест")
	testQ[myNome]["взятый_квест"]="9999"
	testQ[myNome]["q33q"]=nil
	testQ[myNome]["q33nik"][1] = nil
	testQ[myNome]["q33nik"][2] = nil
	testQ[myNome]["q33nik"][3] = nil
	testQ[myNome]["взятый_квест3_2"] = nil
	testQ[myNome]["взятый_квест3_1"] = nil
	testQ[myNome]["q3Stat"] = nil
	testQ[myNome]["q3stStart"] = nil
	testQ[myNome]["q3StatNum"] = nil
	testQ[myNome]["q3StatTemp"] = nil
	testQ[myNome]["itemName"] = nil
	testQ[myNome]["itemNum"] = nil
	testQ[myNome]["itemEnStuck"] = nil
	testQ[myNome]["itemQend"] = nil
	SendAddonMessage("NSGadd", "#qUpdate", "guild")
	btn[7]:Disable()
	btn[7]:SetText("Нет взятых квестов")
	btn[8]:Disable()
	btn[8]:SetText("Нет взятых квестов")
	btn[2]:Hide()
	btn[2]:Disable()
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
	if testQ[myNome]["лвл_квестов"] == "2" then
		count = GetAchievementNumCriteria(msgVzyalQ2)
		count = tonumber(count)
		testQ[myNome]["квест_лвл2"][msgVzyalQ2]=count
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		SendAddonMessage("NSGadd", "#qUpdate", "guild")
		SendAddonMessage("NSGadd", "#отобразить_квест_ачивки_нум", "guild")
	end
	if testQ[myNome]["лвл_квестов"] == "3" then
		count = GetAchievementNumCriteria(msgVzyalQ2)
		count = tonumber(count)
		testQ[myNome]["квест_лвл3"][msgVzyalQ2]=count
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		SendAddonMessage("NSGadd", "#qUpdate", "guild")
		SendAddonMessage("NSGadd", "#отобразить_квест_ачивки_нум", "guild")
	end
end

if msg[1] == "#ShowAchAAK" and msg[2] == myNome then
	SendChatMessage(sender .. " ачивка " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) .. " еще не выполнена", "OFFICER", nil, 1)
	SendAddonMessage("NSGadd", "#ачивкуПоказал", "guild")
end

if string.find (message, "#cls") and sender == myNome then
	testQ[myNome]["отключить_поиск"]="тру"
	testQ[myNome]["старт_поиска_нпц"] = time()

end



if string.find (message, "#krt") and sender == myNome then
	if krt == nil then
		krt = {}
	else
		if krt["777"] == nil then
			local testKont = GetCurrentMapContinent()
			testKont = tonumber(testKont)
			if testKont == 1 then
				local lok = GetCurrentMapZone()
				lok = tonumber(lok)
				if lok == 0 then
					if krt["99"] == nil then
						btnF:SetChecked(true)
						krt["99"] = true
						if krt["1"] == true then
							mostraKrtl2("Show",316,576,316,576,1,1,12)
							mostraKrtl2("Show",316,576,316,576,1,1,12)
							mostraKrtl2("Show",320,580,410,569,50,1,3)
						end
						if krt["2"] == true then
							mostraKrtl2("Show",496,554,496,554,1,1,12)
							mostraKrtl2("Show",496,554,496,554,1,1,12)
							mostraKrtl2("Show",500,558,490,508,50,1,3)
						end
						if krt["3"] == true then
							mostraKrtl2("Show",616,561,616,561,1,1,12)
							mostraKrtl2("Show",616,561,616,561,1,1,12)
							mostraKrtl2("Show",620,565,617,510,100,1,3)
						end
						if krt["4"] == true then
							mostraKrtl2("Show",316,421,316,421,1,1,12)
							mostraKrtl2("Show",316,421,316,421,1,1,12)
							mostraKrtl2("Show",320,425,325,370,100,1,3)
						end
						if krt["5"] == true then
							mostraKrtl2("Show",471,426,471,426,1,1,12)
							mostraKrtl2("Show",471,426,471,426,1,1,12)
							mostraKrtl2("Show",471,426,550,500,100,1,3)
						end
						if krt["6"] == true then
							mostraKrtl2("Show",611,436,611,436,1,1,12)
							mostraKrtl2("Show",611,436,611,436,1,1,12)
							mostraKrtl2("Show",615,440,610,390,100,1,3)
						end
						if krt["7"] == true then
							mostraKrtl2("Show",326,311,326,311,1,1,12)
							mostraKrtl2("Show",326,311,326,311,1,1,12)
							mostraKrtl2("Show",330,315,362,250,50,1,3)
						end
						if krt["8"] == true then
							mostraKrtl2("Show",421,321,676,371,1,1,12)
							mostraKrtl2("Show",421,321,676,371,1,1,12)
							mostraKrtl2("Show",425,325,525,344,100,1,3)
						end
						if krt["9"] == true then
							mostraKrtl2("Show",660,346,660,346,1,1,12)
							mostraKrtl2("Show",660,346,660,346,1,1,12)
							mostraKrtl2("Show",664,350,534,360,200,1,3)
						end
						if krt["10"] == true then
							mostraKrtl2("Show",296,151,296,151,1,1,12)
							mostraKrtl2("Show",296,151,296,151,1,1,12)
							mostraKrtl2("Show",300,155,307,250,50,1,3)
						end
						if krt["11"] == true then
							mostraKrtl2("Show",471,246,676,451,1,1,12)
							mostraKrtl2("Show",471,246,676,451,1,1,12)
							mostraKrtl2("Show",475,250,500,275,50,1,3)
						end
						if krt["12"] == true then
							mostraKrtl2("Show",586,226,586,226,1,1,12)
							mostraKrtl2("Show",586,226,586,226,1,1,12)
							mostraKrtl2("Show",590,230,540,217,100,1,3)
						end
						if krt["13"] == true then
							mostraKrtl2("Show",381,106,381,106,1,1,12)
							mostraKrtl2("Show",381,106,381,106,1,1,12)
							mostraKrtl2("Show",385,110,410,118,50,1,3)
						end
						if krt["14"] == true then
							mostraKrtl2("Show",456,46,456,46,1,1,12)
							mostraKrtl2("Show",456,46,456,46,1,1,12)
							mostraKrtl2("Show",460,50,550,43,50,1,3)
						end
						if krt["15"] == true then
							mostraKrtl2("Show",596,36,596,36,1,1,12)
							mostraKrtl2("Show",596,36,596,36,1,1,12)
							mostraKrtl2("Show",600,40,548,140,50,1,3)
						end

						if krt["999"] ~= nil then
							local num = 1
							local x = 973
							local y = 637
							for i=1,krt["999"] do
								chMuestro(num,x,y)
								num = num + 1
								y = y - 32
							end
							local chern = krt["999"]
							for i = 1, krt["999"] do
								if chern >=1 then
									if krt["1"] == true and krt["2"] == true and chern >= 1 then
										mostraKrtl2("Show",320,580,500,558,150,1,3)
										chern = chern - 1
									end
									if krt["2"] == true and krt["5"] == true and chern >= 1 then
										mostraKrtl2("Show",500,558,475,430,150,1,3)
										chern = chern - 1
									end
									if krt["5"] == true and krt["3"] == true and chern >= 1 then
										mostraKrtl2("Show",471,426,620,565,100,1,3)
										chern = chern - 1
									end
									if krt["3"] == true and krt["6"] == true and chern >= 1 then
										mostraKrtl2("Show",620,565,615,440,100,1,3)
										chern = chern - 1
									end
									if krt["6"] == true and krt["12"] == true and chern >= 1 then
										mostraKrtl2("Show",615,440,590,230,100,1,3)
										chern = chern - 1
									end
									if krt["12"] == true and krt["10"] == true and chern >= 1 then
										mostraKrtl2("Show",590,230,300,155,150,1,3)
										chern = chern - 1
									end
									if krt["10"] == true and krt["4"] == true and chern >= 1 then
										mostraKrtl2("Show",300,155,320,425,150,1,3)
										chern = chern - 1
									end
									if krt["4"] == true and krt["7"] == true and chern >= 1 then
										mostraKrtl2("Show",320,425,330,315,100,1,3)
										chern = chern - 1
									end
									if krt["7"] == true and krt["14"] == true and chern >= 1 then
										mostraKrtl2("Show",330,315,460,50,150,1,3)
										chern = chern - 1
									end
									if krt["14"] == true and krt["15"] == true and chern >= 1 then
										mostraKrtl2("Show",460,50,600,40,150,1,3)
										chern = chern - 1
									end
									if krt["15"] == true and krt["1"] == true and chern >= 1 then
										mostraKrtl2("Show",600,40,320,580,300,1,3)
										chern = chern - 1
									end
									if krt["8"] == true and chern >= 1 then
										mostraKrtl2("Show",425,325,680,375,200,1,3)
										chern = chern - 1
									end
									if krt["9"] == true and chern >= 1 then
										mostraKrtl2("Show",664,350,250,381,200,1,3)
										chern = chern - 1
									end
									if krt["11"] == true and chern >= 1 then
										mostraKrtl2("Show",475,250,680,455,200,1,3)
										chern = chern - 1
									end
									if krt["13"] == true and chern >= 1 then
										mostraKrtl2("Show",385,110,700,210,200,1,3)
										chern = chern - 1
									end
								else
									break
								end
							end
						end
					end
				else
					krt["99"] = nil
					krtHide("Hide")
					btnF:SetChecked(false)
				end
			end
		else
			if krt["777"] == 2 then
			local lok = GetCurrentMapZone()
			lok = tonumber(lok)
				if lok == 10 then
					if krt["99"] == nil then
						krt["99"] = true
						btnF:SetChecked(true)
						if krt["21"] == true then
							mostraKrtl2("Show",96,546,96,46,1,1,12)
							mostraKrtl2("Show",96,546,96,46,1,1,12)
							mostraKrtl2("Show",100,550,132,475,50,1,3)
						end
						if krt["22"] == true then
							mostraKrtl2("Show",171,371,171,371,1,1,12)
							mostraKrtl2("Show",171,371,171,371,1,1,12)
							mostraKrtl2("Show",175,375,275,435,100,1,3)
						end
						if krt["23"] == true then
							mostraKrtl2("Show",446,536,446,536,1,1,12)
							mostraKrtl2("Show",446,536,446,536,1,1,12)
							mostraKrtl2("Show",450,540,500,500,50,1,3)
						end
						if krt["24"] == true then
							mostraKrtl2("Show",561,446,561,446,1,1,12)
							mostraKrtl2("Show",561,446,561,446,1,1,12)
							mostraKrtl2("Show",565,450,613,500,100,1,3)
						end
						if krt["25"] == true then
							mostraKrtl2("Show",671,561,671,561,1,1,12)
							mostraKrtl2("Show",671,561,671,561,1,1,12)
							mostraKrtl2("Show",675,565,750,564,50,1,3)
						end
						if krt["26"] == true then
							mostraKrtl2("Show",816,559,816,559,1,1,12)
							mostraKrtl2("Show",816,559,816,559,1,1,12)
							mostraKrtl2("Show",820,563,795,500,50,1,3)
						end
							if krt["27"] == true then
							mostraKrtl2("Show",621,71,621,71,1,1,12)
							mostraKrtl2("Show",621,71,621,71,1,1,12)
							mostraKrtl2("Show",625,75,750,103,50,1,3)
						end
						if krt["28"] == true then
							mostraKrtl2("Show",846,121,846,121,1,1,12)
							mostraKrtl2("Show",846,121,846,121,1,1,12)
							mostraKrtl2("Show",850,125,750,122,50,1,3)
						end
						if krt["29"] == true then
							mostraKrtl2("Show",71,96,71,96,1,1,12)
							mostraKrtl2("Show",71,96,71,96,1,1,12)
							mostraKrtl2("Show",75,100,250,74,100,1,3)
						end
						if krt["30"] == true then
							mostraKrtl2("Show",396,46,396,46,1,1,12)
							mostraKrtl2("Show",396,46,396,46,1,1,12)
							mostraKrtl2("Show",400,50,250,150,100,1,3)
						end
						if krt["31"] == true then
							mostraKrtl2("Show",96,246,96,246,1,1,12)
							mostraKrtl2("Show",96,246,96,246,1,1,12)
							mostraKrtl2("Show",100,250,250,240,100,1,3)
						end
						if krt["32"] == true then
							mostraKrtl2("Show",296,361,296,361,1,1,12)
							mostraKrtl2("Show",296,361,296,361,1,1,12)
							mostraKrtl2("Show",300,365,450,346,200,1,3)
						end
						if krt["33"] == true then
							mostraKrtl2("Show",371,296,371,296,1,1,12)
							mostraKrtl2("Show",371,296,371,296,1,1,12)
							mostraKrtl2("Show",375,300,500,328,100,1,3)
						end
						if krt["34"] == true then
							mostraKrtl2("Show",896,246,896,246,1,1,12)
							mostraKrtl2("Show",896,246,896,246,1,1,12)
							mostraKrtl2("Show",900,250,750,285,100,1,3)
						end

						if krt["21"] == true and krt["22"] == true then
							if testQ["evO0102"] == true then
								mostraKrtl2("Show",100,550,175,375,100,1,3)
							end
						end
						if krt["22"] == true and krt["23"] == true then
							if testQ["evO0203"] == true then
								mostraKrtl2("Show",175,375,450,540,150,1,3)
							end
						end
						if krt["23"] == true and krt["24"] == true then
							if testQ["evO0304"] == true then
								mostraKrtl2("Show",450,540,565,450,100,1,3)
							end
						end
						if krt["24"] == true and krt["25"] == true then
							if testQ["evO0405"] == true then
								mostraKrtl2("Show",565,450,675,565,100,1,3)
							end
						end
						if krt["25"] == true and krt["26"] == true then
							if testQ["evO0506"] == true then
								mostraKrtl2("Show",675,565,820,563,100,1,3)
							end
						end
						if krt["26"] == true and krt["27"] == true then
							if testQ["evO0607"] == true then
								mostraKrtl2("Show",820,563,625,75,200,1,3)
							end
						end
						if krt["27"] == true and krt["28"] == true then
							if testQ["evO0708"] == true then
								mostraKrtl2("Show",625,75,850,125,100,1,3)
							end
						end
						if krt["28"] == true and krt["29"] == true then
							if testQ["evO0809"] == true then
								mostraKrtl2("Show",850,125,75,100,300,1,3)
							end
						end
						if krt["29"] == true and krt["30"] == true then
							if testQ["evO0910"] == true then
								mostraKrtl2("Show",75,100,400,50,200,1,3)
							end
						end
						if krt["30"] == true and krt["31"] == true then
							if testQ["evO1011"] == true then
								mostraKrtl2("Show",400,50,100,250,200,1,3)
							end
						end
						if krt["31"] == true then
							if testQ["evO11"] == true then
								mostraKrtl2("Show",100,250,1000,190,400,1,3)
							end
						end
						if krt["32"] == true then
							if testQ["evO12"] == true then
								mostraKrtl2("Show",300,365,1000,275,400,1,3)
							end
						end
						if krt["33"] == true then
							if testQ["evO13"] == true then
								mostraKrtl2("Show",375,300,1000,440,400,1,3)
							end
						end
						if krt["34"] == true then
							if testQ["evO14"] == true then
								mostraKrtl2("Show",900,250,0,460,400,1,3)
							end
						end

					else
						krt["99"] = nil
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

if string.find (message, "#ahtng") and sender == myNome then
	testQ=nil
end

if msg[1] == "#verS" and msg[2] == myNome then
	testQ["vers"] = {}
	testQ["vers"]["1"] = versAdd
	testQ["vers"]["2"] = msg[3]
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
	if testQ[myNome]["лвл_квестов"] == "2" then
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
		SendAddonMessage("NSGadd", "#показать_ачивку3много", "guild")
	elseif testQ[myNome]["лвл_квестов"] == "3" then
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
		testQ[myNome]["квест_лвл3"][msgVzyalQ2]=j
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		testQ[myNome]["взятый_квест3_2"]="vzyat"
		testQ[myNome]["взятый_квест3_1"]="nevzyat"
		SendAddonMessage("NSGadd", "#показать_ачивку3много", "guild")
	end
	btn[7]:Enable()
	btn[8]:Enable()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end
if msg[1] == "#показалАчивку3много" and msg[2] == myNome then
	local count = GetAchievementNumCriteria(tonumber(testQ[myNome]["взятый_квест"]))
	j=0
	k=0
	for i=1, count do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["взятый_квест"]), i);
		local prov=completed
		if prov == true then
			j=j+1
		else
			k=k+1
		end
	end
	SendChatMessage(sender .. ", доступно " .. k .. " пунктов ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) .. " из " .. count, "officer", nil, 1)
	SendAddonMessage("NSGadd", "#выдайДоброНаАчивку3много", "guild")
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

local function OnEvent(self, event, isLogin, isReload)
	--SendAddonMessage("NSGadd", "#qUpdate", "guild")
	SendAddonMessage("NSGadd", "#ver", "guild")
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", OnEvent)


--[[
local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
local myNome = GetUnitName("player")
	if InterfaceOptionsCombatTextPanelHealing["value"] == "0" then
		if arg2 == "SPELL_HEAL" then
			testQ["cmbtNum"] = "+" .. tostring(arg12/1000):gsub("[.]", ",")
			testQ["cmbtTime"] = 1
		end
	end
end)--]]

local myNome = GetUnitName("player")
local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
	debuffMove(myNome)
end)

