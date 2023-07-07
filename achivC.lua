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
testGM=gmTest(sender)
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
			if krt[99] == nil then
				krt[99] = true
				mostraKrtM111x111("Show")
				if krt[1] == true then
					mostraKrtM1x1("Show")
				end
				if krt[2] == true then
					mostraKrtM1x2("Show")
				end
				if krt[3] == true then
					mostraKrtM1x3("Show")
				end
				if krt[4] == true then
					mostraKrtM2x1("Show")
				end
				if krt[5] == true then
					mostraKrtM2x2("Show")
				end
				if krt[6] == true then
					mostraKrtM2x3("Show")
				end
				if krt[7] == true then
					mostraKrtM3x1("Show")
				end
				if krt[8] == true then
					mostraKrtM3x2("Show")
				end
				if krt[9] == true then
					mostraKrtM3x3("Show")
				end
				if krt[10] == true then
					mostraKrtM4x1("Show")
				end
				if krt[11] == true then
					mostraKrtM4x2("Show")
				end
				if krt[12] == true then
					mostraKrtM4x3("Show")
				end
				if krt[13] == true then
					mostraKrtM5x1("Show")
				end
				if krt[14] == true then
					mostraKrtM5x2("Show")
				end
				if krt[15] == true then
					mostraKrtM5x3("Show")
				end

				if krt[999] ~= nil then
					local chern = krt[999]
					for i = 1, krt[999] do
						if chern >=1 then
							if krt[1] == true and krt[2] == true and chern >= 1 then
								mostraKrtl1("Show",425,387,520,367,100,8)
								chern = chern - 1
							end
							if krt[2] == true and krt[5] == true and chern >= 1 then
								mostraKrtl1("Show",609,355,609,273,100,8)
								chern = chern - 1
							end
							if krt[5] == true and krt[3] == true and chern >= 1 then
								mostraKrtl1("Show",608,200,700,288,100,8)
								chern = chern - 1
							end
							if krt[3] == true and krt[6] == true and chern >= 1 then
								mostraKrtl1("Show",781,369,783,283,100,8)
								chern = chern - 1
							end
							if krt[6] == true and krt[12] == true and chern >= 1 then
								mostraKrtl1("Show",783,215,766,67,200,8)
								chern = chern - 1
							end
							if krt[12] == true and krt[10] == true and chern >= 1 then
								mostraKrtl1("Show",765,-59,565,-97,200,8)
								chern = chern - 1
							end
							if krt[10] == true and krt[4] == true and chern >= 1 then
								mostraKrtl1("Show",395,-132,408,45,200,8)
								chern = chern - 1
							end
							if krt[4] == true and krt[7] == true and chern >= 1 then
								mostraKrtl1("Show",418,203,426,125,100,8)
								chern = chern - 1
							end
							if krt[7] == true and krt[14] == true and chern >= 1 then
								mostraKrtl1("Show",428,62,515,-121,200,8)
								chern = chern - 1
							end
							if krt[14] == true and krt[15] == true and chern >= 1 then
								mostraKrtl1("Show",590,-279,683,-289,100,8)
								chern = chern - 1
							end
							if krt[15] == true and krt[1] == true and chern >= 1 then
								mostraKrtl1("Show",770,-313,579,73,400,8)
								chern = chern - 1
							end
							if krt[8] == true and chern >= 1 then
								mostraKrtl1("Show",597,75,757,110,200,8)
								chern = chern - 1
							end
							if krt[9] == true and chern >= 1 then
								mostraKrtl1("Show",840,95,457,120,300,8)
								chern = chern - 1
							end
							if krt[11] == true and chern >= 1 then
								mostraKrtl1("Show",607,-44,773,140,200,8)
								chern = chern - 1
							end
							if krt[13] == true and chern >= 1 then
								mostraKrtl1("Show",490,-210,757,-130,200,8)
								chern = chern - 1
							end
						else
							break
						end
					end
				end
			else
				krt[99] = nil
				mostraKrtM1x1("Hide")
				mostraKrtM1x2("Hide")
				mostraKrtM1x3("Hide")
				mostraKrtM2x1("Hide")
				mostraKrtM2x2("Hide")
				mostraKrtM2x3("Hide")
				mostraKrtM3x1("Hide")
				mostraKrtM3x2("Hide")
				mostraKrtM3x3("Hide")
				mostraKrtM4x1("Hide")
				mostraKrtM4x2("Hide")
				mostraKrtM4x3("Hide")
				mostraKrtM5x1("Hide")
				mostraKrtM5x2("Hide")
				mostraKrtM5x3("Hide")
				mostraKrtM111x111("Hide")

				if #tochki ~= nil then
					for key, val in pairs(tochki) do
						if tochki[key] == true then
							iconRis[key]["Hide"](iconRis[key])
						end
					end
				end
			end
		else
			if krt[777] == 2 then
				if WorldMapFrameSizeUpButton:IsVisible()~=nil then
					if krt[99] == nil then
						krt[99] = true
						if krt[21] == true then
							mostraKrtM("Show",regRange(1),0,0)
						end
						if krt[22] == true then
							mostraKrtM("Show",regRange(17),144,0)
						end
						if krt[23] == true then
							mostraKrtM("Show",regRange(33),288,0)
						end
						if krt[24] == true then
							mostraKrtM("Show",regRange(49),432,0)
						end
						if krt[25] == true then
							mostraKrtM("Show",regRange(1025),0,-96)
						end
						if krt[26] == true then
							mostraKrtM("Show",regRange(1041),144,-96)
						end
						if krt[27] == true then
							mostraKrtM("Show",regRange(1057),288,-96)
						end
						if krt[28] == true then
							mostraKrtM("Show",regRange(1073),432,-96)
						end
						if krt[29] == true then
							mostraKrtM("Show",regRange(2049),0,-192)
						end
						if krt[30] == true then
							mostraKrtM("Show",regRange(2065),144,-192)
						end
						if krt[31] == true then
							mostraKrtM("Show",regRange(2081),288,-192)
						end
						if krt[32] == true then
							mostraKrtM("Show",regRange(2097),432,-192)
						end
						if krt[33] == true then
							mostraKrtM("Show",regRange(3073),0,-288)
						end
						if krt[34] == true then
							mostraKrtM("Show",regRange(3089),144,-288)
						end
						if krt[35] == true then
							mostraKrtM("Show",regRange(3105),288,-288)
						end
						if krt[36] == true then
							mostraKrtM("Show",regRange(3121),432,-288)
						end

						if krt[9990] ~= nil then
							local chern = krt[999]
							for i = 1, krt[999] do
								if chern >=1 then
									if krt[1] == true and krt[2] == true and chern >= 1 then
										mostraKrtl1("Show",425,387,520,367,100,8)
										chern = chern - 1
									end

								end
							end
						end
					else
						krt[99] = nil
						mostraKrtM("Hide",regRange(1),0,0)
						mostraKrtM("Hide",regRange(17),144,0)
						mostraKrtM("Hide",regRange(33),288,0)
						mostraKrtM("Hide",regRange(49),432,0)
						mostraKrtM("Hide",regRange(1025),0,-96)
						mostraKrtM("Hide",regRange(1041),144,-96)
						mostraKrtM("Hide",regRange(1057),288,-96)
						mostraKrtM("Hide",regRange(1073),432,-96)
						mostraKrtM("Hide",regRange(2049),0,-192)
						mostraKrtM("Hide",regRange(2065),144,-192)
						mostraKrtM("Hide",regRange(2081),288,-192)
						mostraKrtM("Hide",regRange(2097),432,-192)
						mostraKrtM("Hide",regRange(3073),0,-288)
						mostraKrtM("Hide",regRange(3089),144,-288)
						mostraKrtM("Hide",regRange(3105),288,-288)
						mostraKrtM("Hide",regRange(3121),432,-288)
					end
					if #tochki ~= nil then
						for key, val in pairs(tochki) do
							if tochki[key] == true then
								iconRis[key]["Hide"](iconRis[key])
							end
						end
					end
				else
					if krt[99] == nil then
						krt[99] = true
						if krt[21] == true then
							mostraKrtMF("Show",regRange(1),0,0)
						end
						if krt[22] == true then
							mostraKrtMF("Show",regRange(17),251.2,0)
						end
						if krt[23] == true then
							mostraKrtMF("Show",regRange(33),502.4,0)
						end
						if krt[24] == true then
							mostraKrtMF("Show",regRange(49),753.6,0)
						end
						if krt[25] == true then
							mostraKrtMF("Show",regRange(1025),0,-167.2)
						end
						if krt[26] == true then
							mostraKrtMF("Show",regRange(1041),251.2,-167.2)
						end
						if krt[27] == true then
							mostraKrtMF("Show",regRange(1057),502.4,-167.2)
						end
						if krt[28] == true then
							mostraKrtMF("Show",regRange(1073),753.6,-167.2)
						end
						if krt[29] == true then
							mostraKrtMF("Show",regRange(2049),0,-334.4)
						end
						if krt[30] == true then
							mostraKrtMF("Show",regRange(2065),251.2,-334.4)
						end
						if krt[31] == true then
							mostraKrtMF("Show",regRange(2081),502.4,-334.4)
						end
						if krt[32] == true then
							mostraKrtMF("Show",regRange(2097),753.6,-334.4)
						end
						if krt[33] == true then
							mostraKrtMF("Show",regRange(3073),0,-501.6)
						end
						if krt[34] == true then
							mostraKrtMF("Show",regRange(3089),251.2,-501.6)
						end
						if krt[35] == true then
							mostraKrtMF("Show",regRange(3105),502.4,-501.6)
						end
						if krt[36] == true then
							mostraKrtMF("Show",regRange(3121),753.6,-501.6)
						end

						if krt[999] ~= nil then
							--чернила
						end
					else
						krt[99] = nil
						mostraKrtMF("Hide",regRange(1),0,0)
						mostraKrtMF("Hide",regRange(17),144,0)
						mostraKrtMF("Hide",regRange(33),288,0)
						mostraKrtMF("Hide",regRange(49),432,0)
						mostraKrtMF("Hide",regRange(1025),0,-96)
						mostraKrtMF("Hide",regRange(1041),144,-96)
						mostraKrtMF("Hide",regRange(1057),288,-96)
						mostraKrtMF("Hide",regRange(1073),432,-96)
						mostraKrtMF("Hide",regRange(2049),0,-192)
						mostraKrtMF("Hide",regRange(2065),144,-192)
						mostraKrtMF("Hide",regRange(2081),288,-192)
						mostraKrtMF("Hide",regRange(2097),432,-192)
						mostraKrtMF("Hide",regRange(3073),0,-288)
						mostraKrtMF("Hide",regRange(3089),144,-288)
						mostraKrtMF("Hide",regRange(3105),288,-288)
						mostraKrtMF("Hide",regRange(3121),432,-288)
					end
					if #tochki ~= nil then
						for key, val in pairs(tochki) do
							if tochki[key] == true then
								iconRis[key]["Hide"](iconRis[key])
							end
						end
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

if string.find (message, "#zz_x") and testGM~=nil then
	testQ[myNome]["zzl"] = nil
	testQ[myNome]["btn3"] = 1
	if testQ[myNome]["zzlf"] ~= nil then
		testQ[myNome]["zzlf"] = testQ[myNome]["zzlf"] - bonusQuestF
	else
		testQ[myNome]["zzlf"] = 0
	end
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
