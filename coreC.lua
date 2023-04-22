local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local neobhodimo="необходимо_сделать"
local str = string.gsub(message, "%s+", "")
local myNome = GetUnitName("player")
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
