local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)
    if testQ ~= nil then
        if testQ[myNome] ~= nil then
            if testQ[myNome]["настройки"]==nil then
                testQ[myNome]["настройки"]={}
            end
            rollSender=mysplit(message)
            rollSender=rollSender[1]
                if string.find (message, "выбрасывает") and rollSender==myNome then
                    SendChatMessage(hshStran3 .. " #rll " .. message, "OFFICER", nil, 1);
                else
                end
        end
    end


end
)
