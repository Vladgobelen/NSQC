local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local versAdd=3
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

function alfabet (bookv)
shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	myB=string.find(shablon,bookv)
	return myB
end

function hashStr (nome)
	i = time()
	i = string.sub(i, 8, 9)
	i = i * i
	i = i * 3.1415926535
	i = string.sub(i, 3, 5)
	i = string.format("%03d",i)
	nome1=string.sub(nome, 1, 1)
	nome2=string.sub(nome, 2, 2)
	nome1=alfabet(nome1)
	nome2=alfabet(nome2)
	hNome=nome1*nome2
	hNome=string.sub(hNome, 1, 3)
	hNome=string.format("%03d",hNome)
	r1=string.sub(i, 1, 1)
	r2=string.sub(hNome, 1, 1)
	r3=string.sub(i, 2, 2)
	r4=string.sub(hNome, 2, 2)
	r5=string.sub(i, 3, 3)
	r6=string.sub(hNome, 3, 3)
	r=r1 .. r2 .. r3 .. r4 .. r5 .. r6
	return r
end

local myNome = GetUnitName("player")
hsh=hashStr(myNome)
hshStraniero=hashStr(sender)
local nachalo = string.sub(message, 1, 1)

msg3=mysplit(message)
if string.find (message, "покажи мне ачивку") and msg3[2]~="#aaa" and nachalo~="*" then
	print ("fdsfdsaf")
	msg1 = mysplit(message)
	msg1 = msg1[5]
	msg1 = tonumber(msg1)
	id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
	if completed == true then
		SendChatMessage("*" .. sender .. ", эта уже выполнена: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	else
		SendChatMessage("*" .. sender .. ", эту еще не делал: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	end
end

if string.find (message, myNome) and string.find (message, "покажи") and string.find (message, "ачивку") and nachalo~="*" then
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

        SendChatMessage("*" .. hsh .." ВОЖДЬ, " .. k .. " из " .. count .. " осталось: " .. GetAchievementLink(msg), "OFFICER", nil, 1)

end
if string.find (message, myNome) and sender=="Витинари" and string.find (message, "версия") and string.find (message, "1234567890")  and nachalo~="*" then
        SendChatMessage(hsh .." текущая версия " .. versAdd, "OFFICER", nil, 1)
end
if string.find (message, myNome) and sender=="Витинари" and string.find (message, "покажимне") then
	SendChatMessage(hsh .." " .. hshStraniero, "OFFICER", nil, 1)
end
end
)
