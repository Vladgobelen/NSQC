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
if string.find (message, "приглашается в вашу гильдию") then
    if ginv == nil then
        ginv = {}
    end
    table.insert(ginv, gInv[1])
end

if ginv ~= nil then
    if string.find (message, "присоединяется к гильдии") then
        for range,value in pairs(ginv) do
            if value == gInv[1] then
                if testQ[myNome]["zzlf"] ~= nil then
                    testQ[myNome]["zzlf"] = testQ[myNome]["zzlf"] + 1
                    SendAddonMessage("NSGadd", myNome .. " принял +1 ", "guild")
                else
                    testQ[myNome]["zzlf"] = 1
                end
            end
        end
    end
end



end
)
local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)
local q33q = message
q33q = mysplit(q33q)
if testQ[myNome]["q33q"] == "полюби" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы любите") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я полюбил " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я полюбил " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я полюбил " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "укуси" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы кусаете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я укусил " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я укусил " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я укусил " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "изумленно" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы изумленно смотрите") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я изумленно смотрю на " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я изумленно смотрю на " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я  изумленно смотрю на " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "ударь" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы бьете") then
        if string.find (message, q3nik1) then
             SendChatMessage("Я бью " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я бью " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я бью " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "попытайся" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы пытаетесь успокоить") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я пытаюсь успокоить " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я пытаюсь успокоить " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я пытаюсь успокоить " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "почеши" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы чешете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я очень котяво чешу " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я очень котяво чешу " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я очень котяво чешу " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "утешь" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы утешаете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я утешаю " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я утешаю " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я утешаю " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "похвали" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы хвалите") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я хвалю " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я хвалю " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я хвалю " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "недоуменно" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы недоуменно смотрите") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я недоуменно смотрю на " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я недоуменно смотрю на " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я недоуменно смотрю на " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "поздравь" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы поздравляете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я поздравляю " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я поздравляю " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я поздравляю " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end

end
if testQ[myNome]["q33q"] == "хмуро" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы хмуро смотрите") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я хмуро смотрю на " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я хмуро смотрю на " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я хмуро смотрю на " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "смерь" then
    if string.find (message, "Вы меряете взглядом") then
        if string.find (message,"[" .. testQ[myNome]["q33nik1"]:sub(1, -2) .. "]") then
            print (testQ[myNome]["q33nik1"])
            SendChatMessage("Я меряю взглядом " .. testQ[myNome]["q33nik1"]:sub(1, -2) , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message,"[" .. testQ[myNome]["q33nik2"]:sub(1, -2) .. "]") then
            print (testQ[myNome]["q33nik2"])
            SendChatMessage("Я меряю взглядом " .. testQ[myNome]["q33nik2"]:sub(1, -2) , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message,"[" .. testQ[myNome]["q33nik3"] .. "]") then
            print (testQ[myNome]["q33nik3"])
            SendChatMessage("Я меряю взглядом " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "потрись" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы третесь об") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я трусь, громко испуская газы об " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я трусь, громко испуская газы об " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я трусь, громко испуская газы об " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "пожирай" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы пожираете взглядом") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я пожираю взглядом " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я пожираю взглядом " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я пожираю взглядом " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "брось" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы бросаете гневный взгляд") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я бросаяю гневный взгляд на " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я бросаяю гневный взгляд на " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я бросаяю гневный взгляд на " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "тепло" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы тепло приветствуете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я тепло приветствую " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я тепло приветствую " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я тепло приветствую " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "смотри" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы смотрите на") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я смотрю и стоню..стону на " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я смотрю и стоню..стону на " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я смотрю и стоню..стону на " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "поприветствуй" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы приветствуете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я приветствую " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я приветствую " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я приветствую " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "крепко" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы крепко обнимаете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я крепко обнимаю " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я крепко обнимаю " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я крепко обнимаю " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "оближи" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы облизываете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я облизываю " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я облизываю " .. q3nik2 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я облизываю " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
if testQ[myNome]["q33q"] == "внимательно" then
    q3nik1 = testQ[myNome]["q33nik1"]:sub(1, -2)
    q3nik2 = testQ[myNome]["q33nik2"]:sub(1, -2)
    if string.find (message, "Вы внимательно слушаете") then
        if string.find (message, q3nik1) then
            SendChatMessage("Я внимательно слушаю " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik1"] = 1
        end
        if string.find (message, q3nik2) then
            SendChatMessage("Я внимательно слушаю " .. q3nik1 , "OFFICER", nil, 1)
            testQ[myNome]["q33nik2"] = 1
        end
        if string.find (message, q3nik3) then
            SendChatMessage("Я внимательно слушаю " .. testQ[myNome]["q33nik3"] , "OFFICER", nil, 1)
            testQ[myNome]["q33nik3"] = 1
        end
    end
end
end)
