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

gInv = mysplit(message)
if string.find (message, "приглашается в вашу") then
    if ginv == nil then
        ginv = {}
    end
    table.insert(ginv, gInv[1])
end

if ginv ~= nil then
    if string.find (message, "присоединяется к") then
        for range,value in pairs(ginv) do
            if value == gInv[1] then
                if testQ[myNome]["zzlf"] ~= nil then
                    testQ[myNome]["zzlf"] = testQ[myNome]["zzlf"] + 1
                else
                    testQ[myNome]["zzlf"] = 1
                end
            end
        end
    end
end
end
)
