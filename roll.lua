local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
    rollSender=mysplit(message)
    rollSender=rollSender[1]
    if string.find (message, "выбрасывает") and rollSender==myNome then
       SendChatMessage(message, "OFFICER", nil, 1);
    else
    end



end
)
