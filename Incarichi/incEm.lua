local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)


end)

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_YELL")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)

if sender == myNome then
	local numRazdel
	if incTabC ~= nil then
		local spisokQ = mysplit(printPar(incTabC))
		for i=1, #spisokQ do
			local nomeTab = testTab(spisokQ[i])
		end
		if #spisokQ ~= 0 then
			for i=1, #spisokQ do
				if inQuest[spisokQ[i]]["старт"] ~= nil then
				numRazdel = tostring(inQuest[spisokQ[i]]["старт"])
				print(incTabC[spisokQ[i]]["крики"][numRazdel])
					if incTabC[spisokQ[i]]["крики"][numRazdel] ~= nil then
						x=UnitName("target")
						print (x)
						local spisokEm = mysplit(printPar(incTabC[spisokQ[i]]["крики"][numRazdel]["ответы"]))
						for j=1,#spisokEm do
							numJ=tostring(j)
							if x == incTabC[spisokQ[i]]["крики"][numRazdel]["таргет"] and string.find(message,incTabC[spisokQ[i]]["крики"][numRazdel]["крик"], 1, true) then
								SendChatMessage(incTabC[spisokQ[i]]["крики"][numRazdel]["ответы"][numJ], "OFFICER", nil, 1)
								numJ=tonumber(numJ)
								SendAddonMessage("NSGadd", "#buhloXXX", "guild")
								inQuest[spisokQ[i]]["старт"] = inQuest[spisokQ[i]]["старт"] + 1
							end
						end
					end
				end
			end
		end
	end
end

end)
