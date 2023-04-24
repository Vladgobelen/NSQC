local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
    if testQ[myNome]["настройки"]==nil then
        testQ[myNome]["настройки"]={}
    end
    rollSender=mysplit(message)
    rollSender=rollSender[1]
    if testQ[myNome]["настройки"]["roll"]=="Enable" then
        if string.find (message, "выбрасывает") and rollSender==myNome then
            SendChatMessage(message, "OFFICER", nil, 1);
        else
        end
    end


end
)
