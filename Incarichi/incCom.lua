local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
local myNome = GetUnitName("player")
--[[print (arg1)
print (arg2)
print (arg3)
print (arg4)
print (arg5)
print (arg6)
print (arg7)
print (arg8)
print (arg9)
print (arg10)
print (arg11)
print (arg12)
print (arg13)
print (arg14)
print (arg15)
print (arg16)
print (arg17)--]]

if inQuest ~= nil then
	if inQuest["бухло"] ~= nil then
		if inQuest["бухло"]["старт"] == 1 then
			if arg2 == "UNIT_DIED" then
				if arg7 == myNome then
					SendChatMessage("Жизнь великого " .. myNome .. " завершена. Квест провален.", "OFFICER", nil, 1)
					inQuest["бухло"]["старт"] = nil
				end
			end
		end
	end
end

end
)
