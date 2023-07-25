local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
--команды для управления квестами
local myNome = GetUnitName("player")
testGM=gmTest(sender)

if string.find (message, "бСтарт") and string.find (message, myNome) and testGM ~= nil then
	if inQuest == nil then
		inQuest = {}
	end
	if inQuest["бухло"] == nil then
		inQuest["бухло"] = {}
	end
	inQuest["бухло"]["старт"] = 0
	SendChatMessage("У меня возникает смутное ощущение, что мне срочно  нужно набухаться с Витинари...", "guild", nil, 1)

end

end
)
