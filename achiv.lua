local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local versAdd=2
local str = string.gsub(message, "%s+", "")
function all_trim(s)
        return s:match( "^%s*(.-)%s*$" )
end
function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function hashStr (nome)
        hours, minutes = GetGameTime()
        count1=hours* 3,1415926535
        count2=minutes* 3,1415926535
        count3=count1*count2
        count3=string.sub(count3, 1, 3)
        count3=string.format("%03d",count3)
        hNik=string.byte(nome,1)
        hNik2=string.byte(nome,2)
        hNome=hNik*hNik2
        hNome=string.sub(hNome, 1, 3)
        hNome=string.format("%03d",hNome)
        r1=string.sub(count3, 1, 1)
        r2=string.sub(hNome, 1, 1)
        r3=string.sub(count3, 2, 2)
        r4=string.sub(hNome, 2, 2)
        r5=string.sub(count3, 3, 3)
        r6=string.sub(hNome, 3, 3)
        r=r1 .. r2 .. r3 .. r4 .. r5 .. r6
        return r
end

local nachalo = string.sub(message, 1, 1)
local myName = GetUnitName("player")

if string.find (message, myName) and nachalo~="*" then
        proverka_komandy=mysplit(message)
        if proverka_komandy[2]=="покажи" and proverka_komandy[3]=="мне" and proverka_komandy[4]=="ачивку" then
                msg1=proverka_komandy[5]
                msg1 = tonumber(msg1)
                id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
                hsh=0
                hsh=hashStr(sender)
                if completed == true then
                        SendChatMessage("*" .. hsh .." ВОЖДЬ, уже сделана: " .. GetAchievementLink(msg1), "guild", nil, 1)
                else
                        SendChatMessage(hsh .." ВОЖДЬ, можно сделать: " .. msg1 .. " " .. GetAchievementLink(msg1), "guild", nil, 1)
                end
        end
end
if string.find (message, myName) and string.find (message, "покажи") and string.find (message, "ачивку") and nachalo~="*" then
        msg = all_trim(message)
        msg = (msg):gsub(myName, "");
        msg = all_trim(msg)
        msg = (msg):gsub(", покажи ачивку ", "");

        j=0
        k=0
        count = GetAchievementNumCriteria(msg)
        for i=1, count do
                local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msg, i);
                prov=completed
                if prov == true then
                        j=j+1
                else
                        k=k+1
                end
                i=i+1
        end
        hsh=0
        hsh=hashStr(sender)
        SendChatMessage("*" .. hsh .." ВОЖДЬ, " .. k .. " из " .. count .. " осталось: " .. GetAchievementLink(msg), "guild", nil, 1)

end
if string.find (message, myName) and string.find (message, "а сделал ли ты") and nachalo~="*" then
        proverka_komandy=mysplit(message)
        msg1=proverka_komandy[6]
        msg1 = tonumber(msg1)
        id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
        hsh=0
        hsh=hashStr(sender)
        if completed == true then
                SendChatMessage("*" .. hsh .." ага: " .. msg1 .. " " .. GetAchievementLink(msg1), "guild", nil, 1)
        else
                SendChatMessage("*" .. hsh .." поторопился...", "guild", nil, 1)
        end
else
end


end
)
