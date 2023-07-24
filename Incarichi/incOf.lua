local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")

if string.find (message, "бСтарт") and string.find (message, myNome) and testGM ~= nil then
	if inQuest == nil then
		inQuest = {}
	end
	if inQuest["бухло"] == nil then
		inQuest["бухло"] = {}
	end
	inQuest["бухло"]["старт"] = 0
end

end
)
