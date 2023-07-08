local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
testLvlUp=mysplit(message)

if  testLvlUp[1] == "Поздравляем" and testLvlUp[3] == "c" and testLvlUp[2] == myNome then
	PlaySoundFile("Interface\\AddOns\\NSQC\\lvlUp.ogg")
end

if string.find (message, "#zzl") and string.find (message, myNome) and testGM ~= nil then
	local versA = mysplit(message)
	if testQ[myNome]["zzl"] == nil then
		testQ[myNome]["zzl"] = 1

		testQ[myNome]["btn3"] = 0
		testQ[myNome]["btn4"] = 0
	end
end

if string.find (message, "#q33") and string.find (message, myNome) and testGM ~= nil then
	local q33 = message
	q33 = mysplit(q33)
	if q33[3] == "полюби" then
		testQ[myNome]["q33q"] = "полюби"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "укуси" then
		testQ[myNome]["q33q"] = "укуси"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "изумленно" then
		testQ[myNome]["q33q"] = "изумленно"
		testQ[myNome]["q33nik1"] = q33[6]
		testQ[myNome]["q33nik2"] = q33[7]
		testQ[myNome]["q33nik3"] = q33[8]

	end
	if q33[3] == "ударь" then
		testQ[myNome]["q33q"] = "ударь"
		testQ[myNome]["q33nik1"] = q33[6]
		testQ[myNome]["q33nik2"] = q33[7]
		testQ[myNome]["q33nik3"] = q33[8]

	end
	if q33[3] == "попытайся" then
		testQ[myNome]["q33q"] = "попытайся"
		testQ[myNome]["q33nik1"] = q33[5]
		testQ[myNome]["q33nik2"] = q33[6]
		testQ[myNome]["q33nik3"] = q33[7]

	end
	if q33[3] == "почеши" then
		testQ[myNome]["q33q"] = "почеши"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "утешь" then
		testQ[myNome]["q33q"] = "утешь"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "похвали" then
		testQ[myNome]["q33q"] = "похвали"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "недоуменно" then
		testQ[myNome]["q33q"] = "недоуменно"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "поздравь" then
		testQ[myNome]["q33q"] = "поздравь"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "хмуро" then
		testQ[myNome]["q33q"] = "хмуро"
		testQ[myNome]["q33nik1"] = q33[6]
		testQ[myNome]["q33nik2"] = q33[7]
		testQ[myNome]["q33nik3"] = q33[8]

	end
	if q33[3] == "смерь" then
		testQ[myNome]["q33q"] = "смерь"
		testQ[myNome]["q33nik1"] = q33[5]
		testQ[myNome]["q33nik2"] = q33[6]
		testQ[myNome]["q33nik3"] = q33[7]

	end
	if q33[3] == "потрись" then
		testQ[myNome]["q33q"] = "потрись"
		testQ[myNome]["q33nik1"] = q33[5]
		testQ[myNome]["q33nik2"] = q33[6]
		testQ[myNome]["q33nik3"] = q33[7]

	end
	if q33[3] == "пожирай" then
		testQ[myNome]["q33q"] = "пожирай"
		testQ[myNome]["q33nik1"] = q33[5]
		testQ[myNome]["q33nik2"] = q33[6]
		testQ[myNome]["q33nik3"] = q33[7]

	end
	if q33[3] == "брось" then
		testQ[myNome]["q33q"] = "брось"
		testQ[myNome]["q33nik1"] = q33[7]
		testQ[myNome]["q33nik2"] = q33[8]
		testQ[myNome]["q33nik3"] = q33[9]

	end
	if q33[3] == "тепло" then
		testQ[myNome]["q33q"] = "тепло"
		testQ[myNome]["q33nik1"] = q33[5]
		testQ[myNome]["q33nik2"] = q33[6]
		testQ[myNome]["q33nik3"] = q33[7]

	end
	if q33[3] == "смотри" then
		testQ[myNome]["q33q"] = "смотри"
		testQ[myNome]["q33nik1"] = q33[7]
		testQ[myNome]["q33nik2"] = q33[8]
		testQ[myNome]["q33nik3"] = q33[9]

	end
	if q33[3] == "поприветствуй" then
		testQ[myNome]["q33q"] = "поприветствуй"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "крепко" then
		testQ[myNome]["q33q"] = "крепко"
		testQ[myNome]["q33nik1"] = q33[5]
		testQ[myNome]["q33nik2"] = q33[6]
		testQ[myNome]["q33nik3"] = q33[7]

	end
	if q33[3] == "оближи" then
		testQ[myNome]["q33q"] = "оближи"
		testQ[myNome]["q33nik1"] = q33[4]
		testQ[myNome]["q33nik2"] = q33[5]
		testQ[myNome]["q33nik3"] = q33[6]

	end
	if q33[3] == "внимательно" then
		testQ[myNome]["q33q"] = "внимательно"
		testQ[myNome]["q33nik1"] = q33[5]
		testQ[myNome]["q33nik2"] = q33[6]
		testQ[myNome]["q33nik3"] = q33[7]

	end
	testQ[myNome]["взятый_квест"] = "q33"
end

end
)
