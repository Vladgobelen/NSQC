versAdd=282;versAddDop=9
local zloykakash
bonusQuestF = 30
local myNome = GetUnitName("player")
btn = {};
editB = {}
fBtn = {}
resursy = {}
vybor = {}
okNo = {}
magazin = {}

function okNo:configure(id,sign)
	if sign == "show" then
		if testQ["okno"] ~= "completed" or testQ["okno"] ~= "itemQend" or testQ["okno"] == "q33" or testQ["okno"] == testQ[myNome]["взятый_квест_х"] then
			if okNo[1] == nil then
				self[1] = CreateFrame("Button", nil, UIParent, "");
				self[1]:SetFrameStrata("TOOLTIP")
				self[1]:SetPoint("BOTTOMLEFT", iconQText[1],"BOTTOMLEFT",20, 20)
				self[1]:SetSize(128, 128)
				self[1]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ok.tga")
				self[1]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ok.tga")
				self[2] = CreateFrame("Button", nil, UIParent, "");
				self[2]:SetFrameStrata("TOOLTIP")
				self[2]:SetPoint("BOTTOMRIGHT", iconQText[1],"BOTTOMRIGHT",-20, 20)
				self[2]:SetSize(128, 128)
				self[2]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\no.tga")
				self[2]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\no.tga")
			else
				okNo[1]:Show()
				if okNo[2] ~= nil then
					okNo[2]:Show()
				end
			end
			if testQ["okno"] == "q33" and testQ["okno"] ~= "itemQ" then
				if okNo[2] then
					okNo[1]:Show()
				end
				if okNo[2] ~= nil then
					okNo[2]:Show()
				end
			end
			if testQ["okno"] == testQ[myNome]["взятый_квест_х"] then
				if okNo[2] then
					okNo[1]:Show()
				end
				if okNo[2] ~= nil then
					okNo[2]:Show()
				end
			end
			if testQ["itemQVzyat"] == 1 and testQ[myNome]["hTimer"] ~= nil and testQ["okno"] == "itemQ" then
				okNo[2]:Hide()
			end
			if testQ["okno"] == "itemQ" and testQ[myNome]["hTimer"] ~= nil and testQ["okno"] == "itemQ" then
				okNo[2]:Hide()
			end
			if testQ["okno"] == "itemQend" and testQ[myNome]["hTimer"] ~= nil then
				okNo[2]:Hide()
			end
		else
			if okNo[1] == nil then
				self[1] = CreateFrame("Button", nil, UIParent, "");
				self[1]:SetFrameStrata("TOOLTIP")
				self[1]:SetPoint("BOTTOMLEFT", iconQText[1],"BOTTOMLEFT",20, 20)
				self[1]:SetSize(128, 128)
				self[1]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ok.tga")
				self[1]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ok.tga")
			else
				okNo[1]:Show()
			end
		end
	else
		okNo[1]:Hide()
		if okNo[2]~= nil then
			okNo[2]:Hide()
		end
	end
	self[1]:SetScript("OnClick",function(self, button)

		if testQ["okno"] == "itemQend" then
			SendChatMessage("Я отправил Возждю все что нужно", "OFFICER", nil, 1)
			if testQ[myNome]["hTimer"] ~= nil then
				SendAddonMessage("#hQ1itemQ " .. testQ[myNome]["hTimer"], testQ[myNome]["взятый_квест_х"], "guild")
			else
				SendAddonMessage("#hQ1itemQ ", testQ[myNome]["взятый_квест_х"], "guild")
			end
			hX()
			testQ['sign'] = nil
			testQ["okno"] = nil
			testQ["itemQVzyat"] = nil
		end
		if testQ["okno"] == "q33" then
			local odin,dva,tri
			if testQ[myNome]["q33nik"][1] == 1 then
				odin = "выполнено"
			else
				odin = testQ[myNome]["q33nik"][1]
			end
			if testQ[myNome]["q33nik"][2] == 1 then
				dva = "выполнено"
			else
				dva = testQ[myNome]["q33nik"][2]
			end
			if testQ[myNome]["q33nik"][3] == 1 then
				tri = "выполнено"
			else
				tri = testQ[myNome]["q33nik"][3]
			end
			SendChatMessage("Мне срочно нужно " .. testQ[myNome]["q33q"] .. odin .. ", " .. dva .. ", " .. tri, "OFFICER", nil, 1)
			testQ["okno"] = nil
		end
		if testQ["okno"] == "itemQ" then
			SendChatMessage("Скоро я пришлю Вождю многа многа стаков вот этого: " .. testQ[myNome]["itemName"], "OFFICER", nil, 1)
			testQ[myNome]["взятый_квест"] = "itemQ"
			testQ[myNome]["взятый_квест_х"] = "itemQ"
			testQ[myNome]["itemQend"]=nil
			testQ["okno"] = nil
		end
		if testQ["okno"] == "completed" then
			SendChatMessage("ВОЖДЬ, я выполнил ачивку " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_х"])), "OFFICER", nil, 1)
			SendAddonMessage("#hQ1", testQ[myNome]["взятый_квест_х"], "guild")
			testQ["okno"] = nil
			hX()
			testQ['sign'] = nil
		end
		if testQ["okno"] == "99991" then
			SendChatMessage("Ухожу, ухожу...", "guild")
			hX()
			testQ["okno"] = nil
			testQ['sign'] = nil
		end
		if testQ["okno"] == nil then
			hX()
			testQ['sign'] = nil
			testQ["okno"] = nil
		end
		if testQ["okno"] ~= nil and testQ["okno"] ~= "99991" and testQ["okno"] ~= "itemQ" and testQ["okno"] ~= "itemQend" and testQ["okno"] ~= "q33end" then
			SendChatMessage("Мне нужно выполнить ачивку " .. GetAchievementLink(tonumber(testQ["okno"])), "OFFICER", nil, 1)
			testQ[myNome]["взятый_квест_х"] = testQ["okno"]
			testQ["okno"] = nil
			hX()
			testQ['sign'] = nil
		end
		if testQ["okno"] == "q33end" then
			SendChatMessage("ВОЖДЬ, я выполнил квест", "OFFICER", nil, 1)
			SendAddonMessage("#hQ1 ", "", "guild")
			hX()
			testQ['sign'] = nil
			testQ["okno"] = nil
		end
	end)
	if self[2] ~= nil then
		self[2]:SetScript("OnClick",function(self, button)
			if testQ["okno"] == "itemQ" then
				SendChatMessage("Я злонамеренно отказываюсь от квеста.", "OFFICER", nil, 1)
				testQ[myNome]["взятый_квест"] = "9999"
				testQ[myNome]["взятый_квест_х"] = "9999"
				testQ["okno"] = nil
				hX()
				testQ['sign'] = nil
				testQ["itemQVzyat"] = nil
			elseif testQ["okno"] == nil then
				if testQ[myNome]["взятый_квест_х"] ~= nil or testQ[myNome]["взятый_квест_х"] ~= "9999" or testQ[myNome]["взятый_квест_х"] ~= "itemQ" then
					SendChatMessage("Я злонамеренно отказываются от ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_х"])), "OFFICER", nil, 1)
					testQ[myNome]["взятый_квест_х"] = "9999"
					testQ["okno"] = nil
					hX()
					testQ['sign'] = nil
					testQ["okno"] = nil
				else
					hX()
					testQ['sign'] = nil
					testQ["okno"] = nil
				end
			end
			if testQ["okno"] == "q33" then
				SendChatMessage("Я злонамеренно отказываюсь от квеста.", "OFFICER", nil, 1)
				testQ[myNome]["взятый_квест_s"] = nil
				testQ["okno"] = nil
				hX()
				testQ['sign'] = nil
			end
			if testQ["okno"] == "99991" then
				SendChatMessage("Ухожу, но я еще вернусь...", "guild")
				hX()
				testQ["okno"] = nil
				testQ['sign'] = nil
			end
			if testQ["okno"] ~= nil and testQ["okno"] ~= "99991" then
				SendChatMessage("Я злонамеренно отказываюсь от ачивки " .. GetAchievementLink(tonumber(testQ["okno"])), "OFFICER", nil, 1)
				testQ[myNome]["взятый_квест_х"] = "9999"
				testQ["okno"] = nil
				hX()
				testQ['sign'] = nil
			end
		end)
	end
end

function vybor:configure(id)
	local nome
	if testQ['sign'] ~= "1" then
		nome = GuildFrame["selectedName"]
	else
		nome = myNome
	end
	if self[id] == nil then
		self[id] = CreateFrame("Button", nil, UIParent, "")
	end
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetSize(128, 128)
	self[id]:Hide();
	vybor[id]:SetScript("OnEnter",function(self)
		local testFldhs = nil
		local testFldza = nil
		local testFldh = nil
		local testFldts = nil
		for i = 1,100 do
			fBtn[i]:SetFrameStrata("FULLSCREEN")
		end
		for i = 1, 100 do
			if resursy[i] ~= nil then
				resursy[i]:SetFrameStrata("FULLSCREEN")
			end
		end
		for i = 1,100 do
			if mioFld[nome]["объекты"][tostring(i)] == "s" then
				testFlds = 1
			end
			if mioFld[nome]["объекты"][tostring(i)] == "sx" then
				testFlds = 1
			end
			if mioFld[nome]["объекты"][tostring(i)] == "hs" then
				testFldh = 1
			end
			if mioFld[nome]["объекты"][tostring(i)] == "h" then
				testFldh = 1
			end
			if mioFld[nome]["объекты"][tostring(i)] == "za" then
				testFldza = 1
			end
			if mioFld[nome]["объекты"][tostring(i)] == "zx" then
				testFldza = 1
			end
			if mioFld[nome]["объекты"][tostring(i)] == "zs" then
				testFldza = 1
			end
			if mioFld[nome]["объекты"][tostring(i)] == "ts" then
				testFldts = 1
			end
		end
		if testQ["picon"] == "bn" and testFlds ~= 1 then
			if vybor[11] ~= nil then
				vybor[11]:Show()
			end
		end
		if testQ["picon"] == "zt" and testFldh ~= 1 and testFldza == 1 then
			if vybor[1] ~= nil then
				vybor[1]:Show()
				vybor[2]:Show()
				vybor[3]:Show()
				if vybor[7] ~= nil then
					vybor[7]:Show()
				end
			end
		end
		if testQ["picon"] == "zt" and testFldts ~= 1 then
			if vybor[13] ~= nil then
				vybor[13]:Show()
			end
		end
		if testQ["picon"] == "zt" and testFldh == 1 and testFldza == 1 then
			if vybor[2] ~= nil then
				vybor[2]:Show()
				vybor[3]:Show()
				if vybor[7] ~= nil then
					vybor[7]:Show()
				end
			end
		end
		if testQ["picon"] == "zt" and testFldh == 1 and testFldza ~= 1 then
			if vybor[2] ~= nil then
				vybor[2]:Show()
				vybor[3]:Show()
				vybor[4]:Show()
				if vybor[7] ~= nil then
					vybor[7]:Show()
				end
			end
		end
		if testQ["picon"] == "zt" and testFldh ~= 1 and testFldza ~= 1 then
			if vybor[1] ~= nil then
				vybor[1]:Show()
				vybor[2]:Show()
				vybor[3]:Show()
				vybor[4]:Show()
				if vybor[7] ~= nil then
					vybor[7]:Show()
				end
			end
		end
		if testQ["picon"] == "t" or testQ["icon"] == "gob" or testQ["icon"] == "gom" then
			if vybor[8] ~= nil then
				vybor[8]:Show()
			end
		end
		if testQ["picon"] == "z" and testQ["icon"] == "kopkop" then
			if vybor[5] ~= nil then
				vybor[5]:Show()
				vybor[6]:Show()
			end
		end
		if testQ["icon"] == "gz" or testQ["icon"] == "smg" then
			if vybor[10] ~= nil then
				vybor[10]:Show()
				for i = 1, 100 do
					if i ~= 10 and i ~= 12 and vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if testQ["icon"] == "os" or testQ["icon"] == "smg" then
			if vybor[9] ~= nil then
				vybor[9]:Show()
				for i = 1, 100 do
					if i ~= 9 and i~= 12 and vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if testQ["icon"] == "smg" and testQ["picon"] == "m" then
			if vybor[12] ~= nil then
				vybor[12]:Show()
				for i = 1, 100 do
					if i ~= 12 and i ~= 9 and i ~= 10 and vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if testQ["icon"] == "smg" and testQ["picon"] == "h" then
			if vybor[12] ~= nil then
				vybor[12]:Show()
				for i = 1, 100 do
					if i ~= 12 then
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 4 and tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["kamen"]) >= 20 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить бетонный завод")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 4 and tonumber(testQ["brevna"]) < 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 10 бревен")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 4 and tonumber(testQ["kamen"]) < 20 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 20 камня")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Утрамбовать")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["stog"]) >= 10 and tonumber(testQ["kamen"]) >= 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить хижину")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["brevna"]) < 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 10 бревен")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["kamen"]) < 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 5 камня")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["stog"]) < 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 10 травы")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 6 and tonumber(testQ["brevna"]) >= 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Копать")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 6 and tonumber(testQ["brevna"]) < 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 10 бревен")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 2 and tonumber(testQ["brevna"]) < 8 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 8 бревен")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 2 and tonumber(testQ["brevna"]) >= 8 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить склад бревен")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 3 and tonumber(testQ["brevna"]) < 15 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 15 бревен")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 3 and tonumber(testQ["brevna"]) >= 15 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить склад камня")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 and tonumber(testQ["beton"]) >= 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Залить бетонный фундамент")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 and tonumber(testQ["beton"]) < 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 5 кубов бетона")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 and tonumber(testQ["beton"]) < 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 10 кубов бетона")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 and tonumber(testQ["kamen"]) < 50 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 50 камня")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 and tonumber(testQ["brevna"]) < 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Нужно 10 бревен")
			GameTooltip:Show()
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 and tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["beton"]) >= 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить сельсовет")
			GameTooltip:Show()
		end
		if id == 12 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Зарплата")
			GameTooltip:Show()
		end
		if id == 13 and tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 5 and tonumber(testQ["stog"]) >= 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Товарный склад")
			GameTooltip:AddLine("Требуется для выбора награды на лвлапе")
			GameTooltip:AddLine("5 камня, 5 бревен, 5 травы")
			GameTooltip:Show()
		end
		if id == 13 and tonumber(testQ["brevna"]) < 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Товарный склад")
			GameTooltip:AddLine("Требуется для выбора награды на лвлапе")
			GameTooltip:AddLine("5 камня, 5 бревен, 5 травы")
			GameTooltip:AddLine("|cffff2b2bНужно больше бревен")
			GameTooltip:Show()
		end
		if id == 13 and tonumber(testQ["stog"]) < 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Товарный склад")
			GameTooltip:AddLine("Требуется для выбора награды на лвлапе")
			GameTooltip:AddLine("5 камня, 5 бревен, 5 травы")
			GameTooltip:AddLine("|cffff2b2bНужно больше травы")
			GameTooltip:Show()
		end
		if id == 13 and tonumber(testQ["kamen"]) < 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Товарный склад")
			GameTooltip:AddLine("Требуется для выбора награды на лвлапе")
			GameTooltip:AddLine("5 камня, 5 бревен, 5 травы")
			GameTooltip:AddLine("|cffff2b2bНужно больше камня")
			GameTooltip:Show()
		end
	end)
	vybor[id]:SetScript("OnLeave",function(self)
		for i=1,100 do
			if vybor[i] ~= nil then
				vybor[i]:Hide()
			end
		end
		testQ["temp"] = nil
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 then
			vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
			vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 1 then
			vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\toptop.tga")
			vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\toptop.tga")
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 2 then
			vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kopkop.tga")
			vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kopkop.tga")
		end
		GameTooltip:Show()
	end)
	vybor[id]:SetScript("OnClick",function(self)
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 13 then
				if tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 5 and tonumber(testQ["stog"]) >= 5 then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("tC " .. testQ["idp"], nome, "guild")
						testQ["brevna"] = tonumber(testQ["brevna"]) - 5
						testQ["kamen"] = tonumber(testQ["kamen"]) - 5
						testQ["stog"] = tonumber(testQ["stog"]) - 5
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 13 then
				if tonumber(testQ["brevna"]) >= 25 and tonumber(testQ["kamen"]) >= 25 and tonumber(testQ["stog"]) >= 25 then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("tC " .. testQ["idp"], nome, "guild")
						testQ["brevna"] = tonumber(testQ["brevna"]) - 25
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						testQ["stog"] = tonumber(testQ["stog"]) - 25
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		end
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 4 then
				if tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["kamen"]) >= 20 then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zak.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zak.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("za " .. testQ["idp"], nome, "guild")
						testQ["brevna"] = tonumber(testQ["brevna"]) - 10
						testQ["kamen"] = tonumber(testQ["kamen"]) - 20
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 2 then
				if tonumber(testQ["brevna"]) >= 50 and tonumber(testQ["kamen"]) >= 100 then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zak.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zak.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("za " .. testQ["idp"], nome, "guild")
						testQ["brevna"] = tonumber(testQ["brevna"]) - 50
						testQ["kamen"] = tonumber(testQ["kamen"]) - 100
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 5 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\topto.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\topto.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\uz.ogg")
				SendAddonMessage("TopTop " .. testQ["idp"], nome, "guild")
				testQ["temp"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 6 then
			if tonumber(testQ["brevna"]) >= 10 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kopko.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kopko.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
					SendAddonMessage("KopKop " .. testQ["idp"], nome, "guild")
					testQ["temp"] = nil
					testQ["brevna"] = tonumber(testQ["brevna"]) - 10
					dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 then
				if tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["stog"]) >= 10 and tonumber(testQ["kamen"]) >= 5 then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\hsS.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\hsS.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("hS " .. testQ["idp"] .. " " .. 99, nome, "guild")
						testQ["brevna"] = tonumber(testQ["brevna"]) - 10
						testQ["stog"] = tonumber(testQ["stog"]) - 10
						testQ["kamen"] = tonumber(testQ["kamen"]) - 5
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 then
				if tonumber(testQ["brevna"]) >= 50 and tonumber(testQ["stog"]) >= 50 and tonumber(testQ["kamen"]) >= 25 then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\hsS.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\hsS.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("hS " .. testQ["idp"] .. " " .. 99, nome, "guild")
						testQ["brevna"] = tonumber(testQ["brevna"]) - 50
						testQ["stog"] = tonumber(testQ["stog"]) - 50
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil and vybor[i]:IsVisible() then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		end
		if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "t" and id == 8 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hr.ogg")
				SendAddonMessage("bB " .. testQ["idp"] .. " " .. 999, nome, "guild")
				if nome ~= myNome then
					testQ[myNome]["петы"]["bb"] = nome
				else
					testQ[myNome]["петы"]["bb"] = 0
				end
				testQ["temp"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if (mioFld[nome]["объекты"][tostring(testQ["idp"])] == "m" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "mx" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "hs" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "ms" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "uz" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zs" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zx" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "skc" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "sx") and id == 8 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. testQ[myNome]["петы"]["gg"] .. ".tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. testQ[myNome]["петы"]["gg"] .. ".tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				SendAddonMessage("goB " .. testQ["idp"] .. " " .. testQ[myNome]["петы"]["gg"], nome, "guild")
				if nome ~= myNome then
					testQ[myNome]["петы"]["gg"] = nome
				else
					testQ[myNome]["петы"]["gg"] = 0
				end
				testQ["temp"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if id == 9 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\os.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\os.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				SendAddonMessage("oS " .. testQ["idp"] .. " " .. mioFld[nome]["петы"][tostring(testQ["idp"])], nome, "guild")
				testQ["temp"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if id == 12 and tonumber(testQ["smg"]) >= 1 and testQ["picon"] == "m" then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				testQ["zarplata"] = 10000
				testQ["smg"] = tonumber(testQ["smg"])-1
				dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
				testQ["temp"] = nil
				testQ["picon"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if id == 12 and tonumber(testQ["smg"]) >= 1 and testQ["picon"] == "h" then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				if testQ[myNome]["hTimer"] ~= nil then
					local x = math.random(1,5)
					if x == 1 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 100
						SendChatMessage("...незаметно пролетают аж 100 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 2 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 200
						SendChatMessage("...незаметно пролетают аж 200 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 3 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 500
						SendChatMessage("...незаметно пролетают аж 500 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 4 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 1000
						SendChatMessage("...незаметно пролетают аж 1000 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 5 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 3800
						SendChatMessage("...незаметно пролетают аж 3800 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					end
				end
			end
		end
		if id == 10 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gz.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gz.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				SendAddonMessage("gZ " .. testQ["idp"] .. " " .. mioFld[nome]["петы"][tostring(testQ["idp"])] .. " " .. mioFld[nome]["хозяин"][tostring(testQ["idp"])], nome, "guild")
				testQ["temp"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 2 then
				if tonumber(testQ["brevna"]) >= 8 then
					if testQ["temp"] == nil then
						vybor[2]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sbS.tga")
						vybor[2]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sbS.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("sbS " .. testQ["idp"] .. " " .. 99, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"])-8
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 2 then
				if tonumber(testQ["brevna"]) >= 30 then
					if testQ["temp"] == nil then
						vybor[2]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sbS.tga")
						vybor[2]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sbS.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("sbS " .. testQ["idp"] .. " " .. 99, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"])-30
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil and vybor[i]:IsVisible() then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		end
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 3 then
				if tonumber(testQ["brevna"]) >= 15 then
					if testQ["temp"] == nil then
						vybor[3]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
						vybor[3]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("skS " .. testQ["idp"] .. " " .. 99, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"])-15
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 3 then
				if tonumber(testQ["brevna"]) >= 30 then
					if testQ["temp"] == nil then
						vybor[3]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
						vybor[3]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("skS " .. testQ["idp"] .. " " .. 99, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"])-50
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil and vybor[i]:IsVisible() then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		end
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 then
				if tonumber(testQ["beton"]) >= 5 then
					if testQ["temp"] == nil then
						vybor[7]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bn.tga")
						vybor[7]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bn.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bt.ogg")
						SendAddonMessage("bN " .. testQ["idp"] .. " " .. -999, nome, "guild")
						testQ["temp"] = nil
						testQ["beton"] = tonumber(testQ["beton"]) - 5
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 then
				if tonumber(testQ["beton"]) >= 20 then
					if testQ["temp"] == nil then
						vybor[7]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bn.tga")
						vybor[7]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bn.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bt.ogg")
						SendAddonMessage("bN " .. testQ["idp"] .. " " .. -999, nome, "guild")
						testQ["temp"] = nil
						testQ["beton"] = tonumber(testQ["brevna"]) - 20
						dmgText(testQ["beton"],resursy[4],104,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil and vybor[i]:IsVisible() then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		end
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 then
				if tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["beton"]) >= 10 then
					if testQ["temp"] == nil then
						vybor[11]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
						vybor[11]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						SendAddonMessage("sX " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 10
						testQ["kamen"] = tonumber(testQ["kamen"]) - 50
						testQ["beton"] = tonumber(testQ["beton"]) - 10
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 then
				if tonumber(testQ["brevna"]) >= 50 and tonumber(testQ["kamen"]) >= 150 and tonumber(testQ["beton"]) >= 30 then
					if testQ["temp"] == nil then
						vybor[1]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
						vybor[1]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						SendAddonMessage("sX " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 50
						testQ["kamen"] = tonumber(testQ["kamen"]) - 150
						testQ["beton"] = tonumber(testQ["beton"]) - 30
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		end
	end)
end
if myNome == "Хефе" or myNome == "Витинари" then
	local gTest1,gTest2
	gtg = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	gtg:SetPoint("BOTTOMLEFT",350, 370)
	gtg:SetSize(32, 32)
	gtg:RegisterForClicks("RightButtonDown", "LeftButtonDown")
	gtg:SetScript("OnClick",function(self,button)
		if arg1 == "LeftButton" then
			for i=1, 50 do
				if gTest[i] ~= nil then
					gTest1 = gTest[i]
					gTest2 = i
				end
			end
			if gTest1 ~= nil then
				if ChatFrame1:IsVisible() then
					ChatFrame1EditBox:Show()
					ChatFrame1EditBox:SetFocus()
					ChatFrame1EditBox:SetText("/ginvite " .. gTest1)
					gTest[gTest2]=nil
					gTest1 = nil
				end
				testQ["gTimer"] = 6
				gtg:Disable()
			end
		elseif arg1 == "RightButton" then
			gtest()
		end
	end)
end
function fBtn:configure(id,posex,posey,sizex,sizey,zzid,message)
	self[id] = CreateFrame("Button", nil, UIParent, "");
	self[id]:SetFrameStrata("FULLSCREEN")
	self[id]:SetPoint("CENTER",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\z.tga")
	self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\z.tga")
	self[id]:Hide();
	self[id]:RegisterForClicks("RightButtonDown", "LeftButtonDown","LeftButtonUp")
	self[id]:SetScript("OnClick",function(self, button)
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if nome == myNome then
			if tonumber(testQ["kamen"]) >= 1 then
				if mioFld[nome]["объекты"][tostring(id)] == "za" then
					if arg1 == "LeftButton" then
						if arg2 == true then
							testQ["zavod"] = 1
							testQ["kamen"] = tonumber(testQ["kamen"])-1
							dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
							fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\za.tga")
							fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\za.tga")
						end
						if arg2 == false then
							testQ["zavod"] = nil
						end
					end
				end
			end
		else
			if tonumber(testQ["kamen"]) >= 5 then
				if mioFld[nome]["объекты"][tostring(id)] == "za" then
					if arg1 == "LeftButton" then
						if arg2 == true then
							testQ["zavod"] = 1
							testQ["kamen"] = tonumber(testQ["kamen"])-5
							dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						end
						if arg2 == false then
							testQ["zavod"] = nil
						end
					end
				end
			end
		end
		if arg1 == "LeftButton" then
			if arg2 == false then
				if mioFld[nome]["объекты"][tostring(id)] == "ts" then
					if testQ["vyborNagrady"] == 1 then
						SendAddonMessage("vyborNagrady", testQ["mioFldLvl"], "guild")
					end
				end
				if mioFld[nome]["объекты"][tostring(id)] == "s" then
					if nome == myNome then
						if testQ[myNome]["hTimer"] ~= nil then
							if testQ[myNome]["взятый_квест_s"] ~= nil then
								if testQ[myNome]["q33end"] ~= 1 then
									testQ["okno"] = "q33"
									quesT("show")
									okNo:configure(1,"show")
									local odin,dva,tri
									if testQ[myNome]["q33nik"][1] == 1 then
										odin = "выполнено"
									else
										odin = testQ[myNome]["q33nik"][1]
									end
									if testQ[myNome]["q33nik"][2] == 1 then
										dva = "выполнено"
									else
										dva = testQ[myNome]["q33nik"][2]
									end
									if testQ[myNome]["q33nik"][3] == 1 then
										tri = "выполнено"
									else
										tri = testQ[myNome]["q33nik"][3]
									end
									rtnTextF("Мне срочно нужно " .. testQ[myNome]["q33q"] .. odin .. ", " .. dva .. ", " .. tri,1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								else
									testQ["okno"] = "q33end"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Задание завершено",1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							end
						else
							if testQ[myNome]["взятый_квест_s"] == nil then
								testQ[myNome]["q33q"],testQ[myNome]["q33nik"][1],testQ[myNome]["q33nik"][2],testQ[myNome]["q33nik"][3],testQ[myNome]["q33fnd"],testQ[myNome]["q33ans"] = qLvl33c(myNome)
								--SendChatMessage("Мне срочно нужно " .. testQ[myNome]["q33q"] .. testQ[myNome]["q33nik"][1] .. ", " .. testQ[myNome]["q33nik"][2] .. ", " .. testQ[myNome]["q33nik"][3], "OFFICER", nil, 1)
								testQ["okno"] = "q33"
								testQ[myNome]["взятый_квест_s"] = "q33"
								htimer(myNome)
								rtnTextF("Мне срочно нужно " .. testQ[myNome]["q33q"] .. testQ[myNome]["q33nik"][1] .. ", " .. testQ[myNome]["q33nik"][2] .. ", " .. testQ[myNome]["q33nik"][3],1,"show")
								quesT("show")
								okNo:configure(1,"show")
								for i=1,100 do
									fBtn[i]:Hide()
								end
								for i = 1, 100 do
									if resursy[i] ~= nil then
										resursy[i]:Hide()
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
							end
						end
					end
				end
				if mioFld[nome]["объекты"][tostring(id)] == "h" then
					if nome == myNome then
						if testQ[myNome]["hTimer"] ~= nil then
							if testQ[myNome]["взятый_квест_х"] == "itemQ" then
								if testQ[myNome]["itemQend"] ~= 1 then
									testQ["okno"] = "itemQ"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно прислать Вождю " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"],1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								else
									testQ["okno"] = "itemQend"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Я отправил Вождю, все что нужно",1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							end
							if testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999" then
								local qq=math.random(1,#pQuest["items"])
								testQ[myNome]["itemName"]=tostring(pQuest["items"][qq]["itemName"])
								testQ[myNome]["itemNum"]=tonumber(pQuest["items"][qq]["itemNum"])
								testQ[myNome]["itemEnStuck"]=tonumber(pQuest["items"][qq]["itemEnStuck"])
								testQ["okno"] = "itemQ"
								testQ["itemQVzyat"] = 1
								quesT("show")
								okNo:configure(1,"show")
								rtnTextF("Нужно прислать Вождю " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"],1,"show")
								for i=1,100 do
									fBtn[i]:Hide()
								end
								for i = 1, 100 do
									if resursy[i] ~= nil then
										resursy[i]:Hide()
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
							end
						end
						local lvlTemp = tonumber(testQ["mioFldLvl"])
						local testDate = tonumber(string.sub(date(),4,5))
						local lvlTest = 1

						if testQ[myNome]["взятый_квест_х"] ~= "itemQ" then
							if testQ == nil then
								testQ = {}
							end
							if testQ[myNome] == nil then
								testQ[myNome] = {}
							end
							if testQ[myNome]["выполненные_квесты_х"] == nil then
								testQ[myNome]["выполненные_квесты_х"] = {}
							end
							if testQ[myNome]["взятый_квест_х"] ~= nil and testQ[myNome]["взятый_квест_х"] ~= "9999" then
								local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(tonumber(testQ[myNome]["взятый_квест_х"]))
								if completed == false then
									testQ["okno"] = testQ[myNome]["взятый_квест_х"]
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно выполнить ачивку " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_х"])),1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								else
									testQ["okno"] = "completed"
									quesT("show")
									rtnTextF("Ачивка " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_х"])) .. " выполнена",1,"show")
									okNo:configure(1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							end
							if testQ[myNome]["hTimer"] == nil then
								if lvlTest ~= nil then
									if testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999" then
										local iii = 0
										while true do
											local x = math.random(1,tonumber(#pQuest["х"]))
											if testQ[myNome]["выполненные_квесты_х"][tostring(pQuest["х"][x])] == nil or testQ[myNome]["выполненные_квесты_х"][tostring(pQuest["х"][x])] ~= "9999" then
												if iii == tonumber(#pQuest["х"]) then
													SendChatMessage("В хижине больше нет заданий...", "OFFICER", nil, 1)
													break
												end
												local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(tonumber(pQuest["х"][x]))
												if completed == false then
													testQ["okno"] = pQuest["х"][x]
													break
												end
												iii = iii + 1
											end
										end
										if testQ["okno"] ~= nil then
											quesT("show")
											okNo:configure(1,"show")
											rtnTextF("Нужно выполнить ачивку " .. GetAchievementLink(tonumber(testQ["okno"])),1,"show")
											for i=1,100 do
												fBtn[i]:Hide()
											end
											for i = 1, 100 do
												if resursy[i] ~= nil then
													resursy[i]:Hide()
												end
											end
											btn[989]:Hide()
											btn[989]:ClearAllPoints()
											btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
										end
									end
								end
								htimer(myNome)
							end
						else
							if lvlTest ~= nil then
								if testQ[myNome]["itemQend"] ~= 1 then
									testQ["okno"] = "itemQ"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно прислать Вождю " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"],1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								else
									testQ["okno"] = "itemQend"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Я отправил Вождю, все что нужно",1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if resursy[i] ~= nil then
											resursy[i]:Hide()
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							end
						end
					else
						quesT("show")
						okNo:configure(1,"show")
						rtnTextF("Ты кто такой? Я тебя не знаю.",1,"show")
						testQ["okno"] = "99991"
					end
				end
				if mioFld[nome]["объекты"][tostring(id)] == "hs" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "tc" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "sx" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ms" or mioFld[nome]["объекты"][tostring(id)] == "uz" then
					treeX(nome,myNome,id)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. ".ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "t" or mioFld[nome]["объекты"][tostring(id)] == "f" then
					--resObj(id,myNome,nome)
					--PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\tr.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "mx" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "zx" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "zs" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "zx" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "skc" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "sb" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sb.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sb.tga")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "m" then
					local x = math.random(1,500)
					if x ~= 500 then
						dmgText(x,fBtn[id],999,13,"bbbbbb")
						dmG[999]:Show()
					else
						dmgText(x,fBtn[id],999,13,"c10020")
						dmG[999]:Show()
					end
					gKam(myNome,x)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m.tga")
				end
			end
		end
		if arg1 == "RightButton" then
			if dmG[999] ~= nil then
				dmG[999]:Hide()
			end
			if mioFld[nome]["объекты"][tostring(id)] == "za" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zx.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("zX " .. id, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "s" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("sX " .. id .. " " .. 29998, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) < 999 then
				local x = math.random(1,1800)
				SendAddonMessage("bNx " .. id .. " " .. x, nome, "guild")
				local x = math.random(1,3)
				if x == 1 then
					SendChatMessage("Хмм... А что будет если оставить тут след от моей руки?", "OFFICER", nil, 1)
					testQ["brevna"] = tonumber(testQ["brevna"]) - 1
				elseif x == 2 then
					SendChatMessage("Хмм... А что будет если оставить тут след от моей ноги?", "OFFICER", nil, 1)
					testQ["beton"] = tonumber(testQ["beton"]) - 1
				elseif x == 3 then
					SendChatMessage("Хмм... А что будет если оставить тут след от моей задницы?", "OFFICER", nil, 1)
					testQ["kamen"] = tonumber(testQ["kamen"]) - 1
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "ms" or mioFld[nome]["объекты"][tostring(id)] == "uz" then
				resObj(id,myNome,nome)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. ".ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "t" or mioFld[nome]["объекты"][tostring(id)] == "f" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. ".ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "m" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. "x.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. "x.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("mX " .. id, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "h" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("hS " .. id .. " " .. 9999, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "sk" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("skc " .. id .. " " .. 999, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "ts" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("tsX " .. id .. " " .. 4998, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "hs" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "tc" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "mx" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. ".ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "zx" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "zs" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "sb" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "skc" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "sx" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
		end
	end)
	self[id]:SetScript("OnEnter",function(self)
		local nome
		local n = nil
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		testQ["hs"] = 0
		testQ["h"] = 0
		testQ["za"] = 0
		testQ["s"] = 0
		testQ["ts"] = 0
		for i=1,100 do
			if mioFld ~= nil then
				if mioFld[nome] ~= nil then
					if mioFld[nome]["петы"] == nil then
						mioFld[nome]["петы"] = {}
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "s" or mioFld[nome]["объекты"][tostring(i)] == "sx" then
						testQ["s"] = testQ["s"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "h" then
						testQ["h"] = testQ["h"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "hs" then
						testQ["hs"] = testQ["hs"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "zx" then
						testQ["za"] = testQ["za"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "zs" then
						testQ["za"] = testQ["za"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "za" then
						testQ["za"] = testQ["za"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "ts" then
						testQ["ts"] = testQ["ts"]+1
					end
					if  mioFld[nome]["петы"][tostring(i)] == "gob" and id == i then
						testQ["gob"] = 1
					end
					if  mioFld[nome]["петы"][tostring(i)] == "gom" and id == i then
						testQ["gom"] = 1
					end

				end
			end
		end
		if nome == myNome then
			if testQ[myNome]["hTimer"] ~= nil then
				if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
					if mioFld[nome]["объекты"][tostring(id)] == "h" then
						vybor:configure(12)
						vybor[12]:SetPoint("CENTER", fBtn[id],"CENTER",96, 0)
						vybor[12]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
						vybor[12]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
						vybor[12]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "smg"
							testQ["picon"] = mioFld[nome]["объекты"][tostring(id)]
						end
					end
				end
			end
		end


		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if testQ["hs"] < 1 and testQ["h"] < 1 then
				if mioFld[nome]["объекты"][tostring(id)] == "zt" then
					if vybor[1] == nil or not vybor[1]:IsVisible() then
						vybor:configure(1)
						vybor[1]:SetPoint("CENTER", fBtn[id],"CENTER",-1*(1*64), 96)
						if n == nil then
							n = "hs"
						end
						vybor[1]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
						vybor[1]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
						vybor[1]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "hs"
							testQ["picon"] = "zt"
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "zt" then
				if vybor[2] == nil or not vybor[2]:IsVisible() then
					vybor:configure(2)
					if n == nil then
						vybor[2]:SetPoint("CENTER", fBtn[id],"CENTER",-64, 96)
					end
					if n ~= nil then
						if string.find(n,"hs") then
							vybor[2]:SetPoint("CENTER", fBtn[id],"CENTER",64, 96)
						end
					end
					if n == nil then
						n = "sb"
					end
					if n ~= nil then
						n = n .. "sb"
					end
					vybor[2]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sb.tga")
					vybor[2]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sb.tga")
					vybor[2]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "sb"
						testQ["picon"] = "zt"
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "zt" then
				if vybor[13] == nil or not vybor[13]:IsVisible() then
					vybor:configure(13)
					if tonumber(testQ["ts"]) == 0 then
						vybor[13]:SetPoint("CENTER", fBtn[id],"CENTER",0, -96)
					end
					vybor[13]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ts.tga")
					vybor[13]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ts.tga")
					vybor[13]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "ts"
						testQ["picon"] = "zt"
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "zt" then
				if vybor[3] == nil or not vybor[3]:IsVisible() then
					vybor:configure(3)
					if n == nil then
						vybor[3]:SetPoint("CENTER", fBtn[id],"CENTER",64, 96)
						n = "sk"
					end
					if n ~= nil then
						if string.find(n,"hs") then
							vybor[3]:SetPoint("CENTER", fBtn[id],"CENTER",1*192, 96)
							n = n .. "sk"
						end
						if not string.find(n,"hs") then
							vybor[3]:SetPoint("CENTER", fBtn[id],"CENTER",64, 96)
							n = n .. "sk"
						end
					end
					vybor[3]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sk.tga")
					vybor[3]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sk.tga")
					vybor[3]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "sk"
						testQ["picon"] = "zt"
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if testQ["za"] < 1 then
				if mioFld[nome]["объекты"][tostring(id)] == "zt" then
					if vybor[4] == nil or not vybor[4]:IsVisible() then
						vybor:configure(4)
						if tonumber(testQ["h"]) == 0 and tonumber(testQ["hs"]) == 0 then
							vybor[4]:SetPoint("CENTER", fBtn[id],"CENTER",1*320, 96)
						end
						if tonumber(testQ["h"]) ~= 0 or tonumber(testQ["hs"]) ~= 0 then
							vybor[4]:SetPoint("CENTER", fBtn[id],"CENTER",1*192, 96)
						end
						vybor[4]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\za.tga")
						vybor[4]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\za.tga")
						vybor[4]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "za"
							testQ["picon"] = "zt"
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "z" then
				if vybor[5] == nil or not vybor[5]:IsVisible() then
					vybor:configure(5)
					vybor:configure(6)
					vybor[5]:SetPoint("CENTER", fBtn[id],"CENTER",-1*(1*64), 96)
					vybor[6]:SetPoint("CENTER", fBtn[id],"CENTER",1*64, 96)
					vybor[5]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\toptop.tga")
					vybor[5]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\toptop.tga")
					vybor[6]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kopkop.tga")
					vybor[6]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kopkop.tga")
					vybor[5]:Show()
					vybor[6]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "kopkop"
						testQ["picon"] = "z"
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "zt" then
				if vybor[7] == nil or not vybor[7]:IsVisible() then
					vybor:configure(7)
					vybor[7]:SetPoint("CENTER", fBtn[id],"CENTER",-1*(1*192), 96)
					vybor[7]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bn.tga")
					vybor[7]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bn.tga")
					vybor[7]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "bn"
						testQ["picon"] = "zt"
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "t" then
				if vybor[8] == nil or not vybor[8]:IsVisible() then
					if testQ[myNome]["петы"] ~= nil then
						if mioFld[nome]["петы"] == nil then
							mioFld[nome]["петы"] = {}
						end
						if mioFld[nome]["петы"][tostring(id)] == nil then
							if testQ[myNome]["петы"]["bb"] == 1 then
								vybor:configure(8)
								vybor[8]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
								vybor[8]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
								vybor[8]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
								vybor[8]:Show()
								if testQ ~= nil then
									testQ["idp"] = id
									testQ["icon"] = "bb"
									testQ["picon"] = "t"
								end
							end
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "m" or mioFld[nome]["объекты"][tostring(id)] == "mx" or mioFld[nome]["объекты"][tostring(id)] == "hs" or mioFld[nome]["объекты"][tostring(id)] == "ms" or mioFld[nome]["объекты"][tostring(id)] == "uz" or mioFld[nome]["объекты"][tostring(id)] == "zs" or mioFld[nome]["объекты"][tostring(id)] == "zx" or mioFld[nome]["объекты"][tostring(id)] == "skc" or mioFld[nome]["объекты"][tostring(id)] == "sx" then
				if vybor[8] == nil or not vybor[8]:IsVisible() then
					if testQ[myNome]["петы"] ~= nil then
						if mioFld[nome]["петы"] == nil then
							mioFld[nome]["петы"] = {}
						end
						if mioFld[nome]["петы"][tostring(id)] == nil then
							if testQ[myNome]["петы"]["gg"] == "gob" then
								vybor:configure(8)
								vybor[8]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
								vybor[8]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gob.tga")
								vybor[8]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gob.tga")
								vybor[8]:Show()
								if testQ ~= nil then
									testQ["idp"] = id
									testQ["icon"] = "gob"
									testQ["picon"] = mioFld[nome]["объекты"][tostring(id)]
								end
							end
							if testQ[myNome]["петы"]["gg"] == "gom" then
								vybor:configure(8)
								vybor[8]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
								vybor[8]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gom.tga")
								vybor[8]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gom.tga")
								vybor[8]:Show()
								if testQ ~= nil then
									testQ["idp"] = id
									testQ["icon"] = "gom"
									testQ["picon"] = mioFld[nome]["объекты"][tostring(id)]
								end
							end
						end
					end
				end
			end
		end

		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 then
			if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 then
				if vybor[11] == nil or not vybor[11]:IsVisible() then
					if tonumber(testQ["s"]) == 0 then
						vybor:configure(11)
						vybor[11]:SetPoint("CENTER", fBtn[id],"CENTER",-1*(1*64), 96)
						vybor[11]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
						vybor[11]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
						vybor[11]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "sx"
							testQ["picon"] = "bn"
						end
					end
				end
			end
		end
		if mioFld[nome]["петы"] ~= nil then
			if mioFld[nome]["хозяин"] ~= nil then
				if mioFld[nome]["петы"][tostring(id)] ~= nil then
					if mioFld[nome]["хозяин"][tostring(id)] == myNome then
						vybor:configure(9)
						vybor[9]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
						vybor[9]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\os.tga")
						vybor[9]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\os.tga")
						vybor[9]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "os"
							testQ["picon"] = mioFld[nome]["объекты"][tostring(id)]
						end
					else
						if myNome == nome or myNome == mioFld[nome]["хозяин"][tostring(id)] then
							vybor:configure(10)
							vybor[10]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
							vybor[10]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gz.tga")
							vybor[10]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gz.tga")
							vybor[10]:Show()
							if testQ ~= nil then
								testQ["idp"] = id
								testQ["icon"] = "gz"
								testQ["picon"] = mioFld[nome]["объекты"][tostring(id)]
							end
						end
					end
					if nome == myNome then
						vybor:configure(12)
						vybor[12]:SetPoint("CENTER", fBtn[id],"CENTER",96, 0)
						vybor[12]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
						vybor[12]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
						vybor[12]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "smg"
							testQ["picon"] = mioFld[nome]["объекты"][tostring(id)]
						end
					end
				end
			end
		end

		for i = 1,100 do
			if fBtn[i] ~= nil then
				fBtn[i]:SetFrameStrata("FULLSCREEN")
			end
		end
		for i = 1,100 do
			if resursy[i] ~= nil then
				resursy[i]:SetFrameStrata("FULLSCREEN")
			end
		end
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		btn[989]:Show()
		if testQ == nil then
			testQ = {}
		end
		if testQ[myNome] == nil then
			testQ[myNome] = {}
		end
		if testQ[myNome]["характеристики"] == nil then
			testQ[myNome]["характеристики"] = {}
		end
		local x = math.random(1,1000)
		if x == 1 then
			if testQ[myNome]["характеристики"]["внимательность"] == nil then
				testQ[myNome]["характеристики"]["внимательность"] = 1
			else
				testQ[myNome]["характеристики"]["внимательность"] = testQ[myNome]["характеристики"]["внимательность"]+1
			end
		end
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if mioFld ~= nil then
			if mioFld[nome] ~= nil then
				if mioFld[nome]["объекты"][tostring(id)] == "za" and tonumber(testQ["kamen"]) < 1 then
					GameTooltip:AddLine("Нужно больше камня")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "za" and tonumber(testQ["kamen"]) >= 1 then
					GameTooltip:AddLine("Потребление: 1-5 камня за попытку")
				end
				if mioFld[nome]["подсказки"] ~= nil then
					if mioFld[nome]["подсказки"][tostring(id)] ~= nil then
						GameTooltip:AddLine(mioFld[nome]["подсказки"][tostring(id)])
					end
				end
				if mioFld[nome]["влияние"] ~= nil then
					if mioFld[nome]["влияние"][tostring(id)] ~= nil then
						local skryt = mysplit(mioFld[nome]["влияние"][tostring(id)])
						if skryt[2] ~= nil then
							if tonumber(skryt[2]) <= testQ[myNome]["характеристики"]["внимательность"] then
								GameTooltip:AddLine("Следы: " .. mioFld[nome]["влияние"][tostring(id)])
							end
						else
							GameTooltip:AddLine("Следы: " .. mioFld[nome]["влияние"][tostring(id)])
						end
					end
				end
				if mioFld[nome]["объекты"][tostring(id)] == "m" then
					GameTooltip:AddLine("клик ЛКМ: добывать камень")
					GameTooltip:AddLine("клик ПКМ: сломать рудник")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ts" then
					GameTooltip:AddLine("|cffff2b2bЛКМ: Отказаться от стандартной награды за лвлап и получить рандомные ресурсы")
					GameTooltip:AddLine("Шанс получить пета")
				end
				if testQ[myNome]["hTimer"] ~= nil and mioFld[nome]["объекты"][tostring(id)] == "s" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("Вы что, не видите?! У нас обед!!!")
				end
			end
		end
		GameTooltip:Show()
		if mioFld[nome]["петы"] ~= nil then
			if mioFld[nome]["петы"][tostring(id)] ~= nil then
				local pet
				pet = mysplit(mioFld[nome]["петы"][tostring(id)])
				fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. pet[1] .. ".tga")
				if mioFld[nome]["петы"][tostring(id)] ~= "bb" then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["петы"][tostring(id)] .. ".ogg")
				else
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hr.ogg")
				end
			end
		end
	end)
	self[id]:SetScript("OnLeave",function(self)
		testQ["gob"] = nil
		testQ["gom"] = nil
		if dmG[999] ~= nil then
			dmG[999]:Hide()
		end
		testQ["zavod"] = nil
		testQ["temp"] = nil
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		for i = 1,100 do
			if vybor[i]~= nil and vybor[i]:IsVisible() then
				vybor[i]:Hide()
			end
		end
		GameTooltip:Hide();
		local str = fBtn[1]:GetFrameStrata()
		for i = 1,100 do
			fBtn[i]:SetFrameStrata("BACKGROUND")
		end
		for i = 1, 100 do
			if resursy[i] ~= nil then
				if resursy[i]:IsVisible() then
					resursy[i]:SetFrameStrata("BACKGROUND")
				end
			end
		end
		fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. ".tga")
	end)
end

fBtn:configure(1,-320,320,64,64,"","");
fBtn:configure(2,-256,320,64,64,"","");
fBtn:configure(3,-192,320,64,64,"","");
fBtn:configure(4,-128,320,64,64,"","");
fBtn:configure(5,-64,320,64,64,"","");
fBtn:configure(6,0,320,64,64,"","");
fBtn:configure(7,64,320,64,64,"","");
fBtn:configure(8,128,320,64,64,"","");
fBtn:configure(9,192,320,64,64,"","");
fBtn:configure(10,256,320,64,64,"","");
fBtn:configure(11,-320,256,64,64,"","");
fBtn:configure(12,-256,256,64,64,"","");
fBtn:configure(13,-192,256,64,64,"","");
fBtn:configure(14,-128,256,64,64,"","");
fBtn:configure(15,-64,256,64,64,"","");
fBtn:configure(16,-0,256,64,64,"","");
fBtn:configure(17,64,256,64,64,"","");
fBtn:configure(18,128,256,64,64,"","");
fBtn:configure(19,192,256,64,64,"","");
fBtn:configure(20,256,256,64,64,"","");
fBtn:configure(21,-320,192,64,64,"","");
fBtn:configure(22,-256,192,64,64,"","");
fBtn:configure(23,-192,192,64,64,"","");
fBtn:configure(24,-128,192,64,64,"","");
fBtn:configure(25,-64,192,64,64,"","");
fBtn:configure(26,0,192,64,64,"","");
fBtn:configure(27,64,192,64,64,"","");
fBtn:configure(28,128,192,64,64,"","");
fBtn:configure(29,192,192,64,64,"","");
fBtn:configure(30,256,192,64,64,"","");
fBtn:configure(31,-320,128,64,64,"","");
fBtn:configure(32,-256,128,64,64,"","");
fBtn:configure(33,-192,128,64,64,"","");
fBtn:configure(34,-128,128,64,64,"","");
fBtn:configure(35,-64,128,64,64,"","");
fBtn:configure(36,0,128,64,64,"","");
fBtn:configure(37,64,128,64,64,"","");
fBtn:configure(38,128,128,64,64,"","");
fBtn:configure(39,192,128,64,64,"","");
fBtn:configure(40,256,128,64,64,"","");
fBtn:configure(41,-320,64,64,64,"","");
fBtn:configure(42,-256,64,64,64,"","");
fBtn:configure(43,-192,64,64,64,"","");
fBtn:configure(44,-128,64,64,64,"","");
fBtn:configure(45,-64,64,64,64,"","");
fBtn:configure(46,0,64,64,64,"","");
fBtn:configure(47,64,64,64,64,"","");
fBtn:configure(48,128,64,64,64,"","");
fBtn:configure(49,192,64,64,64,"","");
fBtn:configure(50,256,64,64,64,"","");
fBtn:configure(51,-320,0,64,64,"","");
fBtn:configure(52,-256,0,64,64,"","");
fBtn:configure(53,-192,0,64,64,"","");
fBtn:configure(54,-128,0,64,64,"","");
fBtn:configure(55,-64,0,64,64,"","");
fBtn:configure(56,0,0,64,64,"","");
fBtn:configure(57,64,0,64,64,"","");
fBtn:configure(58,128,0,64,64,"","");
fBtn:configure(59,192,0,64,64,"","");
fBtn:configure(60,256,0,64,64,"","");
fBtn:configure(61,-320,-64,64,64,"","");
fBtn:configure(62,-256,-64,64,64,"","");
fBtn:configure(63,-192,-64,64,64,"","");
fBtn:configure(64,-128,-64,64,64,"","");
fBtn:configure(65,-64,-64,64,64,"","");
fBtn:configure(66,0,-64,64,64,"","");
fBtn:configure(67,64,-64,64,64,"","");
fBtn:configure(68,128,-64,64,64,"","");
fBtn:configure(69,192,-64,64,64,"","");
fBtn:configure(70,256,-64,64,64,"","");
fBtn:configure(71,-320,-128,64,64,"","");
fBtn:configure(72,-256,-128,64,64,"","");
fBtn:configure(73,-192,-128,64,64,"","");
fBtn:configure(74,-128,-128,64,64,"","");
fBtn:configure(75,-64,-128,64,64,"","");
fBtn:configure(76,0,-128,64,64,"","");
fBtn:configure(77,64,-128,64,64,"","");
fBtn:configure(78,128,-128,64,64,"","");
fBtn:configure(79,192,-128,64,64,"","");
fBtn:configure(80,256,-128,64,64,"","");
fBtn:configure(81,-320,-192,64,64,"","");
fBtn:configure(82,-256,-192,64,64,"","");
fBtn:configure(83,-192,-192,64,64,"","");
fBtn:configure(84,-128,-192,64,64,"","");
fBtn:configure(85,-64,-192,64,64,"","");
fBtn:configure(86,0,-192,64,64,"","");
fBtn:configure(87,64,-192,64,64,"","");
fBtn:configure(88,128,-192,64,64,"","");
fBtn:configure(89,192,-192,64,64,"","");
fBtn:configure(90,256,-192,64,64,"","");
fBtn:configure(91,-320,-256,64,64,"","");
fBtn:configure(92,-256,-256,64,64,"","");
fBtn:configure(93,-192,-256,64,64,"","");
fBtn:configure(94,-128,-256,64,64,"","");
fBtn:configure(95,-64,-256,64,64,"","");
fBtn:configure(96,0,-256,64,64,"","");
fBtn:configure(97,64,-256,64,64,"","");
fBtn:configure(98,128,-256,64,64,"","");
fBtn:configure(99,192,-256,64,64,"","");
fBtn:configure(100,256,-256,64,64,"","");
function resursy:configure(id)
	self[id] = CreateFrame("Button", nil, fBtn[10], "");
	self[id]:SetFrameStrata("FULLSCREEN")
	if id == 1 then
		self[id]:SetPoint("TOPLEFT", fBtn[10],"TOPLEFT",64, 0)
	end
	if id == 2 then
		self[id]:SetPoint("TOPLEFT", fBtn[10],"TOPLEFT",64, -64)
	end
	if id == 3 then
		self[id]:SetPoint("TOPLEFT", fBtn[10],"TOPLEFT",64, -128)
	end
	if id == 4 then
		self[id]:SetPoint("TOPLEFT", fBtn[10],"TOPLEFT",64, -192)
	end
	if id == 5 then
		self[id]:SetPoint("TOPLEFT", fBtn[10],"TOPLEFT",64, -256)
	end
	self[id]:SetSize(64, 64)
	if id == 1 then
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\b.tga")
	end
	if id == 2 then
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\stog.tga")
	end
	if id == 3 then
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kamen.tga")
	end
	if id == 4 then
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bt.tga")
	end
	if id == 5 then
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
	end
	self[id]:SetScript("OnEnter",function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if id == 1 then
			GameTooltip:AddLine("|c0099ff99Бревна")
		end
		if id == 2 then
			GameTooltip:AddLine("|c0099ff99Трава")
		end
		if id == 3 then
			GameTooltip:AddLine("|c0099ff99Камень")
		end
		if id == 4 then
			GameTooltip:AddLine("|c0099ff99Бетон")
		end
		if id == 5 then
			GameTooltip:AddLine("|c0099ff99Валюта")
		end
		GameTooltip:Show()
	end)
end
resursy:configure(1)
resursy:configure(2)
resursy:configure(3)
resursy:configure(4)
resursy:configure(5)

function btn:configure(id,posex,posey,sizex,sizey,zzid,message)
	self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	if id == 996 then
		self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"TOPLEFT",posex, posey)
	elseif id == 994 or id == 993 or id == 992 or id == 989 then
		self[id]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",posex, posey)
	elseif id == 995 then
		self[id]:SetPoint("BOTTOMLEFT", SendMailMailButton,"TOPLEFT",posex, posey)
	elseif id == 991 then
		self[id]:SetPoint("TOPRIGHT", BuffFrame,"TOPRIGHT",posex, posey)
	elseif id == 988 then
		self[id]:SetPoint("TOPRIGHT", MailFrame,"TOPRIGHT",posex, posey)
	else
		self[id]:SetPoint("CENTER",posex, posey)
	end
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	self[id]:Hide();
	if id==9 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			RandomRoll(1, 100)
		end)
	end

	if id == 10 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			RandomRoll(1, 333)
		end)
	end

	if id==11 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			RandomRoll(1, 111)
		end)
	end
	if id == 988 then
		self[id]:SetScript("OnClick",function(self, button)
			if testQ["mail"] == nil then
				testQ["mail"] = 1
			else
				testQ["mail"] = nil
			end
		end)
	end
	if id==7 or id==1 or id==2 then
	self[id]:SetScript("OnClick",function(self, button)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if id==2 then
			btn[2]:Disable()
			testQ["timerID2"] = 60
			if testQ[myNome]["взятый_квест"] ~= "q33" and testQ[myNome]["взятый_квест"] ~= "q3Stat" and testQ[myNome]["взятый_квест"] ~= "itemQ" then
				if testQ[myNome]["лвл_квестов"]~="2" and testQ[myNome]["лвл_квестов"]~="3" then
					SendAddonMessage("NSGadd", zzid, "guild")
				elseif testQ[myNome]["лвл_квестов"]=="2" then
					SendAddonMessage("NSGadd", "#aam", "guild")
				elseif testQ[myNome]["лвл_квестов"]=="3" then
					SendAddonMessage("NSGadd", "#aat", "guild")
				end
			end
			if testQ[myNome]["взятый_квест"] == "q33" then
				SendAddonMessage("NSGadd", "#q33x", "guild")
			end
			if testQ[myNome]["взятый_квест"] == "q3Stat" then
				SendAddonMessage("NSGadd", testQ[myNome]["q3StatNum"], "guild")
				local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10 = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["q3Stat"]), 1)
				SendAddonMessage("#zlnDa", arg4, "guild")
				--SendAddonMessage("NSGadd", "q3StX", "guild")
			end
			if testQ[myNome]["взятый_квест"] == "itemQ" then
				SendAddonMessage("itemQuestSend", myNome .. " " .. testQ[myNome]["itemName"] .. " " .. testQ[myNome]["itemNum"], "guild")
			end
			SendAddonMessage("NSGadd", "#questTimerID2", "guild")

			for ii=1,15 do
				btn[ii]:Hide();
			end
			minibtn:SetNormalTexture("Interface\\AddOns\\NSQC\\emblem.tga")
			minibtn:SetPushedTexture("Interface\\AddOns\\NSQC\\emblem.tga")
			minibtn:SetHighlightTexture("Interface\\AddOns\\NSQC\\emblem.tga")
			pokazat = 0
		elseif id == 1 then
			SendAddonMessage("NSGadd", zzid .. " " .. versAdd, "guild")
			SendChatMessage("ВOЖДЬ", "guild", nil, 1)
			SendAddonMessage("NSGadd", "#questTimerID2", "guild")
		else
			SendAddonMessage("NSGadd", zzid, "guild")
		end

	end)

	elseif id==5 or id==6 or id==999 or id==12 or id==13 then
	self[id]:SetScript("OnClick",function(self, button)
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		   SendAddonMessage("NSGadd", zzid, "guild") end)
	end
	if id==8 then
			self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
				if testQ[myNome]["взятый_квест"] ~= "q33" and testQ[myNome]["взятый_квест"] ~="q3Stat" and testQ[myNome]["взятый_квест"] ~="itemQ" then
					if testQ[myNome]["лвл_квестов"]~="2" and testQ[myNome]["лвл_квестов"]~="3" then
						SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)
					end
					if testQ[myNome]["лвл_квестов"]=="2" then
						proverkaVypolneniyaKvestySachivkoj(myNome,"2")
					end
					if testQ[myNome]["лвл_квестов"]=="3" and testQ[myNome]["взятый_квест3_1"] == "vzyat" then
						SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)
					end
					if testQ[myNome]["лвл_квестов"]=="3" and testQ[myNome]["взятый_квест3_2"] == "vzyat" then
						proverkaVypolneniyaKvestySachivkoj(myNome,"3")
					end
				end
				if testQ[myNome]["взятый_квест"] == "q33" then
					local nik = {}
					for i=1,#testQ[myNome]["q33nik"] do
						if testQ[myNome]["q33nik"][i] == 1 then
							nik[i] = "выполнено"
						else
							nik[i] = testQ[myNome]["q33nik"][i]
						end
					end
					SendChatMessage(testQ[myNome]["q33q"] .. nik[1] .. ", " .. nik[2] .. ", " .. nik[3], "OFFICER", nil, 1)
				end
				if testQ[myNome]["взятый_квест"] == "q3Stat" then
					local x = tonumber(testQ[myNome]["q3StatNum"])+5
					SendChatMessage("Должно стать " .. x .. " пунктов ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["q3Stat"])), "OFFICER", nil, 1)
				end
				if testQ[myNome]["взятый_квест"] == "itemQ" then
					SendChatMessage("Нужно достать " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"] .. " и прислать по почте персонажу Хефе", "OFFICER", nil, 1)
				end
		end)
	end
	if id == 14 then
		self[id]:SetScript("OnClick",function(self, button)
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		end)
	end
	if id == 15 then
		self[id]:SetScript("OnClick",function(self, button)
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		end)
	end
	if id == 998 then
		self[id]:SetScript("OnClick",function(self, button)
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			SendAddonMessage("NSGadd", "#ahtng", "guild")
		end)
	end
	if id == 997 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			SendAddonMessage("NSGadd", "#zzp", "guild")
		end)
	end
	if id == 996 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			SendAddonMessage("NSGadd", "#2t", "guild")
		end)
	end
	if id == 4 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			SendAddonMessage("NSGadd", "#zzguild " .. testQ[myNome]["zzlf"], "guild")
		end)
	end
	if id == 3 then
		self[id]:SetScript("OnClick",function(self, button)
			if WhoFrame:IsVisible() then
				if WhoFrame["selectedName"] ~= nil then
					local wNome = WhoFrame["selectedName"]
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
					if ChatFrame1:IsVisible() then
						ChatFrame1EditBox:Show()
						ChatFrame1EditBox:SetFocus()
						ChatFrame1EditBox:SetText("/ginvite " .. wNome)
					end
					if ChatFrame2:IsVisible() then
						ChatFrame1EditBox:Show()
						ChatFrame2EditBox:SetFocus()
						ChatFrame2EditBox:SetText("/ginvite " .. wNome)
					end
					if ChatFrame3:IsVisible() then
						ChatFrame1EditBox:Show()
						ChatFrame3EditBox:SetFocus()
						ChatFrame3EditBox:SetText("/ginvite " .. wNome)
					end
					if ChatFrame4:IsVisible() then
						ChatFrame1EditBox:Show()
						ChatFrame4EditBox:SetFocus()
						ChatFrame4EditBox:SetText("/ginvite " .. wNome)
					end
				end
			end
		end)
	end
	if id == 777 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			if testQ["marshS"] == nil then
				testQ["marshS"] = 1
			elseif testQ["marshS"] == 1 then
				marsh = nil
				testQ["marshS"] = nil
				testQ["marshK"] = nil
				testQ["marshL"] = nil
				testQ["marshN"] = nil
			end
		end)
	end
	if id == 999999 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			if testQ ~= nil then
				if testQ[myNome] ~= nil then
					if testQ[myNome]["sdvig"] == nil then
						testQ[myNome]["sdvig"] = 1
						local x,y = GetPlayerMapPosition("player")
						testQ[myNome]["sdvigx"] = x
						testQ[myNome]["sdvigy"] = y
						print ("1")
					else
						testQ[myNome]["sdvig"] = nil
						testQ[myNome]["sdvigx"] = nil
						testQ[myNome]["sdvigy"] = nil
						print("nil")
					end
				end
			end
		end)
	end
	if id == 995 then
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			SendMail("Хефе", "Квест на сбор предметов", "")
			btn[995]:Hide()
			testQ[myNome]["itemQend"] = 1
			tempRez1 = nil
			MailFrame:Hide()
		end)
	end
end

-- вместо цикла явная индексация, так как у тебя один фиг ifы
-- видимо я так понял имеет значение порядок создания кнопок
btn:configure(1,0,300,300,30,"#zzs","Взять квест");
btn:configure(2,0,300,300,30,"#zzr","Сдать квест");
btn:configure(3,-135,270,30,30,"","?");
btn:configure(4,15,270,270,30,"#zzguild","Сдать бонусный квест вне лимита");
btn:configure(5,0,240,300,30,"#zzt","Узнать свой гилдлвл");
btn:configure(99,-400,400,100,30,"","тест");
btn:configure(7,0,210,300,30,"#zzp","Отказаться от квеста");
btn:configure(8,0,180,300,30,"","Узнать текущий квест");
btn:configure(9,250,300,200,30,"","Ролл");
btn:configure(10,250,270,200,30,"#ltr 1","Лотерея одним куском");
btn:configure(11,250,240,200,30,"#ltr 3","Лотерея тремя кусками");
btn:configure(999,0,150,200,50,"#cls","Закрыть");
btn:configure(12,-22225,350,150,30,"#opn","Включить поиск");
btn:configure(13,-22225,320,150,30,"#crtPoint","Создать точку");
btn:configure(14,-133,332,32,32,"#ver","*");
btn:configure(15,-101,332,32,32,"#u","У");
btn:configure(998,-83,220,70,32,"#ahtng","СБРОС");
btn:configure(997,-13,220,70,32,"#zzp","ОТМЕНА");
btn:configure(996,-5,19,32,32,"#krt","К");
btn:configure(777,-300,-75,200,32,"#marsh","");
btn:configure(999999,635,310,32,32,"#","");
btn:configure(995,0,-32,184,64,"","отправить");
btn:configure(994,0,-3,32,32,"","З");
btn:configure(993,32,-3,32,32,"","П");
btn:configure(992,64,-3,32,32,"","О");
btn:configure(991,0,0,32,32,"","");
btn:configure(990,0,0,32,32,"","?");
btn:configure(989,96,-3,32,32,"","Б");
btn:configure(988,-40,-40,128,32,"","ЗАБРАТЬ ВСЕ");

btn[989]:SetScript("OnClick",function(self, button)
	btn[989]:RegisterForClicks("LeftButtonUp", "RightButtonDown")
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	showFld("0",myNome)
end)

btn[1]:Hide()
btn[2]:Hide()

editB[1] = CreateFrame("EditBox", nil, UIParent, "UIPanelButtonTemplate");
editB[1]:SetSize(900, 32)
editB[1]:SetPoint("BOTTOMLEFT", btn[994],"TOPLEFT",-300, -700)
editB[1]:SetFrameStrata("TOOLTIP")
editB[1]:SetMaxLetters(32000)
editB[1]:SetAutoFocus(true)
editB[1]:SetFontObject("ChatFontNormal")
editB[1]:SetMultiLine(1000);
editB[1]:Hide()

editB[2] = CreateFrame("EditBox", nil, UIParent, "UIPanelButtonTemplate");
editB[2]:SetSize(900, 32)
editB[2]:SetPoint("BOTTOMLEFT", btn[993],"TOPLEFT",-300, -700)
editB[2]:SetFrameStrata("TOOLTIP")
editB[2]:SetMaxLetters(32000)
editB[2]:SetAutoFocus(true)
editB[2]:SetFontObject("ChatFontNormal")
editB[2]:SetMultiLine(1000);
editB[2]:Hide()

editB[3] = CreateFrame("EditBox", nil, UIParent, "UIPanelButtonTemplate");
editB[3]:SetSize(512, 32)
editB[3]:SetPoint("BOTTOMLEFT", btn[992],"TOPLEFT",0, 0)
editB[3]:SetFrameStrata("TOOLTIP")
editB[3]:SetMaxLetters(32000)
editB[3]:SetAutoFocus(true)
editB[3]:SetFontObject("ChatFontNormal")
editB[3]:Hide()

editB[1]:SetScript("OnEditFocusLost",function(self)
	local str = editB[1]:GetText()
	local nome = GuildFrame["selectedName"]
	if testQ["клик994"] == nil then
		SendAddonMessage("zametkaNS", str, "guild")
			--editB[1]:SetText("")
	end
end)

editB[2]:SetScript("OnEditFocusLost",function(self)
	local str = editB[2]:GetText()
	local nome = GuildFrame["selectedName"]
	if testQ["клик993"] == nil then
		SendAddonMessage("pamyatkaNS " .. nome, str, "guild")
	end
end)

editB[3]:SetScript("OnEditFocusLost",function(self)
	local str = editB[3]:GetText()
	local nome = GuildFrame["selectedName"]
	if testQ["клик992"] == nil then
		if str ~= nil and str ~= "" then
			SendAddonMessage("otzyvNS " .. nome, str, "guild")
			testQ["клик992"] = nil
			--editB[1]:SetText("")
		else
			SendChatMessage("Нельзя добавить пустой отзыв.", "OFFICER", nil, 1)
		end
	end
end)
editB[3]:SetScript("OnEnterPressed",function(self)
	local nome = GuildFrame["selectedName"]
	editB[3]:Hide()
end)

btn[15]:SetScript("OnClick",function(self)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	SendAddonMessage("NSGadd", "Я читаю Устав", "guild")
	if GameTooltip:IsVisible() then
		GameTooltip:Hide()
	else
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:AddLine("|cffFF8C001. |cffFFFFE0Управление гильдией осуществляется путем прямой демократии: 1 игрок - 1 голос*.")
		GameTooltip:AddLine("|cffFFFFE0*глава гильдии - тот самый игрок, который имеет единственный голос.")
		GameTooltip:AddLine ("|cffFF8C001.1. |cffFFFFE0Орнелла Мути законодательно является лучше Моники Белуччи и любых других актрис (или альтернативных актеров")
		GameTooltip:AddLine ("|cffFF8C001.2. |cffFFFFE0Незнание устава не освобождает от ответственности и является отягчающим обстоятельством")
		GameTooltip:AddLine ("|cffFF8C002. |cffFFFFE0Торговля в гильдии запрещена")
		GameTooltip:AddLine ("|cffFF8C003. |cffFFFFE0Попрошайничество в гильдии запрещено. Наказание - смерть. Или исключение из гильдии до возможности исполнить приговор")
		GameTooltip:AddLine ("|cffFF8C003.0. |cffFFFFE0Офицеры могут исключать и понижать в звании, исходя из принципа гуманности")
		GameTooltip:AddLine ("|cffFF8C003.1 |cffFFFFE0Строго не рекомендуется давать деньги званиям ниже капитана")
		GameTooltip:AddLine ("|cffFF8C003.2 |cffFFFFE0Прохождение подземелий с новичками ниже вас на 10 уровней или с илвлом на 80 от вашего молчаливо порицается")
		GameTooltip:AddLine ("|cffFFFFE0\(офицеры, не стесняйтесь использовать молчаливое порицание для слишком настырных\)")
		GameTooltip:AddLine ("|cffFF8C004. |cffFFFFE0Каждый член гильдии имеет право попросить квест и получить за выполнение этого квеста награду")
		GameTooltip:AddLine ("|cffFF8C004.1. |cffFFFFE0Каждый член гильдии имеет право отказаться от квеста и получить следующий квест гораздо сложнее за ту же награду.")
		GameTooltip:AddLine ("|cffFFFFE0(Количество доступных квестов на сутки обнуляется)")
		GameTooltip:AddLine ("|cffFF8C004.2. |cffFFFFE0Гоблины имеют бонусную единицу опыта на каждый гильдлвл ")
		GameTooltip:AddLine ("|cffFF8C004.2.1. |cffFFFFE0Вульперы получают половину гоблинского бонуса")
		GameTooltip:AddLine ("|cffFF8C004.3. |cffFFFFE0Каждый член гильдии имеет право ничего не делать, если не хочет")
		GameTooltip:AddLine ("|cffFF8C004.4 |cffFFFFE0Запрещается навязывать другим игрокам свои ценности, насколько бы хороши они ни были. На усмотрение модерации")
		GameTooltip:AddLine ("|cffFF8C004.4.1. |cffFFFFE0Запрещается продолжать беседу на тему, которая не нравится любому участнику чата")
		GameTooltip:AddLine ("|cffFF8C005. |cffFFFFE0Каждый член гильдии имеет право на три необоснованных мата в час.")
		GameTooltip:AddLine ("|cffFFFFE0Каждый последующий мат: понижение в звании до исполняющего обязанности констебля на один час")
		GameTooltip:AddLine ("|cffFF8C005.1 |cffFFFFE0Если женщина или прочий какой беременный ребенок младше 25 лет жалуется на мат, матерящийся понижается в звании")
		GameTooltip:AddLine ("|cffFFFFE0до первого звания на срок пока пожаловавшийся не попросит повысить или не уйдет из гильдии")
		GameTooltip:AddLine ("|cffFF8C005.1.1. |cffFFFFE0За уместностью матов следят офицеры")
		GameTooltip:AddLine ("|cffFF8C005.2 |cffFFFFE0Грамматические ошибки считаются за половину мата")
		GameTooltip:AddLine ("|cffFF8C005.2.1 |cffFFFFE0Персонаж с \"правильным\" уникальным ником имеет право на бонус \(на усмотрение ГМа\): ")
		GameTooltip:AddLine ("|cffFFFFE0- Полностью кириллический односложный ник: 5 опыта")
		GameTooltip:AddLine ("|cffFFFFE0- Односложный ник на латинице 1 опыта")
		GameTooltip:AddLine ("|cffFF8C005.3. |cffFFFFE0Штрафы для офицеров утроены")
		GameTooltip:AddLine ("|cffFF8C005.4. |cffFFFFE0Все ушедшие в добровольный отпуск, получают запись об этом и на время отпуска понижаются в до минимального звания ")
		GameTooltip:AddLine ("|cffFF8C006.1. |cffFFFFE0Офицер всегда прав")
		GameTooltip:AddLine ("|cffFF8C006.3. |cffFFFFE0Верующих может исключать только их персональное божество или глава гильдии лично")
		GameTooltip:AddLine ("|cffFF8C007. |cffFFFFE0АУЕ запрещено \(Кик по желанию офицера\). \(Закон Леджаго\)")
		GameTooltip:AddLine ("|cffFF8C007.1. |cffFFFFE0Политика запрещена. Вся, целиком. Все что не относится к игровому миру в данном контексте")
		GameTooltip:AddLine ("|cffFF8C008. |cffFFFFE0Действия направленные на подрыв экономической и политической безопасности гильдии запрещены")
		GameTooltip:AddLine ("|cffFF8C008.2. |cffFFFFE0Необоснованные обвинения вышестоящего офицера запрещены, если вас не поддерживают еще двое игроков вашего ранга или выше")
		GameTooltip:AddLine ("|cffFF8C0013.4. |cffFFFFE0Оскорбление члена гильдии считается клеветой, если оскорбляющего не поддержат минимум двое членов гильдии рангом не ниже оскорбляемого")
		GameTooltip:AddLine ("|cffFFFFE0Наказание назначает оскорбляемый")
		GameTooltip:AddLine ("|cffFF8C0013.4.1. |cffFFFFE0Если оскорбляющего поддерживают двое равных рангом оскорбляемому или выше, все трое понижаются на одно звание")
		GameTooltip:AddLine ("|cffFF8C0013.4.2. |cffFFFFE0Провоцирующий нарушение получат наказание равное нарушившему")
		GameTooltip:AddLine ("|cffFF8C0013.4.3. |cffFFFFE0Офицер имеет право исключить самозванца, маскирующегося под его ник")
		GameTooltip:AddLine ("|cffFF8C0015. |cffFFFFE0Закон обратной силы не имеет")
		GameTooltip:Show()
	end
end)
btn[15]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|cFF6495EDУстав гильдии(Нажать кнопку пару раз)")
	GameTooltip:Show()
end)

btn[990]:SetScript("OnClick",function(self)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	testQ["VerF"] = 2300
	testQ["fontVers"]=testQ["fontVers"]+5
	VerF:SetPoint("CENTER", UIParent, "CENTER", testQ["VerF"], 0)
end)
btn[991]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|cFF6495EDРасположение панели дебафов")
	GameTooltip:AddLine("|cFF6495EDЛКМ один раз - привязать кнопку к курсору")
	GameTooltip:AddLine("|cFF6495EDОКМ второй раз - отвязать кнопку от курсора")
	GameTooltip:AddLine("|cFF6495EDЛКМ по кнопке и затем ПКМ по кнопке  - сброс")
	GameTooltip:Show()
end)

btn[994]:SetScript("OnEnter",function(self)
	btn[994]:Show()
	btn[993]:Show()
	btn[992]:Show()
	btn[989]:Show()
	local nome = GuildFrame["selectedName"]
	local zametka
	SendAddonMessage("#получить_заметку", nome, "guild")
	if testQ~=nil then
		if testQ["tempZametka"] ~= nil then
			if testQ["tempZametka"][nome] == nil or testQ["tempZametka"][nome] == "" then
				editB[1]:SetText("")
				testQ["tempZametka"][nome] = ""
				zametka = "Персональные заметки о своем персонаже. Заполняются самим игроком. Пока тут пусто."
			else
				zametka = testQ["tempZametka"][nome]
				editB[1]:SetText(zametka)
			end
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("|c006495ED" .. zametka)
			GameTooltip:Show()
		end
	end
end)

btn[990]:SetScript("OnEnter",function(self)
	if testQ["fontVers"] >=80 then
		btn[990]:Hide()
	end
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|cFF6495EDЧтобы надпись исчезла, обнови аддон NSQC")
	GameTooltip:AddLine("|cFF6495EDКлик по кнопке - временно убрать надпись")
	GameTooltip:Show()
end)
btn[992]:SetScript("OnEnter",function(self)
	btn[994]:Show()
	btn[993]:Show()
	btn[992]:Show()
	btn[989]:Show()
	local nome = GuildFrame["selectedName"]
	local zametka
	SendAddonMessage("#получить_отзыв", nome, "guild")
	if testQ ~= nil then
		if testQ["tempOtzyv"] ~= nil then
			if testQ["tempOtzyv"][nome] == nil or testQ["tempOtzyv"][nome] == "" then
				zametka = "Отзывы об игроке. Заполняются кем угодно, видит кто угодно. Пока отзывов об этом персонаже нет."
			else
				zametka = testQ["tempOtzyv"][nome]
				print(zametka)
			end
		else
			zametka = "Отзывы об игроке. Заполняются кем угодно, видит кто угодно. Пока отзывов об этом персонаже нет."
		end
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:AddLine("|c0099ff99" .. zametka)
		GameTooltip:Show()
	end
end)

btn[989]:SetScript("OnEnter",function(self)
	btn[994]:Show()
	btn[993]:Show()
	btn[992]:Show()
	btn[989]:Show()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|c0099ff99Бонусы")
	GameTooltip:Show()
end)

btn[993]:SetScript("OnEnter",function(self)
	btn[994]:Show()
	btn[993]:Show()
	btn[992]:Show()
	btn[989]:Show()
	local nome = GuildFrame["selectedName"]
	local zametka
	if zametki~=nil then
		if zametki[nome] == nil or zametki[nome] == "" then
			zametka = "Личные заметки о данном персонаже. Вижу только я. Заполняю только я. Пока заметок нет."
			editB[2]:SetText("")
		else
			zametka = zametki[nome]
			editB[2]:SetText(zametka)
		end
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:AddLine("|c00F4A460" .. zametka)
		GameTooltip:Show()
	end
end)

btn[994]:SetScript("OnClick",function(self, button)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	local nome = GuildFrame["selectedName"]
	if nome == myNome then
		if editB[1]:IsVisible() then
			testQ["клик994"] = 1
			editB[1]:Hide()
		else
			testQ["клик994"] = nil
			editB[1]:Show()
		end
	end
end)

btn[991]:SetScript("OnClick",function(self, button)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	btn[991]:RegisterForClicks("LeftButtonUp", "RightButtonDown")
	if arg1=="RightButton" then
		testQ["buffX"] = nil
		btn[991]:SetPoint("TOPRIGHT", BuffFrame,"TOPRIGHT",0, 0)
	end
	if buffBTN == nil then
		buffBTN	= 1
	elseif buffBTN == 1 then
		buffBTN = nil
	end
end)
btn[993]:SetScript("OnClick",function(self, button)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	local nome = GuildFrame["selectedName"]
	if editB[2]:IsVisible() then
		testQ["клик993"] = 1
		editB[2]:Hide()
	else
		testQ["клик993"] = nil
		editB[2]:Show()
	end
end)
btn[992]:SetScript("OnClick",function(self, button)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	local nome = GuildFrame["selectedName"]
	if editB[3]:IsVisible() then
		testQ["клик992"] = 1
		editB[3]:Hide()
	else
		testQ["клик992"] = nil
		editB[3]:Show()
	end
end)
GuildMemberDetailFrame:SetScript("OnEnter",function(self)
	btn[994]:Show()
	btn[993]:Show()
	btn[992]:Show()
	btn[989]:Show()
end)
GuildMemberDetailFrame:SetScript("OnLeave", function(self)
	btn[994]:Hide()
	btn[993]:Hide()
	btn[992]:Hide()
	btn[989]:Hide()
	GameTooltip:Hide();
end)
btn[994]:SetScript("OnLeave", function(self)
	btn[994]:Hide()
	btn[992]:Hide()
	btn[993]:Hide()
	btn[989]:Hide()
	editB[1]:Hide()
	GameTooltip:Hide();
end)
btn[993]:SetScript("OnLeave", function(self)
	btn[993]:Hide()
	btn[992]:Hide()
	btn[994]:Hide()
	btn[989]:Hide()
	editB[2]:Hide()
	GameTooltip:Hide();
end)
btn[992]:SetScript("OnLeave", function(self)
	btn[992]:Hide()
	btn[993]:Hide()
	btn[994]:Hide()
	btn[989]:Hide()
	editB[3]:Hide()
	GameTooltip:Hide();
end)
btn[989]:SetScript("OnLeave", function(self)
	btn[992]:Hide()
	btn[993]:Hide()
	btn[994]:Hide()
	btn[989]:Hide()
	GameTooltip:Hide();
end)

btn[14]:SetScript("OnClick",function(self)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	showRB(myNome)
end)

btn[14]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

btn[3]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|c006495EDБонусный квест. Доступен всегда.")
	GameTooltip:AddLine("|c00FFFFE0Каждые 30 принятых игроков принесут 3 опыта и кусок карты")
	GameTooltip:AddLine("|c00FFFFE0По пометкам на карте можно найти клад: в кладе Механоцикл")
	GameTooltip:AddLine("|c00F4A460Нажми \"Щ\". Затем выбери внизу вкладку \"Кто\"")
	GameTooltip:AddLine("|c00F4A460В строке поиска снизу напиши диапазон лвлов (лучше всего по 5: 1-5, 6-10 итд)")
	GameTooltip:AddLine("|c00F4A460Затем выбирай ники без гильдии и пиши в чате: |cff99ff99/ginvite ник")
	GameTooltip:AddLine("|c00FFFFE0Для удобства команду |cff99ff99/ginvite |c00FFFFE0лучше скопировать в буфер обмена")
	GameTooltip:Show()
end)
btn[3]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

btn[3]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

btnF = CreateFrame("CheckButton", "myCheckButton_GlobalName", parentFrame, "ChatConfigCheckButtonTemplate");
btnF:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"TOPLEFT",-5,-18)
btnF:SetText("CheckBox Name");
btnF:SetFrameStrata("TOOLTIP")
btnF:SetScript("OnClick",  function()
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	if krt["777"] ~= 3 then
		SendAddonMessage("NSGadd", "#krt", "guild")
	else
		if krt["evO3"] ~= nil then
			for i=1,krt["evO3"] do
				if iconRisEv3[i] == nil then
					ev3("evO3",i,4)
				else
					iconRisEv3[i]:Show()
				end
			end
		end
	end
end)
function memB()
for k, v in pairs(MainMenuMicroButton) do
	if v~= nil then
		print(k, v[1])
	end
end
end

btn[14]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|cFF6495EDКлик по кнопке: открыть/закрыть настройки")
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("|cff99ff99!заметка+ |cffFFFFE0[текст заметки] |cffbbbbbb- дополнить системную заметку о себе")
	GameTooltip:AddLine("|cffbbbbbbВ гильдчат: |cff99ff99" .. myNome .. " покажи предмет |cffFF8C00[название предмета, существующего в игре]")
	GameTooltip:AddLine("|cffbbbbbbВ гильдчат: |cff99ff99" .. myNome .. " !ачивка |cffFF8C00[название ачивки ИЛИ статистики]")
	GameTooltip:Show()
end)
btn[14]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

minibtn = CreateFrame("Button", nil, Minimap)
minibtn:RegisterForClicks("LeftButtonUp", "RightButtonDown")
minibtn:SetScript("OnEnter",function(self)
	MainMenuMicroButton["hover"]=1
	MainMenuMicroButton.updateInterval = 5
	SendAddonMessage("NSGadd", "#qUpdate", "guild")
	SendAddonMessage("NSGadd", "#ver", "guild")
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|cFF6495EDNSQC|cFF808080-|cff00BFFF".. versAdd .. "." .. versAddDop .. " |cffbbbbbbОЗУ: |cff00BFFF" .. string.format("%.0f", GetAddOnMemoryUsage("NSQC")) .. " |cffbbbbbbкб")
	if testQ["vers"] ~= nil then
		GameTooltip:AddLine("|cFF6495EDАктуальная версия аддона: |cff00BFFF" .. testQ["vers"]["2"])
	end
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("|cffFF8C00ЛКМ|cffFFFFE0 - открыть аддон")
	GameTooltip:AddLine("|cffF4A460ПКМ|cffFFFFE0 - показать настройки (когда аддон открыт)")
	GameTooltip:AddLine("|cffFFFFE0Тягать кнопку можно, когда аддон открыт")
	GameTooltip:Show()
end)
minibtn:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
	MainMenuMicroButton["hover"]=nil
end)
if testQ==nil then
	testQ={}
end
if testQ[myNome]==nil then
	testQ[myNome]={}
end
if testQ[myNome]["настройки"]==nil then
	testQ[myNome]["настройки"]={}
end


minibtn:SetFrameLevel(8)
minibtn:SetSize(32,32)
minibtn:SetMovable(true)









--minibtn:SetNormalTexture("Interface/AddOns/NSQuestClient/icon.tga")
--minibtn:SetPushedTexture("Interface/AddOns/NSQuestClient/icon.tga")
--minibtn:SetHighlightTexture("Interface/AddOns/NSQuestClient/icon.tga")
	minibtn:SetNormalTexture("Interface\\AddOns\\NSQC\\emblem.tga")
	minibtn:SetPushedTexture("Interface\\AddOns\\NSQC\\emblem.tga")
	minibtn:SetHighlightTexture("Interface\\AddOns\\NSQC\\emblem.tga")
if testQ ~= nil then
	if testQ["miniMapConf"] == nil then
		myIconPos = 0
		testQ["miniMapConf"] = 0
	end

-- Control movement
		local function UpdateMapBtn()
		local Xpoa, Ypoa = GetCursorPosition()
		local Xmin, Ymin = Minimap:GetLeft(), Minimap:GetBottom()
		Xpoa = Xmin - Xpoa / Minimap:GetEffectiveScale() + 70
		Ypoa = Ypoa / Minimap:GetEffectiveScale() - Ymin - 70

		myIconPos = math.deg(math.atan2(Ypoa, Xpoa))

		minibtn:ClearAllPoints()

		minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)), (80 * sin(myIconPos)) - 52)
		end

		minibtn:RegisterForDrag("LeftButton")
		minibtn:SetScript("OnDragStart", function()
		minibtn:StartMoving()
		minibtn:SetScript("OnUpdate", UpdateMapBtn)
		end)

		minibtn:SetScript("OnDragStop", function()
		minibtn:StopMovingOrSizing();
		minibtn:SetScript("OnUpdate", nil)
		testQ["miniMapConf"] = myIconPos
		local test1,test2,test3,test4,test5=minibtn:GetPoint(1)
		testQ["mbX"] = test4
		testQ["mbY"] = test5
		UpdateMapBtn();
		end)

-- Set position
		minibtn:ClearAllPoints();
		myIconPos = testQ["miniMapConf"]
		minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)),(80 * sin(myIconPos)) - 52)

		pokazat=0
		pokazatChk=0
end

minibtn:SetScript("OnClick", function()
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	local lvl
	for Zc=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
		if name == myNome then
			lvl = string.sub(officerNote,1,1)
			if tonumber(lvl) == 0 then
				testQ["mioFldLvl"] = 0.5
			end
			if tonumber(lvl) == 1 then
				testQ["mioFldLvl"] = 0.9
			end
		end
	end
	testQ["lvlProv"] = lvl
	if testQ["mioFldLvl"] ~= nil and testQ["mioFldLvl"] ~= "" and testQ["mioFldLvl"] ~= "0" and testQ["mioFldLvl"] ~= 0.5 and testQ["mioFldLvl"] ~= 0.9 then
		if arg1=="LeftButton" then
			if testQ==nil then
				testQ={}
			end
			if testQ[myNome]==nil then
				testQ[myNome]={}
			end
			btn[2]:Hide()
			btn[1]:Hide()
			if testQ[myNome]["взятый_квест"]==nil or testQ[myNome]["взятый_квест"]=="9999" then
				if pokazat == 0 then
					btn[1]:SetText("Взять квест")
					btn[1]:Show()
					btn[1]:Enable()
					btn[2]:Hide()
					btn[7]:Disable()
					btn[7]:SetText("Нет взятых квестов")
					btn[8]:Disable()
					btn[8]:SetText("Нет взятых квестов")
					btn[2]:Disable()
				end
				if pokazat == 1 then
					btn[1]:Hide()
					btn[1]:Enable()
					btn[2]:Hide()
					btn[7]:Disable()
					btn[7]:SetText("Нет взятых квестов")
					btn[8]:Disable()
					btn[8]:SetText("Нет взятых квестов")
					btn[2]:Disable()

				end
			elseif testQ[myNome]["взятый_квест"]~=nil or testQ[myNome]["взятый_квест"]~="9999" then
				if pokazat == 0 then
					btn[1]:Hide()
					btn[7]:SetText("Сдать квест")
					btn[2]:Show()
					btn[7]:Enable()
					btn[7]:SetText("Отказаться от квеста")
					btn[8]:Enable()
					btn[8]:SetText("Узнать текущий квест")
					btn[2]:Disable()
				end
				if pokazat == 1 then
					btn[2]:Hide()
					btn[1]:Hide()
					btn[7]:Enable()
					btn[7]:SetText("Отказаться от квеста")
					btn[8]:Enable()
					btn[8]:SetText("Узнать текущий квест")
					btn[2]:Disable()
				end
				if testQ[myNome]["лвл_квестов"]~="2" and testQ[myNome]["лвл_квестов"]~="3" then
					testComplit=testQ[myNome]["взятый_квест"]
					testComplit=tonumber(testComplit)
					if testComplit ~= nil then
						id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(testComplit)
					end
					if completed ~= true then
						btn[2]:Disable()
						if pokazat == 0 then
								btn[2]:Show()
								btn[1]:Hide()
							else
								btn[2]:Hide()
							end
						btn[2]:SetText("Ачивка не выполнена")
						btn[1]:Hide()
						btn[1]:SetText("Ачивка не выполнена")
					else
						if testQ["timerID2"] == nil then
							btn[2]:Enable()
							btn[1]:Enable()
						end
						if pokazat == 0 then
								btn[2]:Show()
								btn[1]:Hide()
							else
								btn[2]:Hide()
							end
						btn[2]:SetText("Сдать квест")
					end
				elseif testQ[myNome]["лвл_квестов"]=="2" then
					vypolnenaLiAch=testQ[myNome]["взятый_квест"]
					count = GetAchievementNumCriteria(vypolnenaLiAch)
					chisloPunktop=testQ[myNome]["квест_лвл2"][vypolnenaLiAch]
					chisloToNum=tonumber(vypolnenaLiAch)
					j=0
					k=0
					for i=1, count do
						local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(chisloToNum, i);
						prov=completed
						if prov == true then
							j=j+1
						else
							k=k+1
						end
						i=i+1
					end
					temvChislo = tonumber(chisloPunktop)
					if j<temvChislo then
						btn[2]:Disable()
						if pokazat == 0 then
								btn[2]:Show()
								btn[1]:Hide()
							else
								btn[2]:Hide()
							end
						btn[2]:SetText("Ачивка не выполнена")
						btn[1]:Hide()
						btn[1]:SetText("Ачивка не выполнена")
					else
						if testQ["timerID2"] == nil then
							btn[2]:Enable()
						end
						if pokazat == 0 then
								btn[2]:Show()
								btn[1]:Hide()
							else
								btn[2]:Hide()
							end
						btn[2]:SetText("Сдать квест")
					end
				elseif testQ[myNome]["лвл_квестов"]=="3" or testQ[myNome]["лвл_квестов"] == 3 then
					if testQ[myNome]["взятый_квест"] ~= "q33" and testQ[myNome]["взятый_квест"] ~= "q3Stat" and testQ[myNome]["взятый_квест"] ~= "itemQ" then
						if testQ[myNome]["взятый_квест3_1"] == "vzyat" then
							testComplit=testQ[myNome]["взятый_квест"]
							testComplit=tonumber(testComplit)
							id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(testComplit)
							if completed ~= true then
								btn[2]:Disable()
								if pokazat == 0 then
									btn[2]:Show()
									btn[1]:Hide()
								else
									btn[2]:Hide()
								end
								btn[2]:SetText("Ачивка не выполнена")
								btn[1]:Hide()
								btn[1]:SetText("Ачивка не выполнена")
							else
								if testQ["timerID2"] == nil then
									btn[2]:Enable()
									btn[1]:Enable()
								end
								if pokazat == 0 then
									btn[2]:Show()
									btn[1]:Hide()
								else
									btn[2]:Hide()
								end
								btn[2]:SetText("Сдать квест")
							end
						elseif testQ[myNome]["взятый_квест3_2"] == "vzyat" then
							vypolnenaLiAch=testQ[myNome]["взятый_квест"]
							vypolnenaLiAch=tonumber(vypolnenaLiAch)
							count = GetAchievementNumCriteria(vypolnenaLiAch)
							chisloPunktop=testQ[myNome]["квест_лвл3"][vypolnenaLiAch]
							j=0
							k=0
							for i=1, count do
								local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(vypolnenaLiAch, i);
								prov=completed
								if prov == true then
									j=j+1
								else
									k=k+1
								end
								i=i+1
							end
							temvChislo = tonumber(chisloPunktop)
							if j<temvChislo then
								btn[2]:Disable()
								if pokazat == 0 then
									btn[2]:Show()
									btn[1]:Hide()
								else
									btn[2]:Hide()
								end
								btn[2]:SetText("Ачивка не выполнена")
								btn[1]:Hide()
								btn[1]:SetText("Ачивка не выполнена")
							else
								if testQ["timerID2"] == nil then
									btn[2]:Enable()
									btn[1]:Enable()
								end
								if pokazat == 0 then
									btn[2]:Show()
									btn[1]:Hide()
								else
									btn[2]:Hide()
								end
								btn[2]:SetText("Сдать квест")
							end
						end
					end
					if testQ[myNome]["взятый_квест"] == "q3Stat" then
						if testQ[myNome]["q3Stat"]~= nil then
							btn[1]:Hide()
							btn[2]:Disable()
							local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10 = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["q3Stat"]), 1)
							local tQ = tonumber(testQ[myNome]["q3StatNum"])
							local tQ1 = tQ+5
							local tQ2 = tonumber(arg4)
							if tQ2 < tQ1 then
								btn[2]:Disable()
								if pokazat == 0 then
									btn[2]:Show()
									btn[1]:Hide()
								else
									btn[2]:Hide()
								end
								btn[2]:SetText("Ачивка не выполнена")
								btn[1]:Hide()
								btn[1]:SetText("Ачивка не выполнена")
							else
								if testQ["timerID2"] == nil then
									btn[2]:Enable()
									btn[1]:Enable()
								end
								if pokazat == 0 then
									btn[2]:Show()
									btn[1]:Hide()
								else
									btn[2]:Hide()
								end
								btn[2]:SetText("Сдать квест")
							end
						end

					end
					if testQ[myNome]["взятый_квест"] == "q33" then
						btn[1]:Hide()
						if testQ[myNome]["q33nik"][1] ~= 1 or testQ[myNome]["q33nik"][2] ~= 1 or testQ[myNome]["q33nik"][3] ~= 1 then
							btn[2]:Disable()
							if pokazat == 0 then
								btn[2]:Show()
								btn[1]:Hide()
							else
								btn[2]:Hide()
							end
							btn[2]:SetText("Ачивка не выполнена")
							btn[1]:Hide()
							btn[1]:SetText("Ачивка не выполнена")
						else
							if testQ["timerID2"] == nil then
								btn[2]:Enable()
								btn[1]:Enable()
							end
							if pokazat == 1 then
								btn[2]:Hide()
								btn[1]:Hide()
							else
								btn[2]:Show()
							end
								btn[2]:SetText("Сдать квест")
						end

					end

					if testQ[myNome]["взятый_квест"] == "itemQ" then
						btn[1]:Hide()
						if testQ[myNome]["itemQend"] ~= 1 then
							btn[2]:Disable()
							if pokazat == 0 then
								btn[2]:Show()
								btn[1]:Hide()
							else
								btn[2]:Hide()
							end
							btn[2]:SetText("Ачивка не выполнена")
							btn[1]:Hide()
							btn[1]:SetText("Ачивка не выполнена")
						else
							if testQ["timerID2"] == nil then
								btn[2]:Enable()
								btn[1]:Enable()
							end
							if pokazat == 1 then
								btn[2]:Hide()
								btn[1]:Hide()
							else
								btn[2]:Show()
							end
								btn[2]:SetText("Сдать квест")
						end

					end
				end
			end
			if pokazat~=1 then
				ii=6
				btn[ii] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
				btn[ii]:SetFrameStrata("FULLSCREEN_DIALOG")
				btn[ii]:SetPoint("CENTER",0,150)
				btn[ii]:SetSize(300, 30)
				btn[ii]:SetText("Закрыть")
				btn[ii]:Hide();
				btn[ii]:SetScript("OnClick", function(self, button)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
					for ii=1,15 do
						btn[ii]:Hide();
					end
					minibtn:SetNormalTexture("Interface\\AddOns\\NSQC\\emblem.tga")
					minibtn:SetPushedTexture("Interface\\AddOns\\NSQC\\emblem.tga")
					minibtn:SetHighlightTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				end)
				for ii=3,15 do
					btn[ii]:Show();
				end
				if myCheckButton1:IsVisible() then
					showRB(myNome)
				end
				pokazatChk=0
				minibtn:SetNormalTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetPushedTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetHighlightTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				pokazat=1
			else
				for ii=3,15 do
					if btn[ii] ~= nil then
						btn[ii]:Hide();
					end
				end
				minibtn:SetNormalTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetPushedTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetHighlightTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				pokazat=0
				myCheckButton1:Hide()
				myCheckButton2:Hide()
				myCheckButton3:Hide()
				myCheckButton4:Hide()
				myCheckButton5:Hide()
				myCheckButton6:Hide()
				btn[998]:Hide()
				btn[997]:Hide()
				pokazatChk=0
			end
		end
		if arg1=="RightButton" then
			showRB(myNome)
		end
	elseif testQ["mioFldLvl"] == 0.5 or testQ["mioFldLvl"] == 0.9 then
		if arg1=="LeftButton" then
			showFld("1",myNome)
		end
		if arg1=="RightButton" then
			if pokazat == 0 and not myCheckButton1:IsVisible() then
				pokazat = 1
			end
			showRB(myNome)
		end
	end
end)


if framePos==nil then
	framePos={}
end
btn[99]:SetScript("OnClick",function(self, button)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	if setPos==1 or setPos==nil then
		setPos=0

		framePos[1]=setPos
	else
		setPos=1

		framePos[1]=setPos
	end

end)

local GC_Sniffer111 = CreateFrame("Frame")
GC_Sniffer111:RegisterEvent("CHAT_MSG_GUILD")
GC_Sniffer111:SetScript("OnEvent", function (self, event, message, sender)
if sender==myNome and message=="stop" then
	framePos[1]=0
	btn[99]:Disable()
elseif sender==myNome and message=="start" then
	framePos[1]=1
	btn[99]:Enable()
elseif sender==myNome and message=="скрыть" then
	btn[99]:Hide()
elseif sender==myNome and message=="показать" then
	btn[99]:Show()
	btn[99]:Disable()
end


end
)


--[[frameTextu = {}
local i = 1
WorldMapDetailFrame:SetScript("OnUpdate",function(self)
	local uiScale, x, y = WorldMapDetailFrame:GetEffectiveScale(), GetCursorPosition()
	frameTextu[i] = WorldMapDetailFrame:CreateTexture()
	frameTextu[i]:SetNormalTexture(1,1,1)
	frameTextu[i]:SetSize(4,4)
	frameTextu[i]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame, "BOTTOMLEFT", x / uiScale, y / uiScale)
	x,y,z,jj,k,l=frameTextu[i]:GetPoint()
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine(jj)
	GameTooltip:AddLine(k)
	GameTooltip:Show()
	WorldFrame:SetScript("OnMouseDown", function()
		print (jj .. " " .. k)
	end)
	i=i+1
	j = i - 2
	if frameTextu[j] ~= nil then
		frameTextu[j]:Hide()
	end
end)--]]
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 100 then
		timeElapsed = 0

		for i = 1,100 do
			local x = math.random(1,5)
			if x == 5 then
				if mioFld ~= nil then
					if mioFld[myNome] ~= nil then
						if mioFld[myNome]["объекты"][tostring(i)] == "f" then
							resObj(i,myNome,myNome)
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
	if timeElapsed > 10 then
		timeElapsed = 0
		for i = 1,100 do
			local pet
			if mioFld ~= nil then
				if mioFld[myNome] ~= nil then
					local x = math.random(1,100)
					if x == 100 then
						if mioFld[myNome]["объекты"][tostring(i)] == "t" then
							if math.fmod(i,10) == 0 then
								if mioFld[myNome]["объекты"][tostring(math.fmod(i,100)-1)] == "z" then
									SendAddonMessage("travA " .. math.fmod(i,100)-1, myNome, "guild")
								end
								if i == 10 then
									if mioFld[myNome]["объекты"]["20"] == "z" then
										SendAddonMessage("travA " .. 20, myNome, "guild")
									end
								end
								if i == 100 then
									if mioFld[myNome]["объекты"]["90"] == "z" then
										SendAddonMessage("travA " .. 90, myNome, "guild")
									end
								end
								if i ~= 100 and i ~= 10 then
									if mioFld[myNome]["объекты"][tostring(i-10)] == "z" then
										SendAddonMessage("travA " .. i-10, myNome, "guild")
									end
									if mioFld[myNome]["объекты"][tostring(i+10)] == "z" then
										SendAddonMessage("travA " .. i+10, myNome, "guild")
									end
								end
							else
								if fBtn[math.fmod(i,100)-1] ~= nil and mioFld[myNome]["объекты"][tostring(math.fmod(i,100)-1)] == "z" then
									SendAddonMessage("travA " .. math.fmod(i,100)-1, myNome, "guild")
								end
								if mioFld[myNome]["объекты"][tostring(math.fmod(i,100)+1)] == "z" then
									SendAddonMessage("travA " .. math.fmod(i,100)+1, myNome, "guild")
								end
								if (i-10) >= 1 and mioFld[myNome]["объекты"][tostring(math.fmod(i,100)-10)] == "z" then
									SendAddonMessage("travA " .. math.fmod(i,100)-10, myNome, "guild")
								end
								if (i+10) <= 100 and mioFld[myNome]["объекты"][tostring(math.fmod(i,100)+10)] == "z" then
									SendAddonMessage("travA " .. math.fmod(i,100)+10, myNome, "guild")
								end
								if (i-10) <= 0 and mioFld[myNome]["объекты"][tostring(math.fmod(i,100)+10)] == "z" then
									SendAddonMessage("travA " .. math.fmod(i,100)+10, myNome, "guild")
								end
								if (i+10) >= 101 and mioFld[myNome]["объекты"][tostring(math.fmod(i,100)-10)] == "z" then
									SendAddonMessage("travA " .. math.fmod(i,100)-10, myNome, "guild")
								end
							end
						end
					end

					if mioFld[myNome]["петы"] ~= nil then
						if mioFld[myNome]["петы"][tostring(i)] ~= nil then
							pet = mysplit(mioFld[myNome]["петы"][tostring(i)])
						end
						if pet ~= nil then
							if mioFld[myNome]["объекты"][tostring(i)] == "t" and pet[1] == "bb" then
								treeX(myNome,myNome,i)
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
							end
							if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gom" then
								local x = math.random(1,2)
								if x == 2 then
									local xx = math.random(1,100)
									gKam(myNome,xx)
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
								end
							end
							if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gob" then
								local xx = math.random(1,100)
								gKam(myNome,xx)
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
								if x == 1 then
									 SendAddonMessage("gobXm " .. i, myNome, "guild")
								end
							end
							if (mioFld[myNome]["объекты"][tostring(i)] == "mx" or mioFld[myNome]["объекты"][tostring(i)] == "hs" or mioFld[myNome]["объекты"][tostring(i)] == "ms" or mioFld[myNome]["объекты"][tostring(i)] == "uz" or mioFld[myNome]["объекты"][tostring(i)] == "zs" or mioFld[myNome]["объекты"][tostring(i)] == "zx" or mioFld[myNome]["объекты"][tostring(i)] == "skc" or mioFld[myNome]["объекты"][tostring(i)] == "sx") and pet[1] == "gom" then
							print(testQ["gom"])
								local x = math.random(1,10000)
								local xx
								local xxx = math.random(1,2)
								if xxx == 2 then
									if x == 1 then
										if testQ["gom"] == nil then
											xx = math.random(1,4)
											if xx == 1 then
												testQ["brevna"] = tonumber(testQ["brevna"])-50
											end
											if xx == 2 then
												testQ["stog"] = tonumber(testQ["stog"])-50
											end
											if xx == 3 then
												testQ["kamen"] = tonumber(testQ["kamen"])-50
											end
											if xx == 4 then
												testQ["beton"] = tonumber(testQ["beton"])-50
											end
										end
									elseif x >= 2 and x < 101 then
										if testQ["gom"] == nil then
											xx = math.random(1,4)
											if xx == 1 then
												testQ["brevna"] = 0
											end
											if xx == 2 then
												testQ["stog"] = 0
											end
											if xx == 3 then
												testQ["kamen"] = 0
											end
											if xx == 4 then
												testQ["beton"] = 0
											end
										end
									elseif x >= 101 and x < 1000 then
										if testQ["gom"] == nil then
											xx = math.random(1,4)
											if xx == 1 then
												testQ["brevna"] = tonumber(testQ["brevna"])-10
											end
											if xx == 2 then
												testQ["stog"] = tonumber(testQ["stog"])-10
											end
											if xx == 3 then
												testQ["kamen"] = tonumber(testQ["kamen"])-10
											end
											if xx == 4 then
												testQ["beton"] = tonumber(testQ["beton"])-10
											end
										end
									elseif x >= 1000 and x < 9500 then
										resObj(i,myNome,myNome)
										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
									elseif x >= 9500 and x < 9990 then
										resObj(i,myNome,myNome)
										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
										xx = math.random(1,4)
										if xx == 1 then
											testQ["brevna"] = tonumber(testQ["brevna"])+1
										end
										if xx == 2 then
											testQ["stog"] = tonumber(testQ["stog"])+1
										end
										if xx == 3 then
											testQ["kamen"] = tonumber(testQ["kamen"])+1
										end
										if xx == 4 then
											testQ["beton"] = tonumber(testQ["beton"])+1
										end
									elseif x >= 9991 and x <= 10000 then
										resObj(i,myNome,myNome)
										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
										xx = math.random(1,4)
										if xx == 1 then
											testQ["brevna"] = tonumber(testQ["brevna"])+10
										end
										if xx == 2 then
											testQ["stog"] = tonumber(testQ["stog"])+10
										end
										if xx == 3 then
											testQ["kamen"] = tonumber(testQ["kamen"])+10
										end
										if xx == 4 then
											testQ["beton"] = tonumber(testQ["beton"])+10
										end
									end
								end
							end
							if (mioFld[myNome]["объекты"][tostring(i)] == "mx" or mioFld[myNome]["объекты"][tostring(i)] == "hs" or mioFld[myNome]["объекты"][tostring(i)] == "ms" or mioFld[myNome]["объекты"][tostring(i)] == "uz" or mioFld[myNome]["объекты"][tostring(i)] == "zs" or mioFld[myNome]["объекты"][tostring(i)] == "zx" or mioFld[myNome]["объекты"][tostring(i)] == "skc" or mioFld[myNome]["объекты"][tostring(i)] == "sx") and pet[1] == "gob" then
								local x = math.random(1,10000)
								if x == 1 then
									if testQ["gob"] == nil then
										mioFld[myNome]["объекты"][tostring(i)] = "z"
										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\gobXm.ogg")
									end
								elseif x >= 2 and x < 101 then
									if testQ["gob"] == nil then
										mioFld[myNome]["целостность"][tostring(i)] = x
										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
									end
								elseif x >= 101 and x < 1000 then
									mioFld[myNome]["целостность"][tostring(i)] = tonumber(string.format("%d", tonumber(mioFld[myNome]["целостность"][tostring(i)]) - (x/10)))
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
								elseif x >= 1000 and x < 5000 then
									resObj(i,myNome,myNome)
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
								elseif x >= 5000 and x < 9500 then
									resObj(i,myNome,myNome)
									resObj(i,myNome,myNome)
									resObj(i,myNome,myNome)
									resObj(i,myNome,myNome)
									resObj(i,myNome,myNome)
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
								elseif x >= 9500 and x < 9990 then
									mioFld[myNome]["целостность"][tostring(i)] = tonumber(string.format("%d", tonumber(mioFld[myNome]["целостность"][tostring(i)]) + (x/10)))
									resObj(i,myNome,myNome)
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
								elseif x >= 9991 and x <= 10000 then
									mioFld[myNome]["целостность"][tostring(i)] = tonumber(mioFld[myNome]["целостность"][tostring(i)])+tonumber(mioFld[myNome]["целостность"][tostring(i)])
									resObj(i,myNome,myNome)
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
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
	if timeElapsed > 1 then
		timeElapsed = 0
		--print(Minimap:GetPingPosition())
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		for i = 1,100 do
			if mioFld ~= nil then
				if mioFld[myNome] ~= nil then
					if mioFld[myNome]["объекты"] ~= nil then
						if mioFld[myNome]["объекты"][tostring(i)] == "bn" and tonumber(mioFld[myNome]["целостность"][tostring(i)]) < 999 then
							mioFld[myNome]["целостность"][tostring(i)] = tonumber(mioFld[myNome]["целостность"][tostring(i)])+1
							if fBtn[i]:IsVisible() and nome == myNome then
								dmgText(mioFld[myNome]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
							end
						end
					end
				end
			end
		end
		if testQ["zavod"] == 1 then
			if testQ["beton"] == nil then
				testQ["beton"] = 0.01
			else
				testQ["beton"] = tonumber(testQ["beton"])+0.01
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bt.ogg")
				dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
			end
		end
		if testQ[myNome]["dTimer"] == nil then
			testQ[myNome]["dTimer"] = {}
		end
		if testQ[myNome]["dTimer"][tonumber(date("%d"))] == nil then
			testQ[myNome]["dTimer"][tonumber(date("%d"))] = 1
		else
			testQ[myNome]["dTimer"][tonumber(date("%d"))] = testQ[myNome]["dTimer"][tonumber(date("%d"))] + 1
		end
		if testQ[myNome]["hTimer"] ~= nil then
			local nome
			if testQ['sign'] ~= "1" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			if fBtn[1] ~= nil and fBtn[1]:IsVisible() then
				for i = 1, 100 do
					if mioFld[nome]["объекты"][tostring(i)] ~= nil and mioFld[nome]["объекты"][tostring(i)] == "h" then
						dmgText(testQ[myNome]["hTimer"],fBtn[i],i,13,"ff0000")
						dmG[i]:Show()
					end
				end
			end
			testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 1
			if tonumber(testQ[myNome]["hTimer"]) <=1 then
				testQ[myNome]["hTimer"] = nil
				if fBtn[1] ~= nil and fBtn[1]:IsVisible() then
					for i = 1, 100 do
						if mioFld[nome]["объекты"][tostring(i)] == "h" then
							dmgText("",fBtn[i],i,13,"ff0000")
						end
					end
				end
			end
		end
		if testQ["gTimer"] ~= nil then
			gtg:SetText(testQ["gTimer"])
			testQ["gTimer"] = testQ["gTimer"] - 1
		end
		if testQ["gTimer"] == 0 then
			gtg:SetText("")
			gtg:Enable()
			testQ["gTimer"] = nil
		end

		if testQ["эвент3"] == 0 then
			if myNome ~= "Витинари" then
				local w = GetScreenWidth()
				local testKont = tostring(GetCurrentMapContinent())
				local testLok = tostring(GetCurrentMapZone())
				local x,y = GetPlayerMapPosition("player")
				local x1,y1 = GetPlayerMapPosition("Витинари")
				if tonumber(testKont) == tonumber(testQ["эвент3_k"]) and tonumber(testLok) == tonumber(testQ["эвент3_l"]) then
					local mioCel=sqrt((x-x1)^2+(y-y1)^2)
					event3(1,(((0.999-mioCel)*w)/0.999)+100,"show")
					if mioCel <= tonumber(mapTables["lokRasstoyanie"][testKont][testLok])*2 then
						SendAddonMessage("clientEvent3Win","", "guild")
					end
				else
					event3(1,1,"hide")
				end
			end
		end
		if testQ["эвент1_запущен"] == 0 then
			if mapTables[testQ["эвент1"]] ~= nil then
				for k, v in pairs(mapTables[testQ["эвент1"]]) do
					if type(k)=="string" then
					tKont = k
				end
					for k, v in pairs(mapTables[testQ["эвент1"]][k]) do
						if type(k)=="string" then
							tLok = k
						end
					end
				end
				local testKont = tostring(GetCurrentMapContinent())
				local testLok = tostring(GetCurrentMapZone())
				local x,y = GetPlayerMapPosition("player")
				if testKont == tKont and testLok == tLok then

					for i=1,100 do
						if testQ["event1"] ~= nil then
							if testQ["event1"][i] ~= 9999 then
								if iconRisBO[tonumber(testQ["event1"][i])] == nil then
									bo(tonumber(testQ["event1"][i]),testQ["boDiam"])
								end
								if not iconRisBO[tonumber(testQ["event1"][i])]:IsVisible() then
									iconRis[tonumber(testQ["event1"][i])]:Show()
								end
							end
						end
					end

					local mioCel1
					for i=1,100 do
						if testQ["event1"] ~= nil then
							if testQ["event1"][i] ~= 9999 then
								mioCel1=sqrt((x-tonumber(mapTables[testQ["эвент1"]][tKont][tLok][tostring(testQ["event1"][i])]["x"]))^2+(y-tonumber(mapTables[testQ["эвент1"]][tKont][tLok][tostring(testQ["event1"][i])]["y"]))^2)
							end
						end
						if mioCel1 ~= nil then
							if mioCel1 <= tonumber(mapTables["lokRasstoyanie"][tKont][tLok])*3 then
								SendChatMessage("Нашел!!!", "OFFICER", nil, 1)
								PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
								if iconRis[tonumber(testQ["event1"][i])] ~= nil then
									iconRis[tonumber(testQ["event1"][i])]:Hide()
								end
								testQ["event1"][i] = 9999
								SendAddonMessage("clientEvent1Fail",i, "guild")
							end
						end
					end

				else
					for i=1,100 do
						if iconRis[i] ~= nil then
							iconRis[i]:Hide()
						end
					end
				end
				if not WorldMapFrame:IsVisible() then
					for i=1,100 do
						if iconRis[i] ~= nil then
							iconRis[i]:Hide()
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
	if timeElapsed > 0.5 then
		timeElapsed = 0
		if testQ["mail"] ~= nil then
			AutoLootMailItem(1)
			MailItem1Button:Click()
			OpenMailDeleteButton:Click()
			StaticPopup1Button2:Click()
		end
		--[[if WorldMapFrame:IsVisible() then
			if myMap == nil then
				myMap = CreateFrame("Button")
				myMap:SetPoint("BOTTOMLEFT",WorldMapDetailFrame,"BOTTOMLEFT",0,0)
				myMap:SetSize(449, 300)
				myMap:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\map.tga")
				myMap:SetFrameStrata("FULLSCREEN_DIALOG")

				myMap:SetScript("OnClick",function(self)
					local x,y = GetCursorPosition()
					local testKont = GetCurrentMapContinent()
					testKont = tostring(testKont)
					local lok = GetCurrentMapZone()
					lok = tostring(lok)
					if marsh == nil then
						marsh = {}
					end
					if marsh[tostring(testKont)] == nil then
						marsh[tostring(testKont)] = {}
					end
					if marsh[tostring(testKont)][tostring(lok)] == nil then
						marsh[tostring(testKont)][tostring(lok)] = {}
					end

					if marsh[tostring(testKont)][tostring(lok)]["1"] == nil then
						marsh[tostring(testKont)][tostring(lok)]["1"] = {}
						marsh[tostring(testKont)][tostring(lok)]["1"]["x"] = (x-17)/449
						marsh[tostring(testKont)][tostring(lok)]["1"]["y"] = 1-((y-359)/301)
					else
						local tablen = tablelength(marsh[tostring(testKont)][tostring(lok)])
						if marsh[tostring(testKont)][tostring(lok)][tostring(tablen+1)] == nil then
							marsh[tostring(testKont)][tostring(lok)][tostring(tablen+1)] = {}
							marsh[tostring(testKont)][tostring(lok)][tostring(tablen+1)]["x"] = (x-17)/449
							marsh[tostring(testKont)][tostring(lok)][tostring(tablen+1)]["y"] = 1-((y-359)/301)
						end
					end

					print (tablelength(marsh[tostring(testKont)][tostring(lok)]))
				end)
			end
			if myMap ~= nil and not myMap:IsVisible() then
				myMap:Show()
			end
		else
			if myMap ~= nil and myMap:IsVisible() then
				myMap:Hide()
			end
		end--]]

		if mapTables ~= nil then
			if mapTables["nMapPoint"] ~= nil then
				if testQ ~= nil then
					if testQ["nPoint"] ~= nil then
						for k, v in pairs(mapTables["nMapPoint"][tostring(testQ["nPoint"])]) do
							if type(k)=="string" then
								tKont = k
							end
							for k, v in pairs(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont]) do
								if type(k)=="string" then
									tLok = k
								end
							end
						end
						local face = GetPlayerFacing()
						local x,y = GetPlayerMapPosition("player")
						local testKont = tostring(GetCurrentMapContinent())
						local testLok = tostring(GetCurrentMapZone())
						if mapTables ~= nil then
							if mapTables["lokRasstoyanie"] ~= nil then
								if mapTables["lokRasstoyanie"][testKont] ~= nil then
									if mapTables["lokRasstoyanie"][testKont][testLok] ~= nil then
										if testKont == tostring(tKont) and testLok == tostring(tLok) then
											local mioCel = sqrt((x-tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["x"]))^2+(y-tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["y"]))^2)
											if mioCel <= (tonumber(mapTables["lokRasstoyanie"][testKont][testLok]))*2 and (face < tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["f"])-0.3 or face > tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["f"])+0.3) then
												PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\sh.ogg")
												if face > tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["f"])-0.8 and face < tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["f"])+0.7 then
												end
											end

										end
									end
								end
							end
						end
					end
				end
			end
		end

		if VerF == nil or not VerF:IsVisible() then
			if testQ["fontVers"] ~= nil then
				testQ["fontVers"]=nil
			end
		end
		if testQ["vers"] ~= nil then
			if tostring(versAdd) ~= tostring(testQ["vers"]["2"]) then
				if VerF == nil or not VerF:IsVisible() then
					if testQ["fontVers"] == nil then
						testQ["fontVers"]=5
					end
					versFail(testQ["fontVers"])
					btn[990]:SetPoint("CENTER", VerF, "CENTER", -400, 470)
					btn[990]:Show()
				end
				if VerF ~= nil and VerF:IsVisible() then
					if testQ["VerF"] ~= nil and testQ["VerF"] ~= 600 then
						testQ["VerF"] = testQ["VerF"] - 1
						VerF:SetPoint("CENTER", UIParent, "CENTER", testQ["VerF"], -355)
						VerF:SetFont('Fonts\\FRIZQT__.TTF', testQ["fontVers"])
					end
				end
			else
				if VerF ~= nil and VerF:IsVisible() then
					VerF:Hide()
					btn[990]:Hide()
				end
			end
		end
		if testQ["enWorld"] ~= nil then
			local timer = time()
			if timer >= tonumber(testQ["enWorld"])+5 then
				debuffMove(myNome)
				testQ["enWorld"] = nil
			end
		end
		if testQ ~= nil then
			if testQ[myNome] ~= nil then
				if testQ[myNome]["настройки"] == nil then
					testQ[myNome]["настройки"]={}
				end
				if testQ[myNome]["настройки"]["watch"]=="Enable" then
					WatchFrame:Hide()
				end
				if testQ[myNome]["настройки"]["watch"]=="Disable" then
					WatchFrame:Show()
				end
			end
		end

		if editB[1]:IsVisible() or editB[2]:IsVisible() or editB[3]:IsVisible() then
			GameTooltip:Hide()
		end

		if WorldMapFrame:IsVisible() then
			if krt == nil then
				krt = {}
			end
			if krt["777"] == nil then
				if krt["podskazki"] ~= nil then
					if krt["chernila"] ~= nil then
						local yrez,x,y,rezPod,rez,lenRez,podChast
						local r = {}
						podChast = krt["podskazki"]
						for i=1, tablelength(krt["chernila"]) do
							x,y=tabellaEnStr(i,podChast)
							podChast = podChast - y
							r[i] = x
							if yrez == nil then
								yrez=tonumber(y)
							else
								yrez = yrez + tonumber(y)
							end
							rezPod = tonumber(krt["podskazki"])
							if yrez >= rezPod then
								break
							end
						end
						lenRez = tablelength(r)
						rez = r[1]
						for i=2,lenRez do
							rez = rez .. "\n" .. r[i]
						end
						btnF.tooltip=rez
					end
				end
			end
			if krt["777"] == nil then
				local testKont = GetCurrentMapContinent()
				testKont = tostring(testKont)
				local testLok = GetCurrentMapZone()
				testLok = tostring(testLok)
				local zoneName = GetMapInfo()
				if zoneName == "Ragefire" then
					testKont = "99"
					lok = "1"
				end
				local x,y = GetPlayerMapPosition("player")
				if testQ["chD"] == nil then
					testQ["chD"] = {}
				end
				for i=1,15 do
					j = tostring(i)
					if krt["chernila"]== nil then
						krt["chernila"] = {}
					end
					if krt["chernila"][j] ~= nil then
						if testQ["chD"][j] == nil then
							local kont, lok, x1, y1, m, c = krtChernGetXY(j)
							if testKont == kont then
								if testLok == lok then
									local mioCel=sqrt((x-x1)^2+(y-y1)^2)
									if mioCel <= 0.0011 then
										SendChatMessage(txtXor(m), "OFFICER", nil, 1)
										if krt["999"] == nil then
											krt["999"] = 1
										else
											krt["999"] = krt["999"]+1
										end
										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\q.ogg")
										testQ["chD"][j] = 1
										btnF.tooltip = "Подсказки:\n"
									end
								end
							end
						end
					end
				end
			end
			if testQ ~= nil then
				if testQ["mapQuest"] ~= nil then
					if testQ["mapQuest"]["текущий"] ~= nil and testQ["mapQuest"]["текущий"] ~= "9999" then
						local testKont = GetCurrentMapContinent()
						testKont = tostring(testKont)
						local testLok = GetCurrentMapZone()
						testLok = tostring(testLok)
						local zoneName = GetMapInfo()
						if zoneName == "Ragefire" then
							testKont = "99"
							lok = "1"
						end
						local x,y = GetPlayerMapPosition("player")
						local kont, lok, x1, y1, m = mapQuest(testQ["mapQuest"]["текущий"])
						if testKont == kont then
							if testLok == lok then
								local mioCel=sqrt((x-x1)^2+(y-y1)^2)
								if mioCel <= 0.0011 then
									SendChatMessage(txtXor(m), "OFFICER", nil, 1)
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\q.ogg")
									testQ["mapQuest"]["список"][testQ["mapQuest"]["текущий"]] = "9999"
									testQ["mapQuest"]["текущий"] = "9999"
								end
							end
						end
					end
				end
			end
		end

		if testQ["проверка_версии"] == nil then
			testQ[myNome]["zzlf"]=0
		end
		if testQ["проверка_версии"] == nil then
			testQ["проверка_версии"] = 1
		end
		if testQ[myNome]["sdvig"] == 1 then
			local x,y = GetPlayerMapPosition("player")
			if x ~= testQ[myNome]["sdvigx"] or y ~= testQ[myNome]["sdvigy"] then
				PlaySoundFile("Interface\\AddOns\\NSQC\\gob.ogg")
			end

		end
		if testQ["старт"] == 0 then
			if testQ["start"]==nil then
				testQ["start"] = testQ["tempStartT"]
			end
			local testKont = GetCurrentMapContinent()
			testKont = tostring(testKont)
			local lok = GetCurrentMapZone()
			lok = tostring(lok)
			local x,y = GetPlayerMapPosition("player")
			local par1 = testQ["start"]
			local tKont,tLok
			local zoneName = GetMapInfo()
			if zoneName == "Ragefire" then
				testKont = "99"
				lok = "1"
			end
			for k, v in pairs(mapTables[testQ["start"]]) do
				if type(k)=="string" then
				tKont = k
			end
				for k, v in pairs(mapTables[testQ["start"]][k]) do
					if type(k)=="string" then
						tLok = k
					end
				end
			end
			if mapTables[testQ["start"]] ~= nil then
				if mapTables[testQ["start"]][testKont] ~= nil then
					if mapTables[testQ["start"]][testKont][lok] ~= nil then
						if tLok == lok then
							if testKont == tKont then
								local mioCel=sqrt((x-mapTables[testQ["start"]][testKont][lok]["1"]["x"])^2+(y-mapTables[testQ["start"]][testKont][lok]["1"]["y"])^2)
								if mioCel < tonumber(mapTables["lokRasstoyanie"][tKont][tLok])*2 then
									PlaySoundFile("Interface\\AddOns\\NSQC\\start.ogg")
									testQ["marshF"] = {}
									testQ["marshF"][1] = 1
									testQ["старт"]=1
									SendChatMessage("Старт маршрута", "OFFICER", nil, 1)
									marshruT = {}
								end
							end
						end
					end
				end
			end
		end
	end

		if testQ["старт"] ~= nil and testQ["старт"] == 1 then
			local par1 = testQ["start"]
			for k, v in pairs(mapTables[testQ["start"]]) do
				if type(k)=="string" then
				tKont = k
			end
				for k, v in pairs(mapTables[testQ["start"]][k]) do
					if type(k)=="string" then
						tLok = k
					end
				end
			end
			local xxx = (testMarsh(par1,tonumber(mapTables["lokRasstoyanie"][tKont][tLok])*3))
			if xxx < 1 then
				if marshruT ~= nil then
					for i=1,9999 do
						if marshruT[i] ~= nil then
							marshruT[i]:Hide()
						end
					end
				end
				marshruT = nil
				testQ["tempStartT"] = testQ["start"]
				if testQ[testQ["start"]] ~= nil then
					testQ[testQ["start"]]=nil
				end
				if testQ["start"] ~= "evO3" then
					SendChatMessage("Ой! Не туда!!!", "OFFICER", nil, 1)
					PlaySoundFile("Interface\\AddOns\\NSQC\\gob.ogg")
				end
				testQ["num"] = nil
				testQ["marshF"] = nil
				testQ["старт"] = 0
			end
		end
end)

local txtNum = 1
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 0.01 then
		timeElapsed = 0
		if WorldMapFrame:IsVisible() then
			local zon = GetZoneText()
			if zon == "Огненная пропасть" then
				local mx,my = Minimap:GetPingPosition()
				op(1,625-(mx*165),580-(my*165),"show")
				PlayerArrowFrame:Show()
				PlayerArrowFrame:SetFrameStrata("TOOLTIP")
			else
				op(1,0,0,"hide")
			end
		end
		if MailFrame:IsVisible() and not SendMailFrame:IsVisible() then
			if not btn[988]:IsVisible() then
				btn[988]:Show()
			end
		else
			if btn[988]:IsVisible() then
				btn[988]:Hide()
			end
			testQ["mail"] = nil
		end
		if testQ["mail"] == 1 then
			if btn[988]:IsVisible() then
				btn[988]:SetText("..сбор..")
			end
		else
			if btn[988]:IsVisible() then
				btn[988]:SetText("ЗАБРАТЬ ВСЕ")
			end
		end
		if testQ["zarplata"] ~= nil then
			for i = 1, 100 do
				if mioFld[myNome]["петы"] ~= nil then
					if mioFld[myNome]["петы"][tostring(i)] ~= nil then
						pet = mysplit(mioFld[myNome]["петы"][tostring(i)])
					end
					if pet ~= nil then
						if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gom" then
							local x = math.random(1,2)
							if x == 2 then
								local xx = math.random(1,500)
								gKam(myNome,xx)
								fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gomZ.tga")
							end
						end
						if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gob" then
							local xx = math.random(1,500)
							gKam(myNome,xx)
							fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gobZ.tga")
							if x == 1 then
									SendAddonMessage("gobXm " .. i, myNome, "guild")
							end
						end
					end
				end
			end
			testQ["zarplata"] = tonumber(testQ["zarplata"])-1
			if tonumber(testQ["zarplata"]) <= 0 then
				testQ["zarplata"] = nil
				for i = 1, 100 do
					if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gom" then
						fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m.tga")
					end
					if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gob" then
						fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m.tga")
					end
				end
			end
		end

		if AuctionFrame ~= nil and AuctionFrame:IsVisible() then
			ml()
		else
			if aucBtn ~= nil then
				aucBtn:Hide()
			end
		end

		if testQ ~= nil then
			if testQ["brevna"] == nil then
				testQ["brevna"] = 0
			end
			if testQ["stog"] == nil then
				testQ["stog"] = 0
			end
			if testQ["kamen"] == nil then
				testQ["kamen"] = 0
			end
			if testQ["beton"] == nil then
				testQ["beton"] = 0
			end
			if testQ["smg"] == nil then
				testQ["smg"] = 0
			end
		end
		if StaticPopup1~= nil then
			StaticPopup1:SetFrameStrata("TOOLTIP")
			StaticPopup1Button1:SetFrameStrata("TOOLTIP")
			StaticPopup1Button2:SetFrameStrata("TOOLTIP")
		end

		if not fBtn[1]:IsVisible() then
			if dmG[101] ~= nil and dmG[101]:IsVisible() then
				for i = 1, 100 do
					if dmG[i] ~= nil then
						dmG[i]:Hide()
					end
				end
			end
		end

		if testQ[myNome]["взятый_квест_s"] == "q33" then
			if testQ[myNome]["q33nik"][1] == 1 and testQ[myNome]["q33nik"][2] == 1 and testQ[myNome]["q33nik"][3] == 1 then
				testQ[myNome]["q33end"] = 1
			end
		end
		if testQ == nil then
			testQ = {}
		end
		if testQ[myNome] == nil then
			testQ[myNome] = {}
		end
		if testQ[myNome]["петы"] == nil then
			testQ[myNome]["петы"] = {}
		end
		--bdf(myNome)
		--if UnitAffectingCombat("player") == 1 then
			--if GetRaidTargetIndex("target") ~= 8 then
				--SetRaidTarget("target",8)
			--end
		--end
		--if UnitAffectingCombat("player") == 1 then
			--if GetRaidTargetIndex("mouseover") ~= 4 and GetRaidTargetIndex("mouseover") ~= 8 then
				--SetRaidTarget("mouseover",4)
			--end
		--end
		if resursy[1] ~= nil and resursy[1]:IsVisible() then
			if dmG[101] == nil or not dmG[101]:IsVisible() then
				dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
				dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
				dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
				dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
				dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
			end
			for i = 101, 200 do
				if dmG[i] ~= nil then
					dmG[i]:Show()
				end
			end
		end
		if fBtn[1]:IsVisible() then
			for i = 1, 100 do
				if resursy[i] ~= nil then
					if not resursy[i]:IsVisible() then
						resursy[i]:Show()
					end
				end
			end

			for i = 1,100 do
				if resursy[i] ~= nil then
					for j = 1,100 do
						fBtn[i]:SetFrameStrata("FULLSCREEN")
					end
					resursy[i]:SetFrameStrata("FULLSCREEN")
				end
			end
		else
			for i = 1, 100 do
				if resursy[i] ~= nil then
					if resursy[i]:IsVisible() then
						resursy[i]:Hide()
					end
				end
			end
		end

		if GuildFrame:IsVisible() and not GuildMemberDetailFrame:IsVisible() and fBtn[1]:IsVisible() then
			for i=1,100 do
				fBtn[i]:Hide()
			end
			for i = 1, 100 do
				if resursy[i] ~= nil then
					if resursy[i]:IsVisible() then
						resursy[i]:Hide()
					end
				end
			end
			btn[989]:ClearAllPoints()
			btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
			btn[989]:Hide()
			testQ['sign'] = nil
		end
		if testQ["fRand2"] ~= nil and testQ["fRand2name"] == myNome then
			local nome
			if GuildFrame:IsVisible() or testQ['sign'] == "1" then
				if not GuildFrameLFGButton:GetChecked() or testQ['sign'] == "1" then
					if testQ['sign'] ~= "1" then
						nome = GuildFrame["selectedName"]
					else
						nome = myNome
					end
					if not fBtn[1]:IsVisible() then
						for i=1,100 do
							j = tostring(i)
							fBtn[i]:Show()
							btn[989]:ClearAllPoints()
							btn[989]:SetPoint("BOTTOMLEFT", fBtn[10],"TOPRIGHT",0, 0)
							if mioFld ~= nil then
								if mioFld[nome] ~= nil then
									if mioFld[nome]["объекты"] ~= nil then
										fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][j] .. ".tga")
									end
								end
							end
						end
					end
				end
			end
			testQ["fRand2"] = nil
			testQ["fRand1"] = nil
			testQ["fRand2name"] = nil
			FriendsFrame:Hide()
		end
			if (GuildFrame["selectedName"] ~= nil and testQ["fRandDbnome"] ~= nil) or testQ['sign'] == "1" then
				if (GuildFrame["selectedName"] == testQ["fRandDbnome"]) or (testQ['sign'] == "1" and testQ["fRandDbnome"] == myNome) then
					if testQ["fRandDb"] ~= nil then
						for i = 1, 100 do
							local pet
							if testQ["fRandDbnome"] ~= nil then
								if mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)] ~= nil then
								pet = mysplit(mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)])
							end
							end
							if pet ~= nil then
								if pet[1] == "bb" then
									fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
									testQ["fRandDb"] = nil
									testQ["fRandDbnome"] = nil
									pet = nil
								end
							end
						end
					end
				end
			end
			if (GuildFrame["selectedName"] ~= nil and testQ["fRandD1nome"] ~= nil) or testQ['sign'] == "1" then
				if (GuildFrame["selectedName"] == testQ["fRandD1nome"]) or (testQ['sign'] == "1" and testQ["fRandD1nome"] == myNome) then
					if testQ["fRandD1"] == 1 then
						for i=1,35 do
							j = tostring(i)
							local pet
							if testQ["fRandDbnome"] ~= nil then
								if mioFld ~= nil then
									if mioFld[testQ["fRandDbnome"]]["петы"] ~= nil then
										if mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)] ~= nil then
											pet = mysplit(mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)])
											fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. pet[1] .. ".tga")
										end
									end
								end
								testQ["fRandDbnome"] = nil
							end
							if mioFld ~= nil then
								fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRandD1nome"]]["объекты"][tostring(i)] .. ".tga")
								fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRandD1nome"]]["объекты"][tostring(i)] .. ".tga")
								fBtn[i]:Show()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", fBtn[10],"TOPRIGHT",0, 0)
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "hs" and mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "hx" and mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "sx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "hs" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 9999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "zx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 19999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "sx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 29999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
							end
							testQ["fRandD1"] = nil
						end
					end
					if testQ["fRandD2"] == 1 then
						for i=36,70 do
							j = tostring(i)
							local pet
							if mioFld ~= nil then
								if testQ["fRandDbnome"] ~= nil then
									if mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)] ~= nil then
										pet = mysplit(mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)])
										fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. pet[1] .. ".tga")
									end
								end
								fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRandD1nome"]]["объекты"][tostring(i)] .. ".tga")
								fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRandD1nome"]]["объекты"][tostring(i)] .. ".tga")
								fBtn[i]:Show()
								FriendsFrame:Hide()
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "hs" and mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "hx" and mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "sx"  then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "hs" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 9999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "zx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 19999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "sx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 29999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
							end
						end
						testQ["fRandD2"] = nil
					end
					if testQ["fRandD3"] == 1 then
						for i=71,100 do
							j = tostring(i)
							local pet
							if mioFld ~= nil then
								if testQ["fRandDbnome"] ~= nil then
									if mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)] ~= nil then
										pet = mysplit(mioFld[testQ["fRandDbnome"]]["петы"][tostring(i)])
										fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. pet[1] .. ".tga")
									end
								end
								fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRandD1nome"]]["объекты"][tostring(i)] .. ".tga")
								fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRandD1nome"]]["объекты"][tostring(i)] .. ".tga")
								fBtn[i]:Show()
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "hs" and mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "hx" and mioFld[testQ["fRandD1nome"]]["объекты"][j] ~= "sx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "hs" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 9999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "zx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 19999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
								if mioFld[testQ["fRandD1nome"]]["объекты"][j] == "sx" then
									if tonumber(mioFld[testQ["fRandD1nome"]]["целостность"][j]) < 29999 then
										dmgText(mioFld[testQ["fRandD1nome"]]["целостность"][j],fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									else
										dmgText("",fBtn[i],i,13,"FF8C00")
										dmG[i]:Show()
									end
								end
							end
						end
						testQ["fRandD3"] = nil
						testQ["fRandD1nome"] = nil
					end
				end
			end
			if (GuildFrame["selectedName"] ~= nil and testQ["fRand3Nome"] ~= nil) or testQ['sign'] == "1" then
				if (GuildFrame["selectedName"] == testQ["fRand3Nome"]) or (testQ['sign'] == "1" and testQ["fRand3Nome"] == myNome) then
					if testQ["fRand3"] == 1 then
						local nome
						if testQ['sign'] ~= "1" then
							nome = GuildFrame["selectedName"]
						else
							nome = myNome
						end
						if mioFld ~= nil then
							if testQ["fRand3Nome"] == nome then
								if fBtn[1] ~= nil or fBtn[1]:IsVisible() then
									for i = 1,100 do
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "hs" and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "zs" and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "sx" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "hs" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 9999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "tc" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 4999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "zx" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 19999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "zs" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 19999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "sx" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 29999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
									end
								end
								testQ["fRand3"] = nil
								testQ["fRand3Nome"] = nil
							end
						end
					end
				end
			end
			if (GuildFrame["selectedName"] ~= nil and testQ["fRand4Nome"] ~= nil) or testQ['sign'] == "1" then
				if (GuildFrame["selectedName"] == testQ["fRand4Nome"]) or (testQ['sign'] == "1" and testQ["fRand4Nome"] == myNome) then
					if testQ["fRand4"] == 1 then
						local nome
						if testQ['sign'] ~= "1" then
							nome = GuildFrame["selectedName"]
						else
							nome = myNome
						end
						if mioFld ~= nil then
							if nome == testQ["fRand4Nome"] then
								if fBtn[1] ~= nil or fBtn[1]:IsVisible() then
									for i = 1,100 do
										j = tostring(i)
										fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRand4Nome"]]["объекты"][j] .. ".tga")
										fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRand4Nome"]]["объекты"][j] .. ".tga")
										--fBtn[i]:SetHighlightTexture("")
										if tonumber(mioFld[testQ["fRand4Nome"]]["целостность"][tostring(i)]) < 999 then
											dmgText(mioFld[testQ["fRand4Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
											dmG[i]:Show()
										else
											if dmG[i]~=nil then
												dmG[i]:Hide()
											end
										end
									end
								end
							end
						end
						testQ["fRand4"] = nil
						testQ["fRand4Nome"] = nil
					end
				end
			end
			if (GuildFrame["selectedName"] ~= nil and testQ["fRand5Nome"] ~= nil) or testQ['sign'] == "1" then
				if (GuildFrame["selectedName"] == testQ["fRand5Nome"]) or (testQ['sign'] == "1" and testQ["fRand5Nome"] == myNome) then
					if testQ["fRand5"] == 1 then
						local nome
						if testQ['sign'] ~= "1" then
							nome = GuildFrame["selectedName"]
						else
							nome = myNome
						end
						if nome == testQ["fRand5Nome"] then
							if fBtn[1] ~= nil or fBtn[1]:IsVisible() then
								for i = 1,100 do
									j = tostring(i)
									if mioFld ~= nil then
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "hs" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "zs" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "zx" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "sx" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "tc" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 4999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "hs" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 9999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "zx" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 19999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "zs" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 19999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "sx" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 29999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["fRand5Nome"]]["объекты"][j] .. ".tga")
									end
								end
							end
						end
						testQ["fRand5"] = nil
						testQ["fRand5Nome"] = nil
					end
				end
			end

			if GuildFrame["selectedName"] ~= nil or testQ['sign'] == "1" then
				local nome
				if testQ['sign'] ~= "1" then
					nome = GuildFrame["selectedName"]
				else
					nome = myNome
				end
				if (GuildFrame["selectedName"] == myNome) or testQ['sign'] == "1" then
					if testQ["fRand6"] == 1 then
						if resursy[1] ~= nil and resursy[1]:IsVisible() then
							dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
							dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
							dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
							dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
							dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
						end
						testQ["fRand6"] = nil
					end
				end
			end

		if btn[6] == nil or not btn[6]:IsVisible() then
			btn[2]:Hide()
			btn[1]:Hide()
		end

		if mapTables ~= nil then
			if mapTables["nMapPoint"] ~= nil then
				if testQ ~= nil then
					if testQ["nPoint"] ~= nil then
						for k, v in pairs(mapTables["nMapPoint"][tostring(testQ["nPoint"])]) do
							if type(k)=="string" then
								tKont = k
							end
							for k, v in pairs(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont]) do
								if type(k)=="string" then
									tLok = k
								end
							end
						end
						local face = GetPlayerFacing()
						local x,y = GetPlayerMapPosition("player")
						local testKont = tostring(GetCurrentMapContinent())
						local testLok = tostring(GetCurrentMapZone())
						if mapTables ~= nil then
							if mapTables["lokRasstoyanie"] ~= nil then
								if mapTables["lokRasstoyanie"][testKont] ~= nil then
									if mapTables["lokRasstoyanie"][testKont][testLok] ~= nil then
										if face > tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["f"])-0.1 and face < tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["f"])+0.1 then
											local mioCel = sqrt((x-tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["x"]))^2+(y-tonumber(mapTables["nMapPoint"][tostring(testQ["nPoint"])][tKont][tLok]["y"]))^2)
											if mioCel <= (tonumber(mapTables["lokRasstoyanie"][testKont][testLok]))/2 then
												SetView(5)
												local x = math.random(1,2)
												if x == 1 then
													if iconQ[1] == nil or not iconQ[1]:IsVisible() then
														quesT("show")
														okNo:configure(1,"show")
														rtnTextF("Твое задание в другой точке",1,"show")
														--SendChatMessage("Мое задание в другой точке...", "guild", nil, 1)
													end
												end
												if x == 2 then
													if iconQ[1] == nil or not iconQ[1]:IsVisible() then
														quesT("show")
														okNo:configure(1,"show")
														rtnTextF("Получить задание",1,"show")
														--SendAddonMessage("NSGadd", "#zzs " .. versAdd, "guild")
														--SendChatMessage("ВOЖДЬ", "guild", nil, 1)
														--SendAddonMessage("NSGadd", "#questTimerID2", "guild")
													end
												end
											else
												rtnTextF("надпись",1,"hide")
												quesT("0")
												okNo:configure(1,"hide")
											end
										else
											rtnTextF("надпись",1,"hide")
											quesT("0")
											okNo:configure(1,"hide")
										end
									end
								end
							end
						end
					end
				end
			end
		end

		if testQ["marshS"] == 1 then
			local x,y = GetPlayerMapPosition("player")
			if testQ["marshK"] == nil then
				marSh()
			end
			local zoneName = GetMapInfo()
			local testKont = GetCurrentMapContinent()
			testKont = tostring(testKont)
			local lok = GetCurrentMapZone()
			lok = tostring(lok)
			if zoneName == "Ragefire" then
				testKont = "99"
				lok = "1"
			end
			if testQ["marshK"] ~= nil then
				local mioCel=sqrt((x-marsh[testQ["marshK"]][testQ["marshL"]][testQ["marshN"]]["x"])^2+(y-marsh[testQ["marshK"]][testQ["marshL"]][testQ["marshN"]]["y"])^2)
				local tKont = testKont
				local tLok = lok
				print (mioCel)
				--if mapTables["lokRasstoyanie"][tKont][tLok] ~= nil then
					--if mioCel >= tonumber(mapTables["lokRasstoyanie"][tKont][tLok])*2 then
						--marSh()
					--end
				--else
					--if mioCel >= 0.9 then
						--marSh()
					--end
				--end
			end
		end
		if testQ == nil then
			testQ = {}
		end
		if testQ[myNome] == nil then
			testQ[myNome] = {}
		end
		if testQ[myNome]["настройки"] == nil then
			testQ[myNome]["настройки"]={}
		end
		if testQ[myNome]["настройки"]["err"] == "Enable" then
			if UIErrorsFrame:IsVisible() then
				UIErrorsFrame:Hide()
			end
		else
			if not UIErrorsFrame:IsVisible() then
				UIErrorsFrame:Show()
			end
		end
		if testQ[myNome]["настройки"]["auk"] == "Enable" then
			if AuctionHouseFrameItemBuyFrameItemListScrollFrameButton1 ~= nil then

				AuctionHouseFrameItemBuyFrameBuyoutFrameBuyoutButton:SetPoint("CENTER", AuctionHouseFrameItemBuyFrameItemListScrollFrameButton1,"CENTER",-300, 0)
				AuctionHouseFrameItemBuyFrameBuyoutFrameBuyoutButton:SetFrameStrata("FULLSCREEN_DIALOG")

			end
			if StaticPopup1Button1:IsVisible() ~= nil and AuctionHouseFrameItemBuyFrameItemListScrollFrameButton1 ~= nil and AuctionHouseFrameItemBuyFrameItemListScrollFrameButton1:IsVisible() then

				StaticPopup1Button1:ClearAllPoints()
				StaticPopup1Button1:SetPoint("CENTER", AuctionHouseFrameItemBuyFrameItemListScrollFrameButton1,"CENTER",270, 0)
				StaticPopup1Button1:SetFrameStrata("TOOLTIP")

			end
		end
		if btn[991]:IsVisible() then
			if buffBTN == 1 then
				local x, y = GetCursorPosition()
				btn[991]:ClearAllPoints()
				local WFx,WFy = WorldFrame:GetSize()
				local UIx,UIy = UIParent:GetSize()
				btn[991]:SetPoint("BOTTOMLEFT", WorldFrame,"BOTTOMLEFT",x*(UIx/WFx), y*(UIy/WFy))
			end
			xx1,yy1,xx2,xx,yy=btn[991]:GetPoint(1)
			testQ["buffX"]=xx
			testQ["buffY"]=yy
		end

		if testQ["buffX"] == nil or testQ["buffX"] == 0 then
			btn[991]:ClearAllPoints()
			btn[991]:SetPoint("TOPRIGHT", BuffFrame,"TOPRIGHT",0, 0)
		else
			btn[991]:ClearAllPoints()
			btn[991]:SetPoint("CENTER", UIParent,"BOTTOMLEFT",testQ["buffX"], testQ["buffY"])
		end
		if testQ["cmbtTime"] ~= nil then
			if bcsQuickFrame[txtNum-1] ~= nil then
				bcsQuickFrame[txtNum-1]:Hide()
			end
			createQuickHtmlFrame(testQ["cmbtNum"],testQ["cmbtTime"],txtNum)
			if testQ["cmbtTime"] >=111 then
				bcsQuickFrame[txtNum]:Hide()
				testQ["cmbtTime"] = nil
			end
			if testQ["cmbtTime"] ~= nil then
				testQ["cmbtTime"] = testQ["cmbtTime"]+(elapsed*150)
			end
			txtNum = txtNum + 1
		end

		if testQ[myNome]["itemNum"] ~= nil then
			if SendMailMoneyButton:IsVisible() then
				local tempMail = {}
				local tempZag
				local tempZag1
				local tempCount = {}
				local tempRez = {}
				for i=1,tonumber(testQ[myNome]["itemNum"]) do
					tempMail[i],tempZag,tempCount[i],tempZag1 = GetSendMailItem(i)
					if tempMail[i] ~= nil then
						if tostring(tempMail[i]) == tostring(testQ[myNome]["itemName"]) then
							if tonumber(tempCount[i]) == tonumber(testQ[myNome]["itemEnStuck"]) then
								tempRez[i]=1
							end
						end
					end
				end
				if tempRez[1] ~= nil then
					local tempRez1 = tempRez[1]
					if tonumber(testQ[myNome]["itemNum"]) ~= 1 then
						if tempRez[2] ~= nil then
							for i=2,tonumber(testQ[myNome]["itemNum"]) do
								if tempRez[i] ~= nil then
									tempRez1 = tonumber(tempRez1) + tonumber(tempRez[i])
								end
							end
						end
					end
					if tonumber(tempRez1) == tonumber(testQ[myNome]["itemNum"]) then
						btn[995]:Show()
					else
						btn[995]:Hide()
					end
				end
			else
				btn[995]:Hide()
			end
		end
		if krt ~= nil then
			if krt["777"] == 2 then
				if testQ["start"] == nil then
					if mapTables["evO0102"] ~= nil then
						if testQ["evO0102"] ~= true then
							if krt["21"] ~= nil and krt["22"] ~=nil then
								if krt["21"] == true and krt["22"] == true then
									testFchern("evO0102",21,22)
								end
							end
						end
					end
					if mapTables["evO0203"] ~= nil then
						if testQ["evO0203"] ~= true then
							if krt["22"] ~= nil and krt["23"] ~=nil then
								if krt["22"] == true and krt["23"] == true then
									testFchern("evO0203",22,23)
								end
							end
						end
					end
					if mapTables["evO0304"] ~= nil then
						if testQ["evO0304"] ~= true then
							if krt["23"] ~= nil and krt["24"] ~=nil then
								if krt["23"] == true and krt["24"] == true then
									testFchern("evO0304",23,24)
								end
							end
						end
					end
					if mapTables["evO0405"] ~= nil then
						if testQ["evO0405"] ~= true then
							if krt["24"] ~= nil and krt["25"] ~=nil then
								if krt["24"] == true and krt["25"] == true then
									testFchern("evO0405",24,25)
								end
							end
						end
					end
					if mapTables["evO0506"] ~= nil then
						if testQ["evO0506"] ~= true then
							if krt["25"] ~= nil and krt["26"] ~=nil then
								if krt["25"] == true and krt["26"] == true then
									testFchern("evO0506",25,26)
								end
							end
						end
					end
					if mapTables["evO0607"] ~= nil then
						if testQ["evO0607"] ~= true then
							if krt["26"] ~= nil and krt["27"] ~=nil then
								if krt["26"] == true and krt["27"] == true then
									testFchern("evO0607",26,27)
								end
							end
						end
					end
					if mapTables["evO0708"] ~= nil then
						if testQ["evO0708"] ~= true then
							if krt["27"] ~= nil and krt["28"] ~=nil then
								if krt["27"] == true and krt["28"] == true then
									testFchern("evO0708",27,28)
								end
							end
						end
					end
					if mapTables["evO0809"] ~= nil then
						if testQ["evO0809"] ~= true then
							if krt["28"] ~= nil and krt["29"] ~=nil then
								if krt["28"] == true and krt["29"] == true then
									testFchern("evO0809",28,29)
								end
							end
						end
					end
					if mapTables["evO0910"] ~= nil then
						if testQ["evO0910"] ~= true then
							if krt["29"] ~= nil and krt["30"] ~=nil then
								if krt["29"] == true and krt["30"] == true then
									testFchern("evO0910",29,30)
								end
							end
						end
					end
					if mapTables["evO1011"] ~= nil then
						if testQ["evO1011"] ~= true then
							if krt["30"] ~= nil and krt["31"] ~=nil then
								if krt["30"] == true and krt["31"] == true then
									testFchern("evO1011",30,31)
								end
							end
						end
					end
					if mapTables["evO11"] ~= nil then
						if testQ["evO11"] ~= true then
							if krt["31"] ~= nil then
								if krt["31"] == true then
									testFchern("evO11",31,31)
								end
							end
						end
					end
					if mapTables["evO12"] ~= nil then
						if testQ["evO12"] ~= true then
							if krt["32"] ~= nil then
								if krt["32"] == true then
									testFchern("evO12",32,32)
								end
							end
						end
					end
					if mapTables["evO13"] ~= nil then
						if testQ["evO13"] ~= true then
							if krt["33"] ~= nil then
								if krt["33"] == true then
									testFchern("evO13",33,33)
								end
							end
						end
					end
					if mapTables["evO14"] ~= nil then
						if testQ["evO14"] ~= true then
							if krt["34"] ~= nil then
								if krt["34"] == true then
									testFchern("evO14",34,34)
								end
							end
						end
					end
				end
			end
		end

		if testQ["timerID2"] ~= nil then
			testQ["timerID2"] = tonumber(testQ["timerID2"])
			testQ["timerID2"] = testQ["timerID2"]-0.02
			local btnT1 = string.format("%02d", testQ["timerID2"])
			btn[2]:SetText(btnT1)
			btn[1]:SetText(btnT1)
			btn[1]:Disable()
			if testQ["timerID2"] <= 1 then
				testQ["timerID2"] = nil
			end
		end
		if testQ["timerID2"] == nil then
			if pokazat == 1 then
				btn[2]:SetText("Сдать квест")
				btn[1]:SetText("Взять квест")
				btn[1]:Enable()
			end
		end
		if pokazat == 0 then
			if testQ["miniMapConf"] ~= nil then
				myIconPos = testQ["miniMapConf"]
				minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)),(80 * sin(myIconPos)) - 52)
			end
		end
		local hourq = date("%M")
		hourq = tonumber(hourq)
		if hourq == 1 then
			ginv = nil
		end
		if myNome == "Веренс" or myNome == "Хэвлок" or myNome == "Витинари" then
			btn[999999]:Show()
		end

		local testKont = GetCurrentMapContinent()
		testKont = tonumber(testKont)
		local lok = GetCurrentMapZone()
		lok = tonumber(lok)

		if WorldMapFrame:IsVisible() ~= nil then
			if krt~=nil then
			if krt["777"] == nil then

				if lok ~= 0 then
					krt["5551"] = nil
					if krt["5551"] == nil then
						krtHide("Hide")
						krt["5551"] = 1
						krt["99"] = nil
						btnF:SetChecked(false)
					end
				else
					krt["5551"] = 1
				end

				if testKont ~= 1 then
					krt["5551"] = nil
					if krt["5551"] == nil then
						krtHide("Hide")
						krt["5551"] = 1
						krt["99"] = nil
						btnF:SetChecked(false)
					end
				else
					krt["5551"] = 1
				end
			elseif krt["777"] == 2 then
				local lok = GetCurrentMapZone()
				lok = tonumber(lok)
				if lok ~= 10 then
					krt["5551"] = nil
					if krt["5551"] == nil then
						krtHide("Hide")
						krt["5551"] = 1
						krt["99"] = nil
						btnF:SetChecked(false)
					end
				else
					krt["5551"] = 1
				end
			elseif krt["777"] == 3 then
				local zoneName = GetMapInfo()
				if zoneName == "Ragefire" then
					testKont = "99"
					lok = "1"
				else
					btnF:SetChecked(false)
					for i=1,krt["evO3"] do
						if iconRisEv3[i] ~= nil then
							iconRisEv3[i]:Hide()
						end
					end
				end
			end
			end
		end
		if testQ[myNome]["zzl"] ~= nil then
			if testQ[myNome]["btn3"] == 0 then
				btn[3]:Enable()
			else
				btn[3]:Enable()
			end
		end
		if testQ[myNome]["btn3"] == 1 then
			btn[3]:Enable()
		end
		if testQ[myNome]["btn4"] == 0 then
			btn[4]:Disable()
		else
			btn[4]:Enable()
		end
		if testQ[myNome]["zzlf"] ~= nil then
			if testQ[myNome]["zzlf"] >= bonusQuestF then
				testQ[myNome]["btn4"] = 1
				btn[3]:SetText("?")
				btn[4]:SetText("Сдать бонусный квест вне лимита")
			else
				testQ[myNome]["btn4"] = 0
				btn[4]:SetText("Принято игроков: " .. testQ[myNome]["zzlf"] .. " из " .. bonusQuestF)
			end
		else
			testQ[myNome]["zzlf"] = 0
		end

		if krt ~= nil then
			if krt["777"] ~= nil and krt["777"] == 2 then
				if krt["7770105"] == nil then
					krt["7770105"] = 0
				end
				if krt["7770502"] == nil then
					krt["7770502"] = 0
				end
				if krt["7770207"] == nil then
					krt["7770207"] = 0
				end
				if krt["7770703"] == nil then
					krt["7770703"] = 0
				end
				if krt["7770304"] == nil then
					krt["7770304"] = 0
				end
				if krt["7770415"] == nil then
					krt["7770415"] = 0
				end
				if krt["7771516"] == nil then
					krt["7771516"] = 0
				end
				if krt["7771613"] == nil then
					krt["7771613"] = 0
				end
				if krt["7771314"] == nil then
					krt["7771314"] = 0
				end
				if krt["7771409"] == nil then
					krt["7771409"] = 0
				end
				if krt["77709"] == nil then
					krt["77709"] = 0
				end
				if krt["77712"] == nil then
					krt["77712"] = 0
				end
				if krt["77706"] == nil then
					krt["77706"] = 0
				end
				if krt["77710"] == nil then
					krt["77710"] = 0
				end


				if krt["20105"] == nil then
					if krt["21"] == true and krt["25"] == true then
						krt["7770105"] = krt["7770105"] + 1
						krt["20105"] = 1
					end
				end
				if krt["20502"] == nil then
					if krt["25"] == true and krt["22"] == true then
						krt["7770502"] = krt["7770502"] + 1
						krt["20502"] = 1
					end
				end
				if krt["20207"] == nil then
					if krt["22"] == true and krt["27"] == true then
						krt["7770207"] = krt["7770207"] + 1
						krt["20207"] = 1
					end
				end
				if krt["20703"] == nil then
					if krt["27"] == true and krt["23"] == true then
						krt["7770703"] = krt["7770703"] + 1
						krt["20703"] = 1
					end
				end
				if krt["20304"] == nil then
					if krt["23"] == true and krt["24"] == true then
						krt["7770304"] = krt["7770304"] + 1
						krt["20304"] = 1
					end
				end
				if krt["20415"] == nil then
					if krt["24"] == true and krt["35"] == true then
						krt["7770415"] = krt["7770415"] + 1
						krt["20415"] = 1
					end
				end
				if krt["21516"] == nil then
					if krt["35"] == true and krt["36"] == true then
						krt["7771516"] = krt["7771516"] + 1
						krt["21516"] = 1
					end
				end
				if krt["21613"] == nil then
					if krt["36"] == true and krt["33"] == true then
						krt["7771613"] = krt["7771613"] + 1
						krt["21613"] = 1
					end
				end
				if krt["21314"] == nil then
					if krt["33"] == true and krt["34"] == true then
						krt["7771314"] = krt["7771314"] + 1
						krt["21314"] = 1
					end
				end
				if krt["21409"] == nil then
					if krt["34"] == true and krt["29"] == true then
						krt["7771409"] = krt["7771409"] + 1
						krt["21409"] = 1
					end
				end
				if krt["209"] == nil then
					if krt["29"] == true then
						krt["77709"] = krt["77709"] + 1
						krt["209"] = 1
					end
				end
				if krt["212"] == nil then
					if krt["32"] == true then
						krt["77712"] = krt["77712"] + 1
						krt["212"] = 1
					end
				end
				if krt["206"] == nil then
					if krt["32"] == true then
						krt["77706"] = krt["77706"] + 1
						krt["206"] = 1
					end
				end
				if krt["210"] == nil then
					if krt["32"] == true then
						krt["77710"] = krt["77710"] + 1
						krt["210"] = 1
					end
				end
			end
		end

		if WorldMapFrame:IsVisible()~=nil then
			btnF:Show()
		else
			btnF:Hide()
		end

		if testQ[myNome]["сброс"] ==  nil then
			btn[998]:Disable()
		else
			btn[998]:Enable()
		end

		if testQ[myNome]["отмена"] ==  nil then
			btn[997]:Disable()
		else
			btn[997]:Enable()
		end

		--testNpc("0xF1300040FE000778")
		local startNpvScan=time()
		startNpvScan=tonumber(startNpvScan)
		local startNpvScanRar = testQ[myNome]["старт_поиска_нпц"]
		startNpvScanRar = tonumber(startNpvScanRar)
		if testQ[myNome]["старт_поиска_нпц"] ~= nil and startNpvScanRar ~= nil and startNpvScan > startNpvScanRar+100 then
			testQ[myNome]["старт_поиска_нпц"] = nil
			testQ[myNome]["отключить_поиск"]=nil
			print ("Поиск включен")
		end

		if pokazatChk==0 then
				myCheckButton1:Hide()
				myCheckButton2:Hide()
				myCheckButton3:Hide()
				myCheckButton4:Hide()
				myCheckButton5:Hide()
				myCheckButton6:Hide()
				btn[998]:Hide()
				btn[997]:Hide()
		end
		if testQ[myNome]["настройки"] == nil then
			testQ[myNome]["настройки"] = {}
			testQ[myNome]["настройки"]["esc"]="Disable"
			testQ[myNome]["настройки"]["roll"]="Enable"
		end
		if testQ[myNome]["настройки"]["roll"]==nil or testQ[myNome]["настройки"]["roll"]=="Disable" then
			myCheckButton2:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["roll"]=="Enable" then
			myCheckButton2:SetChecked(true)
		end
		if testQ[myNome]["настройки"]["debuff"]==nil or testQ[myNome]["настройки"]["debuff"]=="Disable" then
			myCheckButton3:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["debuff"]=="Enable" then
			myCheckButton3:SetChecked(true)
		end
		if testQ[myNome]["настройки"]["watch"]==nil or testQ[myNome]["настройки"]["watch"]=="Disable" then
			myCheckButton4:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["watch"]=="Enable" then
			myCheckButton4:SetChecked(true)
		end
		if testQ[myNome]["настройки"]["auk"]==nil or testQ[myNome]["настройки"]["auk"]=="Disable" then
			myCheckButton5:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["auk"]=="Enable" then
			myCheckButton5:SetChecked(true)
		end
		if testQ[myNome]["настройки"]["err"]==nil or testQ[myNome]["настройки"]["err"]=="Disable" then
			myCheckButton6:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["err"]=="Enable" then
			myCheckButton6:SetChecked(true)
		end
		if debuffChkB ~= nil then
			for k, v in pairs(debuffChkB) do
				if debuffChkB[k] ~= nil then
					if testQ[myNome]["настройки"]["debuffChkB"] ~= nil then
						if testQ[myNome]["настройки"]["debuffChkB"][k] ~= nil then
							if testQ[myNome]["настройки"]["debuffChkB"][k] == nil or testQ[myNome]["настройки"]["debuffChkB"][k] == "Disable" then
								debuffChkB[k]:SetChecked(false)
							end
							if testQ[myNome]["настройки"]["debuffChkB"][k] == "Enable" then
								debuffChkB[k]:SetChecked(true)
							end
						end
					end
				end
			end
		end

		if testQ[myNome]["настройки"]["esc"]==nil or testQ[myNome]["настройки"]["esc"]=="Disable" then
			btn[3]:EnableKeyboard(0);
			myCheckButton1:EnableKeyboard(0);
			myCheckButton1:SetChecked(false)
		elseif testQ[myNome]["настройки"]["esc"]=="Enable" then
			myCheckButton1:SetChecked(true)
			btn[3]:EnableKeyboard(1);
			myCheckButton1:EnableKeyboard(1);
			btn[3]:SetScript("OnKeyDown",function(self,key)
			if GetBindingFromClick(key)=="TOGGLEGAMEMENU" then
				for ii=1,15 do
					btn[ii]:Hide();
				end
				btn[998]:Hide()
				btn[997]:Hide()
				btn[991]:Hide()
				pokazatChk=0
				pokazat=0
				minibtn:SetNormalTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetPushedTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetHighlightTexture("Interface\\AddOns\\NSQC\\emblem.tga")
			end
			end);
			myCheckButton1:SetScript("OnKeyDown",function(self,key)
				if GetBindingFromClick(key)=="TOGGLEGAMEMENU" then
				for ii=1,15 do
					btn[ii]:Hide();
				end
				showRB(myNome)
				myCheckButton1:Hide()
				myCheckButton2:Hide()
				myCheckButton3:Hide()
				myCheckButton4:Hide()
				myCheckButton5:Hide()
				myCheckButton6:Hide()
				btn[998]:Hide()
				btn[997]:Hide()
				btn[991]:Hide()
				pokazatChk=0
				minibtn:SetNormalTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetPushedTexture("Interface\\AddOns\\NSQC\\emblem.tga")
				minibtn:SetHighlightTexture("Interface\\AddOns\\NSQC\\emblem.tga")
			end
			end);
		end
		if testQ[myNome]["лотерея"]~=nil then
			testModLtr=testQ[myNome]["лотерея"]
			testModLtr=tonumber(testModLtr)
			testModLtr=testModLtr%3
		end
		if testQ[myNome]["лотерея"]~=nil then
			if testQ[myNome]["лотерея"]>=1 then
				btn[11]:Enable()
				btn[11]:SetText("Лотерея тремя кусками")
			end
		end
		if testQ[myNome]["лотерея"]~=nil then
			if testQ[myNome]["лотерея"]>=3 then
				btn[10]:Enable()
				btn[10]:SetText("Лотерея одним куском")
			end
		end
		if testQ[myNome]["лотерея"]==nil or testQ[myNome]["лотерея"]<1 then
			btn[11]:Disable()
			btn[10]:SetText("Нет билетов")
			btn[10]:Disable()
			btn[11]:SetText("Нет билетов")
		end
		if testQ[myNome]["лотерея"]~=nil and testModLtr~=0 then
			if testQ[myNome]["лотерея"]>=1 and testQ[myNome]["лотерея"]<3 then
				btn[10]:SetText("Нет билетов")
				btn[10]:Disable()
			end
			if testQ[myNome]["лотерея"]>=1 and testModLtr~=0 then
				btn[10]:SetText("Нет билетов")
				btn[10]:Disable()
			end
		end
		mioX,mioY = GetPlayerMapPosition("player");
		mioKont=GetCurrentMapContinent();
		mioKont=tonumber(mioKont)
		nKont=tonumber(nKont)
		mioLok=GetNumMapLandmarks();
		mioLok=tonumber(mioLok)
		nLok=tonumber(nLok)
		testBtnviz1=framePos["mapViz"]
		testBtnviz1=tonumber(testBtnviz1)
		testBtnviz2=GetCurrentMapAreaID()
		testBtnviz2=tonumber(testBtnviz2)
		if testBtnviz1~=testBtnviz2 then
			btn[99]:SetText("не тут")
			btn[99]:Disable()
		else
			btn[99]:SetText("тут")
			btn[99]:Enable()
		end
		if mioKont==nKont then
			if mioLok==nLok then
				if nXres ~= nil then
					if mioTime < 2 then
						mioTime=mioTime+1
						posmioX, posmioY = GetPlayerMapPosition("player");
						mioCel=sqrt((nXres-posmioX)^2+(nYres-posmioY)^2)
						if mioCel>0.01 then
							if testRasstoyanie~=1 then
								SendChatMessage("Я сбежал с маршрута", "OFFICER", nil, 1)
								testRasstoyanie=1
							else
							end
						else
							if testRasstoyanie~=0 then
								local hshStran3
								hshStran3=hshSenderNomeC(myNome)
								SendChatMessage(hshStran3 .. " Я вернулся на маршрут", "OFFICER", nil, 1)
								nXres=nil
								testRasstoyanie=0
							else
							end
						end

					elseif mioTime >= 2 then
						posmioXN, posmioYN = GetPlayerMapPosition("player");
						mioCel1=sqrt((nXres-posmioXN)^2+(nYres-posmioYN)^2)

						testBtnviz1=framePos["mapViz"]
						testBtnviz1=tonumber(testBtnviz1)
						testBtnviz2=GetCurrentMapAreaID()
						testBtnviz2=tonumber(testBtnviz2)
						if testBtnviz1==testBtnviz2 then

							if mioCel > mioCel1 then
								btn[99]:SetText("тепло")
								btn[99]:Enable()
							else
								btn[99]:SetText("холодно")
								btn[99]:Disable()
							end
							mioTime=1
						elseif testBtnviz1~=testBtnviz2 then
							btn[99]:SetText("не тут")
							btn[99]:Disable()
						end
					end
					end
				end
			end


end

end)


local uniquealyzer = 1;
function createCheckbutton(parent, x_loc, y_loc, displayname)
	uniquealyzer = uniquealyzer + 1;

	local checkbutton = CreateFrame("CheckButton", "my_addon_checkbutton_0" .. uniquealyzer, parent, "ChatConfigCheckButtonTemplate");
	checkbutton:SetPoint("CENTER", x_loc, y_loc);
	getglobal(checkbutton:GetName() .. 'Text'):SetText(displayname);

	return checkbutton;
end

myCheckButton1 = createCheckbutton(UIParent, -100, 350, "Выключение по Esc");
myCheckButton1.tooltip = "Скрывать ли аддон при нажатии на Esc - он будет перехватывать управление, пока включен";
myCheckButton1:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["esc"]=="Disable" or testQ[myNome]["настройки"]["esc"]==nil then
			testQ[myNome]["настройки"]["esc"]="Enable"
			myCheckButton1:SetChecked(true)
		elseif testQ[myNome]["настройки"]["esc"]=="Enable" then
			testQ[myNome]["настройки"]["esc"]="Disable"
			myCheckButton1:SetChecked(false)
		end
	end
);
myCheckButton3 = createCheckbutton(UIParent, -100, 310, "Скрыть панель дебафов");
myCheckButton3.tooltip = "Скрыть панель дебафов";
myCheckButton3:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["debuff"]=="Disable" or testQ[myNome]["настройки"]["debuff"]==nil then
			testQ[myNome]["настройки"]["debuff"]="Enable"
			myCheckButton3:SetChecked(true)
		elseif testQ[myNome]["настройки"]["debuff"]=="Enable" then
			testQ[myNome]["настройки"]["debuff"]="Disable"
			myCheckButton3:SetChecked(false)
		end
	end
);
myCheckButton4 = createCheckbutton(UIParent, -100, 290, "Скрыть список квестов");
myCheckButton4.tooltip = "Скрыть список квестов";
myCheckButton4:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["watch"]=="Disable" or testQ[myNome]["настройки"]["watch"]==nil then
			testQ[myNome]["настройки"]["watch"]="Enable"
			myCheckButton4:SetChecked(true)
		elseif testQ[myNome]["настройки"]["watch"]=="Enable" then
			testQ[myNome]["настройки"]["watch"]="Disable"
			myCheckButton4:SetChecked(false)
		end
	end
);

myCheckButton5 = createCheckbutton(UIParent, -100, 270, "Более удобная скупка товара на аукционе");
myCheckButton5.tooltip = "Более удобная скупка товара на аукционе";
myCheckButton5:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["auk"]=="Disable" or testQ[myNome]["настройки"]["auk"]==nil then
			testQ[myNome]["настройки"]["auk"]="Enable"
			myCheckButton5:SetChecked(true)
		elseif testQ[myNome]["настройки"]["auk"]=="Enable" then
			testQ[myNome]["настройки"]["auk"]="Disable"
			myCheckButton5:SetChecked(false)
		end
	end
);
myCheckButton6 = createCheckbutton(UIParent, -100, 250, "Скрывать сообщения об ошибках");
myCheckButton6.tooltip = "Не показывать сообщения о недостигших цели атаках, недостаточности ярости итд";
myCheckButton6:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["err"]=="Disable" or testQ[myNome]["настройки"]["err"]==nil then
			testQ[myNome]["настройки"]["err"]="Enable"
			myCheckButton6:SetChecked(true)
		elseif testQ[myNome]["настройки"]["err"]=="Enable" then
			testQ[myNome]["настройки"]["err"]="Disable"
			myCheckButton6:SetChecked(false)
		end
	end
);

myCheckButton2 = createCheckbutton(UIParent, -100, 330, "Отправка приветственного сообщения принятым в гильдию новичкам");
myCheckButton1:SetFrameLevel(256)
myCheckButton2:SetFrameLevel(256)
myCheckButton2.tooltip = "Отправка приветственного сообщения принятым в гильдию новичкам";
myCheckButton2:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["roll"]=="Disable" or testQ[myNome]["настройки"]["roll"]==nil then
			testQ[myNome]["настройки"]["roll"]="Enable"
			myCheckButton2:SetChecked(true)
		elseif testQ[myNome]["настройки"]["roll"]=="Enable" then
			testQ[myNome]["настройки"]["roll"]="Disable"
			myCheckButton2:SetChecked(false)
		end

	end
);

