local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)


end)

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_YELL")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)
	if inQuest["бухло"]["старт"] == 1 then
		if sender == myNome then
		x=UnitName("target")
			if x == "Тралл" and string.find (message, "ты меня уважаешь?!") then
				SendChatMessage("Чот мне показалось, что Тралл меня не уважает...", "OFFICER", nil, 1)
				SendChatMessage("Нужно убедиться, что я прав и крут: пойти и поцеловать Сильвану...Хотя бы издалека..", "OFFICER", nil, 1)
				SendAddonMessage("NSGadd", "#buhloXXX", "guild")
				inQuest["бухло"]["старт"] = 2
			end
		end
	end

end)
