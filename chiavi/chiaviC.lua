local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
if arg4 ~= "Куренайский распорядитель боев" then
	if arg2 == "UNIT_DIED" then
		if arg7 ~= "Огглфлинт" and arg7 ~= "Тарагаман Ненасытный" and arg7 ~= "Баззалан" and arg7 ~= "Жергош Призыватель Духов" then
		if mobKNum ~= nil then
			mobKNum = mobKNum + 1
			btnMM[2]:SetText(mobKNum)
		end
		elseif arg7 == "Огглфлинт" then
			btnMM[3]:Disable()
		elseif arg7 == "Тарагаман Ненасытный" then
			btnMM[4]:Disable()
		elseif arg7 == "Баззалан" then
			btnMM[5]:Disable()
		elseif arg7 == "Жергош Призыватель Духов" then
			btnMM[6]:Disable()
		end

	end
end

end
)
