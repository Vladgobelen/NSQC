local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
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
local nachalo = string.sub(message, 1, 1)
local myName = GetUnitName("player")

if string.find (message, myName) and string.find (message, "покажи мне") and string.find (message, "ачивку") and nachalo~="*" then
        msg1 = all_trim(message)
        msg1 = (msg1):gsub(myName, "");
        msg1 = all_trim(msg1)
        msg1 = (msg1):gsub(", покажи мне ачивку ", "");
        msg1 = all_trim(msg1)
        msg1 = tonumber(msg1)
        id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
        hours, minutes = GetGameTime()
        count1=hours
        print (count1)
        count2=minutes
        print (count2)
        count3=count1/count2
        print (count3)
        count3=string.sub(count3, 3, 5)
        count3=string.format("%03d",count3)
        if completed == true then
                SendChatMessage("*" .. count3 .." ВОЖДЬ, уже сделана: " .. GetAchievementLink(msg1), "guild", nil, 1)
        else
                SendChatMessage("*" .. count3 .." ВОЖДЬ, можно сделать: " .. GetAchievementLink(msg1), "guild", nil, 1)
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
        hours, minutes = GetGameTime()
        count1=hours
        count2=minutes
        count3=count1/count2
        count3=string.sub(count3, 3, 5)
        count3=string.format("%03d",count3)
        SendChatMessage("*" .. count3 .." ВОЖДЬ, " .. k .. " из " .. count .. " осталось: " .. GetAchievementLink(msg), "guild", nil, 1)

end


end
)
