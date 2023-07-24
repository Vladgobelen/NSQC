local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)


end)
