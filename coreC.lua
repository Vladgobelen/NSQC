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
			print(i)

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
if string.find (message, "получает лотерейный билет") and ltrC[1]==myNome then
	ltrNikC=ltrC[1]
	if testQ[ltrNikC]["лотерея"]==nil then
		testQ[ltrNikC]["лотерея"]=3
	else
		lotereyaC=testQ[ltrNikC]["лотерея"]
		lotereyaC=lotereyaC+3
		testQ[ltrNikC]["лотерея"]=lotereyaC
	end
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
				end
			end
		else
			print ("Выбери цель")
		end
	else
		print ("Закрой карту")
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

if string.find (message, "#ltr333") and testGM~=nil and lotTest[3]==myNome then
	minusLrt=testQ[myNome]["лотерея"]
	minusLrt=tonumber(minusLrt)
	minusLrt=minusLrt-3
	testQ[myNome]["лотерея"]=minusLrt
end

if string.find (message, "покажи сиськи") and string.find(message, myNome) and nachalo~="*" then
	SendChatMessage("(  .   Y   .  )" , "OFFICER", nil, 1)
end

if string.find (message, myNome) and testGM~=nil and string.find (message, "версия") and string.find (message, "1234567890")  and nachalo~="*" then
        SendChatMessage(hshStran3 .." текущая версия " .. versAdd, "OFFICER", nil, 1)
end

if string.find (message, myNome) and testGM~=nil and string.find (message, "покажимне") then
	SendChatMessage(hshStran3, "OFFICER", nil, 1)
end
end
)
