local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
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

function hashStr (nome)
	hours, minutes = GetGameTime()
	count1=hours* 3.1415926535
	count2=minutes* 3.1415926535
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
local myNome = GetUnitName("player")
hsh=hashStr(myNome)
hshStraniero=hashStr(sender)
local nachalo = string.sub(message, 1, 1)

if sender == "Витинари" or sender == "Детрит" or sender == "Железобетонс" or sender == "Двацветок" then
	if string.find (message, "#aaa") and string.find(message, hshStraniero) and nachalo~="*" then
		msg1 = mysplit(message)
		msg1 = msg1[7]
		msg1 = tonumber(msg1)
		id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
		if completed == true then
			SendChatMessage(hsh .. " #aab " .. "эта уже выполнена " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
		else
        	SendChatMessage(hsh .. " #aac " .. "можно сделать: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
		end
	end
if string.find (message, hshStraniero) and string.find (message, "#aaf") then
	proverka_komandy=mysplit(message)
	msg1=proverka_komandy[8]
	msg1 = tonumber(msg1)
	id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
	if completed == true then
		SendChatMessage(hsh .. " #aag " .." ага: " .. msg1 .. " " .. GetAchievementLink(msg1), "OFFICER", nil, 1)
	else
		SendChatMessage("*я забыл...скоро сделаю, вернусь позже.", "OFFICER", nil, 1)
	end
	else
end


end

end
)
