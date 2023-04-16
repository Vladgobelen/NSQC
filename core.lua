local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local versAdd=14
local neobhodimo="необходимо_сделать"
local str = string.gsub(message, "%s+", "")
local myNome = GetUnitName("player")
hsh=hashStr(myNome)
msg3=mysplit(message)
if string.find (message, "покажи мне ачивку")  and string.find(message, myNome) and msg3[2]~="#aaa" and nachalo~="*" then
	msg1 = mysplit(message)
	msg1 = msg1[5]
	msg1 = tonumber(msg1)
	id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
	if completed == true then
		SendChatMessage("*" .. sender .. ", эта уже выполнена: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	else
		SendChatMessage("*" .. sender .. ", эту еще не делал: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
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
		SendChatMessage(hsh .. " #aai " .. "уже выполнена полностью: " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	else
		SendChatMessage("*" .. "доступно пунктов ачивки: " .. k .. " из " .. count  .. " " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	end


end
if string.find (message, myNome) and sender=="Витинари" and string.find (message, "версия") and string.find (message, "1234567890")  and nachalo~="*" then
        SendChatMessage(hsh .." текущая версия " .. versAdd, "OFFICER", nil, 1)
end

if string.find (message, myNome) and sender=="Витинари" and string.find (message, "покажимне") then
	SendChatMessage(hsh, "OFFICER", nil, 1)
end
end
)
