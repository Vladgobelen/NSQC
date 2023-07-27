local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_SYSTEM")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
local hshStran3
testGM=gmTest(sender)
hshStran3=hshSenderNomeC(myNome)

if inQuest ~= nil then
	if inQuest["бухло"] ~= nil then
		if inQuest["бухло"]["старт"] == 0 then
			x=UnitName("target")
			if x == "Витинари" and string.find (message, "Вы пьяны") then
				SendChatMessage("Вау...кажется я пяьн!", "OFFICER", nil, 1)
				SendAddonMessage("NSGadd", "#buhloXXX", "guild")
				inQuest["бухло"]["старт"] = 1
			end
			if inQuest["бухло"]["старт"] == 1 then
				SendChatMessage("..мне открылась истина! Все вожди кроме Витинари - лжецы и обманщики!", "OFFICER", nil, 1)
				SendChatMessage("Я срочно должен пойти и спросить у Тралла: /к ты меня уважаешь?!", "OFFICER", nil, 1)
			end
		end
		if inQuest["бухло"]["старт"] == 1 then
			if string.find (message, "Вы снова трезвы.", 1, true) then
				SendChatMessage("Ой... Я кажется протрезвел и понял весь идиотизм ситуации. Ну его нафиг...", "OFFICER", nil, 1)
				SendChatMessage("Квест провален.", "OFFICER", nil, 1)
				inQuest["бухло"]["старт"] = nil
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
		if inQuest ~= nil then
			if inQuest["бухло"] ~= nil then
				if inQuest["бухло"]["старт"] == 1 then
					spell, rank, displayName, icon, startTime, endTime, isTradeSkill, castID, interrupt = UnitCastingInfo("player")
					if spell == "Камень возвращения" then
						SendChatMessage("Стоп! Я бесчестно использую запретную магию. Это недостойное поведение. Пойду посыпать голову пеплом....", "OFFICER", nil, 1)
						SendChatMessage("Квест провален.", "OFFICER", nil, 1)
						inQuest["бухло"]["старт"] = nil
					end

				end
			end
		end

	end
end)
