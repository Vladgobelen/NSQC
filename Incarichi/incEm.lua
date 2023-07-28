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
	if incTabC ~= nil then
		local spisokQ = mysplit(printPar(incTabC))
		for i=1, #spisokQ do
			local nomeTab = testTab(spisokQ[i])
		end
		if #spisokQ ~= 0 then
			for i=1, #spisokQ do
				if inQuest[spisokQ[i]]["старт"] ~= nil then
					if incTabC[spisokQ[i]]["крики"][inQuest[spisokQ[i]]["старт"]] ~= nil then
						x=UnitName("target")
						local spisokEm = mysplit(printPar(incTabC[spisokQ[i]]["крики"][inQuest[spisokQ[i]]["старт"]]["ответы"]))
						for j=1,#spisokEm do
							numJ=tostring(j)
							if x == incTabC[spisokQ[i]]["крики"][inQuest[spisokQ[i]]["старт"]]["таргет"] then
								SendChatMessage(incTabC[spisokQ[i]]["крики"][inQuest[spisokQ[i]]["старт"]]["ответы"][numJ], "OFFICER", nil, 1)
							end
							numJ=tonumber(numJ)
							if numJ == #spisokEm then
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
