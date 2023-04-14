local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local versAdd=3
local str = string.gsub(message, "%s+", "")
local myNome = GetUnitName("player")
hsh=hashStr(myNome)

local nachalo = string.sub(message, 1, 1)

if string.find (message, "#aaa") and string.find (message, hsh) and nachalo~="*" then
	msg1 = mysplit(message)
	msg1 = msg1[7]
	msg1 = tonumber(msg1)
	id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
	if completed == true then
		SendChatMessage(hsh .. " #aab " .. "эта уже выполнена " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	else
       	SendChatMessage(hsh .. " #aac " .. "можно сделать: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	end
end

if string.find (message, hsh) and string.find (message, "#aaf") then
	proverka_komandy=mysplit(message)
	msg1=proverka_komandy[8]
	msg1 = tonumber(msg1)
	id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
	if completed == true then
		SendChatMessage(hsh .. " #aag " .." ага: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	else
		SendChatMessage("*я забыл...скоро сделаю, вернусь позже.", "OFFICER", nil, 1)
	end
else
end

if string.find (message, hsh) and string.find (message, "#aah") then
	msg2 = mysplit(message)
	msg2 = msg2[13]
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
		SendChatMessage(hsh .. " #aai " .. "уже выполнена полностью: " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	else
		SendChatMessage(hsh .. " #aaj " .. "доступно пунктов ачивки: " .. k .. " из " .. count  .. " " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	end

end

if sender == "Витинари" or sender == "Двацветок" or sender == "Хэвлок" or sender == "Железобетонс" or sender == "Детрит" then
local testXY
testXY=mysplit(message)
if testXY[1]=="#zzn" then


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
end
end

end
)
