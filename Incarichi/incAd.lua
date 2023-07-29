local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
--команды для управления квестами
local myNome = GetUnitName("player")
testGM=gmTest(sender)

if incTabC == nil then
	testTab()
end
local spisokQ = mysplit(printPar(incTabC))
	for i=1, #spisokQ do
		local nomeTab = testTab(spisokQ[i])
	end
if string.find(kod, "inQdiServ") and string.find(kod, "название") then
	local i = testTab(message)
	incTabC[message]["название"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "старт") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	incTabC[kodNum[3]]["старт"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "количество_этапов") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	incTabC[kodNum[3]]["количество_этапов"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "пСмерть") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	incTabC[kodNum[3]]["пСмерть"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "смерть") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	incTabC[kodNum[3]]["смерть"][kodNum4] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "крикиКрик") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	if incTabC[kodNum[3]]["крики"][kodNum4] == nil then
		incTabC[kodNum[3]]["крики"][kodNum4] = {}
	end
	incTabC[kodNum[3]]["крики"][kodNum4]["крик"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "крикиТаргет") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	if incTabC[kodNum[3]]["крики"][kodNum4] == nil then
		incTabC[kodNum[3]]["крики"][kodNum4] = {}
	end
	incTabC[kodNum[3]]["крики"][kodNum4]["таргет"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "крикиОтв") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	kodNum5 = tostring(kodNum[5])
	if incTabC[kodNum[3]]["крики"][kodNum4] == nil then
		incTabC[kodNum[3]]["крики"][kodNum4] = {}
	end
	if incTabC[kodNum[3]]["крики"][kodNum4]["ответы"] == nil then
		incTabC[kodNum[3]]["крики"][kodNum4]["ответы"] = {}
	end
	incTabC[kodNum[3]]["крики"][kodNum4]["ответы"][kodNum5] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "системСообщение") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	if incTabC[kodNum[3]]["систем"][kodNum4] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4] = {}
	end
	incTabC[kodNum[3]]["систем"][kodNum4]["сообщение"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "системПровал") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	if incTabC[kodNum[3]]["систем"][kodNum4] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4] = {}
	end
	incTabC[kodNum[3]]["систем"][kodNum4]["провал"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "системТаргет") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	if incTabC[kodNum[3]]["систем"][kodNum4] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4] = {}
	end
	incTabC[kodNum[3]]["систем"][kodNum4]["таргет"] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "системОтвет") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	kodNum5 = tostring(kodNum[5])
	if incTabC[kodNum[3]]["систем"][kodNum4] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4] = {}
	end
	if incTabC[kodNum[3]]["систем"][kodNum4]["ответы"] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4]["ответы"] = {}
	end
	incTabC[kodNum[3]]["систем"][kodNum4]["ответы"][kodNum5] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "системПровОтв") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	kodNum5 = tostring(kodNum[5])
	if incTabC[kodNum[3]]["систем"][kodNum4] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4] = {}
	end
	if incTabC[kodNum[3]]["систем"][kodNum4]["провалОтв"] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4]["провалОтв"] = {}
	end
	incTabC[kodNum[3]]["систем"][kodNum4]["провалОтв"][kodNum5] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "системЗапретСкилл") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	kodNum5 = tostring(kodNum[5])
	if incTabC[kodNum[3]]["систем"][kodNum4] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4] = {}
	end
	if incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"] = {}
	end
	incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"][kodNum5] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "системЗапСкиллОтв") then
	local kodNum = kod
	kodNum = mysplit(kodNum)
	kodNum4 = tostring(kodNum[4])
	kodNum5 = tostring(kodNum[5])
	if incTabC[kodNum[3]]["систем"][kodNum4] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4] = {}
	end
	if incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"] = {}
	end
	if incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"]["ответы"] == nil then
		incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"]["ответы"] = {}
	end
	incTabC[kodNum[3]]["систем"][kodNum4]["запрет_скиллы"]["ответы"][kodNum5] = message
end
if string.find(kod, "inQdiServ") and string.find(kod, "успех") then
	SendChatMessage("Список квестов успешно обновлен. Добавлен квест: " .. message, "OFFICER", nil, 1)
end


if string.find(kod, "inQuest") then
	local msg = mysplit(message)
	local testTabella = testTab(msg[3])
	print ("1")
	if string.find (message, "инСтарт") and string.find (message, myNome) and testGM ~= nil and testTabella ~= nil and inQuest[msg[3]]["старт"] == nil then
		print ("2")
		inQuest[msg[3]]["старт"] = 0
		print("3")
		SendChatMessage(incTab[msg[3]]["старт"], "OFFICER", nil, 1)
	end
end
if string.find(kod, "inQxxx") and string.find (message, myNome) and testGM ~= nil then
	local msg = mysplit(message)
	local testTabella = testTab(msg[3])
	if string.find (message, "инСтарт") and string.find (message, myNome) and testGM ~= nil then
		inQuest[msg[3]]["старт"] = nil
		SendChatMessage("Квест принудительно отменен", "OFFICER", nil, 1)
	end
end
if string.find(kod, "inQuest") then
	local msg = mysplit(message)
	local testTabella = testTab(msg[2])
	if string.find (message, "ОбинСтарт") and testGM ~= nil and testTabella ~= nil and inQuest[msg[2]]["старт"] == nil then
		inQuest[msg[2]]["старт"] = 0
		SendChatMessage(incTab[msg[3]]["старт"], "OFFICER", nil, 1)
	end
end

end
)
