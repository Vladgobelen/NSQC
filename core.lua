local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
--команды для управления квестами
local nik=sender
local versAdd=6
local neobhodimo="необходимо_сделать"
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
	local i = time()
	i = i % 1000
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
nachaloStr = string.sub(message, 1, 1)
testN=string.sub(message, 5, 5)
if nachaloStr=="#" and testN~="" then
	nachaloHsh = string.sub(message, 2, 7)
	hshStraniero1=string.sub(nachaloHsh,1,1)
	hshStraniero2=string.sub(nachaloHsh,3,3)
	hshStraniero3=string.sub(nachaloHsh,5,5)
	hshStraniero=hshStraniero1 .. hshStraniero2 .. hshStraniero3
	hsh1=string.sub(hsh,1,1)
	hsh2=string.sub(hsh,3,3)
	hsh3=string.sub(hsh,5,5)
	hsh4=hsh1 .. hsh2 .. hsh3
	hshC=math.abs(hsh4-hshStraniero)
	if hshC<10 then
		hshCMD="maodzedun"
	else
		hshCMD="0"
	end
end
local nachalo = string.sub(message, 1, 1)

msg3=mysplit(message)
if string.find (message, "покажи мне ачивку")  and string.find(message, myNome) and msg3[2]~="#aaa" and nachalo~="*" then
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

if string.find (message, "покажи ачивку") and string.find(message, myNome) and msg3[2]~="#aaa" and nachalo~="*" then
	msg2 = mysplit(message)
	msg2 = msg2[4]
	msg2 = tonumber(msg2)
	j=0
	k=0
	count = GetAchievementNumCriteria(msg2)
	for i=1, count do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msg2, i);
		prov=completed
		if prov == true then
			j=j+1
		else
			k=k+1
		end
		i=i+1
	end
	if k==0 then
		SendChatMessage("#" .. hsh .. " #aai " .. "уже выполнена полностью: " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	else
		SendChatMessage("*" .. "доступно пунктов ачивки: " .. k .. " из " .. count  .. " " .. msg2 .. " " .. GetAchievementLink(msg2), "OFFICER", nil, 1)
	end


end

if string.find (message, myNome) and sender=="Витинари" and string.find (message, "версия") and string.find (message, "1234567890")  and nachalo~="*" then
        SendChatMessage("#" .. hsh .." текущая версия " .. versAdd, "OFFICER", nil, 1)
end
if string.find (message, myNome) and sender=="Витинари" and string.find (message, "покажимне") then
	SendChatMessage("#" .. hsh .." " .. hshStraniero, "OFFICER", nil, 1)
end
end
)
