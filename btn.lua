versAdd=305;versAddDop=7
bonusQuestF = 30
local myNome = GetUnitName("player")
btn = {};
editB = {}
fBtn = {}
resursy = {}
vybor = {}
okNo = {}
magazin = {}
mBtn = {}
dBtn = {}
sBtn = {}
eBtn = {}
function skll()
	for k, v in pairs(SkillTypeLabel5) do
		print(k,v, v[1], v[2], v[3])
	end
end
function eBtn:configure(id,posex,posey,sizex,sizey,zzid,message)
	self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetPoint("TOPRIGHT", MerchantFrame,"TOPRIGHT",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	self[id]:SetScript("OnClick",function(self, button)
		if UnitName("target") == "Магистр Весара" then
			if id == 1 then
				BuyMerchantItem(6,1)
			end
			if id == 2 then
				BuyMerchantItem(6,5)
			end
			if id == 3 then
				BuyMerchantItem(6,10)
			end
			if id == 4 then
				BuyMerchantItem(6,50)
			end
		end
		if UnitName("target") == "Магистр Сариен" then
			if id == 1 then
				BuyMerchantItem(36,1)
			end
			if id == 2 then
				BuyMerchantItem(36,5)
			end
			if id == 3 then
				BuyMerchantItem(36,10)
			end
			if id == 4 then
				BuyMerchantItem(36,50)
			end
		end
		if UnitName("target") == "Магистр Бразайл" then
			if id == 1 then
				BuyMerchantItem(4,1)
			end
			if id == 2 then
				BuyMerchantItem(4,5)
			end
			if id == 3 then
				BuyMerchantItem(4,10)
			end
			if id == 4 then
				BuyMerchantItem(4,50)
			end
		end
		if UnitName("target") == "Усури Златоблям" then
			if id == 5 then
				BuyMerchantItem(1,1)
			end
			if id == 6 then
				BuyMerchantItem(1,5)
			end
			if id == 7 then
				BuyMerchantItem(1,10)
			end
			if id == 8 then
				BuyMerchantItem(1,50)
			end
			if id == 9 then
				BuyMerchantItem(2,1)
			end
			if id == 10 then
				BuyMerchantItem(2,5)
			end
			if id == 1 then
				BuyMerchantItem(2,10)
			end
			if id == 12 then
				BuyMerchantItem(2,50)
			end
			if id == 13 then
				BuyMerchantItem(3,1)
			end
			if id == 14 then
				BuyMerchantItem(3,5)
			end
			if id == 15 then
				BuyMerchantItem(3,10)
			end
			if id == 15 then
				BuyMerchantItem(3,50)
			end
		end
	end)
	self[id]:SetScript("OnEnter",function(self, button)
		GameTooltip:Hide()
	end)
	self[id]:SetScript("OnEnter",function(self, button)
		for i = 1, 10 do
			local name,__,__,__,__,ttemb = GetCurrencyListInfo(i)
			if name == "Эмблема триумфа" then
				temb = ttemb
			end
			if name == "Эмблема завоевания" then
				zemb = ttemb
			end
			if name == "Эмблема доблести" then
				demb = ttemb
			end
		end
		if zemb == nil then
			zemb = 0
		end
		if temb == nil then
			temb = 0
		end
		if demb == nil then
			demb = 0
		end
		if UnitName("target") == "Магистр Весара" then
			if id == 1 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить одну эмблему Завоевания")
				GameTooltip:AddLine("|cffFF0000Стоимость: 1 эмблема триумфа из " .. temb)
				GameTooltip:Show()
			end
			if id == 2 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить пять эмблем Завоевания")
				GameTooltip:AddLine("|cffFF0000Стоимость: 5 эмблем триумфа из " .. temb)
				GameTooltip:Show()
			end
			if id == 3 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить десять эмблем Завоевания")
				GameTooltip:AddLine("|cffFF0000Стоимость: 10 эмблем триумфа из " .. temb)
				GameTooltip:Show()
			end
			if id == 4 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить пятьдесят эмблем Завоевания")
				GameTooltip:AddLine("|cffFF0000Стоимость: 50 эмблем триумфа из " .. temb)
				GameTooltip:Show()
			end
		end
		if UnitName("target") == "Магистр Сариен" then
			if id == 1 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить одну эмблему доблести")
				GameTooltip:AddLine("|cffFF0000Стоимость: 1 эмблема завоевания из " .. zemb)
				GameTooltip:Show()
			end
			if id == 2 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить пять эмблем доблести")
				GameTooltip:AddLine("|cffFF0000Стоимость: 5 эмблем завоевания из " .. zemb)
				GameTooltip:Show()
			end
			if id == 3 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить десять эмблем доблести")
				GameTooltip:AddLine("|cffFF0000Стоимость: 10 эмблем завоевания из " .. zemb)
				GameTooltip:Show()
			end
			if id == 4 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить пятьдесят эмблем доблести")
				GameTooltip:AddLine("|cffFF0000Стоимость: 50 эмблем завоевания из " .. zemb)
				GameTooltip:Show()
			end
		end
		if UnitName("target") == "Магистр Бразайл" then
			if id == 1 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить одну эмблему героизма")
				GameTooltip:AddLine("|cffFF0000Стоимость: 1 эмблема доблести из " .. demb)
				GameTooltip:Show()
			end
			if id == 2 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить пять эмблем героизма")
				GameTooltip:AddLine("|cffFF0000Стоимость: 5 эмблем доблести из " .. demb)
				GameTooltip:Show()
			end
			if id == 3 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить десять эмблем героизма")
				GameTooltip:AddLine("|cffFF0000Стоимость: 10 эмблем доблести из " .. demb)
				GameTooltip:Show()
			end
			if id == 4 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Купить пятьдесят эмблем героизма")
				GameTooltip:AddLine("|cffFF0000Стоимость: 50 эмблем доблести из " .. demb)
				GameTooltip:Show()
			end
		end
		if id == 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить одну эмблему завоевания")
			GameTooltip:AddLine("|cffFF0000Стоимость: 1 эмблема триумфа из " .. temb)
			GameTooltip:Show()
		end
		if id == 6 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить пять эмблем Завоевания")
			GameTooltip:AddLine("|cffFF0000Стоимость: 5 эмблем триумфа из " .. temb)
			GameTooltip:Show()
		end
		if id == 7 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить десять эмблем Завоевания")
			GameTooltip:AddLine("|cffFF0000Стоимость: 10 эмблем триумфа из " .. temb)
			GameTooltip:Show()
		end
		if id == 8 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить пятьдесят эмблем Завоевания")
			GameTooltip:AddLine("|cffFF0000Стоимость: 50 эмблем триумфа из " .. temb)
			GameTooltip:Show()
		end
		if id == 9 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить одну эмблему доблести")
			GameTooltip:AddLine("|cffFF0000Стоимость: 1 эмблема завоевания из " .. zemb)
			GameTooltip:Show()
		end
		if id == 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить пять эмблем доблести")
			GameTooltip:AddLine("|cffFF0000Стоимость: 5 эмблем завоевания из " .. zemb)
			GameTooltip:Show()
		end
		if id == 11 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить десять эмблем доблести")
			GameTooltip:AddLine("|cffFF0000Стоимость: 10 эмблем завоевания из " .. zemb)
			GameTooltip:Show()
		end
		if id == 12 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить пятьдесят эмблем доблести")
			GameTooltip:AddLine("|cffFF0000Стоимость: 50 эмблем завоевания из " .. zemb)
			GameTooltip:Show()
		end
		if id == 13 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить одну эмблему героизма")
			GameTooltip:AddLine("|cffFF0000Стоимость: 1 эмблема доблести из " .. demb)
			GameTooltip:Show()
		end
		if id == 14 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить пять эмблем героизма")
			GameTooltip:AddLine("|cffFF0000Стоимость: 5 эмблем доблести из " .. demb)
			GameTooltip:Show()
		end
		if id == 15 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить десять эмблем героизма")
			GameTooltip:AddLine("|cffFF0000Стоимость: 10 эмблем доблести из " .. demb)
			GameTooltip:Show()
		end
		if id == 16 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Купить пятьдесят эмблем героизма")
			GameTooltip:AddLine("|cffFF0000Стоимость: 50 эмблем доблести из " .. demb)
			GameTooltip:Show()
		end
	end)
end

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
		if okno ~= nil then
			if okno[1] ~= nil then
				okNo[1]:Hide()
			end
			if okNo[2]~= nil then
				okNo[2]:Hide()
			end
		end
	end
	self[1]:SetScript("OnClick",function(self, button)
		local testBH = "bh0"
		local testBI = "bi0"
		for i = 1, 100 do
			if mioFld[myNome]["объекты"][tostring(i)] == "bh" then
				testBH = "bh"
			end
			if mioFld[myNome]["объекты"][tostring(i)] == "bi" then
				testBI = "bi"
			end
		end
		if testQ["okno"] == "itemQend" then
			SendChatMessage("Все товары отправлены Вождю, я котэ!", "OFFICER", nil, 1)
			SendAddonMessage("#hQ1itemQ " .. testBH, testQ[myNome]["взятый_квест_х"], "guild")
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
		if testQ["okno"] == "tavernaQ" then
			SendChatMessage("Мне нужно выполнить " .. tonumber(testQ["taverna_num_q"])+3 .. " пунктов ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_t"])) .. " или получить ее", "OFFICER", nil, 1)
			testQ["okno"] = nil
			testQ['sign'] = nil
			okNo[1]:Hide()
			okNo[2]:Hide()
		end
		if testQ["okno"] == "itemQ" then
			SendChatMessage("Скоро я пришлю Вождю многа многа стаков вот этого: " .. testQ[myNome]["itemName"], "OFFICER", nil, 1)
			testQ[myNome]["взятый_квест"] = "itemQ"
			testQ[myNome]["взятый_квест_х"] = "itemQ"
			testQ[myNome]["itemQend"]=nil
			testQ["okno"] = nil
			for i = 1, 100 do
				if dBtn[1] ~= nil then
					dBtn[i]:Hide()
				end
			end
			okNo[1]:Hide()
		end
		if testQ["okno"] == "completed" then
			SendChatMessage("ВОЖДЬ, я выполнил ачивку " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_х"])), "OFFICER", nil, 1)
			SendAddonMessage("#hQ1 " .. testBI, testQ[myNome]["взятый_квест_х"], "guild")
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
		if testQ["okno"] ~= nil and testQ["okno"] ~= "99991" and testQ["okno"] ~= "itemQ" and testQ["okno"] ~= "itemQend" and testQ["okno"] ~= "q33end" and testQ["okno"] ~= "tavernaQ" then
			SendChatMessage("Мне нужно выполнить ачивку " .. GetAchievementLink(tonumber(testQ["okno"])), "OFFICER", nil, 1)
			testQ[myNome]["взятый_квест_х"] = testQ["okno"]
			testQ["okno"] = nil
			hX()
			testQ['sign'] = nil
			okNo[1]:Hide()
			okNo[2]:Hide()
		end
		if testQ["okno"] == "q33end" then
			SendChatMessage("ВОЖДЬ, я выполнил квест", "OFFICER", nil, 1)
			SendAddonMessage("#hQ1 " .. testBI, "", "guild")
			--htimer(myNome)
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
				okNo[1]:Hide()
				okNo[2]:Hide()
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
					okNo[1]:Hide()
					okNo[2]:Hide()
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
				okNo[1]:Hide()
				okNo[2]:Hide()
				testQ['sign'] = nil
			end
			if testQ["okno"] == "tavernaQ" then
				SendChatMessage("Я злонамеренно отказываюсь от ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_t"])), "OFFICER", nil, 1)
				testQ[myNome]["взятый_квест_t"] = nil
				testQ["taverna_num_q"] = nil
				testQ["okno"] = nil
				hX()
				okNo[1]:Hide()
				okNo[2]:Hide()
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
				okNo[1]:Hide()
				okNo[2]:Hide()
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
		if id==17 then
			if vybor[17] ~= nil then
				vybor[17]:Show()
			end
		end
		if id == 32 then
			if vybor[32] ~= nil then
				vybor[32]:Show()
			end
		end
		if id == 20 then
			if vybor[20] ~= nil then
				vybor[20]:Show()
			end
		end
		if id == 33 then
			if vybor[33] ~= nil then
				vybor[33]:Show()
			end
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Добавить армирование в бетон")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Серьезно?! Деревяшкой?")
			if testQ["doska"] >= 1 and testQ["smg"] >= 1 then
				GameTooltip:AddLine("|cffFFCF40Стоимость: 1 самогона, 1 доска")
			else
				GameTooltip:AddLine("|cffFF0000Стоимость: 1 самогона, 1 доска")
			end
			GameTooltip:Show()
		end
		if id == 18 then
			if vybor[18] ~= nil then
				vybor[18]:Show()
			end
		end
		if id == 31 then
			if vybor[31] ~= nil then
				vybor[31]:Show()
			end
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить колодец")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Если кинуть в колодец лотерейный билет, можно получить награду")
			GameTooltip:AddLine("Хм.. Почему в нем нет воды?")
			if testQ["kirpich"] >= 10 and testQ["smg"] >= 5 and testQ["kamen"] >= 10 and testQ["doska"] >= 5 then
				GameTooltip:AddLine("|cffFFCF40Стоимость: 10 кирпича, 5 самогона, 10 камня, 5 досок")
			else
				GameTooltip:AddLine("|cffFF0000Стоимость: 10 кирпича, 5 самогона, 10 камня, 5 досок")
			end
			GameTooltip:Show()
		end
		if id == 34 then
			if vybor[34] ~= nil then
				vybor[34]:Show()
			end
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить музей")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Музей нужен для достижений и обучения")
			GameTooltip:AddLine("В музее хранится все ценное, что было достаточно легким для того, чтобы его можно было вывезти отовсюду...Пирамиды вывезти не удалось.")
			if testQ["kirpich"] >= 10 and testQ["smg"] >= 5 and testQ["kamen"] >= 10 and testQ["doska"] >= 5 and testQ["beton"] >= 10 then
				GameTooltip:AddLine("|cffFFCF40Стоимость: 10 кирпича, 5 самогона, 10 камня, 5 досок, 10 бетона")
			else
				GameTooltip:AddLine("|cffFF0000Стоимость: 10 кирпича, 5 самогона, 10 камня, 5 досок, 10 бетона")
			end
			GameTooltip:Show()
		end
		if id == 14 or id == 15 or id == 16 then
			if vybor[14] ~= nil then
				vybor[14]:Show()
			end
			if vybor[15] ~= nil then
				vybor[15]:Show()
			end
			if vybor[16] ~= nil then
				vybor[16]:Show()
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
		if (testQ["picon"] == "t" or testQ["icon"] == "gob" or testQ["icon"] == "gom") and mioFld[nome]["петы"][tostring(testQ["idp"])] ~= "bb" then
			if vybor[8] ~= nil then
				vybor[8]:Show()
			end
		end
		if id == 8 then
			vybor[8]:Show()
		end
		if id == 29 then
			vybor[29]:Show()
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить обелиск")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Какой он..черный...")
			GameTooltip:AddLine("На табличке выгравирован Устав гильдии")
			if testQ["kamen"] < 10 then
				GameTooltip:AddLine("|cffff0000Стоимость: 10 камня")
			end
			if testQ["kamen"] >= 10 then
				GameTooltip:AddLine("|cffFFCF40Стоимость: 10 камня")
			end
			GameTooltip:Show()
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
		if testQ["icon"] == "smg" and testQ["picon"] == "t" then
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
		if id == 5 or id == 6 then
			if vybor[5] ~= nil then
				vybor[5]:Show()
				vybor[6]:Show()
			end
		end
		if testQ["icon"] == "zc" and testQ["picon"] == "bn" then
			if vybor[18] ~= nil then
				vybor[18]:Show()
				for i = 1, 100 do
					if i ~= 18 then
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if id == 21 then
			if vybor[21] ~= nil then
				vybor[21]:Show()
			end
		end
		if id == 30 then
			if vybor[30] ~= nil then
				vybor[30]:Show()
			end
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Поставить барную стойку")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Выдача квестов всяким мутным личностям, зашедшим в таверну")
			GameTooltip:Show()
		end
		if id == 27 then
			if vybor[27] ~= nil then
				vybor[27]:Show()
			end
			if testQ["brevna"] < 30 or testQ["stog"] < 15 or testQ["smg"] < 10 or testQ["stanok"] < 1 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить лесопилку")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Производство досок")
				GameTooltip:AddLine("|cffff0000Стоимость: 30 бревен, 15 травы, 10 бутылок самогона, 1 распиловочный станок")
				GameTooltip:Show()
			end
			if testQ["brevna"] >= 30 and testQ["stog"] >= 15 and testQ["smg"] >= 10 and testQ["stanok"] >= 1 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить лесопилку")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Производство досок")
				GameTooltip:AddLine("|cffFFCF40Стоимость: |cff99ff9930 |cffFFCF40бревен, |cff99ff9915 |cffFFCF40травы, |cff99ff9910 |cffFFCF40бутылок самогона, |cff99ff991 |cffFFCF40распиловочный станок")
				GameTooltip:Show()
			end
		end
		if id == 22 or id == 23 or id == 24 or id == 25 or id == 26 then
			if vybor[22] ~= nil then
				for i = 22, 26 do
					vybor[i]:Show()
				end
			end
		end
		if id == 9 then
			vybor[9]:Show()
		end
		if id == 10 then
			vybor[10]:Show()
		end
		if id == 12 then
			vybor[12]:Show()
		end
		if id == 28 then
			vybor[28]:Show()
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Дать бутылку пету для ускорения строительства")
			GameTooltip:Show()
		end
		if id == 19 then
			if vybor[19] ~= nil then
				vybor[19]:Show()
				for i = 1, 100 do
					if i ~= 19 then
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if id == 20 and testQ["brevna"] >= 50 and testQ["stog"] >= 25 and testQ["smg"] >= 10 and testQ["kirpich"] >= 15 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить мебельную фабрику")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Производство всякого там деревянного")
			GameTooltip:AddLine("Стоимость: 50 бревен, 25 травы, 10 бутылок самогона, 15 кирпичей")
			GameTooltip:Show()
		end
		if id == 20 and (testQ["brevna"] < 50 or testQ["stog"] < 25 or testQ["smg"] < 10 or testQ["kirpich"] < 15) then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить мебельную фабрику")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Производство всякого там деревянного")
			GameTooltip:AddLine("|cffff0000Стоимость: 50 бревен, 25 травы, 10 бутылок самогона, 15 кирпичей")
			GameTooltip:Show()
		end
		if id == 19 and testQ["brevna"] >= 50 and testQ["stog"] >= 25 and testQ["smg"] >= 10 and testQ["kirpich"] >= 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить таверну")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Выдает квесты на получение пунктов ачивок")
			GameTooltip:AddLine("Стоимость: 50 бревен, 25 травы, 10 бутылок самогона, 5 кирпичей")
			GameTooltip:Show()
		end
		if id == 19 and (testQ["brevna"] < 50 or testQ["stog"] < 25 or testQ["smg"] < 10 or testQ["kirpich"] < 5) then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить таверну")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Выдает квесты на получение пунктов ачивок")
			GameTooltip:AddLine("|cffff0000Стоимость: 50 бревен, 25 травы, 10 бутылок самогона, 5 кирпичей")
			GameTooltip:Show()
		end
		if id == 18 and tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 10 and tonumber(testQ["smg"]) >= 3  then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("|cFF6495EDКирпичный цех: 5 бревен, 10 камня, 3 самогона")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Можно производить кирпичи, а можно не производить")
			GameTooltip:AddLine("Для производства кирпича требуется одновременно работающий завод бетона")
			GameTooltip:AddLine("Периодически потребляет бревна и траву..хм.. И бетон, ведь это силикатные кирпичи.")
			GameTooltip:Show()
		end
		if id == 18 and testQ["picon"] == "bn" and tonumber(testQ["brevna"]) < 5 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Кирпичный цех")
			GameTooltip:AddLine("|cffff0000Нужно 5 бревен, 10 камня и 3 самогона")
			GameTooltip:Show()
		end
		if id == 18 and testQ["picon"] == "bn" and tonumber(testQ["smg"]) < 3 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Кирпичный цех")
			GameTooltip:AddLine("|cffff0000Нужно 5 бревен, 10 камня и 3 самогона")
			GameTooltip:Show()
		end
		if id == 18 and testQ["picon"] == "bn" and tonumber(testQ["kamen"]) < 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Кирпичный цех")
			GameTooltip:AddLine("|cffff0000Нужно 5 бревен, 10 камня и 3 самогона")
			GameTooltip:Show()
		end
		if testQ["picon"] == "bn" and id == 17 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Архив: Информационные услуги")
			GameTooltip:AddLine("|cffff2b2b5 бревен, 25 камня, 5 бетона, 1 бутылка самогона")
			GameTooltip:Show()
		end
		if testQ["picon"] == "bn" and id == 14 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Библиотека: Удваивает опыт от квестов в сельсовете")
			GameTooltip:AddLine("|cffff2b2b5 бревен, 25 камня, 5 бетона, 1 бутылка самогона")
			GameTooltip:Show()
		end
		if testQ["picon"] == "bn" and id == 15 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Бухгалтерия: Добавляет единицу опыта товарным квестам")
			GameTooltip:AddLine("|cffff2b2b5 бревен, 25 камня, 5 бетона, 1 бутылка самогона")
			GameTooltip:Show()
		end
		if testQ["picon"] == "bn" and id == 16 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Логистический отдел: Сокращает таймер вдвое")
			GameTooltip:AddLine("|cffff2b2b5 бревен, 25 камня, 5 бетона, 1 бутылка самогона")
			GameTooltip:Show()
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
		if id == 32 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Лом Дервина. Вес 5кг.")
			GameTooltip:AddLine("Каждый удар: сила +1. Шанс нанести урон бетону.")
			GameTooltip:Show()
		end
		if id == 11 and (tonumber(testQ["brevna"]) < 10 or tonumber(testQ["kamen"]) < 50 or tonumber(testQ["beton"])<10) then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:ClearLines()
			GameTooltip:AddLine("|cFF6495EDПостроить сельсовет")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - квест на эмоции")
			GameTooltip:AddLine("|cffFFCF40если есть таймер - сдать |cff99ff99магическую ткань")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cffFFCF40Доступно 4 пристройки:")
			GameTooltip:AddLine("|cff99ff99Библиотека: |cffFFCF40увеличивает опыт для квеста в хижине")
			GameTooltip:AddLine("|cff99ff99Бухгалтерия: |cffFFCF40дает единицу опыта к товарным квестам")
			GameTooltip:AddLine("|cff99ff99Отдел логистики: |cffFFCF40ускоряет таймер")
			GameTooltip:AddLine("|cff99ff99Архив: |cffFFCF40информация о прогрессе")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cffff0000Стоимость: 10 бревен, 50 камня, 10 кубов бетона")
			GameTooltip:Show()
		end
		if id == 11 and tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["beton"]) >= 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:ClearLines()
			GameTooltip:AddLine("|cFF6495EDПостроить сельсовет")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - квест на эмоции")
			GameTooltip:AddLine("|cffFFCF40если есть таймер - сдать |cff99ff99магическую ткань")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cffFFCF40Доступно 4 пристройки:")
			GameTooltip:AddLine("|cff99ff99Библиотека: |cffFFCF40увеличивает опыт для квеста в хижине")
			GameTooltip:AddLine("|cff99ff99Бухгалтерия: |cffFFCF40дает единицу опыта к товарным квестам")
			GameTooltip:AddLine("|cff99ff99Отдел логистики: |cffFFCF40ускоряет таймер")
			GameTooltip:AddLine("|cff99ff99Архив: |cffFFCF40информация о прогрессе")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cff99ff99Стоимость: 10 бревен, 50 камня, 10 кубов бетона")
			GameTooltip:Show()
		end

		if id == 12 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			if testQ["picon"] == "sx" then
				GameTooltip:AddLine("Дать бутылку строителям, чтобы они сровняли все в землей")
			end
			if testQ["picon"] == "h" then
				GameTooltip:AddLine("Дать бутылку жителям, чтобы время пролетело незаметно")
			end
			if testQ["picon"] == "m" or testQ["picon"] == "t" then
				GameTooltip:AddLine("Дать бутылку пету, чтобы он работал охотнее")
			end
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
		if id == 21 and testQ["yi"] ~= nil and tonumber(testQ["yi"]) >= 1 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Поставить ящик с инструментами")
			GameTooltip:AddLine("Требуется для работы с деревом")
			GameTooltip:Show()
		end
		if id == 21 and testQ["yi"] ~= nil and tonumber(testQ["yi"]) < 1 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Поставить ящик с инструментами")
			GameTooltip:AddLine("Требуется для работы с деревом")
			GameTooltip:AddLine("|cffff2b2bИнструменты можно купить в магазине")
			GameTooltip:Show()
		end
		if id == 22 then
			testQ['icon'] = "b"
		end
		if id == 23 then
			testQ['icon'] = "f"
		end
		if id == 24 then
			testQ['icon'] = "kamen"
		end
		if id == 25 then
			testQ['icon'] = "doska"
		end
		if id == 26 then
			testQ['icon'] = "kirpich"
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
	local nome
	if testQ['sign'] ~= "1" then
		nome = GuildFrame["selectedName"]
	else
		nome = myNome
	end
		if id == 27 then
			if testQ["brevna"] >= 30 and testQ["stog"] >= 15 and testQ["smg"] >= 10 and testQ["stanok"] >= 1 then
				if nome == myNome then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\lx.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\lx.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("lP " .. testQ["idp"], nome, "guild")
						testQ["brevna"] = tonumber(testQ["brevna"]) - 30
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["stog"] = tonumber(testQ["stog"]) - 15
						testQ["nikQF"] = antc(tonumber(testQ["stog"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 10
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						testQ["stanok"] = tonumber(testQ["stanok"]) - 1
						testQ["nikQST"] = antc(testQ["stanok"])
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["stog"],resursy[3],103,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
						dmgText2(testQ["stanok"],mBtn[10],810,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				else
					if testQ["brevna"] >= 90 and testQ["stog"] >= 45 and testQ["smg"] >= 30 and testQ["stanok"] >= 1 then
						if testQ["temp"] == nil then
							vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\lx.tga")
							vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\lx.tga")
							testQ["temp"] = 1
						elseif testQ["temp"] == 1 then
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							SendAddonMessage("lP " .. testQ["idp"], nome, "guild")
							testQ["brevna"] = tonumber(testQ["brevna"]) - 90
							testQ["nikQB"] = antc(testQ["brevna"])
							testQ["stog"] = tonumber(testQ["stog"]) - 45
							testQ["nikQF"] = antc(tonumber(testQ["stog"]))
							testQ["smg"] = tonumber(testQ["smg"]) - 30
							testQ["nikQS"] = antc(tonumber(testQ["smg"]))
							testQ["stanok"] = tonumber(testQ["stanok"]) - 1
							testQ["nikQST"] = antc(testQ["stanok"])
							dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
							dmgText(testQ["stog"],resursy[3],103,13,"FF8C00")
							dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
							dmgText2(testQ["stanok"],mBtn[10],810,13,"FF8C00")
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
		end
		if id == 33 then
			if testQ["doska"] >= 1 and testQ["smg"] >= 1 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ba.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ba.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("dB " .. testQ["idp"] .. " " .. mioFld[nome]["целостность"][tostring(testQ["idp"])], nome, "guild")
					testQ["doska"] = tonumber(testQ["doska"]) - 1
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText2(testQ["doska"],mBtn[11],811,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if id == 29 then
			if testQ["kamen"] >= 10 then
				if nome == myNome then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("oB " .. testQ["idp"], nome, "guild")
						testQ["kamen"] = tonumber(testQ["kamen"]) - 10
						testQ["nikQK"] = antc(testQ["kamen"])
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				else
					if testQ["kamen"] >= 50 then
						if testQ["temp"] == nil then
							vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
							vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
							testQ["temp"] = 1
						elseif testQ["temp"] == 1 then
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							SendAddonMessage("oB " .. testQ["idp"], nome, "guild")
							testQ["kamen"] = tonumber(testQ["kamen"]) - 50
							testQ["nikQK"] = antc(testQ["kamen"])
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
		end
		if id == 32 then
			local x = 0
			local x1 = 0
			x1 = math.random(1,10)
			if testQ["lom"] ~= nil and testQ["lom"] >= 1 then

				if testQ[myNome]["сила"] == nil then
					testQ[myNome]["сила"] = 1
				else
					testQ[myNome]["сила"] = tonumber(testQ[myNome]["сила"]) + 1
				end
				if tonumber(testQ[myNome]["сила"]) < 50 then
					print("Сила: " .. testQ[myNome]["сила"])
					x = math.random(1,100)
				end
				if tonumber(testQ[myNome]["сила"]) >= 50 and tonumber(testQ[myNome]["сила"]) < 200 then
					print("Сила: " .. testQ[myNome]["сила"])
					x = math.random(90,100)
				end
				if tonumber(testQ[myNome]["сила"]) >= 200 and tonumber(testQ[myNome]["сила"]) < 300 then
					print("Сила: " .. testQ[myNome]["сила"])
					x = math.random(99,100)
				end
				if tonumber(testQ[myNome]["сила"]) >= 200 and tonumber(testQ[myNome]["сила"]) >= 300 then
					print("Сила: " .. testQ[myNome]["сила"])
					x = 100
					x1 = math.random(10,50)
				end
			end
			if x == 100 then
				SendAddonMessage("lom " .. testQ["idp"] .. " " .. x1, nome, "guild")
			end
			local xx = math.random(1,5)
			testQ["lom"] = tonumber(testQ["lom"]) - xx
			print("Прочность лома: " .. testQ["lom"])
			if testQ["lom"] <= 0 then
				testQ["lom"] = nil
			end
			dmgText2(testQ["lom"],mBtn[13],813,13,"FF8C00")
			vybor[32]:Hide()
		end
		if id >= 22 and id <= 26 then
			dBtn[tonumber(testQ["idp"])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. testQ['icon'] .. ".tga")
			dBtn[tonumber(testQ["idp"])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. testQ['icon'] .. ".tga")
			if testQ["redactor"] == nil then
				local sch=0
				for i = 1, #shRec do
					if shRec[i][tonumber(testQ["idp"])] ~= testQ['icon'] then
						if sch == nil then
							sch = 1
						else
							sch = sch+1
						end
					end
				end
				if sch >= tonumber(#shRec) then
					SendChatMessage("Видимо такого рецепта не существует и я просто испортил хорошие ресурсы...", "officer", nil, 1)
					for i = 1, 100 do
						dBtn[i]:Hide()
					end
					btn[989]:Hide()
					btn[989]:ClearAllPoints()
					btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
					for i = 1, 100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				else
					testQ["diffT"][tonumber(testQ["idp"])] = testQ['icon']
				end
				for i = 1, #shRec do
					if diffT(testQ["diffT"],shRec[i]) == true then
						SendChatMessage(shRec[i][101], "officer", nil, 1)
						if shRec[i][101] == "Я распилил бревно" then
							testQ["diffT"] = {}
							for i = 1, 100 do
								dBtn[i]:Hide()
								fBtn[i]:Show()
								if vybor[i] ~= nil then
									vybor[i]:Hide()
								end
							end
							testQ["domZ"] = nil
							local x = math.random(1,5)
							testQ["doska"] = tonumber(testQ["doska"])+x
							testQ["nikQD"] = antc(tonumber(testQ["doska"]))
							dmgText2(testQ["doska"],mBtn[11],811,13,"FF8C00")
							print("Получено " .. x .. " досок")
							dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
							dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						end
						if shRec[i][101] == "Я собрал барную стойку" then
							SendChatMessage(shRec[i][101], "officer", nil, 1)
							for i = 1, 100 do
								dBtn[i]:Hide()
								fBtn[i]:Show()
								if vybor[i] ~= nil then
									vybor[i]:Hide()
								end
							end
							testQ["domZ"] = nil
							if testQ["b0"] == nil then
								testQ["b0"] = 1
							else
								testQ["b0"] = tonumber(testQ["b0"])+1
							end
							print("Получена барная стойка")
						end
					end
				end
			else
				testQ["diffT"][tonumber(testQ["idp"])] = testQ['icon']
			end
		end
		if id == 21 and testQ["yi"] ~= nil and tonumber(testQ["yi"]) >= 1 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\yi.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\yi.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				SendAddonMessage("#yIm " .. testQ["idp"], nome, "guild")
				testQ["yi"] = tonumber(testQ["yi"])-1
				testQ["temp"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if id == 30 and testQ["b0"] ~= nil and tonumber(testQ["b0"]) >= 1 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\b0.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\b0.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				SendAddonMessage("#b0 " .. testQ["idp"], nome, "guild")
				testQ["b0"] = tonumber(testQ["b0"])-1
				testQ["temp"] = nil
				for i=1,100 do
					if vybor[i] ~= nil then
						vybor[i]:Hide()
					end
				end
			end
		end
		if nome == myNome then
			if id == 18 and tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 10 and tonumber(testQ["smg"]) >= 3  then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zp.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zp.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("zP " .. testQ["idp"], nome, "guild")
					testQ["brevna"] = tonumber(testQ["brevna"]) - 5
					testQ["nikQB"] = antc(testQ["brevna"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 3
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
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
		else
			if id == 18 and tonumber(testQ["brevna"]) >= 25 and tonumber(testQ["kamen"]) >= 50 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zp.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zp.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("zP " .. testQ["idp"], nome, "guild")
					testQ["brevna"] = tonumber(testQ["brevna"]) - 25
					testQ["nikQB"] = antc(testQ["brevna"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 50
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
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
		if nome == myNome then
			if id == 31 and tonumber(testQ["kirpich"]) >= 10 and tonumber(testQ["kamen"]) >= 10 and tonumber(testQ["smg"]) >= 5 and tonumber(testQ["doska"]) >= 5  then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("kO " .. testQ["idp"], nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		else
			if id == 31 and tonumber(testQ["kirpich"]) >= 50 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["smg"]) >= 25 and tonumber(testQ["doska"]) >= 25  then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("kO " .. testQ["idp"], nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 50
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 50
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 25
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 25
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if nome == myNome then
			if id == 34 and tonumber(testQ["kirpich"]) >= 10 and tonumber(testQ["kamen"]) >= 10 and tonumber(testQ["smg"]) >= 5 and tonumber(testQ["doska"]) >= 5 and tonumber(testQ["beton"]) >= 10  then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m1.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m1.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("mZ " .. testQ["idp"], nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["beton"] = tonumber(testQ["beton"]) - 10
					testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
					dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		else
			if id == 34 and tonumber(testQ["kirpich"]) >= 50 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["smg"]) >= 25 and tonumber(testQ["doska"]) >= 25 and tonumber(testQ["beton"]) >= 25   then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m1.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m1.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("mZ " .. testQ["idp"], nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 50
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 50
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 25
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 25
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["beton"] = tonumber(testQ["beton"]) - 25
					testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
					dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if nome == myNome then
			if id == 19 and testQ["brevna"] >= 50 and testQ["stog"] >= 25 and testQ["smg"] >= 10 and testQ["kirpich"] >= 5 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tv.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tv.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("tV " .. testQ["idp"], nome, "guild")
					testQ["brevna"] = tonumber(testQ["brevna"]) - 50
					testQ["nikQB"] = antc(testQ["brevna"])
					testQ["stog"] = tonumber(testQ["stog"]) - 25
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 5
					testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
					dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
					dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		else
			if id == 19 and testQ["brevna"] >= 150 and testQ["stog"] >= 75 and testQ["smg"] >= 20 and testQ["kirpich"] >= 15 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tv.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tv.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("tV " .. testQ["idp"], nome, "guild")
					testQ["brevna"] = tonumber(testQ["brevna"]) - 150
					testQ["nikQB"] = antc(testQ["brevna"])
					testQ["stog"] = tonumber(testQ["stog"]) - 75
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 20
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 15
					testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
					dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
					dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
		if nome == myNome then
			if id == 20 and testQ["brevna"] >= 50 and testQ["stog"] >= 25 and testQ["smg"] >= 10 and testQ["kirpich"] >= 15 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("mF " .. testQ["idp"], nome, "guild")
					testQ["brevna"] = tonumber(testQ["brevna"]) - 50
					testQ["nikQB"] = antc(testQ["brevna"])
					testQ["stog"] = tonumber(testQ["stog"]) - 25
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 15
					testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
					dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
					dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		else
			if id == 20 and testQ["brevna"] >= 150 and testQ["stog"] >= 75 and testQ["smg"] >= 20 and testQ["kirpich"] >= 45 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("mF " .. testQ["idp"], nome, "guild")
					testQ["brevna"] = tonumber(testQ["brevna"]) - 150
					testQ["nikQB"] = antc(testQ["brevna"])
					testQ["stog"] = tonumber(testQ["stog"]) - 75
					testQ["nikQF"] = antc(testQ["stop"])
					testQ["smg"] = tonumber(testQ["smg"]) - 20
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 45
					testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
					dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
					dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
		end
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 5
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["stog"] = tonumber(testQ["stog"]) - 5
						testQ["nikQF"] = antc(tonumber(testQ["stog"]))
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["stog"] = tonumber(testQ["stog"]) - 25
						testQ["nikQF"] = antc(tonumber(testQ["stog"]))
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 20
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 100
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
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
					testQ["nikQB"] = antc(testQ["brevna"])
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["stog"] = tonumber(testQ["stog"]) - 10
						testQ["nikQF"] = antc(tonumber(testQ["stog"]))
						testQ["kamen"] = tonumber(testQ["kamen"]) - 5
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["stog"] = tonumber(testQ["stog"]) - 50
						testQ["nikQF"] = antc(tonumber(testQ["stog"]))
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
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
		if (mioFld[nome]["объекты"][tostring(testQ["idp"])] == "m" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "mx" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "hs" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "ms" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "uz" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zs" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zx" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "skc" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "sx" or mioFld[nome]["объекты"][tostring(testQ["idp"])] == "zp") and id == 8 then
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
				testQ["nikQS"] = antc(tonumber(testQ["smg"]))
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
		if id == 28 and tonumber(testQ["smg"]) >= 1 then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				testQ["zarplata"] = 10000
				testQ["smg"] = tonumber(testQ["smg"])-1
				testQ["nikQS"] = antc(tonumber(testQ["smg"]))
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
		if id == 12 and tonumber(testQ["smg"]) >= 1 and testQ["picon"] == "t" then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				testQ["zarplatab"] = 20
				testQ["smg"] = tonumber(testQ["smg"])-1
				testQ["nikQS"] = antc(tonumber(testQ["smg"]))
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
		if id == 12 and tonumber(testQ["smg"]) >= 1 and testQ["picon"] == "sx" then
			if testQ["temp"] == nil then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
				testQ["temp"] = 1
			elseif testQ["temp"] == 1 then
				testQ["smg"] = tonumber(testQ["smg"])-1
				testQ["nikQS"] = antc(tonumber(testQ["smg"]))
				dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
				SendAddonMessage("sXX " .. testQ["idp"], nome, "guild")
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
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 2 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 200
						SendChatMessage("...незаметно пролетают аж 200 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 3 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 500
						SendChatMessage("...незаметно пролетают аж 500 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 4 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 1000
						SendChatMessage("...незаметно пролетают аж 1000 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					elseif x == 5 then
						testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 3800
						SendChatMessage("...незаметно пролетают аж 3800 секунд", "OFFICER", nil, 1)
						testQ["smg"] = tonumber(testQ["smg"])-1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
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
						testQ["nikQB"] = antc(testQ["brevna"])
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
						testQ["nikQB"] = antc(testQ["brevna"])
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
						testQ["nikQB"] = antc(testQ["brevna"])
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
						testQ["nikQB"] = antc(testQ["brevna"])
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
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
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
						testQ["beton"] = tonumber(testQ["beton"]) - 20
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
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
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 17 then
				if tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 25 and tonumber(testQ["beton"]) >= 5 and tonumber(testQ["smg"]) >= 1 then
					if testQ["temp"] == nil then
						vybor[17]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
						vybor[17]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("aS " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 5
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 5
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 17 then
				if tonumber(testQ["brevna"]) >= 25 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["beton"]) >= 25 and tonumber(testQ["smg"]) >= 5 then
					if testQ["temp"] == nil then
						vybor[14]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
						vybor[14]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("aS " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 25
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 50
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 25
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 5
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
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
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 14 then
				if tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 25 and tonumber(testQ["beton"]) >= 5 and tonumber(testQ["smg"]) >= 1 then
					if testQ["temp"] == nil then
						vybor[14]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
						vybor[14]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("bS " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 5
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 5
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 14 then
				if tonumber(testQ["brevna"]) >= 25 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["beton"]) >= 25 and tonumber(testQ["smg"]) >= 5 then
					if testQ["temp"] == nil then
						vybor[14]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
						vybor[14]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("bS " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 25
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 50
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 25
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 5
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
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
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 15 then
				if tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 25 and tonumber(testQ["beton"]) >= 5 and tonumber(testQ["smg"]) >= 1 then
					if testQ["temp"] == nil then
						vybor[15]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
						vybor[15]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("bH " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 5
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 5
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 15 then
				if tonumber(testQ["brevna"]) >= 25 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["beton"]) >= 25 and tonumber(testQ["smg"]) >= 5 then
					if testQ["temp"] == nil then
						vybor[14]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
						vybor[14]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("bH " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 25
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 50
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 25
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 5
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
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
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 16 then
				if tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["kamen"]) >= 25 and tonumber(testQ["beton"]) >= 5 and tonumber(testQ["smg"]) >= 1 then
					if testQ["temp"] == nil then
						vybor[16]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
						vybor[16]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("tO " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 5
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 25
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 5
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 1
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
		else
			if mioFld[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 16 then
				if tonumber(testQ["brevna"]) >= 25 and tonumber(testQ["kamen"]) >= 50 and tonumber(testQ["beton"]) >= 25 and tonumber(testQ["smg"]) >= 5 then
					if testQ["temp"] == nil then
						vybor[16]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
						vybor[16]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
						SendAddonMessage("tO " .. testQ["idp"] .. " " .. 999, nome, "guild")
						testQ["temp"] = nil
						testQ["brevna"] = tonumber(testQ["brevna"]) - 25
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 50
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 25
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
						testQ["smg"] = tonumber(testQ["smg"]) - 5
						testQ["nikQS"] = antc(tonumber(testQ["smg"]))
						dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 50
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 10
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
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
						testQ["nikQB"] = antc(testQ["brevna"])
						testQ["kamen"] = tonumber(testQ["kamen"]) - 150
						testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
						testQ["beton"] = tonumber(testQ["beton"]) - 30
						testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
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
if myNome == "Хефе" or myNome == "Витинари" or myNome == "Люцзе" or myNome == "Посети" or myNome == "Колон" or myNome == "Кербес" or myNome == "Аффа" or myNome == "Маздам" or myNome == "Нугган" then
	local gTest1,gTest2
	gtg = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	gtg:SetPoint("BOTTOMLEFT",350, 670)
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
					--ChatFrame1EditBox:Show()
					--ChatFrame1EditBox:SetFocus()
					GuildInvite(gTest1)
					--ChatFrame1EditBox:SetText("/ginvite " .. gTest1)
					--table.insert(testQ["ginvXXX"],gTest1)
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
	self[id]:RegisterForClicks("RightButtonDown", "LeftButtonDown","LeftButtonUp","MiddleButtonUp")
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
							testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
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
							testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
							dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
						end
						if arg2 == false then
							testQ["zavod"] = nil
						end
					end
				end
			end
		end
		if nome == myNome then
			if tonumber(testQ["brevna"]) >= 1 and tonumber(testQ["stog"]) >= 1 then
				if mioFld[nome]["объекты"][tostring(id)] == "zp" then
					if arg1 == "LeftButton" then
						if arg2 == true then
							testQ["zavodp"] = 1
							testQ["zavodpc"] = 1
							testQ["brevna"] = tonumber(testQ["brevna"])-1
							testQ["nikQB"] = antc(testQ["brevna"])
							dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
							testQ["stog"] = tonumber(testQ["stog"])-1
							testQ["nikQF"] = antc(tonumber(testQ["stog"]))
							dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
						end
						if arg2 == false then
							testQ["zavodp"] = nil
							testQ["zavodpc"] = nil
						end
					end
				end
			end
		else
			if tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["stog"]) >= 5 then
				if mioFld[nome]["объекты"][tostring(id)] == "zp" then
					if arg1 == "LeftButton" then
						if arg2 == true then
							testQ["zavodp"] = 1
							testQ["zavodpc"] = 1
							testQ["brevna"] = tonumber(testQ["brevna"])-5
							testQ["nikQB"] = antc(testQ["brevna"])
							dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
							testQ["stog"] = tonumber(testQ["stog"])-5
							testQ["nikQF"] = antc(tonumber(testQ["stog"]))
							dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
						end
						if arg2 == false then
							testQ["zavodp"] = nil
							testQ["zavodpc"] = nil
						end
					end
				end
			end
		end
		if arg1 == "MiddleButton" then
			if nome == myNome then
				if mioFld[nome]["объекты"][tostring(id)] == "ko" then
					if testQ[myNome]["лотерея"] ~= nil and tonumber(testQ[myNome]["лотерея"]) >= 1 then
						RandomRoll(1, 111)
					end
				end
			else
				if mioFld[nome]["объекты"][tostring(id)] == "ko" then

				end
			end
		end
		if arg1 == "LeftButton" then
			if arg2 == false then
				if mioFld[nome]["объекты"][tostring(id)] == "tv" then
					SendAddonMessage("#domtv", nome .. " " .. myNome, "guild")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "mf" then
					SendAddonMessage("#dommf", nome .. " " .. myNome, "guild")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ts" then
					if nome == myNome then
						if testQ["vyborNagrady"] == 1 then
							if testQ["infTimer"] == nil then
								if nome == myNome then
									testQ["infTimer"] = 60
									dmgText(testQ["infTimer"],fBtn[id],888,13,"ff0000")
									SendAddonMessage("vyborNagrady", testQ["mioFldLvl"], "guild")
								else
									SendChatMessage("Дорогой дневник, сегодня я пытался украсть награду " .. nome .. " за лвлап. Не получилось...", "OFFICER", nil, 1)
								end
							else
								dmgText(testQ["infTimer"],fBtn[id],888,13,"ff0000")
							end
						end
					else
						SendChatMessage("Дорогой дневник, сегодня я пытался украсть награду " .. nome .. " за лвлап. Не получилось...", "OFFICER", nil, 1)
					end
				end
				if nome == myNome then
					if mioFld[nome]["объекты"][tostring(id)] == "ko" then
						if testQ[myNome]["лотерея"] ~= nil and tonumber(testQ[myNome]["лотерея"]) >= 3 then
							RandomRoll(1, 333)
						end
					end
				else
					if mioFld[nome]["объекты"][tostring(id)] == "ko" then

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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							else
								if testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999" or testQ[myNome]["взятый_квест_х"] == "itemQ" then
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
												if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
													if resursy[i] ~= nil then
														if i == 5 then
															if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
															end
														else
															resursy[i]:Hide()
														end
													end
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
												if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
													if resursy[i] ~= nil then
														if i == 5 then
															if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
															end
														else
															resursy[i]:Hide()
														end
													end
												end
											end
											btn[989]:Hide()
											btn[989]:ClearAllPoints()
											btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
										end
									else
										local qq
										while true do
											qq=math.random(1,#pQuest["items"])
											if tostring(pQuest["items"][qq]["itemName"]) == "Магическая ткань" then
												testQ[myNome]["itemName"]=tostring(pQuest["items"][qq]["itemName"])
												testQ[myNome]["itemNum"]=tonumber(pQuest["items"][qq]["itemNum"])
												testQ[myNome]["itemEnStuck"]=tonumber(pQuest["items"][qq]["itemEnStuck"])
												break
											end
										end
										testQ["okno"] = "itemQ"
										testQ["itemQVzyat"] = 1
										quesT("show")
										okNo:configure(1,"show")
										rtnTextF("Нужно прислать Вождю " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"],1,"show")
										for i=1,100 do
											fBtn[i]:Hide()
										end
										for i = 1, 100 do
											if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
												if resursy[i] ~= nil then
													if i == 5 then
														if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
														end
													else
														resursy[i]:Hide()
													end
												end
											end
										end
										btn[989]:Hide()
										btn[989]:ClearAllPoints()
										btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
									end
								end
							end
						else
							if testQ[myNome]["взятый_квест_s"] == nil and (testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999") then
								testQ[myNome]["q33q"],testQ[myNome]["q33nik"][1],__,__,testQ[myNome]["q33fnd"],testQ[myNome]["q33ans"] = qLvl33c1(myNome)
								__,__,testQ[myNome]["q33nik"][2],__,__,__ = qLvl33c2(myNome)
								__,__,__,testQ[myNome]["q33nik"][3],__,__ = qLvl33c3(myNome)
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
									if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
										if resursy[i] ~= nil then
											if i == 5 then
												if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
												end
											else
												resursy[i]:Hide()
											end
										end
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
							else
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
											if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
												if resursy[i] ~= nil then
													if i == 5 then
														if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
														end
													else
														resursy[i]:Hide()
													end
												end
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
											if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
												if resursy[i] ~= nil then
													if i == 5 then
														if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
														end
													else
														resursy[i]:Hide()
													end
												end
											end
										end
										btn[989]:Hide()
										btn[989]:ClearAllPoints()
										btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
									end
								end
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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							end
							if testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999" and testQ[myNome]["взятый_квест_s"] == nil then
								local qq
									while true do
										qq=math.random(1,#pQuest["items"])
										if tostring(pQuest["items"][qq]["itemName"]) == "Шерсть" then
											testQ[myNome]["itemName"]=tostring(pQuest["items"][qq]["itemName"])
											testQ[myNome]["itemNum"]=tonumber(pQuest["items"][qq]["itemNum"])
											testQ[myNome]["itemEnStuck"]=tonumber(pQuest["items"][qq]["itemEnStuck"])
											break
										end
									end
								testQ["okno"] = "itemQ"
								testQ["itemQVzyat"] = 1
								quesT("show")
								okNo:configure(1,"show")
								rtnTextF("Нужно прислать Вождю " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"],1,"show")
								for i=1,100 do
									fBtn[i]:Hide()
								end
								for i = 1, 100 do
									if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
										if resursy[i] ~= nil then
											if i == 5 then
												if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
												end
											else
												resursy[i]:Hide()
											end
										end
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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							end
							if testQ[myNome]["hTimer"] == nil then
								testQ["hEnd"] = nil
								if lvlTest ~= nil then
									if testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999" then
										local iii = 0
										while true do
											local x = math.random(1,tonumber(#pQuest["х"]))
											if testQ[myNome]["выполненные_квесты_х"][tostring(pQuest["х"][x])] == nil or testQ[myNome]["выполненные_квесты_х"][tostring(pQuest["х"][x])] ~= "9999" then
												if iii == tonumber(#pQuest["х"]) then
													SendChatMessage("В хижине больше нет заданий...", "OFFICER", nil, 1)
													testQ["hEnd"] = 1
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
												if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
													if resursy[i] ~= nil then
														if i == 5 then
															if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
															end
														else
															resursy[i]:Hide()
														end
													end
												end
											end
											btn[989]:Hide()
											btn[989]:ClearAllPoints()
											btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
										end
									end
								end
								if testQ["hEnd"] ~= 1 then
									htimer(myNome)
								end
								testQ["hEnd"] = nil
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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
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
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
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
				if mioFld[nome]["объекты"][tostring(id)] == "ar" then
					if testQ["infTimer"] == nil then
						if nome == myNome then
							testQ["infTimer"] = 60
							SendAddonMessage("#zMYzt", "#zMYzt", "guild")
						else
							quesT("show")
							okNo:configure(1,"show")
							rtnTextF("Ты кто такой? Я тебя не знаю.",1,"show")
							testQ["okno"] = "99991"
						end
					else
						dmgText(testQ["infTimer"],fBtn[id],888,13,"ff0000")
					end
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ox" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "m1" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "kx" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "hs" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "lx" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "tz" then
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
				if mioFld[nome]["объекты"][tostring(id)] == "zc" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "m0" then
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

				if mioFld[nome]["объекты"][tostring(id)] == "skc" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "as" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "bc" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "bx" then
					resObj(id,myNome,nome)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "bs" then
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
			if mioFld[nome]["объекты"][tostring(id)] == "lp" then
				testQ["diffT"] = {}
				for i = 1, 100 do
					testQ["diffT"][i] = "st"
				end
				testQ["brevna"] = tonumber(testQ["brevna"])-1
				testQ["nikQB"] = antc(testQ["brevna"])
				dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
				testQ["domZ"] = "crt"
				local nome
				if testQ['sign'] ~= "1" then
					nome = GuildFrame["selectedName"]
				else
					nome = myNome
				end

				for i = 1, 100 do
					fBtn[i]:Hide()
					dBtn[i]:Show()
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
				end
				testQ["domZ"] = "crt"
				for i = 1, 100 do
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
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
					testQ["nikQB"] = antc(testQ["brevna"])
				elseif x == 2 then
					SendChatMessage("Хмм... А что будет если оставить тут след от моей ноги?", "OFFICER", nil, 1)
					testQ["beton"] = tonumber(testQ["beton"]) - 1
					testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
				elseif x == 3 then
					SendChatMessage("Хмм... А что будет если оставить тут след от моей задницы?", "OFFICER", nil, 1)
					testQ["kamen"] = tonumber(testQ["kamen"]) - 1
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
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
			if mioFld[nome]["объекты"][tostring(id)] == "ar" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("aS " .. id .. " " .. 14990, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "bi" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("bS " .. id .. " " .. 14990, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "to" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("tO " .. id .. " " .. 14990, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "ko" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("kX " .. id .. " " .. 14990, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "mz" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m1.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m1.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("m2 " .. id .. " " .. 990, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "bh" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("bH " .. id .. " " .. 14990, nome, "guild")
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
			if mioFld[nome]["объекты"][tostring(id)] == "zp" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zc.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zc.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("zPx " .. id .. " " .. 9998, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "mf" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("mFXX " .. id .. " " .. 29998, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "tv" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tz.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tz.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("tVxx " .. id .. " " .. 29998, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "ob" then
				if testQ["temp"] == nil then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					SendAddonMessage("oXX " .. id .. " " .. 998, nome, "guild")
					testQ["temp"] = nil
				end
			end
			if mioFld[nome]["объекты"][tostring(id)] == "ox" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "m1" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "kx" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "hs" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "lx" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "tz" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "zc" then
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
			if mioFld[nome]["объекты"][tostring(id)] == "as" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "bc" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "bx" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "bs" then
				treeX(nome,myNome,id)
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
			end
			if mioFld[nome]["объекты"][tostring(id)] == "m0" then
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
		testQ["bi"] = 0
		testQ["ar"] = 0
		testQ["zp"] = 0
		testQ["tv"] = 0
		testQ["mf"] = 0
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
					if  mioFld[nome]["объекты"][tostring(i)] == "zp" then
						testQ["zp"] = testQ["zp"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "mf" then
						testQ["mf"] = testQ["mf"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "tv" or mioFld[nome]["объекты"][tostring(i)] == "tz" then
						testQ["tv"] = testQ["tv"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "ar" or mioFld[nome]["объекты"][tostring(i)] == "as" then
						testQ["ar"] = testQ["ar"]+1
					end
					if  mioFld[nome]["объекты"][tostring(i)] == "bi" or mioFld[nome]["объекты"][tostring(i)] == "bh" or mioFld[nome]["объекты"][tostring(i)] == "bs" or mioFld[nome]["объекты"][tostring(i)] == "to" or mioFld[nome]["объекты"][tostring(i)] == "bx" or mioFld[nome]["объекты"][tostring(i)] == "bc" then
						testQ["bi"] = testQ["bi"]+1
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
				if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
					if mioFld[nome]["объекты"][tostring(id)] == "h" or mioFld[nome]["объекты"][tostring(id)] == "sx" then
						vybor:configure(12)
						vybor[12]:SetPoint("CENTER", fBtn[id],"CENTER",96, 0)
						vybor[12]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
						vybor[12]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
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
		if nome == myNome then
			if mioFld[nome]["объекты"][tostring(id)] == "sx" and (mioFld[nome]["петы"][tostring(id)] == "gob" or mioFld[nome]["петы"][tostring(id)] == "gom") then
				vybor:configure(28)
				vybor[28]:SetPoint("CENTER", fBtn[id],"CENTER",-96, 0)
				vybor[28]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
				vybor[28]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
				vybor[28]:Show()
				if testQ ~= nil then
					testQ["idp"] = id
					testQ["icon"] = "smg"
					testQ["picon"] = mioFld[nome]["объекты"][tostring(id)]
				end
			end
		end

		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld[nome]["объекты"][tostring(id)] == "z" then
				if vybor[31] == nil or not vybor[31]:IsVisible() then
					vybor:configure(31)
					vybor[31]:SetPoint("CENTER", fBtn[id],"CENTER",0, -96)
					vybor[31]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ko.tga")
					vybor[31]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ko.tga")
					vybor[31]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "ko"
						testQ["picon"] = "z"
					end
				end
			end
		end

		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if testQ["tv"] < 1 and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 then
				if mioFld[nome]["объекты"][tostring(id)] == "bn" then
					if vybor[19] == nil or not vybor[19]:IsVisible() then
						vybor:configure(19)
						vybor[19]:SetPoint("CENTER", fBtn[id],"CENTER",-1*64, -96)
						vybor[19]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tv.tga")
						vybor[19]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tv.tga")
						vybor[19]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "tv"
							testQ["picon"] = "bn"
						end
					end
				end
			end
		end
		if tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 then
			if mioFld[nome]["объекты"][tostring(id)] == "ba" then
				if vybor[34] == nil or not vybor[34]:IsVisible() then
					vybor:configure(34)
					vybor[34]:SetPoint("CENTER", fBtn[id],"CENTER",-1*64, 96)
					vybor[34]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\mz.tga")
					vybor[34]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\mz.tga")
					vybor[34]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "mz"
						testQ["picon"] = "ba"
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld[nome]["объекты"][tostring(id+1)] == "mf" and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 then
				if mioFld[nome]["объекты"][tostring(id)] == "bn" then
					if vybor[27] == nil or not vybor[27]:IsVisible() then
						vybor:configure(27)
						vybor[27]:SetPoint("CENTER", fBtn[id],"CENTER",64, -96)
						vybor[27]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\lp.tga")
						vybor[27]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\lp.tga")
						vybor[27]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "lp"
							testQ["picon"] = "bn"
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if testQ["tv"] == 1 and testQ["s"] == 1 and testQ["mf"] ~= 1 then
				if mioFld[nome]["объекты"][tostring(id)] == "bn" then
					if vybor[20] == nil or not vybor[20]:IsVisible() then
						vybor:configure(20)
						vybor[20]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
						vybor[20]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\mf.tga")
						vybor[20]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\mf.tga")
						vybor[20]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "mf"
							testQ["picon"] = "bn"
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if testQ["zp"] < 1 then
				if mioFld[nome]["объекты"][tostring(id)] == "bn" and mioFld[nome]["объекты"][tostring(id+1)] == "za" and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 then
					if vybor[18] == nil or not vybor[18]:IsVisible() then
						vybor:configure(18)
						vybor[18]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
						vybor[18]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zc.tga")
						vybor[18]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zc.tga")
						vybor[18]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "zc"
							testQ["picon"] = "bn"
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 then
				if vybor[29] == nil or not vybor[29]:IsVisible() then
					vybor:configure(29)
					vybor[29]:SetPoint("CENTER", fBtn[id],"CENTER",64, -96)
					vybor[29]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ob.tga")
					vybor[29]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ob.tga")
					vybor[29]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "ob"
						testQ["picon"] = "bn"
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4  or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4  or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld[nome]["объекты"][tostring(id)] == "m" or mioFld[nome]["объекты"][tostring(id)] == "mx" or mioFld[nome]["объекты"][tostring(id)] == "hs" or mioFld[nome]["объекты"][tostring(id)] == "ms" or mioFld[nome]["объекты"][tostring(id)] == "uz" or mioFld[nome]["объекты"][tostring(id)] == "zs" or mioFld[nome]["объекты"][tostring(id)] == "zx" or mioFld[nome]["объекты"][tostring(id)] == "skc" or mioFld[nome]["объекты"][tostring(id)] == "sx" or mioFld[nome]["объекты"][tostring(id)] == "zp" or mioFld[nome]["объекты"][tostring(id)] == "bc" then
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
		if tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 and (mioFld[nome]["объекты"][tostring(id-1)] ~= nil and mioFld[nome]["объекты"][tostring(id-1)] == "s") then
				if vybor[11] == nil or not vybor[11]:IsVisible() then
					if tonumber(testQ["bi"]) == 0 and tonumber(testQ["s"]) == 1 then
						vybor:configure(14)
						vybor[14]:SetPoint("CENTER", fBtn[id],"CENTER",-64, 96)
						vybor[14]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bi.tga")
						vybor[14]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bi.tga")
						vybor[14]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "bi"
							testQ["picon"] = "bn"
						end
						vybor:configure(15)
						vybor[15]:SetPoint("CENTER", fBtn[id],"CENTER",64, 96)
						vybor[15]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bh.tga")
						vybor[15]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bh.tga")
						vybor[15]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "bh"
							testQ["picon"] = "bn"
						end
						vybor:configure(16)
						vybor[16]:SetPoint("CENTER", fBtn[id],"CENTER",192, 96)
						vybor[16]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\to.tga")
						vybor[16]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\to.tga")
						vybor[16]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "to"
							testQ["picon"] = "bn"
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 and (mioFld[nome]["объекты"][tostring(id+1)] ~= nil and mioFld[nome]["объекты"][tostring(id+1)] == "s") then
				if vybor[17] == nil or not vybor[17]:IsVisible() then
					if tonumber(testQ["ar"]) == 0 and tonumber(testQ["s"]) == 1 then
						vybor:configure(17)
						vybor[17]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
						vybor[17]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ar.tga")
						vybor[17]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ar.tga")
						vybor[17]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "ar"
							testQ["picon"] = "bn"
						end
					end
				end
			end
		end
		if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
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
		if testQ["logConfig"] == 1 then
			if mioFld[nome]["объекты"][tostring(id)] == "bn" then
				if testQ["lom"] ~= nil and testQ["lom"] >= 1 then
					vybor:configure(32)
					local x = math.random(-100,100)
					local x1 = math.random(-100,100)
					vybor[32]:SetPoint("CENTER", fBtn[id],"CENTER",x,x1)
					vybor[32]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\lom.tga")
					vybor[32]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\lom.tga")
					vybor[32]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "lom"
						testQ["picon"] = "bn"
					end
				end
			end
		end
		if testQ["doskaConfig"] == 1 then
			if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) <= -1 then
				if testQ["doska"] ~= nil and testQ["doska"] >= 1 then
					vybor:configure(33)
					local x = math.random(-100,100)
					local x1 = math.random(-100,100)
					vybor[33]:SetPoint("CENTER", fBtn[id],"CENTER",x,x1)
					vybor[33]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\doska.tga")
					vybor[33]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\doska.tga")
					vybor[33]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "doska"
						testQ["picon"] = "bn"
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
						vybor[12]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
						vybor[12]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
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
				if mioFld[nome]["объекты"][tostring(id)] == "ko" then
					GameTooltip:AddLine("Колодец желаний")
					GameTooltip:AddLine("А что будет, если кинуть в колодец лотерейный билет? Может он размокнет?")
					GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40Скинуть в колодец лотерейный билет")
					GameTooltip:AddLine("|cff99ff99СКМ: |cffFFCF40Скинуть в колодец треть лотерейного билета")

				end
				if mioFld[nome]["объекты"][tostring(id)] == "za" and tonumber(testQ["kamen"]) >= 1 then
					GameTooltip:AddLine("|cFF6495EDБетонный завод")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Потребление: 1-5 камня за попытку")
					GameTooltip:AddLine("|cff99ff99Держать ЛКМ: |cffFFCF40добывать бетон")
					GameTooltip:AddLine("|cff99ff99Не держать ЛКМ: |cffFFCF40не добывать добывать бетон. Хм, что логично..")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Доступна пристройка: кирпичный цех(требуется бетонный фундамент)")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "m" then
					GameTooltip:AddLine("|cFF6495EDКаменоломня")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Тут можно добывать камень.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40добывать камень |cff99ff99(шансы: 1 из 500 кликов)")
					GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40сломать рудник")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "f" then
					if tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 100 then
						GameTooltip:AddLine("Густая трава. Ну видно же!")
						GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
						GameTooltip:AddLine("шанс получить траву: |cff99ff991%")
					end
					if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 100 and tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 200 then
						GameTooltip:AddLine("Густая трава. Ну видно же!")
						GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
						GameTooltip:AddLine("шанс получить траву: |cff99ff995%")
					end
					if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 200 and tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 500 then
						GameTooltip:AddLine("Густая трава. Ну видно же!")
						GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
						GameTooltip:AddLine("шанс получить траву: |cff99ff9910%")
					end
					if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 500 and tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 900 then
						GameTooltip:AddLine("Густая трава. Ну видно же!")
						GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
						GameTooltip:AddLine("шанс получить траву: |cff99ff9950%")
					end
					if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 900 then
						GameTooltip:AddLine("Густая трава. Ну видно же!")
						GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
						GameTooltip:AddLine("шанс получить траву: |cff99ff9990%")
					end
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ts" then
					GameTooltip:AddLine("|cFF6495EDТоварный склад")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffff2b2bЛКМ: Отказаться от стандартной награды за лвлап и получить рандомные ресурсы")
					GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40сломать склад")
					GameTooltip:AddLine("|cff99ff99Шанс получить пета")
				end
				if testQ[myNome]["hTimer"] ~= nil and mioFld[nome]["объекты"][tostring(id)] == "s" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDСельсовет")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffff2b2bВы что, не видите?! У нас обед!!!")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40получить квест")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - квест на эмоции")
					GameTooltip:AddLine("|cffFFCF40если есть таймер - сдать |cff99ff99магическую ткань|cffFFCF40 (не реализовано)")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Доступно 4 пристройки:")
					GameTooltip:AddLine("|cff99ff99Библиотека: |cffFFCF40увеличивает опыт для квеста в хижине")
					GameTooltip:AddLine("|cff99ff99Бухгалтерия: |cffFFCF40дает единицу опыта к товарным квестам")
					GameTooltip:AddLine("|cff99ff99Отдел логистики: |cffFFCF40ускоряет таймер")
					GameTooltip:AddLine("|cff99ff99Архив: |cffFFCF40информация о прогрессе")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "sx" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDСтройка: Будущий сельсовет")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40строить")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "m1" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDСтройка: Строительство музея")
					GameTooltip:AddLine("|cFF6495EDСтройка: Когда нибудь сюда можно будет привозить все награбленное, но ценное только в духовном плане")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40строить")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "mz" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDМузей")
					GameTooltip:AddLine("|cffFFCF40Обычно в музеях хранят все недостаточно ценное, чтобы применить это в реальной жизни")
					GameTooltip:AddLine("|cffFFCF40Чаще всего это художественные ценности, которые стали ничейными по причине внезапной гибели их прошлых хозяев")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Войти")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if testQ[myNome]["hTimer"] == nil and mioFld[nome]["объекты"][tostring(id)] == "s" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDСельсовет")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40получить квест")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - квест на эмоции")
					GameTooltip:AddLine("|cffFFCF40если есть таймер - сдать |cff99ff99магическую ткань|cffFFCF40 (не реализовано)")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Доступно 4 пристройки:")
					GameTooltip:AddLine("|cff99ff99Библиотека: |cffFFCF40увеличивает опыт для квеста в хижине")
					GameTooltip:AddLine("|cff99ff99Бухгалтерия: |cffFFCF40дает единицу опыта к товарным квестам")
					GameTooltip:AddLine("|cff99ff99Отдел логистики: |cffFFCF40ускоряет таймер")
					GameTooltip:AddLine("|cff99ff99Архив: |cffFFCF40информация о прогрессе")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) >= 999 then
					GameTooltip:AddLine("Бетонный фундамент под здание")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld[nome]["целостность"][tostring(id)]) < 999 then
					GameTooltip:AddLine("Только что залитый сырой бетонный фундамент, а что если тыкнуть в него..мм.. пальцем?")
					GameTooltip:AddLine("|cffff2b2bКаждая попытка мародерства: минус рандомный ресурс")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "z" then
					GameTooltip:AddLine("Слегка рыхлая сырая земля..ее что, копали?")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "t" then
					GameTooltip:AddLine("Определенно это дерево... Может у него спросить чего?")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Рубить дерево")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "sb" then
					GameTooltip:AddLine("|cFF6495EDСклад бревен")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Кладбище невинно убиенных деревьев, огороженное их трупами.")
					GameTooltip:AddLine("Каждый склад расширяет хранилище бревен на |cff99ff99100")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "sk" then
					GameTooltip:AddLine("|cFF6495EDСклад камней")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Склад камней или правильно - сад камней? Хм..")
					GameTooltip:AddLine("Каждый склад расширяет хранилище камней на |cff99ff99100")
				end

				if mioFld[nome]["объекты"][tostring(id)] == "ar" then
					GameTooltip:AddLine("|cFF6495EDАрхив")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Тут можно узнать многие тайны..или не узнать.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Узнать свой прогресс")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "bi" then
					GameTooltip:AddLine("|cFF6495EDБиблиотека")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Плюс |cff99ff99единица опыта|cffFFCF40 к квестам в хижине")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Здесь нельзя шуметь!")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "to" then
					GameTooltip:AddLine("|cFF6495EDОтдел логистики")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Ускоряет таймер вдвое! И это как минимум! Мы очень быстрые...")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "bh" then
					GameTooltip:AddLine("|cFF6495EDБухгалтерия")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Если существует (но сомневается в этом, как и все мы), квесты на шерсть и прочие товары принесут |cff99ff99единицу опыта.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Кликать бесполезно")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "uz" then
					GameTooltip:AddLine("Еще не доконца утоптанная земля. Неровности там всякие.. Ну, воон там.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Топтать. Хм.. Или утаптывать?")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Портить все что утоптал")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "zt" then
					GameTooltip:AddLine("Очень хорошо утоптанная земля, молодец.")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ms" then
					GameTooltip:AddLine("Эта дырка в земле очень хорошо демонстрирует, что такое заготовка под рудник")
					GameTooltip:AddLine("А может все бросить и ну его нафиг?")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40копать до упора")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40все портить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "h" then
					GameTooltip:AddLine("|cFF6495EDХижина")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Хижина, дом, бла бла. Тут можно получить квест.")
					GameTooltip:AddLine("Я серьезно: |cff99ff99ЛКМ: " .. "|cffFFCF40получить квест")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - получить достижение")
					GameTooltip:AddLine("|cffFFCF40если есть таймер - сдать |cff99ff99шерсть")
					GameTooltip:AddLine("|cff99ff99Сдача шерсти: |cffFFCF40снижает таймер на рандомное время, дает рандомные плюшки")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "zp" then
					GameTooltip:AddLine("|cFF6495EDКирпичный цех")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Можно производить кирпичи, а можно не производить")
					GameTooltip:AddLine("|cff99ff99Зажать ЛКМ или поставить пета: " .. "|cffFFCF40производить кирпичи.")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("Для производства кирпича требуется одновременно работающий завод бетона")
					GameTooltip:AddLine("Периодически потребляет бревна и траву..хм.. И бетон, ведь это силикатные кирпичи.")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "zc" then
					GameTooltip:AddLine("|cFF6495EDКирпичный цех")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Можно производить кирпичи, а можно не производить")
					GameTooltip:AddLine("|cff99ff99ЛКМ или поставить пета: " .. "|cffFFCF40строить.")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "tv" then
					GameTooltip:AddLine("|cFF6495EDТаверна \"Ухо Гоблина\"")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Выдает квесты на получение пунктов ачивок")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Зайти внутрь")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99Сдача ткани пустоты: |cffFFCF40снижает таймер на рандомное время, дает рандомные плюшки")
					GameTooltip:AddLine("Когда то один гоблин поспорил на свое ухо и проиграл...")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "mf" then
					GameTooltip:AddLine("|cFF6495EDМебельная фабрика")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Позволяет создавать всякое деревянное. И перерабатывать.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Зайти внутрь")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ox" then
					GameTooltip:AddLine("|cFF6495EDСтройка")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Этот обелиск такой..черный...")
					GameTooltip:AddLine("Нужно больше камней положить друг на друга")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40положить еще один камень")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld[nome]["объекты"][tostring(id)] == "ob" then
					GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
					GameTooltip:AddLine("|cffFF8C001. |cffFFFFE0Управление гильдией осуществляется путем прямой демократии: 1 игрок - 1 голос*.")
					GameTooltip:AddLine("|cffFFFFE0*глава гильдии - тот самый игрок, который имеет единственный голос.")
					GameTooltip:AddLine ("|cffFF8C001.1. |cffFFFFE0Орнелла Мути законодательно является лучше Моники Белуччи и любых других актрис (или альтернативных актеров)")
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
					GameTooltip:AddLine ("|cffFF8C007.2 Запрещено указывать свой город и страну: мут на усмотрение офицеров")
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
				if mioFld[nome]["объекты"][tostring(id)] == "lp" then
					GameTooltip:AddLine("|cFF6495EDЛесопилка")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Позволяет распиливать деревья и не только...")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Зайти внутрь: расходует |cff99ff991 |cffFFCF40бревно")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld[nome]["влияние"] ~= nil then
					if mioFld[nome]["влияние"][tostring(id)] ~= nil then
						local skryt = mysplit(mioFld[nome]["влияние"][tostring(id)])
						if skryt[2] ~= nil then
							if tonumber(skryt[2]) <= testQ[myNome]["характеристики"]["внимательность"] then
								GameTooltip:AddLine("Следы: " .. mioFld[nome]["влияние"][tostring(id)])
							end
						else
							GameTooltip:AddLine("|cffcd00cdСледы: " .. mioFld[nome]["влияние"][tostring(id)])
						end
					end
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
		testQ["zavodp"] = nil
		testQ["zavodpc"] = nil
		testQ["temp"] = nil
		testQ['icon'] = nil
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
		if fBtn[id] ~= nil then
			fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .. ".tga")
		end
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

function dBtn:configure(id,posex,posey,sizex,sizey,zzid,message)
	if self[id] == nil then
		self[id] = CreateFrame("Button", nil, UIParent, "");
	end
	self[id]:SetFrameStrata("FULLSCREEN")
	self[id]:SetPoint("CENTER",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:Hide();
	self[id]:RegisterForClicks("RightButtonDown","LeftButtonUp")
	self[id]:SetScript("OnClick",function(self, button)
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if arg1 == "LeftButton" then
			if mioFld == nil then
				mioFld = {}
			end
			if mioFld[nome] == nil then
				mioFld[nome] = {}
			end
			if mioFld[nome][testQ["domZ"]] == nil then
				mioFld[nome][testQ["domZ"]] = {}
			end
			if testQ["domZ"] == "taverna" then
				if mioFld[nome][testQ["domZ"]][tostring(id)] == "b0" then
					if testQ[myNome]["hTimer"] ~= nil then
						if testQ[myNome]["взятый_квест_t"] == nil then
							if testQ[myNome]["взятый_квест_t"] == nil or testQ[myNome]["взятый_квест_t"] ~= "9999" then
								if testQ[myNome]["itemQend"] ~= 1 then
									local qq
									while true do
										qq=math.random(1,#pQuest["items"])
										if tostring(pQuest["items"][qq]["itemName"]) == "Ткань Пустоты" then
										print(tostring(pQuest["items"][qq]["itemName"]))
											testQ[myNome]["itemName"]=tostring(pQuest["items"][qq]["itemName"])
											testQ[myNome]["itemNum"]=tonumber(pQuest["items"][qq]["itemNum"])
											testQ[myNome]["itemEnStuck"]=tonumber(pQuest["items"][qq]["itemEnStuck"])
											break
										end
									end
									testQ["okno"] = "itemQ"
									testQ["itemQVzyat"] = 1
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно прислать Вождю " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"],1,"show")
									for i=1,100 do
										fBtn[i]:Hide()
									end
									for i = 1, 100 do
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
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
									for i = 1, 100 do
										dBtn[i]:Hide()
									end
									for i = 1, 100 do
										if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
											if resursy[i] ~= nil then
												if i == 5 then
													if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
													end
												else
													resursy[i]:Hide()
												end
											end
										end
									end
									btn[989]:Hide()
									btn[989]:ClearAllPoints()
									btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								end
							else
								if testQ[myNome]["взятый_квест_t"] ~= nil then

								else

								end
							end
						else
							local count = nil
							count = GetAchievementNumCriteria(tonumber(testQ[myNome]["взятый_квест_t"]))
							local ii = 0
							for j = 1, count do
								local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["взятый_квест_t"]), j);
								if completed == true then
									ii = ii + 1
								end
							end
							if ii < tonumber(testQ["taverna_num_q"])+3 then
								testQ["okno"] = "tavernaQ"
								rtnTextF("Мне нужно получить " .. tonumber(testQ["taverna_num_q"])+3 .. " пунктов ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_t"])) .. " или выполнить ее",1,"show")
								quesT("show")
								okNo:configure(1,"show")
								for i=1,100 do
									dBtn[i]:Hide()
								end
								for i = 1, 100 do
									if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
										if resursy[i] ~= nil then
											if i == 5 then
												if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
												end
											else
												resursy[i]:Hide()
											end
										end
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
							else
								SendChatMessage("ВОЖДЬ, я выполнил квест", "OFFICER", nil, 1)
								SendAddonMessage("#hQ1 " .. "b0", "", "guild")
								--htimer(myNome)
								for i=1,100 do
									dBtn[i]:Hide()
								end
								for i = 1, 100 do
									if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
										if resursy[i] ~= nil then
											if i == 5 then
												if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
												end
											else
												resursy[i]:Hide()
											end
										end
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								testQ['sign'] = nil
								testQ["okno"] = nil
							end
						end
					else
						if testQ[myNome]["взятый_квест_t"] == nil then
							local count = nil
							local q = nil
							local i = 1
							while true do
								local x = math.random(1,#tQuest)
								count = GetAchievementNumCriteria(tQuest[x])
								for j = 1, count do
									local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(tQuest[x], j);
									if completed == false then
										q = tQuest[x]
										break
									end
								end
								if q == nil then
									i = i + 1
									if i >= #tQuest then
										count = nil
										break
									end
								else
									break
								end
							end
							if count ~= nil then
								local ii = 0
								for j = 1, count do
									local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(q, j);
									if completed == true then
										ii = ii + 1
									end
								end
								testQ["taverna_num_q"] = ii
								testQ["okno"] = "tavernaQ"
								testQ[myNome]["взятый_квест_t"] = q
								htimer(myNome)
								rtnTextF("Мне нужно получить " .. tonumber(testQ["taverna_num_q"])+3 .. " пунктов ачивки " .. GetAchievementLink(q) .. " или выполнить ее",1,"show")
								quesT("show")
								okNo:configure(1,"show")
								for i=1,100 do
									dBtn[i]:Hide()
								end
								for i = 1, 100 do
									if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
										if resursy[i] ~= nil then
											if i == 5 then
												if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
												end
											else
												resursy[i]:Hide()
											end
										end
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
							else
								SendChatMessage("В таверне больше нет квестов для меня", "OFFICER", nil, 1)
							end
						else
							local count = nil
							count = GetAchievementNumCriteria(tonumber(testQ[myNome]["взятый_квест_t"]))
							local ii = 0
							for j = 1, count do
								local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["взятый_квест_t"]), j);
								if completed == true then
									ii = ii + 1
								end
							end
							if ii < tonumber(testQ["taverna_num_q"])+3 then
								testQ["okno"] = "tavernaQ"
								rtnTextF("Мне нужно получить " .. tonumber(testQ["taverna_num_q"])+3 .. " пунктов ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест_t"])) .. " или выполнить ее",1,"show")
								quesT("show")
								okNo:configure(1,"show")
								for i=1,100 do
									dBtn[i]:Hide()
								end
								for i = 1, 100 do
									if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
										if resursy[i] ~= nil then
											if i == 5 then
												if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
												end
											else
												resursy[i]:Hide()
											end
										end
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
							else
								SendChatMessage("ВОЖДЬ, я выполнил квест", "OFFICER", nil, 1)
								SendAddonMessage("#hQ1 " .. "", "", "guild")
								--htimer(myNome)
								for i=1,100 do
									dBtn[i]:Hide()
								end
								for i = 1, 100 do
									if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
										if resursy[i] ~= nil then
											if i == 5 then
												if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
												end
											else
												resursy[i]:Hide()
											end
										end
									end
								end
								btn[989]:Hide()
								btn[989]:ClearAllPoints()
								btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
								hX()
								testQ['sign'] = nil
								testQ["okno"] = nil
							end
						end
					end
				end
			end
			if mioFld[nome][testQ["domZ"]][tostring(id)] == "my" then
				testQ["domZ"] = "crt"
				for i = 1, 100 do
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
				end
				testQ["diffT"] = {}
				for i = 1, 100 do
					testQ["diffT"][i] = "st"
				end
				testQ["brevna"] = tonumber(testQ["brevna"])-1
				testQ["nikQB"] = antc(testQ["brevna"])
				dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
			end
		end
		if arg1 == "RightButton" then
			if testQ["domZ"] == "taverna" then
				if mioFld[nome][testQ["domZ"]][tostring(id)] == "b0" then
					--mioFld[nome]["taverna"][tostring(i)] = "pl"
				end
			end
			if mioFld[nome][testQ["domZ"]][tostring(id)] == "my" then
				SendAddonMessage("#yImx " .. id, nome, "guild")
				if testQ["yi"] ~= nil then
					testQ["yi"] = tonumber(testQ["yi"])+1
				else
					testQ["yi"] = 1
				end
				testQ["diffT"] = {}
				for i = 1,100 do
					testQ["diffT"][i] = "st"
				end
			end
		end
	end)
	self[id]:SetScript("OnEnter",function(self, button)
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if testQ["domZ"] == "crt" then
			if vybor[22] == nil or not vybor[22]:IsVisible() then
				vybor:configure(22)
				vybor[22]:SetPoint("CENTER", dBtn[id],"CENTER",-192, 96)
				vybor[22]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\b.tga")
				vybor[22]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\b.tga")
				vybor[22]:Show()
				testQ["idp"] = id
			end
			if vybor[23] == nil or not vybor[23]:IsVisible() then
				vybor:configure(23)
				vybor[23]:SetPoint("CENTER", dBtn[id],"CENTER",-64, 96)
				vybor[23]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\f.tga")
				vybor[23]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\f.tga")
				vybor[23]:Show()
				testQ["idp"] = id
			end
			if vybor[24] == nil or not vybor[24]:IsVisible() then
				vybor:configure(24)
				vybor[24]:SetPoint("CENTER", dBtn[id],"CENTER",64, 96)
				vybor[24]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kamen.tga")
				vybor[24]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kamen.tga")
				vybor[24]:Show()
				testQ["idp"] = id
			end
			if vybor[25] == nil or not vybor[25]:IsVisible() then
				vybor:configure(25)
				vybor[25]:SetPoint("CENTER", dBtn[id],"CENTER",192, 96)
				vybor[25]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\doska.tga")
				vybor[25]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\doska.tga")
				vybor[25]:Show()
				testQ["idp"] = id
			end
			if vybor[26] == nil or not vybor[26]:IsVisible() then
				vybor:configure(26)
				vybor[26]:SetPoint("CENTER", dBtn[id],"CENTER",320, 96)
				vybor[26]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kirpich.tga")
				vybor[26]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kirpich.tga")
				vybor[26]:Show()
				testQ["idp"] = id
			end
		end
		if testQ["domZ"] == "taverna" then
			if testQ["b0"] ~= nil and testQ["b0"] >= 1 then
				if vybor[30] == nil or not vybor[30]:IsVisible() then
					vybor:configure(30)
					vybor[30]:SetPoint("CENTER", dBtn[id],"CENTER",-64, 96)
					vybor[30]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\b0.tga")
					vybor[30]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\b0.tga")
					vybor[30]:Show()
					testQ["idp"] = id
				end
			end
		end
		if testQ["domZ"] == "mf" and mioFld[nome][testQ["domZ"]][tostring(id)] == "bn" then
			if vybor[21] == nil or not vybor[21]:IsVisible() then
				vybor:configure(21)
				vybor[21]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
				vybor[21]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\yi.tga")
				vybor[21]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\yi.tga")
				vybor[21]:Show()
				if testQ ~= nil then
					testQ["idp"] = id
					testQ["icon"] = "yi"
					testQ["picon"] = "bn"
				end
			end

		end
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if testQ["domZ"] ~= nil then
			if mioFld[nome] == nil then
				mioFld[nome] = {}
			end
			if mioFld[nome][testQ["domZ"]] == nil then
				mioFld[nome][testQ["domZ"]] = {}
			end
			if mioFld[nome][testQ["domZ"]][tostring(id)] == "my" then
				GameTooltip:AddLine("|cFF6495EDЯщик с инструментами:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Какие забавные внутри винтики и всякие отверточки")
				GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40создать Шедевр!")
				GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40забрать")
			end
		end
		if testQ["domZ"] == "taverna" then
			if mioFld ~= nil then
				if mioFld[nome] ~= nil then
					if mioFld[nome][testQ["domZ"]] ~= nil then
						if mioFld[nome][testQ["domZ"]][tostring(id)] == "b0" then
							GameTooltip:AddLine("|cFF6495EDБарная стойка:")
							GameTooltip:AddLine(" ")
							GameTooltip:AddLine("Взять квест")
						end
					end
				end
			end
		end
		GameTooltip:Show()
		btn[989]:Show()
	end)
	self[id]:SetScript("OnLeave",function(self, button)
		for i = 1,100 do
			if vybor[i]~= nil and vybor[i]:IsVisible() then
				vybor[i]:Hide()
			end
		end
		GameTooltip:Hide();
	end)
end

dBtn:configure(1,-320,320,64,64,"","");
dBtn:configure(2,-256,320,64,64,"","");
dBtn:configure(3,-192,320,64,64,"","");
dBtn:configure(4,-128,320,64,64,"","");
dBtn:configure(5,-64,320,64,64,"","");
dBtn:configure(6,0,320,64,64,"","");
dBtn:configure(7,64,320,64,64,"","");
dBtn:configure(8,128,320,64,64,"","");
dBtn:configure(9,192,320,64,64,"","");
dBtn:configure(10,256,320,64,64,"","");
dBtn:configure(11,-320,256,64,64,"","");
dBtn:configure(12,-256,256,64,64,"","");
dBtn:configure(13,-192,256,64,64,"","");
dBtn:configure(14,-128,256,64,64,"","");
dBtn:configure(15,-64,256,64,64,"","");
dBtn:configure(16,-0,256,64,64,"","");
dBtn:configure(17,64,256,64,64,"","");
dBtn:configure(18,128,256,64,64,"","");
dBtn:configure(19,192,256,64,64,"","");
dBtn:configure(20,256,256,64,64,"","");
dBtn:configure(21,-320,192,64,64,"","");
dBtn:configure(22,-256,192,64,64,"","");
dBtn:configure(23,-192,192,64,64,"","");
dBtn:configure(24,-128,192,64,64,"","");
dBtn:configure(25,-64,192,64,64,"","");
dBtn:configure(26,0,192,64,64,"","");
dBtn:configure(27,64,192,64,64,"","");
dBtn:configure(28,128,192,64,64,"","");
dBtn:configure(29,192,192,64,64,"","");
dBtn:configure(30,256,192,64,64,"","");
dBtn:configure(31,-320,128,64,64,"","");
dBtn:configure(32,-256,128,64,64,"","");
dBtn:configure(33,-192,128,64,64,"","");
dBtn:configure(34,-128,128,64,64,"","");
dBtn:configure(35,-64,128,64,64,"","");
dBtn:configure(36,0,128,64,64,"","");
dBtn:configure(37,64,128,64,64,"","");
dBtn:configure(38,128,128,64,64,"","");
dBtn:configure(39,192,128,64,64,"","");
dBtn:configure(40,256,128,64,64,"","");
dBtn:configure(41,-320,64,64,64,"","");
dBtn:configure(42,-256,64,64,64,"","");
dBtn:configure(43,-192,64,64,64,"","");
dBtn:configure(44,-128,64,64,64,"","");
dBtn:configure(45,-64,64,64,64,"","");
dBtn:configure(46,0,64,64,64,"","");
dBtn:configure(47,64,64,64,64,"","");
dBtn:configure(48,128,64,64,64,"","");
dBtn:configure(49,192,64,64,64,"","");
dBtn:configure(50,256,64,64,64,"","");
dBtn:configure(51,-320,0,64,64,"","");
dBtn:configure(52,-256,0,64,64,"","");
dBtn:configure(53,-192,0,64,64,"","");
dBtn:configure(54,-128,0,64,64,"","");
dBtn:configure(55,-64,0,64,64,"","");
dBtn:configure(56,0,0,64,64,"","");
dBtn:configure(57,64,0,64,64,"","");
dBtn:configure(58,128,0,64,64,"","");
dBtn:configure(59,192,0,64,64,"","");
dBtn:configure(60,256,0,64,64,"","");
dBtn:configure(61,-320,-64,64,64,"","");
dBtn:configure(62,-256,-64,64,64,"","");
dBtn:configure(63,-192,-64,64,64,"","");
dBtn:configure(64,-128,-64,64,64,"","");
dBtn:configure(65,-64,-64,64,64,"","");
dBtn:configure(66,0,-64,64,64,"","");
dBtn:configure(67,64,-64,64,64,"","");
dBtn:configure(68,128,-64,64,64,"","");
dBtn:configure(69,192,-64,64,64,"","");
dBtn:configure(70,256,-64,64,64,"","");
dBtn:configure(71,-320,-128,64,64,"","");
dBtn:configure(72,-256,-128,64,64,"","");
dBtn:configure(73,-192,-128,64,64,"","");
dBtn:configure(74,-128,-128,64,64,"","");
dBtn:configure(75,-64,-128,64,64,"","");
dBtn:configure(76,0,-128,64,64,"","");
dBtn:configure(77,64,-128,64,64,"","");
dBtn:configure(78,128,-128,64,64,"","");
dBtn:configure(79,192,-128,64,64,"","");
dBtn:configure(80,256,-128,64,64,"","");
dBtn:configure(81,-320,-192,64,64,"","");
dBtn:configure(82,-256,-192,64,64,"","");
dBtn:configure(83,-192,-192,64,64,"","");
dBtn:configure(84,-128,-192,64,64,"","");
dBtn:configure(85,-64,-192,64,64,"","");
dBtn:configure(86,0,-192,64,64,"","");
dBtn:configure(87,64,-192,64,64,"","");
dBtn:configure(88,128,-192,64,64,"","");
dBtn:configure(89,192,-192,64,64,"","");
dBtn:configure(90,256,-192,64,64,"","");
dBtn:configure(91,-320,-256,64,64,"","");
dBtn:configure(92,-256,-256,64,64,"","");
dBtn:configure(93,-192,-256,64,64,"","");
dBtn:configure(94,-128,-256,64,64,"","");
dBtn:configure(95,-64,-256,64,64,"","");
dBtn:configure(96,0,-256,64,64,"","");
dBtn:configure(97,64,-256,64,64,"","");
dBtn:configure(98,128,-256,64,64,"","");
dBtn:configure(99,192,-256,64,64,"","");
dBtn:configure(100,256,-256,64,64,"","");
function mBtn:configure(id)
	self[id] = CreateFrame("Button", nil, UIParent, "")
	self[id]:SetSize(64, 64)
	if id == 1 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",64, -64)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\b.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\b.tga")
	end
	if id == 2 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",136, -64)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\stog.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\stog.tga")
	end
	if id == 3 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",208, -64)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kamen.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kamen.tga")
	end
	if id == 4 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",280, -64)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bt.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bt.tga")
	end
	if id == 5 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",64, -136)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
	end
	if id == 6 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",136, -136)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gob.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gob.tga")
	end
	if id == 7 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",208, -136)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gom.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gom.tga")
	end
	if id == 8 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",352, -64)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kirpich.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kirpich.tga")
	end
	if id == 9 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",64, -208)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\yi.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\yi.tga")
	end
	if id == 10 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",136, -208)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\stanok.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\stanok.tga")
	end
	if id == 11 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",208, -208)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\doska.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\doska.tga")
	end
	if id == 12 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",64, -280)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\b0.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\b0.tga")
	end
	if id == 13 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",280, -208)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\lom.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\lom.tga")
	end
	if id == 14 then
		self[id]:SetPoint("TOPLEFT", mgznText[1],"TOPLEFT",64, -352)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\lb.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\lb.tga")
	end
	self[id]:RegisterForClicks("RightButtonDown", "LeftButtonDown")

	self[id]:SetScript("OnClick",function(self)
		if arg1 == "LeftButton" then
			if tonumber(testQ["smg"]) >= 1 then
				if id == 1 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["brevna"] = tonumber(testQ["brevna"]) + x
					testQ["nikQB"] = antc(testQ["brevna"])
					dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
					dmgText2(testQ["brevna"],mBtn[1],801,13,"FF8C00")
					print("Получено: " .. x .. " бревен")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 2 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["stog"] = tonumber(testQ["stog"]) + x
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
					dmgText2(testQ["stog"],mBtn[2],802,13,"FF8C00")
					print("Получено: " .. x .. " травы")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 3 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["kamen"] = tonumber(testQ["kamen"]) + x
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
					dmgText2(testQ["kamen"],mBtn[3],803,13,"FF8C00")
					print("Получено: " .. x .. " камня")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 4 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["beton"] = tonumber(testQ["beton"]) + x
					testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
					dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
					dmgText2(string.format("%d", tonumber(testQ["beton"])),mBtn[4],804,13,"FF8C00")
					print("Получено: " .. x .. " бетона")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 8 then
					local x = math.random(1,5)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["kirpich"] = tonumber(testQ["kirpich"]) + x
					testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
					dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
					dmgText2(string.format("%d", tonumber(testQ["kirpich"])),mBtn[8],808,13,"FF8C00")
					print("Получено: " .. x .. " кирпичей")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 11 then
					local x = math.random(1,5)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) + x
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					dmgText2(testQ["doska"],mBtn[11],811,13,"FF8C00")
					dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
					print("Получено досок: " .. x)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 13 then
					local x = math.random(1,100)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					if testQ["lom"] == nil then
						testQ["lom"] = x
					else
						testQ["lom"] = tonumber(testQ["lom"]) + x
					end
					dmgText2(testQ["lom"],mBtn[13],813,13,"FF8C00")
					print("Прочность лома: " .. testQ["lom"])
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			if tonumber(testQ["smg"]) >= 10 then
				if id == 5 then
					testQ[myNome]["петы"]["bb"] = 1
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText2(testQ[myNome]["петы"]["bb"],mBtn[5],805,13,"FF8C00")
					print("Получен: бобер")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			if tonumber(testQ["smg"]) >= 10 then
				if id == 9 then
					testQ["yi"] = tonumber(testQ["yi"])+1
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText2(testQ["yi"],mBtn[9],809,13,"FF8C00")
					print("Получен: Ящик с инструментами")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 12 then
					testQ["b0"] = tonumber(testQ["b0"])+1
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText2(testQ["b0"],mBtn[12],812,13,"FF8C00")
					print("Полученf: Барная стойка")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 14 then
					testQ[myNome]["лотерея"] = tonumber(testQ[myNome]["лотерея"]) + 3
					dmgText2(testQ[myNome]["лотерея"],mBtn[14],814,14,"FF8C00")
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText2(testQ["b0"],mBtn[12],812,13,"FF8C00")
					print("Получен: лотерейный билет")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			if tonumber(testQ["smg"]) >= 30 then
				if id == 10 then
					testQ["stanok"] = tonumber(testQ["stanok"])+1
					testQ["smg"] = tonumber(testQ["smg"]) - 30
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["stanok"] = tonumber(testQ["stanok"])+1
					print("Получен: Распиловочный станок")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			if tonumber(testQ["smg"]) >= 50 then
				if id == 6 then
					testQ[myNome]["петы"]["gg"] = "gob"
					if testQ[myNome]["петы"]["gg"] == "gob" then
						gobT = 1
						dmgText2(gobT,mBtn[6],806,13,"FF8C00")
					else
						gobT = 0
						dmgText2(gobT,mBtn[6],806,13,"FF8C00")
					end
					if testQ[myNome]["петы"]["gg"] == "gom" then
						gomT = 1
						dmgText2(gomT,mBtn[7],807,13,"FF8C00")
					else
						gomT = 0
						dmgText2(gomT,mBtn[7],807,13,"FF8C00")
					end
					testQ["smg"] = tonumber(testQ["smg"]) - 50
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					print("Получен: гоблин")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 7 then
					testQ[myNome]["петы"]["gg"] = "gom"
					if testQ[myNome]["петы"]["gg"] == "gom" then
						gomT = 1
						dmgText2(gomT,mBtn[7],807,13,"FF8C00")
					else
						gomT = 0
						dmgText2(gomT,mBtn[7],807,13,"FF8C00")
					end
					if testQ[myNome]["петы"]["gg"] == "gob" then
						gobT = 1
						dmgText2(gobT,mBtn[6],806,13,"FF8C00")
					else
						gobT = 0
						dmgText2(gobT,mBtn[6],806,13,"FF8C00")
					end
					testQ["smg"] = tonumber(testQ["smg"]) - 50
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText2(gomT,mBtn[7],807,13,"FF8C00")
					print("Получен: гном")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
		end
		if arg1 == "RightButton" then
			if id == 11 then
				if testQ["doskaConfig"] == nil then
					testQ["doskaConfig"] = 1
					print("Доска активирована")
				else
					testQ["doskaConfig"] = nil
					print("Доска отключена")
				end
			end
			if id == 13 then
				if testQ["logConfig"] == nil then
					testQ["logConfig"] = 1
					print("Лом активирован")
				else
					testQ["logConfig"] = nil
					print("Лом отключен")
				end
			end
		end
	end)
	self[id]:SetScript("OnEnter",function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if tonumber(testQ["smg"]) < 1 then
			if id == 11 then
				GameTooltip:AddLine("|cff99ff99Купить досок:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-5")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff00001 бутылка")
			end
		else
			if id == 11 then
				GameTooltip:AddLine("|cff99ff99Купить досок:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-5")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF1 бутылка")
			end
		end
		if tonumber(testQ["smg"]) < 1 then
			if id == 13 then
				GameTooltip:AddLine("|cff99ff99Купить лом или восстановить имеющийся:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Прочность: |cff00BFFF1-100")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff00001 бутылка")
			end
		else
			if id == 13 then
				GameTooltip:AddLine("|cff99ff99Купить лом или восстановить имеющийся:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Прочность: |cff00BFFF1-100")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF1 бутылка")
			end
		end
		if tonumber(testQ["smg"]) < 10 then
			if id == 14 then
				GameTooltip:AddLine("|cff99ff99Купить лотерейный билет:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff000010 бутылок")
			end
		else
			if id == 14 then
				GameTooltip:AddLine("|cff99ff99Купить лотерейный билет:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF10 бутылок")
			end
		end
		if tonumber(testQ["smg"]) < 1 then
			if id == 1 then
				GameTooltip:AddLine("|cff99ff99Купить бревна:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff00001 бутылка")
			end
		else
			if id == 1 then
				GameTooltip:AddLine("|cff99ff99Купить бревна:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF1 бутылка")
			end
		end

		if tonumber(testQ["smg"]) < 1 then
			if id == 2 then
				GameTooltip:AddLine("|cff99ff99Купить траву:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff00001 бутылка")
			end
		else
			if id == 2 then
				GameTooltip:AddLine("|cff99ff99Купить траву:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF1 бутылка")
			end
		end

		if tonumber(testQ["smg"]) < 1 then
			if id == 3 then
				GameTooltip:AddLine("|cff99ff99Купить камень:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff00001 бутылка")
			end
		else
			if id == 3 then
				GameTooltip:AddLine("|cff99ff99Купить камень:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF1 бутылка")
			end
		end

		if tonumber(testQ["smg"]) < 1 then
			if id == 4 then
				GameTooltip:AddLine("|cff99ff99Купить бетон:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff00001 бутылка")
			end
		else
			if id == 4 then
				GameTooltip:AddLine("|cff99ff99Купить бетон:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-10")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF1 бутылка")
			end
		end

		if tonumber(testQ["smg"]) < 1 then
			if id == 8 then
				GameTooltip:AddLine("|cff99ff99Купить кирпич:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-5")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff00001 бутылка")
			end
		else
			if id == 8 then
				GameTooltip:AddLine("|cff99ff99Купить кирпич:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Количество: |cff00BFFF1-5")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF1 бутылка")
			end
		end

		if tonumber(testQ["smg"]) < 10 then
			if id == 5 then
				GameTooltip:AddLine("|cff99ff99Купить бобра:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff000010 бутылок")
				GameTooltip:AddLine("|cffff0000ДОМ ДЛЯ БОБРА ВСЕГО ОДИН. Если в доме будет пет, он будет заменен на купленного.")
			end
			if id == 12 then
				GameTooltip:AddLine("|cff99ff99Купить барную стойку:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff000010 бутылок")
			end
		else
			if id == 5 then
				GameTooltip:AddLine("|cff99ff99Купить бобра:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF10 бутылок")
				GameTooltip:AddLine("|cffff0000ДОМ ДЛЯ БОБРА ВСЕГО ОДИН. Если в доме будет пет, он будет заменен на купленного.")
			end
			if id == 12 then
				GameTooltip:AddLine("|cff99ff99Купить барную стойку:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF10 бутылок")
			end
		end

		if tonumber(testQ["smg"]) < 50 then
			if id == 6 then
				GameTooltip:AddLine("|cff99ff99Купить Гоблина:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff000050 бутылок")
				GameTooltip:AddLine("|cffff0000ДОМ ДЛЯ ГНОМА И ГОБЛИНА ВСЕГО ОДИН. Если в доме будет пет, он будет заменен на купленного.")
			end
		else
			if id == 6 then
				GameTooltip:AddLine("|cff99ff99Купить Гоблина:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF50 бутылок")
				GameTooltip:AddLine("|cffff0000ДОМ ДЛЯ ГНОМА И ГОБЛИНА ВСЕГО ОДИН. Если в доме будет пет, он будет заменен на купленного.")
			end
		end

		if tonumber(testQ["smg"]) < 50 then
			if id == 7 then
				GameTooltip:AddLine("|cff99ff99Купить гнома:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff000050 бутылок")
				GameTooltip:AddLine("|cffff0000ДОМ ДЛЯ ГНОМА И ГОБЛИНА ВСЕГО ОДИН. Если в доме будет пет, он будет заменен на купленного.")
			end
		else
			if id == 7 then
				GameTooltip:AddLine("|cff99ff99Купить гнома:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF50 бутылок")
				GameTooltip:AddLine("|cffff0000ДОМ ДЛЯ ГНОМА И ГОБЛИНА ВСЕГО ОДИН. Если в доме будет пет, он будет заменен на купленного.")
			end
		end
		if tonumber(testQ["smg"]) < 10 then
			if id == 9 then
				GameTooltip:AddLine("|cff99ff99Купить ящик с инструментами:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff000010 бутылок")
			end
		else
			if id == 9 then
				GameTooltip:AddLine("|cff99ff99Купить ящик с инструментами:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF10 бутылок")
			end
		end
		if tonumber(testQ["smg"]) < 30 then
			if id == 10 then
				GameTooltip:AddLine("|cff99ff99Купить распиловочный станок:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cffff000030 бутылок")
			end
		else
			if id == 10 then
				GameTooltip:AddLine("|cff99ff99Купить распиловочный станок:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Стоимость: |cff00BFFF30 бутылок")
			end
		end
		GameTooltip:Show()
	end)
	self[id]:SetScript("OnLeave",function(self)
		GameTooltip:Hide()
	end)
	self[id]:SetFrameStrata("FULLSCREEN")
end
function sBtn:configure(id)
	self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
	self[id]:SetSize(32, 32)
	if id == 1 then
		self[id]:SetPoint("CENTER", UIParent,"CENTER",128, 128)
	end
	if id == 2 then
		self[id]:SetPoint("CENTER", UIParent,"CENTER",160, 128)
	end
	if id == 3 then
		self[id]:SetPoint("CENTER", UIParent,"CENTER",192, 128)
	end
	if id == 4 then
		self[id]:SetPoint("CENTER", UIParent,"CENTER",224, 128)
	end
	self[id]:EnableMouse(false)
	self[id]:Hide()
end
sBtn:configure(1)
sBtn:configure(2)
sBtn:configure(3)
sBtn:configure(4)
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
	if id == 6 then
		self[id]:SetPoint("TOPLEFT", fBtn[10],"TOPLEFT",128, -128)
	end
	if id == 7 then
		self[id]:SetPoint("TOPLEFT", fBtn[10],"TOPLEFT",128, 0)
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
	if id == 6 then
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kirpich.tga")
	end
	if id == 7 then
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\doska.tga")
	end
	self[id]:SetScript("OnEnter",function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if id == 1 then
			GameTooltip:AddLine("|cff99ff99Бревна")
		end
		if id == 2 then
			GameTooltip:AddLine("|cff99ff99Трава")
		end
		if id == 3 then
			GameTooltip:AddLine("|cff99ff99Камень")
		end
		if id == 4 then
			GameTooltip:AddLine("|cff99ff99Бетон")
		end
		if id == 5 then
			GameTooltip:AddLine("|cff99ff99Валюта")
			GameTooltip:AddLine("|cffFFCF40Иногда падает с квеста на шерсть и прочую ткань")
			GameTooltip:AddLine("|cffFFCF40Можно купить на аукционе: |cff99ff99\"Обычное письмо\" |cffFFCF40от персонажа \"Хефе\"")
			GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40Открыть/Закрыть магазин")
		end
		if id == 6 then
			GameTooltip:AddLine("|cff99ff99Кирпич")
		end
		if id == 7 then
			GameTooltip:AddLine("|cff99ff99Доски")
		end
		GameTooltip:Show()
	end)
	self[id]:SetScript("OnLeave",function(self)
		GameTooltip:Hide()
	end)
	self[id]:SetScript("OnClick",function(self)
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if id == 5 then
			if testQ["magSign"] == nil then
				magazin("show")
				testQ["magSign"] = 1
				for i = 1, 100 do
					fBtn[i]:Hide()
				end
				if mBtn[1] == nil then
					mBtn:configure(1)
				else
					mBtn[1]:Show()
				end
				dmgText2(testQ["brevna"],mBtn[1],801,13,"FF8C00")
				if mBtn[2] == nil then
					mBtn:configure(2)
				else
					mBtn[2]:Show()
				end
				dmgText2(testQ["stog"],mBtn[2],802,13,"FF8C00")
				if mBtn[3] == nil then
					mBtn:configure(3)
				else
					mBtn[3]:Show()
				end
				dmgText2(testQ["kamen"],mBtn[3],803,13,"FF8C00")
				if mBtn[4] == nil then
					mBtn:configure(4)
				else
					mBtn[4]:Show()
				end
				dmgText2(string.format("%d", tonumber(testQ["beton"])),mBtn[4],804,13,"FF8C00")
				if mBtn[5] == nil then
					mBtn:configure(5)
				else
					mBtn[5]:Show()
				end
				dmgText2(testQ[myNome]["петы"]["bb"],mBtn[5],805,13,"FF8C00")
				if mBtn[6] == nil then
					mBtn:configure(6)
				else
					mBtn[6]:Show()
				end
				local gobT
				if testQ[myNome]["петы"]["gg"] == "gob" then
					gobT = 1
					dmgText2(gobT,mBtn[6],806,13,"FF8C00")
				else
					gobT = 0
					dmgText2(gobT,mBtn[6],806,13,"FF8C00")
				end
				if mBtn[7] == nil then
					mBtn:configure(7)
				else
					mBtn[7]:Show()
				end
				if testQ[myNome]["петы"]["gg"] == "gom" then
					gomT = 1
					dmgText2(gomT,mBtn[7],807,13,"FF8C00")
				else
					gomT = 0
					dmgText2(gomT,mBtn[7],807,13,"FF8C00")
				end
				if mBtn[8] == nil then
					mBtn:configure(8)
				else
					mBtn[8]:Show()
				end
				dmgText2(string.format("%d", tonumber(testQ["kirpich"])),mBtn[8],808,13,"FF8C00")
				if mBtn[9] == nil then
					mBtn:configure(9)
				else
					mBtn[9]:Show()
				end
				if mBtn[10] == nil then
					mBtn:configure(10)
				else
					mBtn[10]:Show()
				end
				if mBtn[11] == nil then
					mBtn:configure(11)
				else
					mBtn[11]:Show()
				end
				if mBtn[12] == nil then
					mBtn:configure(12)
				else
					mBtn[12]:Show()
				end
				if mBtn[13] == nil then
					mBtn:configure(13)
				else
					mBtn[13]:Show()
				end
				if mBtn[14] == nil then
					mBtn:configure(14)
				else
					mBtn[14]:Show()
				end
				dmgText2(testQ["lom"],mBtn[13],813,13,"FF8C00")
				dmgText2(testQ["b0"],mBtn[12],812,13,"FF8C00")
				dmgText2(testQ["doska"],mBtn[11],811,13,"FF8C00")
				dmgText2(testQ["stanok"],mBtn[10],810,13,"FF8C00")
				dmgText2(testQ["yi"],mBtn[9],809,13,"FF8C00")
				dmgText2(testQ[myNome]["лотерея"],mBtn[14],814,14,"FF8C00")
				btn[989]:Hide()
			else
				magazin("hide")
				testQ["magSign"] = nil
				for i = 1, 100 do
					fBtn[i]:Show()
					if mBtn[i] ~= nil then
						mBtn[i]:Hide()
					end
				end
				for i = 1, 1000 do
					if dmG1[i] ~= nil then
						dmG1[i]:Hide()
					end
				end
			end
		end
	end)
end
resursy:configure(1)
resursy:configure(2)
resursy:configure(3)
resursy:configure(4)
resursy:configure(5)
resursy:configure(6)
resursy:configure(7)

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
btn:configure(998,-83,190,70,32,"#ahtng","СБРОС");
btn:configure(997,-13,190,70,32,"#zzp","ОТМЕНА");
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
btn:configure(988,-55,-13,128,23,"","ЗАБРАТЬ ВСЕ");

btn[989]:SetScript("OnClick",function(self, button)
	if testQ["domZ"] == nil then
		btn[989]:RegisterForClicks("LeftButtonUp", "RightButtonDown")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		showFld("0",myNome)
	else
		for i = 1, 100 do
			dBtn[i]:Hide()
			fBtn[i]:Show()
		end
		testQ["domZ"] = nil
	end
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
	if GuildFrame:IsVisible() then
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
				GameTooltip:AddLine("|cff6495ED" .. zametka)
				GameTooltip:Show()
			end
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
		GameTooltip:AddLine("|cff99ff99" .. zametka)
		GameTooltip:Show()
	end
end)

btn[989]:SetScript("OnEnter",function(self)
	btn[994]:Show()
	btn[993]:Show()
	btn[992]:Show()
	btn[989]:Show()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|cff99ff99Бонусы")
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
		GameTooltip:AddLine("|cffF4A460" .. zametka)
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
	GameTooltip:AddLine("|cff6495EDБонусный квест. Доступен всегда.")
	GameTooltip:AddLine("|cffFFFFE0Каждые 30 принятых игроков принесут 3 опыта и кусок карты")
	GameTooltip:AddLine("|cffFFFFE0По пометкам на карте можно найти клад: в кладе Механоцикл")
	GameTooltip:AddLine("|cffF4A460Нажми \"Щ\". Затем выбери внизу вкладку \"Кто\"")
	GameTooltip:AddLine("|cffF4A460В строке поиска снизу напиши диапазон лвлов (лучше всего по 5: 1-5, 6-10 итд)")
	GameTooltip:AddLine("|cffF4A460Затем выбирай ники без гильдии и пиши в чате: |cff99ff99/ginvite ник")
	GameTooltip:AddLine("|cffFFFFE0Для удобства команду |cff99ff99/ginvite |cffFFFFE0лучше скопировать в буфер обмена")
	GameTooltip:Show()
end)
btn[3]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

btn[3]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

btnF = CreateFrame("CheckButton", "myCheckButton_GlobalName", parentFrame, "ChatConfigCheckButtonTemplate");
btnF:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT",0,0)
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

local SPECID_FURY = 72 -- Fury's specialisation ID, as returned by GetInspectSpecialization

-- Calculate and return a unit's average item level using the formula described on this page:
-- http://www.wowpedia.org/API_GetAverageItemLevel
-- Should only be called after INSPECT_READY fired for the unit
function CalculateAverageItemLevel(unit)
	local totalIlvl = 0
	local mainHandEquipLoc, offHandEquipLoc

	for slot = INVSLOT_FIRST_EQUIPPED, INVSLOT_LAST_EQUIPPED do -- For every slot,
		if slot ~= INVSLOT_BODY and slot ~= INVSLOT_TABARD then -- If this isn't the shirt/tabard slot,
			local id = GetInventoryItemID(unit, slot) -- Get the ID of the item in this slot
			if id then -- If we have an item in this slot,
				local _, _, _, itemLevel, _, _, _, _, itemEquipLoc = GetItemInfo(id) -- Get the item's ilvl and equip location
				totalIlvl = totalIlvl + itemLevel -- Add it to the total

				if slot == INVSLOT_MAINHAND then -- If this is the main or off hand, store the equip location for later use
					mainHandEquipLoc = itemEquipLoc
				elseif slot == INVSLOT_OFFHAND then
					offHandEquipLoc = itemEquipLoc
				end
			end
		end
	end

	local numSlots
	if mainHandEquipLoc and offHandEquipLoc then -- The unit has something in both hands, set numSlots to 17
		numSlots = 17
	else -- The unit either has something in one hand or nothing in both hands
		local equippedItemLoc = mainHandEquipLoc or offHandEquipLoc

		local _, class = UnitClass(unit)
		local isFury = class == "WARRIOR" and GetInspectSpecialization() == SPECID_FURY

		-- If the user is holding a one-hand weapon, a main-hand weapon or a two-hand weapon as Fury, set numSlots to 17; otherwise set it to 16

		numSlots = (
			equippedItemLoc == "INVTYPE_WEAPON" or
			equippedItemLoc == "INVTYPE_WEAPONMAINHAND" or
			(equippedItemLoc == "INVTYPE_2HWWEAPON" and isFury)
		) and 17 or 16
	end

	return totalIlvl / numSlots -- Return the average
end

-- Print out the arguments according to the first format string argument
local function printf(formatStr, ...)
	print(formatStr:format(...))
end

local f = CreateFrame("Frame") -- Create a frame to receive events
f:SetScript("OnEvent", function(self, event, ...) -- When an event fires, call the method of the same name
	self[event](self, ...)
end)

f:RegisterEvent("INSPECT_READY") -- Fires when the inspect data we requested is ready

function f:INSPECT_READY(guid)
	local inspectUnit = self.inspectUnit
	if inspectUnit and UnitGUID(inspectUnit) == guid then -- If this is the unit we requested information for,
		self.inspectUnit = nil

		local avIlvl = CalculateAverageItemLevel(inspectUnit) -- Calculate the unit's average item level
		printf("%s has an average item level of %.2f!", UnitName(inspectUnit), avIlvl) -- Print this out to chat
		ClearInspectPlayer() -- Tell the game that we're done with this unit's data.
	end
end

-- Request the average item level of a unit to be calculated
local function RequestAverageItemLevel(unit)
	f.inspectUnit = unit
	NotifyInspect(unit)
	printf("Requesting item level of %s (unitID %s)...", UnitName(unit), unit)
end

minibtn = CreateFrame("Button", nil, Minimap)
minibtn:RegisterForClicks("LeftButtonUp", "RightButtonDown", "MiddleButtonUp")
minibtn:SetScript("OnEnter",function(self)
	MainMenuMicroButton["hover"]=1
	MainMenuMicroButton.updateInterval = 10
	SendAddonMessage("NSGadd", "#qUpdate", "guild")
	SendAddonMessage("NSGadd", "#ver", "guild")
	SendAddonMessage("#gmlist", myNome, "guild")
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|cFF6495EDNSQC|cFF808080-|cff00BFFF".. versAdd .. "." .. versAddDop .. " |cffbbbbbbОЗУ: |cff00BFFF" .. string.format("%.0f", GetAddOnMemoryUsage("NSQC")) .. " |cffbbbbbbкб")
	if testQ["vers"] ~= nil then
		GameTooltip:AddLine("|cFF6495EDАктуальная версия аддона: |cff00BFFF" .. testQ["vers"]["2"])
	end
	GameTooltip:AddLine("|cFF6495EDСредний уровень предметов: |cff00BFFF" .. string.format("%d", CalculateAverageItemLevel(myNome)))
	if GS_Data ~= nil then
		if GS_Data[GetRealmName()].Players[myNome] ~= nil then
			GameTooltip:AddLine("|cFF6495EDGearScore: |cff00BFFF" .. string.format("%d", GS_Data[GetRealmName()].Players[myNome].GearScore))
		end
	end
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("|cffFF8C00ЛКМ|cffFFFFE0 - открыть аддон")
	GameTooltip:AddLine("|cffF4A460ПКМ|cffFFFFE0 - показать настройки")
	GameTooltip:AddLine("|cffF4A460СКМ|cffFFFFE0 - открыть новую версию аддона")
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
			if lvl == "" then
				testQ["mioFldLvl"] = 0.5
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
				myCheckButton7:Hide()
				btn[998]:Hide()
				btn[997]:Hide()
				pokazatChk=0
			end
		end
		if arg1=="RightButton" then
			if pokazat == 1 then
				showRB(myNome)
			end
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
	if arg1 == "MiddleButton" then
		showFld("1",myNome)
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
		if testQ["zarplatab"] ~= nil then
			for i = 1, 100 do
				if mioFld ~= nil then
					if mioFld[myNome] ~= nil then
						if mioFld[myNome]["петы"] ~= nil then
							if mioFld[myNome]["объекты"][tostring(i)] == "t" and mioFld[myNome]["петы"][tostring(i)] == "bb" then
								SendAddonMessage("travA " .. i, myNome, "guild")
								mioFld[myNome]["целостность"][tostring(i)] = 1
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
								testQ["zarplatab"] = tonumber(testQ["zarplatab"])-1
								if tonumber(testQ["zarplatab"]) <= 0 then
									testQ["zarplatab"] = nil
								end
								if testQ ~= nil then
									local testB = nil
									for i = 1,100 do
										if mioFld[myNome]["объекты"][tostring(i)] == "sb" then
											if testB == nil then
												testB = 1
											else
												testB = testB + 1
											end
										end
									end
									if testQ["brevna"] ~= nil and testQ["brevna"] < 10 and testB == nil then
										testQ["brevna"] = testQ["brevna"]+1
										testQ["nikQB"] = antc(testQ["brevna"])
										dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
									end
									if testQ["brevna"] ~= nil and testQ["brevna"] < 100 and testB == 1 then
										testQ["brevna"] = testQ["brevna"]+1
										testQ["nikQB"] = antc(testQ["brevna"])
										dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
									end
									if testQ["brevna"] ~= nil and testQ["brevna"] < 200 and testB == 2 then
										testQ["brevna"] = testQ["brevna"]+1
										testQ["nikQB"] = antc(testQ["brevna"])
										dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
									end
									if testQ["brevna"] ~= nil and testQ["brevna"] < 300 and testB == 3 then
										testQ["brevna"] = testQ["brevna"]+1
										testQ["nikQB"] = antc(testQ["brevna"])
										dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
									end
									if testQ["brevna"] ~= nil and testQ["brevna"] < 400 and testB == 4 then
										testQ["brevna"] = testQ["brevna"]+1
										testQ["nikQB"] = antc(testQ["brevna"])
										dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
									end
									if testQ["brevna"] ~= nil and testQ["brevna"] < 500 and testB == 5 then
										testQ["brevna"] = testQ["brevna"]+1
										testQ["nikQB"] = antc(testQ["brevna"])
										dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
									end
								end
							end
							if mioFld[myNome]["объекты"][tostring(i)] ~= "t" and mioFld[myNome]["петы"][tostring(i)] == "bb" then
								if mioFld[myNome]["объекты"][tostring(i-1)] ~= nil and mioFld[myNome]["объекты"][tostring(i-1)] == "t" then
									SendAddonMessage("bbM " .. i .. " " .. i-1, myNome, "guild")
									testQ["поиск_пути_бобром"] = 1
								end
								if mioFld[myNome]["объекты"][tostring(i+1)] ~= nil and mioFld[myNome]["объекты"][tostring(i+1)] == "t" and testQ["поиск_пути_бобром"] == nil then
									SendAddonMessage("bbM " .. i .. " " .. i+1, myNome, "guild")
									testQ["поиск_пути_бобром"] = 1
								end
								if mioFld[myNome]["объекты"][tostring(i-10)] ~= nil and mioFld[myNome]["объекты"][tostring(i-10)] == "t" and testQ["поиск_пути_бобром"] == nil then
									SendAddonMessage("bbM " .. i .. " " .. i-10, myNome, "guild")
									testQ["поиск_пути_бобром"] = 1
								end
								if mioFld[myNome]["объекты"][tostring(i+10)] ~= nil and mioFld[myNome]["объекты"][tostring(i+10)] == "t" and testQ["поиск_пути_бобром"] == nil then
									SendAddonMessage("bbM " .. i .. " " .. i+10, myNome, "guild")
									testQ["поиск_пути_бобром"] = 1
								end
								testQ["поиск_пути_бобром"] = nil
							end
						end
					end
				end
			end
		end
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
					if testQ["zarplatab"] == nil then
						if mioFld[myNome]["петы"] ~= nil then
							if mioFld[myNome]["петы"][tostring(i)] ~= nil then
								pet = mysplit(mioFld[myNome]["петы"][tostring(i)])
							end
							if pet ~= nil then
								if mioFld[myNome]["объекты"][tostring(i)] == "t" and pet[1] == "bb" then
									local x = math.random(1,1000)
									if x == 1 then
										testQ["brevna"] = tonumber(testQ["brevna"])-1
										testQ["nikQB"] = antc(testQ["brevna"])
										dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
									end
									treeX(myNome,myNome,i)
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
								end
								if mioFld[myNome]["объекты"][tostring(i)] ~= "t" and mioFld[myNome]["петы"][tostring(i)] == "bb" then
									if mioFld[myNome]["объекты"][tostring(i-1)] ~= nil and mioFld[myNome]["объекты"][tostring(i-1)] == "t" then
										SendAddonMessage("bbM " .. i .. " " .. i-1, myNome, "guild")
										testQ["поиск_пути_бобром"] = 1
									end
									if mioFld[myNome]["объекты"][tostring(i+1)] ~= nil and mioFld[myNome]["объекты"][tostring(i+1)] == "t" and testQ["поиск_пути_бобром"] == nil then
										SendAddonMessage("bbM " .. i .. " " .. i+1, myNome, "guild")
										testQ["поиск_пути_бобром"] = 1
									end
									if mioFld[myNome]["объекты"][tostring(i-10)] ~= nil and mioFld[myNome]["объекты"][tostring(i-10)] == "t" and testQ["поиск_пути_бобром"] == nil then
										SendAddonMessage("bbM " .. i .. " " .. i-10, myNome, "guild")
										testQ["поиск_пути_бобром"] = 1
									end
									if mioFld[myNome]["объекты"][tostring(i+10)] ~= nil and mioFld[myNome]["объекты"][tostring(i+10)] == "t" and testQ["поиск_пути_бобром"] == nil then
										SendAddonMessage("bbM " .. i .. " " .. i+10, myNome, "guild")
										testQ["поиск_пути_бобром"] = 1
									end
									testQ["поиск_пути_бобром"] = nil
								end
								if testQ["zarplata"] == nil then
									if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gom" then
										local x = math.random(1,2)
										if x == 2 then
											local xx = math.random(1,500)
											gKam(myNome,xx)
											PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
											if xx == 1 then
												SendAddonMessage("gomXm " .. i, myNome, "guild")
											end
										end
									end
									if mioFld[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gob" then
										local xx = math.random(1,500)
										gKam(myNome,xx)
										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
										if xx == 1 then
											SendAddonMessage("gobXm " .. i, myNome, "guild")
										end
									end
									if (mioFld[myNome]["объекты"][tostring(i)] == "mx" or mioFld[myNome]["объекты"][tostring(i)] == "hs" or mioFld[myNome]["объекты"][tostring(i)] == "ms" or mioFld[myNome]["объекты"][tostring(i)] == "uz" or mioFld[myNome]["объекты"][tostring(i)] == "zs" or mioFld[myNome]["объекты"][tostring(i)] == "zx" or mioFld[myNome]["объекты"][tostring(i)] == "skc" or mioFld[myNome]["объекты"][tostring(i)] == "sx" or mioFld[myNome]["объекты"][tostring(i)] == "bc") and pet[1] == "gom" then
										local x = math.random(1,10000)
										local xx
										local xxx = math.random(1,2)
										if xxx == 2 then
											if x == 1 then
												if testQ["gom"] == nil then
													xx = math.random(1,4)
													if xx == 1 then
														testQ["brevna"] = tonumber(testQ["brevna"])-5
														testQ["nikQB"] = antc(testQ["brevna"])
													end
													if xx == 2 then
														testQ["stog"] = tonumber(testQ["stog"])-5
														testQ["nikQF"] = antc(tonumber(testQ["stog"]))
													end
													if xx == 3 then
														testQ["kamen"] = tonumber(testQ["kamen"])-5
														testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
													end
													if xx == 4 then
														testQ["beton"] = tonumber(testQ["beton"])-5
														testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
													end
												end
											elseif x >= 2 and x < 101 then
												if testQ["gom"] == nil then
													xx = math.random(1,4)
													if xx == 1 then
														testQ["brevna"] = -2
														testQ["nikQB"] = antc(testQ["brevna"])
													end
													if xx == 2 then
														testQ["stog"] = -2
														testQ["nikQF"] = antc(tonumber(testQ["stog"]))
													end
													if xx == 3 then
														testQ["kamen"] = -2
														testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
													end
													if xx == 4 then
														testQ["beton"] = -2
														testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
													end
												end
											elseif x >= 101 and x < 1000 then
												if testQ["gom"] == nil then
													xx = math.random(1,4)
													if xx == 1 then
														testQ["brevna"] = tonumber(testQ["brevna"])-1
														testQ["nikQB"] = antc(testQ["brevna"])
													end
													if xx == 2 then
														testQ["stog"] = tonumber(testQ["stog"])-1
														testQ["nikQF"] = antc(tonumber(testQ["stog"]))
													end
													if xx == 3 then
														testQ["kamen"] = tonumber(testQ["kamen"])-1
														testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
													end
													if xx == 4 then
														testQ["beton"] = tonumber(testQ["beton"])-1
														testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
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
													testQ["nikQB"] = antc(testQ["brevna"])
												end
												if xx == 2 then
													testQ["stog"] = tonumber(testQ["stog"])+1
													testQ["nikQF"] = antc(tonumber(testQ["stog"]))
												end
												if xx == 3 then
													testQ["kamen"] = tonumber(testQ["kamen"])+1
													testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
												end
												if xx == 4 then
													testQ["beton"] = tonumber(testQ["beton"])+1
													testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
												end
											elseif x >= 9991 and x <= 10000 then
												resObj(i,myNome,myNome)
												PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
												xx = math.random(1,4)
												if xx == 1 then
													testQ["brevna"] = tonumber(testQ["brevna"])+10
													testQ["nikQB"] = antc(testQ["brevna"])
												end
												if xx == 2 then
													testQ["stog"] = tonumber(testQ["stog"])+10
													testQ["nikQF"] = antc(tonumber(testQ["stog"]))
												end
												if xx == 3 then
													testQ["kamen"] = tonumber(testQ["kamen"])+10
													testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
												end
												if xx == 4 then
													testQ["beton"] = tonumber(testQ["beton"])+10
													testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
												end
											end
										end
									end
									if (mioFld[myNome]["объекты"][tostring(i)] == "mx" or mioFld[myNome]["объекты"][tostring(i)] == "hs" or mioFld[myNome]["объекты"][tostring(i)] == "ms" or mioFld[myNome]["объекты"][tostring(i)] == "uz" or mioFld[myNome]["объекты"][tostring(i)] == "zs" or mioFld[myNome]["объекты"][tostring(i)] == "zx" or mioFld[myNome]["объекты"][tostring(i)] == "skc" or mioFld[myNome]["объекты"][tostring(i)] == "sx" or mioFld[myNome]["объекты"][tostring(i)] == "bc") and pet[1] == "gob" then
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
		end
	end
end)
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 6 then
		timeElapsed = 0
		if testQ["gtg"] ~= nil and gTest == nil then
			SendWho(tonumber(testQ["gtg"]))
			gtest()
			testQ["gtgi"] = 1
		end
		if gTest ~= nil then
			if tonumber(testQ["gtgi"]) <= tablelength(gTest) then
				if gTest[tonumber(testQ["gtgi"])] ~= nil then
					GuildInvite(gTest[tonumber(testQ["gtgi"])])
					print("Приглашается игрок номер: " .. testQ["gtgi"] .. " " .. gTest[tonumber(testQ["gtgi"])])
					testQ["gtgi"] = tonumber(testQ["gtgi"]) + 1

				else
					testQ["gtgi"] = tonumber(testQ["gtgi"]) + 1
				end
			else
				gTest = nil
				testQ["gtgi"] = nil
				if tonumber(testQ["gtg"]) <= 79 then
					testQ["gtg"] = tonumber(testQ["gtg"]) + 1
				else
					testQ["gtg"] = nil
					gTest = nil
					testQ["gtgi"] = nil
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
		if UnitName("target") == "Магистр Весара" or UnitName("target") == "Магистр Сариен" or UnitName("target") == "Магистр Бразайл" then
			if UnitName("target") ~= "Усури Златоблям" then
				if MerchantFrame:IsVisible() then
					if eBtn[1] == nil then
						eBtn:configure(1,1,-100,32,32,"#zzs","1");
						eBtn:configure(2,1,-132,32,32,"#zzs","5");
						eBtn:configure(3,1,-164,32,32,"#zzs","10");
						eBtn:configure(4,1,-196,32,32,"#zzs","50");
					else
						eBtn[1]:Show()
						eBtn[2]:Show()
						eBtn[3]:Show()
						eBtn[4]:Show()
					end
				else
					if eBtn[1] ~= nil then
						eBtn[1]:Hide()
						eBtn[2]:Hide()
						eBtn[3]:Hide()
						eBtn[4]:Hide()
					end
				end
			end
		end
		if UnitName("target") == "Усури Златоблям" then
			if MerchantFrame:IsVisible() then
				if eBtn[1] ~= nil then
					eBtn[1]:Hide()
					eBtn[2]:Hide()
					eBtn[3]:Hide()
					eBtn[4]:Hide()
				end
				if eBtn[5] == nil then
					eBtn:configure(5,1,-100,32,32,"#zzs","1");
					eBtn:configure(6,1,-132,32,32,"#zzs","5");
					eBtn:configure(7,1,-164,32,32,"#zzs","10");
					eBtn:configure(8,1,-196,32,32,"#zzs","50");
					eBtn:configure(9,32,-100,32,32,"#zzs","1");
					eBtn:configure(10,32,-132,32,32,"#zzs","5");
					eBtn:configure(11,32,-164,32,32,"#zzs","10");
					eBtn:configure(12,32,-196,32,32,"#zzs","50");
					eBtn:configure(13,64,-100,32,32,"#zzs","1");
					eBtn:configure(14,64,-132,32,32,"#zzs","5");
					eBtn:configure(15,64,-164,32,32,"#zzs","10");
					eBtn:configure(16,64,-196,32,32,"#zzs","50");
				else
					for i = 5, 16 do
						eBtn[i]:Show()
					end
				end
			else
				for i = 5, 16 do
					if eBtn[5] ~= nil then
						eBtn[i]:Hide()
					end
				end
			end
		else
			for i = 5, 16 do
				if eBtn[5] ~= nil then
					eBtn[i]:Hide()
				end
			end
		end
		if testQ[myNome]["настройки"]["debuff"] == "Disable" then
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
			if resursy[1] ~= nil and not resursy[1]:IsVisible() then
				for i = 100, 1000 do
					if dmG[i] ~= nil then
						dmG[i]:Hide()
					end
				end
			end
		end
		if gtg ~= nil then
			if FriendsFrame:IsVisible() then
				if not gtg:IsVisible() then
					gtg:Show()
				end
			else
				if gtg:IsVisible() then
					gtg:Hide()
				end
			end
		end
		--print(Minimap:GetPingPosition())
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if testQ["infTimer"] ~= nil then
			testQ["infTimer"] = tonumber(testQ["infTimer"])-1
			dmgText(testQ["infTimer"],fBtn[id],888,13,"ff0000")
			if fBtn[1]:IsVisible() then
				if dmG[888]	~= nil then
					dmG[888]:Show()
				end
			else
				if dmG[888]	~= nil then
					dmG[888]:Hide()
				end
			end
			if tonumber(testQ["infTimer"]) <= 0 then
				testQ["infTimer"] = nil
				if dmG[888]	~= nil then
					dmG[888]:Hide()
				end
			end
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
						if mioFld[myNome]["объекты"][tostring(i)] == "ba" and tonumber(mioFld[myNome]["целостность"][tostring(i)]) < 999 then
							mioFld[myNome]["целостность"][tostring(i)] = tonumber(mioFld[myNome]["целостность"][tostring(i)])+1
							if fBtn[i]:IsVisible() and nome == myNome then
								dmgText(mioFld[myNome]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
							end
						end
					end
					if mioFld[myNome]["объекты"][tostring(i)] == "zp" and mioFld[myNome]["петы"][tostring(i)] ~= nil then
						testQ["zavodp"] = 1
					end
					if mioFld[myNome]["объекты"][tostring(i)] == "zp" and mioFld[myNome]["петы"][tostring(i)] == nil and testQ["zavodp"] == nil then
						testQ["zavodp"] = nil
					end
				end
			end
		end
		if testQ["zavod"] == 1 then
			if testQ["beton"] == nil then
				testQ["beton"] = 0.1
				testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
			else
				testQ["beton"] = tonumber(testQ["beton"])+0.01
				testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bt.ogg")
				dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
			end
		end
		if testQ["zavodp"] == 1 and testQ["zavodp"] == 1 then
			if testQ["kirpich"] == nil then
				testQ["kirpich"] = 0.01
				testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
			else
				local x = math.random(1,100)
				if x == 100 then
					testQ["brevna"] = tonumber(testQ["brevna"]) - 1
					testQ["nikQB"] = antc(testQ["brevna"])
					print("Кирпичный цех расходует 1 бревно")
				end
				dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
				if x == 1 then
					testQ["stog"] = tonumber(testQ["stog"]) - 1
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					print("Кирпичный цех расходует 1 стог травы")
				end
				dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
				testQ["kirpich"] = tonumber(testQ["kirpich"]) + 0.01
				testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
				testQ["beton"] = tonumber(testQ["beton"]) - 0.01
				testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bt.ogg")
				dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
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
			gtg:Click()
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
	if MailFrame:IsVisible() then
		timeElapsed = timeElapsed + elapsed
		if timeElapsed > 0.2 then
			timeElapsed = 0
			if testQ["mail"] ~= nil then
				local x = GetInboxNumItems()
				if x >= 1 then
					local l1,l2,l3,l4,l5,l6=GetInboxHeaderInfo(1)
					if tonumber(l6) == 0 then
						if testQ["mail"] then
							AutoLootMailItem(1)
							MailItem1Button:Click()
							OpenMailDeleteButton:Click()
							StaticPopup1Button2:Click()
						end
					end
				else
					testQ["mail"] = nil
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

		if InboxPrevPageButton:IsEnabled() ~= 0 then
			if btn[988]:IsEnabled() then
				btn[988]:Disable()
			end
		else
			if btn[988]:IsEnabled() == 0 then
				btn[988]:Enable()
			end
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
					VerF:Show()
				end
				if VerF ~= nil and VerF:IsVisible() then
					if testQ["VerF"] ~= nil and testQ["VerF"] ~= 600 then
						testQ["VerF"] = testQ["VerF"] - 1
						VerF:Show()
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
										PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
										SendAddonMessage("#hQ1itemQ 11", "ававыфав", "guild")
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
		if NSdebuf == 1 then
			for i=1, 32 do
				local name,__,__,__,__,__,__,__ = UnitBuff("player",i)
				local name1,__,__,__,__,__,__,__ = UnitDebuff("player",i)
				local buff = _G["BuffButton"..i]
					if buff ~= nil then
						buff:Hide()
					end
				local debuff = _G["DebuffButton"..i]
				if debuff ~= nil then
					debuff:Hide()
				end
			end
			Minimap:Hide()
		end

		if testQ["dom"] == 1 then
			local nome
			if testQ['sign'] ~= "1" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			if nome == testQ["domNome"] then
				for i = 1, 100 do
					fBtn[i]:Hide()
					dBtn[i]:Show()
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["domNome"]][testQ["domZ"]][tostring(i)] ..".tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["domNome"]][testQ["domZ"]][tostring(i)] ..".tga")
				end
			end
			testQ["dom"] = nil
			testQ["domNome"] = nil
		end
		if testQ["mf"] == 1 then
			local nome
			if testQ['sign'] ~= "1" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			if nome == testQ["mfNome"] then
				for i = 1, 100 do
					dBtn[i]:Show()
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["mfNome"]]["mf"][tostring(i)] ..".tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["mfNome"]]["mf"][tostring(i)] ..".tga")
				end
			end
			testQ["mf"] = nil
			testQ["mfNome"] = nil
		end
		if testQ["b0Show"] == 1 then
			local nome
			if testQ['sign'] ~= "1" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			if nome == testQ["b0Nome"] then
				for i = 1, 100 do
					if mioFld ~= nil then
						if mioFld[testQ["b0Nome"]] ~= nil then
							if mioFld[testQ["b0Nome"]]["taverna"] ~= nil then

								dBtn[i]:Show()

								dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["b0Nome"]]["taverna"][tostring(i)] ..".tga")
								dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[testQ["b0Nome"]]["taverna"][tostring(i)] ..".tga")
							end
						end
					end
				end
			end
			testQ["b0Show"] = nil
			testQ["b0Nome"] = nil
		end
		if not dBtn[1]:IsVisible() then
			testQ["domZ"] = nil
		end
		if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
			if resursy[5] ~= nil then
				resursy[5]:Show()
			end
			if mgznZ ~= nil then
				dmgText1(testQ["smg"],mgznZ,105,13,"FF8C00")
				if dmG1[1005] ~= nil then
					dmG1[1005]:SetFrameStrata("TOOLTIP")
					mgznZ:SetFrameStrata("LOW")
					dmG1[1005]:SetFont('Fonts\\FRIZQT__.TTF', 11,"OUTLINE", "MONOCHROME")
				end
				mgznZ:Show()
			end
		else
			if mgznZ ~= nil then
				mgznZ:Hide()
			end
		end
		if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
			testQ["magSign"] = nil
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
					if mioFld[myNome]["объекты"][tostring(i)] == "m" and mioFld[myNome]["петы"][tostring(i)] == "gom" then
						local x = math.random(1,2)
						if x == 2 then
							local xx = math.random(1,500)
							gKam(myNome,xx)
							fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gomZ.tga")
						end
					end
					if mioFld[myNome]["объекты"][tostring(i)] == "m" and mioFld[myNome]["петы"][tostring(i)] == "gob" then
						local xx = math.random(1,500)
						gKam(myNome,xx)
						fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gobZ.tga")
					end
				end
				if (mioFld[myNome]["объекты"][tostring(i)] == "mx" or mioFld[myNome]["объекты"][tostring(i)] == "hs" or mioFld[myNome]["объекты"][tostring(i)] == "ms" or mioFld[myNome]["объекты"][tostring(i)] == "uz" or mioFld[myNome]["объекты"][tostring(i)] == "zs" or mioFld[myNome]["объекты"][tostring(i)] == "zx" or mioFld[myNome]["объекты"][tostring(i)] == "skc" or mioFld[myNome]["объекты"][tostring(i)] == "sx" or mioFld[myNome]["объекты"][tostring(i)] == "bc") and mioFld[myNome]["петы"][tostring(i)] == "gom" then
					local xxx = math.random(1,2)
					if xxx == 2 then
						for j = 1, 500 do
							if j == 500 then
								resObj(i,myNome,myNome)
							end
						end
						mioFld[myNome]["целостность"][tostring(i)] = tonumber(mioFld[myNome]["целостность"][tostring(i)])+1
						--PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
					end
				end
				if (mioFld[myNome]["объекты"][tostring(i)] == "mx" or mioFld[myNome]["объекты"][tostring(i)] == "hs" or mioFld[myNome]["объекты"][tostring(i)] == "ms" or mioFld[myNome]["объекты"][tostring(i)] == "uz" or mioFld[myNome]["объекты"][tostring(i)] == "zs" or mioFld[myNome]["объекты"][tostring(i)] == "zx" or mioFld[myNome]["объекты"][tostring(i)] == "skc" or mioFld[myNome]["объекты"][tostring(i)] == "sx" or mioFld[myNome]["объекты"][tostring(i)] == "bc") and mioFld[myNome]["петы"][tostring(i)] == "gob" then
					for j = 1, 500 do
						if j == 500 then
							resObj(i,myNome,myNome)
						end
					end
					mioFld[myNome]["целостность"][tostring(i)] = tonumber(mioFld[myNome]["целостность"][tostring(i)])+1
					--PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
				end
			end
			testQ["zarplata"] = tonumber(testQ["zarplata"])-1
			if tonumber(testQ["zarplata"]) <= 0 then
				testQ["zarplata"] = nil
				for i = 1, 100 do
					if mioFld[myNome]["объекты"][tostring(i)] == "m" then
						fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m.tga")
					end
					if mioFld[myNome]["объекты"][tostring(i)] == "m" then
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
				testQ["nikQB"] = antc(testQ["brevna"])
			end
			if testQ["stog"] == nil then
				testQ["stog"] = 0
				testQ["nikQF"] = antc(tonumber(testQ["stog"]))
			end
			if testQ["kamen"] == nil then
				testQ["kamen"] = 0
				testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
			end
			if testQ["beton"] == nil then
				testQ["beton"] = 0
				testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
			end
			if testQ["smg"] == nil then
				testQ["smg"] = 0
				testQ["nikQS"] = antc(tonumber(testQ["smg"]))
			end
			if testQ["kirpich"] == nil then
				testQ["kirpich"] = 0
				testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
			end
			if testQ["yi"] == nil then
				testQ["yi"] = 0
			end
			if testQ["stanok"] == nil then
				testQ["stanok"] = 0
			end
			if testQ["doska"] == nil then
				testQ["doska"] = 0
				testQ["nikQD"] = antc(tonumber(testQ["doska"]))
			end
			if testQ["b0"] == nil then
				testQ["b0"] = 0
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
		if testQ == nil then
			testQ = {}
		end
		if testQ[myNome] == nil then
			testQ[myNome] = {}
		end
		if testQ[myNome]["петы"] == nil then
			testQ[myNome]["петы"] = {}
		end
		if testQ[myNome]["взятый_квест_s"] == "q33" then
			if testQ[myNome]["q33nik"][1] == 1 and testQ[myNome]["q33nik"][2] == 1 and testQ[myNome]["q33nik"][3] == 1 then
				testQ[myNome]["q33end"] = 1
			end
		end
		--bdf(myNome)

		if resursy[1] ~= nil and resursy[1]:IsVisible() then
			if dmG[101] == nil or not dmG[101]:IsVisible() then
				dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
				dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
				dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
				dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
				dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
				dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
				dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
			end
			for i = 101, 200 do
				if dmG[i] ~= nil then
					dmG[i]:Show()
				end
			end
		end
		if testQ["nikQB"] ~= antc(testQ["brevna"]) then
			SendChatMessage("Прошу забанить меня по собственному желанию", "officer", nil, 1)
		end
		if testQ["nikQF"] ~= antc(testQ["stog"]) then
			SendChatMessage("Прошу забанить меня по собственному желанию", "officer", nil, 1)
		end
		if testQ["nikQK"] ~= antc(testQ["kamen"]) then
			SendChatMessage("Прошу забанить меня по собственному желанию", "officer", nil, 1)
		end
		if testQ["nikQBT"] ~= antc(testQ["beton"]) then
			SendChatMessage("Прошу забанить меня по собственному желанию", "officer", nil, 1)
		end
		if testQ["nikQS"] ~= antc(testQ["smg"]) then
			SendChatMessage("Прошу забанить меня по собственному желанию", "officer", nil, 1)
		end
		if testQ["nikQKR"] ~= antc(testQ["kirpich"]) then
			SendChatMessage("Прошу забанить меня по собственному желанию", "officer", nil, 1)
		end
		if testQ["nikQD"] ~= antc(testQ["doska"]) then
			SendChatMessage("Прошу забанить меня по собственному желанию", "officer", nil, 1)
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
				if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
					if resursy[i] ~= nil then
						if i == 5 then
							if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
								resursy[i]:Show()
							end
						else
							resursy[i]:Hide()
						end
					end
				end
			end
		end

		if GuildFrame:IsVisible() and not GuildMemberDetailFrame:IsVisible() and fBtn[1]:IsVisible() then
			for i=1,100 do
				fBtn[i]:Hide()
			end
			for i = 1, 100 do
				if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
					if resursy[i] ~= nil then
						if i == 5 then
							if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
								resursy[i]:Show()
							end
						else
							resursy[i]:Hide()
						end
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
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "hs" and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "zs" and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "sx" and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "zc" and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "tz" and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "m0"
										and mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] ~= "lx" then
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
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "lx" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 19999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "zc" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 9999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "tz" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 29999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "m0" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 29999 then
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
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "bc" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 14999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "bs" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 14999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "as" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 14999 then
												dmgText(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											end
										end
										if mioFld[testQ["fRand3Nome"]]["объекты"][tostring(i)] == "bx" then
											if tonumber(mioFld[testQ["fRand3Nome"]]["целостность"][tostring(i)]) < 14999 then
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
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "hs" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "zs" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "zx" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "sx" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "zc" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "tz" and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "m0"
										and mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] ~= "lx" then
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
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "m0" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 29999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "lx" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 19999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "tz" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 29999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "tz" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 29999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "zc" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 9999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "as" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 14999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "bx" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 14999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "bs" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 14999 then
												dmgText(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
												dmG[i]:Show()
											else
												if dmG[i]~=nil then
													dmG[i]:Hide()
												end
											end
										end
										if mioFld[testQ["fRand5Nome"]]["объекты"][tostring(i)] == "bc" then
											if tonumber(mioFld[testQ["fRand5Nome"]]["целостность"][tostring(i)]) < 14999 then
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
							dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
							dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
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
				--print (mioCel)
				if mapTables["lokRasstoyanie"][tKont][tLok] ~= nil then
					if mioCel >= tonumber(mapTables["lokRasstoyanie"][tKont][tLok])*2 then
						marSh()
					end
				else
					--if mioCel >= 0.9 then
						--marSh()
					--end
				end
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
		if testQ[myNome]["настройки"]["party"] == "Enable" then
			if PartyMemberFrame1:IsVisible() or PartyMemberFrame3:IsVisible() or PartyMemberFrame2:IsVisible() or PartyMemberFrame4:IsVisible() then
				partyFrameHide()
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
				else
					btn[995]:Hide()
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
		if myNome == "Хефе" or myNome == "Витинари" or myNome == "Люцзе" then
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
				myCheckButton7:Hide()
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
		if testQ[myNome]["настройки"]["party"]==nil or testQ[myNome]["настройки"]["party"]=="Disable" then
			myCheckButton7:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["party"]=="Enable" then
			myCheckButton7:SetChecked(true)
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
					if btn[ii] ~= nil then
						btn[ii]:Hide();
					end
				end
				showRB(myNome)
				myCheckButton1:Hide()
				myCheckButton2:Hide()
				myCheckButton3:Hide()
				myCheckButton4:Hide()
				myCheckButton5:Hide()
				myCheckButton6:Hide()
				myCheckButton7:Hide()
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

myCheckButton5 = createCheckbutton(UIParent, -100, 270, "Отображать очередь скиллов протовара");
myCheckButton5.tooltip = "Отображать очередь скиллов протовара";
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
myCheckButton7 = createCheckbutton(UIParent, -100, 230, "Скрывать фреймы пати или рейда");
myCheckButton7.tooltip = "Скрывать фреймы пати или рейда";
myCheckButton7:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["party"]=="Disable" or testQ[myNome]["настройки"]["party"]==nil then
			testQ[myNome]["настройки"]["party"]="Enable"
			myCheckButton7:SetChecked(true)
		elseif testQ[myNome]["настройки"]["party"]=="Enable" then
			testQ[myNome]["настройки"]["party"]="Disable"
			myCheckButton7:SetChecked(false)
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
