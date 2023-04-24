local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local versAdd=3
local str = string.gsub(message, "%s+", "")
local myNome = GetUnitName("player")
if testQ[myNome]==nil then
	testQ[myNome]={}
end
local hshStran3C
local hshStanMsgC
local hshStranMsg2
local hshStanMsgC1
local hshStanC1
local hshStanC1
testGM=gmTest(sender)
hshStanMsgC=mysplit(message)
hshStranMsg2=string.sub(message,7,7)
if hshStanMsgC2==" " then
	hshStanMsgC1=hshStanMsgC[1]
	hshStanC1,hshStanC1=hshStrNuovo(hshStanMsgC1,myNome)
end
hshStran3C=hshSenderNomeC(myNome)
if testQ==nil then
	testQ={}
end
local nachalo = string.sub(message, 1, 1)

if string.find (message, "#aaa") and hshStanC1==hshStanC2 and nachalo~="*" and string.find (message, myNome) then
	msg1 = mysplit(message)
	msg1 = msg1[7]
	msg1 = tonumber(msg1)
	id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
	if completed == true then
		SendChatMessage(hshStran3C .. " #aab " .. "эта уже выполнена " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	else
       	SendChatMessage(hshStran3C .. " #aac " .. "можно сделать: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	end
end
local myNome = GetUnitName("player")
if hshStanC1==hshStanC2 and string.find (message, "#aaf") and string.find (message, myNome) then
	if testQ[myNome]["лвл_квестов"]~=2 then
		proverka_komandy=mysplit(message)
		msg1=proverka_komandy[8]
		msg1 = tonumber(msg1)
		id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
		if completed == true then
			SendChatMessage(hshStran3C .. " #aag " .." ага: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
			btn[1]:Enable()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
			SendChatMessage("*я забыл...скоро сделаю, вернусь позже.", "OFFICER", nil, 1)
		end
	elseif testQ[myNome]["лвл_квестов"]==2 then
		proverka_komandy=mysplit(message)
		msg1=proverka_komandy[8]
		msg1 = tonumber(msg1)
		mozhnoLiSdatChislo=testQ[myNome]["квест_лвл2"][msg1]

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
			SendChatMessage(hshStran3C .. " #zzk " .. " Я сделал " .. j .. " пунктов ачивки " .. msg1 .. " " ..  GetAchievementLink(msg1) .. " из " .. mozhnoLiSdatChislo, "OFFICER", nil, 1)
			btn[1]:Enable()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
		end








	end
end

if hshStanC1==hshStanC2 and string.find (message, "#aah") and string.find (message, myNome) then
	testQ[myNome]["лвл_квестов"]=2
	msgQLVL2 = mysplit(message)
	msgQLVL2 = msgQLVL2[6]
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
		SendChatMessage(hshStran3C .. " #aai " .. "уже выполнена полностью: " .. msgQLVL2 .. " " .. GetAchievementLink(msgQLVL2), "OFFICER", nil, 1)
	else
		SendChatMessage(hshStran3C .. " #aaj " .. "доступно пунктов ачивки: " .. k .. " из " .. count  .. " " .. msgQLVL2 .. " " .. GetAchievementLink(msgQLVL2), "OFFICER", nil, 1)
	end

end

local myNome = GetUnitName("player")
if hshStanC1==hshStanC2 and string.find (message, "#aae") and string.find (message, myNome) then
	msg13 = mysplit(message)
	msg13 = msg13[6]
	msg13 = tonumber(msg13)
	testQ[myNome]["взятый_квест"]=msg13
end

if string.find (message, "#xxx") and string.find (message, myNome) then
	btn[1]:Enable()
	btn[1]:SetText("Взять квест")
	testQ[myNome]["взятый_квест"]="9999"
end

if hshStanC1==hshStanC2 and string.find (message, "#aak") and string.find (message, myNome) then
	msgVzyalQ2=mysplit(message)
	msgVzyalQ2=msgVzyalQ2[7]
	msgVzyalQ2=tonumber(msgVzyalQ2)
	if testQ[myNome]==nil then
		testQ[myNome]={}
	end
	if testQ[myNome]["квест_лвл2"]==nil then
		testQ[myNome]["квест_лвл2"]={}
	end
	count = GetAchievementNumCriteria(msgVzyalQ2)
	count =tonumber(count)
	testQ[myNome]["квест_лвл2"][msgVzyalQ2]=count
	testQ[myNome]["взятый_квест"]=msgVzyalQ2
end

if hshStanC1==hshStanC2 and string.find (message, "#aal") and string.find (message, myNome) then
	if testQ[myNome]==nil then
		testQ[myNome]={}
	end
	if testQ[myNome]["квест_лвл2"]==nil then
		testQ[myNome]["квест_лвл2"]={}
	end
	msgVzyalQ2=mysplit(message)
	msgVzyalQ2=msgVzyalQ2[9]
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
	testQ[myNome]["квест_лвл2"][msgVzyalQ2]=j
	testQ[myNome]["взятый_квест"]=msgVzyalQ2
end
lotTest=mysplit(message)
if string.find (message, "#ltr111") and testGM~=nil and lotTest[3]==myNome then
	minusLrt=testQ[ltrNikC]["лотерея"]
	minusLrt=tonumber(minusLrt)
	minusLrt=minusLrt-1
	testQ[ltrNikC]["лотерея"]=minusLrt
end

if string.find (message, "#ltr333") and testGM~=nil and lotTest[3]==myNome then
	minusLrt=testQ[ltrNikC]["лотерея"]
	minusLrt=tonumber(minusLrt)
	minusLrt=minusLrt-3
	testQ[ltrNikC]["лотерея"]=minusLrt
end


if testGM~=nil then
local testXY
testXY=mysplit(message)
if testXY[2]=="#zzn" then
	framePos["hshXY"]=testXY[1]


    nX={}
    nY={}

    nX[1]=string.sub(testXY[3],1,1)
    nY[1]=string.sub(testXY[3],2,2)
    nX[2]=string.sub(testXY[3],3,3)
    nY[2]=string.sub(testXY[3],4,4)
    nX[3]=string.sub(testXY[3],5,5)
    nY[3]=string.sub(testXY[3],6,6)
    nX[4]=string.sub(testXY[3],7,7)
    nY[4]=string.sub(testXY[3],8,8)
    nX[5]=string.sub(testXY[3],9,9)
    nY[5]=string.sub(testXY[3],10,10)
    nX[6]=string.sub(testXY[3],11,11)
    nY[6]=string.sub(testXY[3],12,12)
    nX[7]=string.sub(testXY[3],13,13)
    nY[7]=string.sub(testXY[3],14,14)
    nX[8]=string.sub(testXY[3],15,15)
    nY[8]=string.sub(testXY[3],16,16)
    nXres=nX[1]..nX[2]..nX[3]..nX[4]..nX[5]..nX[6]..nX[7]..nX[8]
    nYres=nY[1]..nY[2]..nY[3]..nY[4]..nY[5]..nY[6]..nY[7]..nY[8]
	nXres="0."..nXres
	nYres="0."..nYres
	mioTime=1
	testRasstoyanie=0
	nKont=testXY[4]
	nLok=testXY[5]
	framePos["X"]=nXres
	framePos["Y"]=nYres
	framePos["kont"]=nKont
	framePos["lok"]=nLok
	framePos["mapViz"]=testXY[6]
end
end

end
)
