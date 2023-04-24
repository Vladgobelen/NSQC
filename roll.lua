local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")

local msg = string.gsub(message, "%s+", "")

    if string.find (message, "выбрасывает") and sender==myNome then
       SendChatMessage(message, "OFFICER", nil, 1);
    else
    end



end
)
