local h=CreateFrame("Frame")
h:RegisterEvent("CHAT_MSG_SYSTEM")
h:SetScript("OnEvent", function(h,H,L,z)
    local X=GetUnitName("player")
    local x
    testGM=gmTest(z)
    x=hshSenderNomeC(X)

    if testQ.fls~=nil then
        if string.find(L,"выходит в игровой мир") then
            local h=mysplit(L)
            local H=string.match(h[1],"%[([^%]]+):]")
            for h,L in pairs(testQ.fls) do
                if h==H then PlaySoundFile(L) break end
            end
        end
    end

    if testQ~=nil then
        if testQ[X]~=nil then
            if testQ[X]["настройки"]==nil then testQ[X]["настройки"]={} end
            -- #rll в офицер-чат больше не шлём
        end
    end

    if testQ~=nil then
        if testQ[X]~=nil then
            if testQ[X].q_stelth~=nil then
                if testQ[X].q_stelth.start==2 or testQ[X].q_stelth.start==3 then
                    if string.find(L,"Подземелье") and string.find(L,"обновлено") then
                        testQ[X].q_stelth.start=0
                        SendChatMessage("Квест обновлен","OFFICER",nil,1)
                    end
                end
            end
        end
    end

    if string.find(L,"Вы ощущаете сильное опьянение") then testQ.acbuhlo=1 end
    if string.find(L,"Вы немного пьяны") then testQ.acbuhlo=nil end

    gInv=mysplit(L)
    if string.find(L,"приглашается в вашу гильдию") then
        if ginv==nil then ginv={} end
        table.insert(ginv,gInv[1])
    end

    if ginv~=nil then
        local h,H,z=GetGuildInfo("player")
        if h=="Ночная стража" then
            if string.find(L,"присоединяется к гильдии") then
                local h
                for H,L in pairs(ginv) do
                    h=L
                    if L==gInv[1] then
                        if testQ.shtrf==nil then testQ.shtrf={} end
                        for h,H in pairs(testQ.shtrf) do
                            if H==gInv[1] then shtraf=1 else shtraf=0 end
                        end
                        if shtraf==0 or shtraf==nil then
                            if testQ[X].zzlf~=nil then
                                testQ[X].zzlf=testQ[X].zzlf+1
                                SendAddonMessage("NSGadd",X.." принял +1 ","guild")
                                if testQ.mapQuestPodskazki~=nil and testQ.mapQuestPodskazki~=1 then
                                    testQ.mapQuestPodskazki=testQ.mapQuestPodskazki+1
                                    if testQ.hTimer~=nil then testQ.hTimer=tonumber(testQ.hTimer)-60 end
                                elseif testQ.mapQuestPodskazki==nil then
                                    testQ.mapQuestPodskazki=0
                                    if testQ.hTimer~=nil then testQ.hTimer=tonumber(testQ.hTimer)-60 end
                                elseif testQ.mapQuestPodskazki>=1 then
                                    SendAddonMessage("#M1QPP",X,"guild")
                                    testQ.mapQuestPodskazki=nil
                                    if testQ.hTimer~=nil then testQ.hTimer=tonumber(testQ.hTimer)-60 end
                                end
                                if testQ[X]["настройки"].roll=="Enable" then
                                    local H=math.random(1,#gInvite)
                                    SendChatMessage(gInvite[H],"WHISPER",nil,h)
                                end
                                break
                            else
                                testQ[X].zzlf=1
                            end
                        else
                            SendAddonMessage("NSGadd",X..(" попытался наебать ником "..gInv[1]),"guild")
                        end
                    end
                end
                table.insert(testQ.shtrf,gInv[1])
                shtraf=nil
            end
        end
    end

    if string.find(L,"Вы выиграли торги") and string.find(L,"Обычное письмо") then
        testQ.smg=tonumber(testQ.smg)+1
        testQ.nikQS=antc(tonumber(testQ.smg))
    end

    local C=GuildFrame.selectedGuildMemberName
    if C~=nil then
        if string.find(L,"выходит из игрового мира") and string.find(L,C) then
            if fBtn[1]:IsVisible() then
                for h=1,100,1 do fBtn[h]:Hide() end
                btn[989]:ClearAllPoints()
                btn[989]:SetPoint("BOTTOMLEFT",GuildMemberDetailFrame,"TOPLEFT",96,-3)
                btn[989]:Hide()
            end
        end
    end

    if testQ.chs==nil then testQ.chs={} end
    for h=1,#testQ.chs,1 do
        if testQ.chs[h]~=nil then
            if string.find(L,testQ.chs[h]) then
                SendChatMessage(testQ.chs[h].." исключен из гильдии","OFFICER",nil,1)
                GuildUninvite(testQ.chs[h])
            end
        end
    end

    if string.find(L,"право пользования каналами и почет временно приостановлено до завершения рассмотрения запроса") then
        SendAddonMessage("#hQ2itemQ ","1","guild")
    end
end)

local H=CreateFrame("Frame")
H:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
H:SetScript("OnEvent", function(h,H,L,z)
    local X=GetUnitName("player")
    local x
    testGM=gmTest(z)
    x=hshSenderNomeC(X)

    if testQ[X].q33fnd~=nil then
        if string.find(L,testQ[X].q33fnd) then
            for h=1,#testQ[X].q33nik,1 do
                if testQ[X].q33nik[h]~=1 then
                    if string.find(L,testQ[X].q33nik[h]:gsub("%-","%%-")) then
                        SendChatMessage(testQ[X].q33ans..testQ[X].q33nik[h],"OFFICER",nil,1)
                        testQ[X].q33nik[h]=1
                    end
                end
            end
        end
    end
end)