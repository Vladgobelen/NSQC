local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)


if incTabC ~= nil then
	local spisokQ = mysplit(printPar(incTabC))
	for i=1, #spisokQ do
		local nomeTab = testTab(spisokQ[i])
	end

	if #spisokQ ~= 0 then
		for i=1, #spisokQ do
			if inQuest[spisokQ[i]]["старт"] ~= nil then
				numRez=tostring(inQuest[spisokQ[i]]["старт"])
				if incTabC[spisokQ[i]]["систем"] ~= nil then
					if incTabC[spisokQ[i]]["систем"][numRez] ~= nil then
						x=UnitName("target")
						if incTabC[spisokQ[i]]["систем"][numRez]["сообщение"] ~= nil then
							if x == incTabC[spisokQ[i]]["систем"][numRez]["таргет"] and string.find (message, incTabC[spisokQ[i]]["систем"][numRez]["сообщение"]) then
								local systemOtvety = mysplit(printPar(incTabC[spisokQ[i]]["систем"][numRez]["ответы"]))
								for k=1,#systemOtvety do
									numK=tostring(k)
									SendChatMessage(incTabC[spisokQ[i]]["систем"][numRez]["ответы"][numK], "OFFICER", nil, 1)
								end
								SendAddonMessage("NSGadd", "#buhloXXX", "guild")
								inQuest[spisokQ[i]]["старт"] = inQuest[spisokQ[i]]["старт"]+1
							end
						end
						if incTabC[spisokQ[i]]["систем"][numRez]["провал"] ~= nil then
							if string.find (message, incTabC[spisokQ[i]]["систем"][numRez]["провал"], 1, true) then
								local systemProvalOtv = mysplit(printPar(incTabC[spisokQ[i]]["систем"][numRez]["провалОтв"]))
								for l=1, #systemProvalOtv do
									numL=tostring(l)
									SendChatMessage(incTabC[spisokQ[i]]["систем"][numRez]["провалОтв"][numL], "OFFICER", nil, 1)
								end
								SendChatMessage("Квест провален.", "OFFICER", nil, 1)
								inQuest[spisokQ[i]]["старт"] = nil
							end
						end
					end
				end
			end
		end
	end
end
end)

local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 0.1 then
		timeElapsed = 0
		local spisokQ
		local qSystem
		local zapretSkill
		local zapSkillOtv
		if incTabC ~= nil then
			spisokQ = mysplit(printPar(incTabC))
			for i=1, #spisokQ do
				local nomeTab = testTab(spisokQ[i])
				if inQuest[spisokQ[i]]["старт"] ~= nil then
				numRez=tostring(inQuest[spisokQ[i]]["старт"])
					qSystem = mysplit(printPar(incTabC[spisokQ[i]]["систем"]))

						if incTabC[spisokQ[i]]["систем"][numRez] ~= nil then
							if incTabC[spisokQ[i]]["систем"][numRez]["запрет_скиллы"] ~= nil then
								spell, rank, displayName, icon, startTime, endTime, isTradeSkill, castID, interrupt = UnitCastingInfo("player")
								zapretSkill = mysplit(printPar(incTabC[spisokQ[i]]["систем"][numRez]["запрет_скиллы"]))
								for zapS=1,#zapretSkill-1 do
									numZapS=tostring(zapS)
									if spell == incTabC[spisokQ[i]]["систем"][numRez]["запрет_скиллы"][numZapS] then
										zapSkillOtv = mysplit(printPar(incTabC[spisokQ[i]]["систем"][numRez]["запрет_скиллы"]["ответы"]))
										for zapSOtv=1,#zapSkillOtv do
											numZapSOtv = tostring(zapSOtv)
											SendChatMessage(incTabC[spisokQ[i]]["систем"][numRez]["запрет_скиллы"]["ответы"][numZapSOtv], "OFFICER", nil, 1)
										end
										inQuest[spisokQ[i]]["старт"] = nil
									end
								end
							end
						end
				end
			end
		end
	end

end)
