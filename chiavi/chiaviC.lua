local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
local myNome = GetUnitName("player")
if arg2 == "UNIT_DIED" then
	---Огненная пропасть
	if arg7 ~= "Огглфлинт" and arg7 ~= "Тарагаман Ненасытный" and arg7 ~= "Баззалан" and arg7 ~= "Жергош Призыватель Духов" then
		if mobKNum ~= nil then
			mobKNum = mobKNum - 1
			btnMM[2]:SetText(mobKNum)
		end
	end
	if arg7 == "Огглфлинт" then
		btnMM[3]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Тарагаман Ненасытный" then
		btnMM[4]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Баззалан" then
		btnMM[5]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Жергош Призыватель Духов" then
		btnMM[6]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	---Пещеры стенаний
	if arg7 ~= "Леди Анакондра" and arg7 ~= "Лорд Питонас" and arg7 ~= "Лорд Кобран" and arg7 ~= "Криг" and arg7 ~= "Шкам" and arg7 ~= "Лорд Серпентис" and arg7 ~= "Вердан Вечноживущий" and arg7 ~= "Мутанус Пожиратель" then
		if mobKNum ~= nil then
			mobKNum = mobKNum - 1
			btnMM[2]:SetText(mobKNum)
		end
	end
	if arg7 == "Леди Анакондра" then
		btnMM[3]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Лорд Питонас" then
		btnMM[4]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Лорд Кобран" then
		btnMM[5]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Криг" then
		btnMM[6]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Шкам" then
		btnMM[7]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Лорд Серпентис" then
		btnMM[8]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Вердан Вечноживущий" then
		btnMM[9]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	if arg7 == "Мутанус Пожиратель" then
		btnMM[10]:Disable()
		if testQ[myNome]["проверка_завершения"] ~= nil then
			testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
		end
	end
	---
end


end
)
