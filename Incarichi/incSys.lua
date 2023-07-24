local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)

if inQuest ~= nil then
	if inQuest["бухло"] ~= nil then
		if inQuest["бухло"]["старт"] == 0 then
			x=UnitName("target")
			if x == "Витинари" and string.find (message, "Вы пьяны") then
				SendChatMessage("Вау...кажется я пяьн!", "OFFICER", nil, 1)
				SendAddonMessage("NSGadd", "#buhloXXX", "guild")
				inQuest["бухло"]["старт"] = nil
			end
		end
	end
end


end)
