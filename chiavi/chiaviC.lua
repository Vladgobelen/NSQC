local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
local myNome = GetUnitName("player")
if arg2 == "UNIT_DIED" then
	---Огненная пропасть
	local testMM = GetInstanceInfo()
	if mmList[testMM] ~= nil then
		if testMM == mmList[testMM]["название"] then
			if tblAllFail(testMM,arg7) == 0 then
				if mobKNum ~= nil then
					if btnMM[2]:IsEnabled() then
						mobKNum = mobKNum - 1
						btnMM[2]:SetText(mobKNum)
						if mobKNum <= 0 then
							btnMM[2]:Disable()
							if testQ[myNome]["проверка_завершения"] ~= nil then
								if mobKNum == 0 then
									btnMM[2]:SetText("0")
									testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
								end
							end
						end
					end
				end
			end
			if tblAllFail(testMM,arg7) ~= 0 then
				bossNum = tblAllFail(testMM,arg7)
				bossNum = tonumber(bossNum)
				bossNum = bossNum + 2
				btnMM[bossNum]:Disable()
				if testQ[myNome]["проверка_завершения"] ~= nil then
					testQ[myNome]["проверка_завершения"] = testQ[myNome]["проверка_завершения"] + 1
				end
			end
		end
	end
end

end
)
