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

if incTabC ~= nil then
	local spisokQ = mysplit(printPar(incTabC))
	for i=1, #spisokQ do
		local nomeTab = testTab(spisokQ[i])
	end

	if #spisokQ ~= 0 then
		for i=1, #spisokQ do
			if inQuest[spisokQ[i]]["старт"] ~= nil then
				if arg2 == "UNIT_DIED" then
					if arg7 == myNome then
						if incTabC[spisokQ[i]]["пСмерть"] ~= 1 then
							if incTabC[spisokQ[i]]["смерть"][inQuest[spisokQ[i]]["старт"]] ~= nil then
								local num = tostring(inQuest[spisokQ[i]]["старт"])
								local num1 = tostring(inQuest[spisokQ[i]]["старт"]+1)
								SendChatMessage(incTabC[spisokQ[i]]["смерть"][num] .. myNome .. incTabC[spisokQ[i]]["смерть"][num1], "OFFICER", nil, 1)
								inQuest[spisokQ[i]]["старт"] = nil
							end
						else
							if incTabC[spisokQ[i]]["смерть"]["0"] ~= nil then
								local num = "0"
								local num1 = "1"
								SendChatMessage(incTabC[spisokQ[i]]["смерть"][num] .. myNome .. incTabC[spisokQ[i]]["смерть"][num1], "OFFICER", nil, 1)
								inQuest[spisokQ[i]]["старт"] = nil
							end
						end
					end
				end
			end
		end
	end
end

end
)
