versAdd=390; versAddDop=0
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
petBtn = {}
skillBtn = {}
iYaBtn = {}
iYaBtnP = {}
--
iYaBtnPic = {}
iYaBtnText = {}
iYaBtnVsp = {}
--
function iYaBtnP:configure(id,posex,posey,sizex,sizey,zzid,message,num,s,tq)
	if self[id] == nil then
		for i = 1, 10 do
			if iYaBtn[i] ~= nil then
				if iYaBtn[i]:GetText() == tq then
					self[id] = CreateFrame("Button", nil, iYaBtn[i], "UIPanelButtonTemplate");
				end
			end
		end
	else
		self[id]:Show()
	end
	if zzid == 99 then
		self[id]:Hide()
	end

	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	for i = 1, 10 do
		if iYaBtn[i] ~= nil then
			if iYaBtn[i]:GetText() == tq then
				self[id]:SetPoint("CENTER", iYaBtn[i],"CENTER",posex, posey)
			end
		end
	end

	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)

	self[id]:SetScript("OnClick",function(self, button)
		for i = 1, 100 do
			if iYaBtnP[i] ~= nil then
				iYaBtnP[i]:Hide()
			end
		end
		if iYaBtnP[id]:GetText() == tq then
			testQ['iya_temp']=time()
		else
			testQ['iya_temp'] = nil
			for i = 1, 11 do
				if iYaBtn[i] ~= nil then
					iYaBtn[i]:SetAlpha(1)
				end
			end
			for i = 1, 100 do
				if iYaBtnP[i] ~= nil then
					iYaBtnP[i]:Hide()
				end
			end
			for i = 1, 100 do
				if iYaBtnPic[i] ~= nil then
					iYaBtnPic[i]:Hide()
				end
			end
			for i = 1, 100 do
				if iYaBtnText[i] ~= nil then
					iYaBtnText[i]:Hide()
				end
			end
			for i = 1, 100 do
				if iYaBtnVsp[i] ~= nil then
					iYaBtnVsp[i]:Hide()
				end
			end
			PlaySoundFile("Interface\\AddOns\\NSQC\\gob.ogg")
			if tonumber(testQ['iya']) >= 11 then
				testQ['iya'] = tostring(tonumber(testQ['iya'])-10)
			else
				testQ['iya'] = "1"
			end
			ns_iya(testQ['iya'])
		end
	end)
end
function iYaBtnPic:configure(id,posex,posey,sizex,sizey,zzid,message,num,s,tq)
	if self[id] == nil then
		self[id] = CreateFrame("Button", nil, UIParent, "");
	else
		self[id]:Show()
	end
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetPoint("CENTER", UIParent,"CENTER",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	self[id]:SetNormalTexture(zzid)
	self[id]:SetHighlightTexture(zzid)
	self[id]:SetScript("OnClick",function(self, button)
		PlaySoundFile(s)
		if tq ~= 99 then
			if iYaBtnPic[id]:GetText() == tq then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\iya\\q.ogg")
				testQ['iya_temp'] = nil
				for i = 1, 111 do
					if iYaBtnPic[i] ~= nil then
						iYaBtnPic[i]:SetAlpha(1)
					end
				end
				for i = 1, 111 do
					if iYaBtn[i] ~= nil then
						iYaBtn[i]:SetAlpha(1)
					end
				end
				for i = 1, 111 do
					if iYaBtnText[i] ~= nil then
						iYaBtnText[i]:SetAlpha(1)
					end
				end
				for i = 1, 111 do
					if iYaBtnVsp[i] ~= nil then
						iYaBtnVsp[i]:SetAlpha(1)
					end
				end
				for i = 1, 111 do
					if iYaBtnP[i] ~= nil then
						iYaBtnP[i]:SetAlpha(1)
					end
				end
				if testQ['iya_ser'] ~= nil and testQ['iya_ser'] >= 50 then
					testQ['iya_end'] = 1
					PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
					for i = 1, 100 do
						if iYaBtnPic[i] ~= nil then
							iYaBtnPic[i]:Hide()
						end
					end
					for i = 1, 100 do
						if iYaBtn[i] ~= nil then
							iYaBtn[i]:Hide()
						end
					end
					for i = 1, 100 do
						if iYaBtnP[i] ~= nil then
							iYaBtnP[i]:Hide()
						end
					end
					for i = 1, 100 do
						if iYaBtnVsp[i] ~= nil then
							iYaBtnVsp[i]:Hide()
						end
					end
					for i = 1, 100 do
						if iYaBtnText[i] ~= nil then
							iYaBtnText[i]:Hide()
						end
					end
					if tonumber(testQ['iya']) ~= 142 then
						testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
					else
						testQ['iya'] = "1"
					end
				else
					if testQ['iya_ser'] == nil then
						testQ['iya_ser'] = 1
					else
						testQ['iya_ser'] = testQ['iya_ser'] + 1
					end
					testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
					ns_iya(testQ['iya'])
				end

			else
				testQ['iya_temp'] = nil
				for i = 1, 11 do
					if iYaBtnPic[i] ~= nil then
						iYaBtnPic[i]:SetAlpha(1)
					end
				end
				for i = 1, 11 do
					if iYaBtnP[i] ~= nil then
						iYaBtnP[i]:SetAlpha(1)
					end
				end
				for i = 1, 11 do
					if iYaBtn[i] ~= nil then
						iYaBtn[i]:SetAlpha(1)
					end
				end
				for i = 1, 11 do
					if iYaBtnText[i] ~= nil then
						iYaBtnText[i]:SetAlpha(1)
					end
				end
				for i = 1, 11 do
					if iYaBtnVsp[i] ~= nil then
						iYaBtnVsp[i]:SetAlpha(1)
					end
				end
				for i = 1, 100 do
					if iYaBtnText[i] ~= nil then
						iYaBtnText[i]:Hide()
					end
				end
				for i = 1, 100 do
					if iYaBtn[i] ~= nil then
						iYaBtn[i]:Hide()
					end
				end
				for i = 1, 100 do
					if iYaBtnP[i] ~= nil then
						iYaBtnP[i]:Hide()
					end
				end
				for i = 1, 100 do
					if iYaBtnPic[i] ~= nil then
						iYaBtnPic[i]:Hide()
					end
				end
				for i = 1, 100 do
					if iYaBtnVsp[i] ~= nil then
						iYaBtnVsp[i]:Hide()
					end
				end
				if testQ['iya_ser'] == nil then
					testQ['iya_ser'] = 0
				else
					testQ['iya_ser'] = testQ['iya_ser'] - 10
				end
				PlaySoundFile("Interface\\AddOns\\NSQC\\gob.ogg")
				if tonumber(testQ['iya']) >= 11 then
					testQ['iya'] = tostring(tonumber(testQ['iya'])-10)
				else
					testQ['iya'] = "1"
				end
				ns_iya(testQ['iya'])
			end
		end
	end)
end
function iYaBtnText:configure(id,posex,posey,sizex,sizey,zzid,message,num,s,tq)
	if self[id] == nil then
		self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	else
		self[id]:Show()
	end
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetPoint("CENTER", UIParent,"CENTER",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	self[id]:SetScript("OnClick",function(self, button)
		PlaySoundFile(s)
	end)
end
function iYaBtn:configure(id,posex,posey,sizex,sizey,zzid,message,num,s,tq)
	if self[id] == nil then
		if id == 1 or id == 6 or id == 7 or id == 8 or id == 9 or id == 10 or id == 11 then
			self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
		else
			self[id] = CreateFrame("Button", nil, UIParent, "");
		end
	else
		self[id]:Show()
	end
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetPoint("CENTER", UIParent,"CENTER",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	if id ~= 1 and id ~= 6 and id ~= 7 and id ~= 8 and id ~= 9 and id ~= 10 and id ~= 11 then
		self[id]:SetNormalTexture(zzid)
		self[id]:SetHighlightTexture(zzid)
	end
	self[id]:SetScript("OnClick",function(self, button)
		PlaySoundFile(s)
		if id ~= 10 then
			if tq ~= 99 then
				if iYaBtn[id]:GetText() == tq then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\iya\\q.ogg")
					testQ['iya_temp'] = nil
					for i = 1, 111 do
						if iYaBtn[i] ~= nil then
							iYaBtn[i]:SetAlpha(1)
						end
						if iYaBtnP[i] ~= nil then
							iYaBtnP[i]:SetAlpha(1)
						end
						if iYaBtnPic[i] ~= nil then
							iYaBtnPic[i]:SetAlpha(1)
						end
						if iYaBtnText[i] ~= nil then
							iYaBtnText[i]:SetAlpha(1)
						end
						if iYaBtnVsp[i] ~= nil then
							iYaBtnVsp[i]:SetAlpha(1)
						end
					end
					if testQ['iya_ser'] ~= nil and testQ['iya_ser'] >= 50 then
						testQ['iya_end'] = 1
						PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
						for i = 1, 100 do
							if iYaBtn[i] ~= nil then
								iYaBtn[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtnP[i] ~= nil then
								iYaBtnP[i]:Hide()
							end
							if iYaBtnPic[i] ~= nil then
								iYaBtnPic[i]:SetAlpha(1)
							end
							if iYaBtnText[i] ~= nil then
								iYaBtnText[i]:SetAlpha(1)
							end
							if iYaBtnVsp[i] ~= nil then
								iYaBtnVsp[i]:SetAlpha(1)
							end
						end

						if tonumber(testQ['iya']) ~= 142 then
							testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
						else
							testQ['iya'] = "1"
						end
					else
						if testQ['iya_ser'] == nil then
							testQ['iya_ser'] = 1
						else
							testQ['iya_ser'] = testQ['iya_ser'] + 1
						end
						testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
						ns_iya(testQ['iya'])
					end

				else
					testQ['iya_temp'] = nil
					for i = 1, 11 do
						if iYaBtn[i] ~= nil then
							iYaBtn[i]:SetAlpha(1)
						end
					end
					for i = 1, 100 do
						if iYaBtnP[i] ~= nil then
							iYaBtnP[i]:Hide()
						end
						if iYaBtnText[i] ~= nil then
							iYaBtnText[i]:SetAlpha(1)
						end
						if iYaBtnPic[i] ~= nil then
							iYaBtnPic[i]:SetAlpha(1)
						end
						if iYaBtnVsp[i] ~= nil then
							iYaBtnVsp[i]:SetAlpha(1)
						end
					end
					if testQ['iya_ser'] == nil then
						testQ['iya_ser'] = 0
					else
						testQ['iya_ser'] = testQ['iya_ser'] - 10
					end
					PlaySoundFile("Interface\\AddOns\\NSQC\\gob.ogg")
					if tonumber(testQ['iya']) >= 11 then
						testQ['iya'] = tostring(tonumber(testQ['iya'])-10)
					else
						testQ['iya'] = "1"
					end
					ns_iya(testQ['iya'])
				end
			end
		else
			for i = 1, 100 do
				if iYaBtn[i] ~= nil then
					iYaBtn[i]:Hide()
				end
			end
			for i = 1, 100 do
				if iYaBtnP[i] ~= nil then
					iYaBtnP[i]:Hide()
				end
			end
			for i = 1, 100 do
				if iYaBtnPic[i] ~= nil then
					iYaBtnPic[i]:Hide()
				end
			end
			for i = 1, 100 do
				if iYaBtnText[i] ~= nil then
					iYaBtnText[i]:Hide()
				end
			end
			for i = 1, 100 do
				if iYaBtnVsp[i] ~= nil then
					iYaBtnVsp[i]:Hide()
				end
			end
		end
	end)
	self[id]:SetScript("OnEnter",function(self, button)
		if id == 11 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("|cff99ff99Текущий модуль/Нужно пройти для завершения")
			GameTooltip:Show()
		end
	end)
end

function skillBtn:configure(id,posex,posey,sizex,sizey,zzid,message)
	if self[id] == nil then
		self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	else
		self[id]:Show()
	end
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetPoint("CENTER", UIParent,"CENTER",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	if id == 1 then
		self[1]:SetNormalTexture("Interface\\Icons\\Spell_Shadow_MindSteal")
	end
	if id == 2 then
		self[2]:SetNormalTexture("Interface\\Icons\\Ability_Sap")
	end
	if id == 3 then
		self[3]:SetNormalTexture("Interface\\Icons\\Spell_Holy_Renew")
	end
	if id == 4 then
		self[4]:SetNormalTexture("Interface\\Icons\\Spell_Nature_NullifyDisease")
	end
	self[id]:SetScript("OnClick",function(self, button)
		if testQ["marshF"] ~= nil and tablelength(testQ["marshF"]) >= 1 then
			if id == 1 then
				if UnitName('target') ~= nil and UnitName('target') ~= myNome then --
					if testQ['ochered_skillov_eventa'] == nil then
						SendAddonMessage("ns_oslep " .. UnitName('target'), "10 " .. (tablelength(testQ["marshF"]))/10, "guild")
						testQ['ochered_skillov_eventa'] = tablelength(testQ["marshF"])
						SendChatMessage("Ослепление на персонажа " .. UnitName('target') .. " силой " .. tablelength(testQ["marshF"]), "OFFICER", nil, 1)
					elseif testQ['ochered_skillov_eventa'] ~= nil and tablelength(testQ["marshF"]) - testQ['ochered_skillov_eventa'] >= 1 then
						SendAddonMessage("ns_oslep " .. UnitName('target'), "10 " .. (tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'])/10, "guild")
						SendChatMessage("Ослепление на персонажа " .. UnitName('target') .. " силой " .. tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'], "OFFICER", nil, 1)
						testQ['ochered_skillov_eventa'] = testQ['ochered_skillov_eventa'] + tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa']
					end
				end
			end
			if id == 2 then
				if UnitName('target') ~= nil and UnitName('target') ~= myNome then --
					if testQ['ochered_skillov_eventa'] == nil then
						SendAddonMessage("ns_oslep " .. UnitName('target'), tablelength(testQ["marshF"]) .. " " .. 0.1, "guild")
						testQ['ochered_skillov_eventa'] = tablelength(testQ["marshF"])
						SendChatMessage("Ошеломление на персонажа " .. UnitName('target') .. " длительностью " .. tablelength(testQ["marshF"]) .. " секунд", "OFFICER", nil, 1)
					elseif testQ['ochered_skillov_eventa'] ~= nil and tablelength(testQ["marshF"]) - testQ['ochered_skillov_eventa'] >= 1 then
						SendAddonMessage("ns_oslep " .. UnitName('target'), tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'] .. " " .. 0.1, "guild")
						SendChatMessage("Ошеломление на персонажа " .. UnitName('target') .. " длительностью " .. tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'] .. " секунд", "OFFICER", nil, 1)
						testQ['ochered_skillov_eventa'] = testQ['ochered_skillov_eventa'] + tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa']
					end
				end
			end
		end
		if id == 3 then
			if testQ['ochered_skillov_eventa'] == nil then
				if testQ['oslep']['sila'] - tablelength(testQ["marshF"]) >= 1 then
					testQ['oslep']['sila'] = testQ['oslep']['sila'] - (tablelength(testQ["marshF"]))/10
				else
					testQ['oslep']['sila'] = 0
				end
				testQ['ochered_skillov_eventa'] = tablelength(testQ["marshF"])
			elseif testQ['ochered_skillov_eventa'] ~= nil and tablelength(testQ["marshF"]) - testQ['ochered_skillov_eventa'] >= 1 then
				if testQ['oslep']['sila'] - ((tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'])/10) >= 1 then
					testQ['oslep']['sila'] = testQ['oslep']['sila'] - ((tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'])/10)
				else
					testQ['oslep']['sila'] = 0
				end
				testQ['ochered_skillov_eventa'] = testQ['ochered_skillov_eventa'] + tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa']
			end
		end
		if id == 4 then
			if testQ['ochered_skillov_eventa'] == nil then
				if testQ['oslep']['time'] - tablelength(testQ["marshF"]) >= 1 then
					testQ['oslep']['time'] = testQ['oslep']['time'] - tablelength(testQ["marshF"])
				else
					testQ['oslep']['time'] = 0
				end
				testQ['ochered_skillov_eventa'] = tablelength(testQ["marshF"])
			elseif testQ['ochered_skillov_eventa'] ~= nil and tablelength(testQ["marshF"]) - testQ['ochered_skillov_eventa'] >= 1 then
				if testQ['oslep']['time'] - (tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa']) >= 1 then
					testQ['oslep']['time'] = testQ['oslep']['time'] - (tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'])
				else
					testQ['oslep']['time'] = 0
				end
				testQ['ochered_skillov_eventa'] = testQ['ochered_skillov_eventa'] + tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa']
			end
		end
	end)
	self[id]:SetScript("OnEnter",function(self, button)
		if id == 1 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Ослепление")
			GameTooltip:AddLine(" ")
			if testQ["marshF"] ~= nil and tablelength(testQ["marshF"]) >= 1 then
				if testQ['ochered_skillov_eventa'] == nil then
					GameTooltip:AddLine("|cff99ff99Ослепить цель на 10 секунд с эффективностью " .. tablelength(testQ["marshF"]))
				else
					GameTooltip:AddLine("|cff99ff99Ослепить цель на 10 секунд с эффективностью " .. tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'])
				end
			else
				GameTooltip:AddLine("|cffFF0000Не хватает пройденных точек ")
			end
			GameTooltip:Show()
		end
		if id == 2 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Ошеломление")
			GameTooltip:AddLine(" ")
			if testQ["marshF"] ~= nil and tablelength(testQ["marshF"]) >= 1 then
				if testQ['ochered_skillov_eventa'] == nil then
					GameTooltip:AddLine("|cff99ff99Вызвать у цели легкое головокружение на " .. tablelength(testQ["marshF"]) .. " секунд")
				else
					GameTooltip:AddLine("|cff99ff99Вызвать у цели легкое головокружение на " .. tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'] .. " секунд")
				end
			else
				GameTooltip:AddLine("|cffFF0000Не хватает пройденных точек ")
			end
			GameTooltip:Show()
		end
		if id == 3 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Очищение")
			GameTooltip:AddLine(" ")
			if testQ["marshF"] ~= nil and tablelength(testQ["marshF"]) >= 1 then
				if testQ['ochered_skillov_eventa'] == nil then
					GameTooltip:AddLine("|cff99ff99Снять с себя часть негативных воздействий на силу " .. tablelength(testQ["marshF"]))
				else
					GameTooltip:AddLine("|cff99ff99Снять с себя часть негативных воздействий на силу " .. tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'])
				end
			else
				GameTooltip:AddLine("|cffFF0000Не хватает пройденных точек ")
			end
			GameTooltip:Show()
		end
		if id == 4 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Излечение")
			GameTooltip:AddLine(" ")
			if testQ["marshF"] ~= nil and tablelength(testQ["marshF"]) >= 1 then
				if testQ['ochered_skillov_eventa'] == nil then
					GameTooltip:AddLine("|cff99ff99Снять с себя часть негативных воздействий на " .. tablelength(testQ["marshF"]) .. " секунд")
				else
					GameTooltip:AddLine("|cff99ff99Снять с себя часть негативных воздействий на " .. tablelength(testQ["marshF"])-testQ['ochered_skillov_eventa'] .. " секунд")
				end
			else
				GameTooltip:AddLine("|cffFF0000Не хватает пройденных точек ")
			end
			GameTooltip:Show()
		end
	end)
	self[id]:SetScript("OnLeave",function(self, button)
		GameTooltip:Hide()
	end)
end
function eBtn:configure(id,posex,posey,sizex,sizey,zzid,message)
	self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetPoint("TOPRIGHT", MerchantFrame,"TOPRIGHT",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	self[id]:SetScript("OnClick",function(self, button)
		if UnitName("target") == "Каменный страж Мукар" then
			if id == 1 then
				--BuyMerchantItem(20,1)
			end
			if id == 2 then
				--BuyMerchantItem(20,5)
			end
			if id == 3 then
				--BuyMerchantItem(20,10)
			end
			if id == 4 then
				--BuyMerchantItem(20,50)
			end
		end
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
		if UnitName("target") == "Усури Златоблям" or UnitName("target") == "Usuri Brightcoin" then
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
			if id == 11 then
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
			if id == 16 then
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
			if testQ["okno"] == "q3xy_end" then
				okNo[2]:Hide()
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
		if mioFld1 ~= nil then
			for i = 1, 100 do
				if mioFld1[myNome]["объекты"][tostring(i)] == "bh" then
					testBH = "bh"
				end
				if mioFld1[myNome]["объекты"][tostring(i)] == "bi" then
					testBI = "bi"
				end
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
		if testQ["okno"] == "ns_q5" then
			SendChatMessage("Мне нужно найти одного из этих игроков: " .. testQ['nsq5_1'] .. ", " .. testQ['nsq5_2'] .. ", " .. testQ['nsq5_3'], "OFFICER", nil, 1)
			hX()
		end
		if testQ["okno"] == "ns_q5_end" then
			SendChatMessage("Найденный мною игрок в безопасности", "OFFICER", nil, 1)
			hX()
			SendAddonMessage("#hQ1 " .. testBI, " ", "guild")
		end
		if testQ["okno"] == "q3b" then
			local q3b1,q3b2,q3b3,q3b4,q3b5
			if testQ['ns_alfabetQ'][1] ~= 1 then
				q3b1 = testQ['ns_alfabetQ'][1]
			else
				q3b1 = "выполнено"
			end
			if testQ['ns_alfabetQ'][2] ~= 1 then
				q3b2 = testQ['ns_alfabetQ'][2]
			else
				q3b2 = "выполнено"
			end
			if testQ['ns_alfabetQ'][3] ~= 1 then
				q3b3 = testQ['ns_alfabetQ'][3]
			else
				q3b3 = "выполнено"
			end
			if testQ['ns_alfabetQ'][4] ~= 1 then
				q3b4 = testQ['ns_alfabetQ'][4]
			else
				q3b4 = "выполнено"
			end
			if testQ['ns_alfabetQ'][5] ~= 1 then
				q3b5 = testQ['ns_alfabetQ'][5]
			else
				q3b5 = "выполнено"
			end
			SendChatMessage("Мне срочно нужно посетить локации с буквами в названии: " .. q3b1 .. ", " .. q3b2 .. ", " .. q3b3 .. ", " .. q3b4 .. ", " .. q3b5, "OFFICER", nil, 1)
			testQ["okno"] = nil
			testQ['sign'] = nil
			okNo[1]:Hide()
			okNo[2]:Hide()
		end
		if testQ["okno"] == "q3bEnd" then
			SendChatMessage("Я успешно пробежал половину Азерота", "OFFICER", nil, 1)
			SendAddonMessage("#hQ1 " .. testBI, testQ[myNome]["взятый_квест_х"], "guild")
			testQ["okno"] = nil
			hX()
			testQ['sign'] = nil
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
		if testQ["okno"] == 'q3dict' then
			SendChatMessage("Я найду их всех...", "OFFICER", nil, 1)
			testQ["okno"] = nil
			for i = 1, 100 do
				if dBtn[1] ~= nil then
					dBtn[i]:Hide()
				end
			end
			okNo[1]:Hide()
		end
		if testQ["okno"] == "q3xy" then
			SendChatMessage("Мне нужно найти похищенную принцессу", "OFFICER", nil, 1)
			testQ["okno"] = nil
			hX()
			testQ['sign'] = nil
		end
		if testQ["okno"] == "ns_q_stelth" then
			if testQ[myNome]['q_stelth']['start'] ~= 4 and testQ[myNome]['q_stelth']['start'] ~= 5 then
				testQ["okno"] = nil
				hX()
			else
				if testQ[myNome]['q_stelth']['start'] == 4 then
					SendChatMessage("Информация получена, квест выполнен.", "OFFICER", nil, 1)
					SendAddonMessage("#hQ1 " .. testBI .. " ful", "", "guild")
				end
				if testQ[myNome]['q_stelth']['start'] == 5 then
					SendChatMessage("Информация получена, квест выполнен...ну типа того..", "OFFICER", nil, 1)
					SendAddonMessage("#hQ1 " .. testBI .. " half", "", "guild")
				end
				testQ["okno"] = nil
				hX()
			end
		end
		if testQ["okno"] == "q3xy_end" then
			SendChatMessage("Я ее почуял. Вот прям нюхом. Не мылась она неделю чтоли...", "OFFICER", nil, 1)
			testQ["okno"] = nil
			hX()
			testQ['sign'] = nil
			SendAddonMessage("#hQ1 " .. testBI, testQ[myNome]["взятый_квест_xy_end"], "guild")
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
		if testQ["okno"] ~= nil and testQ["okno"] ~= "99991" and testQ["okno"] ~= "itemQ" and testQ["okno"] ~= "itemQend" and testQ["okno"] ~= "q33end" and testQ["okno"] ~= "tavernaQ" and testQ["okno"] ~= "ns_q5" and testQ["okno"] ~= "ns_q5_end" then
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
			htimer(myNome)
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
			if testQ["okno"] == "ns_q5" then
				SendChatMessage("У меня топографический кретинизм", "OFFICER", nil, 1)
				--SendChatMessage("test q5x", "OFFICER", nil, 1)
				hX()
				ns_q5Test = nil
				testQ['nsq5_1'] = nil
				testQ['nsq5_2'] = nil
				testQ['nsq5_3'] = nil
			end
			if testQ["okno"] == "ns_q_stelth" then
				testQ["okno"] = nil
				hX()
				testQ[myNome]['q_stelth'] = nil
				SendChatMessage("Мои навыки стелсера схожи с навыками утюга, мирно проходящего триатлон. Не хочу и не буду!", "OFFICER", nil, 1)
			end
			if testQ["okno"] == "q3xy" then
				SendChatMessage("Нет у меня ни чести, ни совести. Пусть кто нибудь другой спасает принцесс.", "OFFICER", nil, 1)
				testQ[myNome]["взятый_квест_xy"] = nil
				testQ["okno"] = nil
				hX()
				testQ['sign'] = nil
			end
			if testQ["okno"] == 'q3dict' then
				SendChatMessage("Я жалкий пацифист и отказываюсь брать в руки оружие.", "OFFICER", nil, 1)
				testQ["okno"] = nil
				for i = 1, 100 do
					if dBtn[1] ~= nil then
						dBtn[i]:Hide()
					end
				end
				hX()
				okNo[1]:Hide()
				testQ['q3dict'] = nil
			end
			if testQ["okno"] == "q3b" then
				SendChatMessage("Я злонамеренно отказываюсь от квеста.", "OFFICER", nil, 1)
				testQ[myNome]["взятый_квест_b"] = nil
				testQ["okno"] = nil
				hX()
				okNo[1]:Hide()
				okNo[2]:Hide()
				testQ['sign'] = nil
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
			if testQ["okno"] ~= nil and testQ["okno"] ~= "99991" and testQ["okno"] ~= "ns_q5" and testQ["okno"] ~= "ns_q5_end" then
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
		if mioFld1 ~= nil then
			for i = 1,100 do
				if mioFld1[nome]["объекты"][tostring(i)] == "s" then
					testFlds = 1
				end
				if mioFld1[nome]["объекты"][tostring(i)] == "sx" then
					testFlds = 1
				end
				if mioFld1[nome]["объекты"][tostring(i)] == "hs" then
					testFldh = 1
				end
				if mioFld1[nome]["объекты"][tostring(i)] == "h" then
					testFldh = 1
				end
				if mioFld1[nome]["объекты"][tostring(i)] == "za" then
					testFldza = 1
				end
				if mioFld1[nome]["объекты"][tostring(i)] == "zx" then
					testFldza = 1
				end
				if mioFld1[nome]["объекты"][tostring(i)] == "zs" then
					testFldza = 1
				end
				if mioFld1[nome]["объекты"][tostring(i)] == "ts" then
					testFldts = 1
				end
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
		if id==36 then
			if vybor[36] ~= nil then
				vybor[36]:Show()
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
		if id == 35 then
			if vybor[35] ~= nil then
				vybor[35]:Show()
			end
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Построить курятник")
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Ко?")
			if tonumber(testQ["mioR"][1]) >= 10 and tonumber(testQ["mioR"][2]) >= 5 and tonumber(testQ["mioR"][5]) >= 5 and tonumber(testQ["mioR"][6]) >= 5 then
				GameTooltip:AddLine("|cffFFCF40Стоимость: 10 бревен, 5 травы, 5 самогона, 5 досок")
			else
				GameTooltip:AddLine("|cffFF0000Стоимость: 10 бревен, 5 травы, 5 самогона, 5 досок")
			end
			GameTooltip:Show()
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
		-- if mioFld1 ~= nil then
		-- 	if (testQ["picon"] == "t" or testQ["icon"] == "gob" or testQ["icon"] == "gom") and mioFld1[nome]["петы"][tostring(testQ["idp"])] ~= "bb" then
		-- 		if vybor[8] ~= nil then
		-- 			vybor[8]:Show()
		-- 		end
		-- 	end
		-- end
		if id == 8 then
			vybor[8]:Show()
		end
		if id == 2 then
			vybor[3]:Show()
			vybor[4]:Show()
			vybor[2]:Show()
		end
		if id == 3 then
			vybor[3]:Show()
			vybor[4]:Show()
			vybor[2]:Show()
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
		if id == 10 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Прогнать пета")
			GameTooltip:Show()
		end
		if id == 9 then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("Отозвать пета домой")
			GameTooltip:Show()
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
		if id == 4 then
			vybor[4]:Show()
			vybor[2]:Show()
			vybor[3]:Show()
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
		if mioFld1 ~= nil then
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 4 and tonumber(testQ["mioR"][1]) >= 10 and tonumber(testQ["mioR"][3]) >= 20 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить бетонный завод")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 4 and tonumber(testQ["mioR"][1]) < 10 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить бетонный завод")
				GameTooltip:AddLine("|cffff0000Нужно 10 бревен")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 4 and tonumber(testQ["mioR"][3]) < 20 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить бетонный завод")
				GameTooltip:AddLine("|cffff0000Нужно 20 камня")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 5 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Утрамбовать")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["brevna"]) >= 10 and tonumber(testQ["stog"]) >= 10 and tonumber(testQ["kamen"]) >= 5 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить хижину")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["brevna"]) < 10 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Нужно 10 бревен")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["kamen"]) < 5 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Нужно 5 камня")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 and tonumber(testQ["stog"]) < 10 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Нужно 10 травы")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 6 and tonumber(testQ["brevna"]) >= 10 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Копать")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 6 and tonumber(testQ["brevna"]) < 10 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("|cFF6495EDВыкопать шахту")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cffFFCF40В шахте добывают..руду?")
				GameTooltip:AddLine("Нужно 10 бревен")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 2 and tonumber(testQ["brevna"]) < 8 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить:|cFF6495ED Склад бревен")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cffFFCF40Увеличивает место под бревна на 100")
				GameTooltip:AddLine("|cffff0000Нужно 8 бревен")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 2 and tonumber(testQ["brevna"]) >= 8 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить склад бревен")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 3 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Построить склад камня")
				GameTooltip:AddLine("Нужно 15 бревен")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 and tonumber(testQ["beton"]) >= 5 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Залить бетонный фундамент")
				GameTooltip:Show()
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 and tonumber(testQ["beton"]) < 5 then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Нужно 5 кубов бетона")
				GameTooltip:Show()
			end
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
		if mioFld1 ~= nil then
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 1 then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\toptop.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\toptop.tga")
			end
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 2 then
				vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kopkop.tga")
				vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kopkop.tga")
			end
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
	SendAddonMessage("smT st",nome, "guild")
	SendAddonMessage("pN1","", "guild")
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
		if mioFld1 ~= nil then
			if id == 33 then
				if testQ["doska"] >= 1 and testQ["smg"] >= 1 then
					if testQ["temp"] == nil then
						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ba.tga")
						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ba.tga")
						testQ["temp"] = 1
					elseif testQ["temp"] == 1 then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
						SendAddonMessage("dB " .. testQ["idp"] .. " " .. mioFld1[nome]["целостность"][tostring(testQ["idp"])], nome, "guild")
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
						for i = 1, 10000 do
							if dmG1[i] ~= nil then
								dmG1[i]:Hide()
							end
							if dmG2[i] ~= nil then
								dmG2[i]:Hide()
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
					for i = 1, 10000 do
						if dmG1[i] ~= nil then
							dmG1[i]:Hide()
						end
						if dmG2[i] ~= nil then
							dmG2[i]:Hide()
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
						testQ["temp"] = nil
						for i=1,100 do
							if vybor[i] ~= nil then
								vybor[i]:Hide()
							end
						end
					end
				end
			end
			if id == 31 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("ns_str " .. testQ["idp"] .. " kx", nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 13 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 13 then
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

			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 5 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\topto.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\topto.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\uz.ogg")
					SendAddonMessage("ns_str " .. testQ["idp"] .. " uz", nome, "guild")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
-- 			if testQ["bbConfig"] == nil then
-- 				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "z" and id == 6 then
-- 					if testQ["temp"] == nil then
-- 						vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kopko.tga")
-- 						vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kopko.tga")
-- 						testQ["temp"] = 1
-- 					elseif testQ["temp"] == 1 then
-- 						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 						testQ["temp"] = nil
-- 						testQ["brevna"] = tonumber(testQ["brevna"]) - 10
-- 						testQ["nikQB"] = antc(testQ["brevna"])
-- 						SendAddonMessage("ns_str " .. testQ["idp"] .. " ms", nome, "guild")
-- 						for i=1,100 do
-- 							if vybor[i] ~= nil then
-- 								vybor[i]:Hide()
-- 							end
-- 						end
-- 					end
-- 				end
-- 			end
			if nome == myNome then
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 1 then
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
			--установка бобра на дерево
			if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "t" and id == 8 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bb.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hr.ogg")
					SendAddonMessage("ns_bbbb " .. testQ["idp"] .. " " .. testQ[myNome]['коды']['nome'][myNome], nome, "guild")
					testQ[myNome]["петы"]["bbbb"] = 0
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
			if (mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "m" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "mx" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "hs" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "ms" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "uz" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zs" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zx" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "skc" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "sx" or mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zp") and id == 8 then
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
					SendAddonMessage("oS " .. testQ["idp"] .. " " .. mioFld1[nome]["петы"][tostring(testQ["idp"])], nome, "guild")
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
					SendAddonMessage("gZ " .. testQ["idp"] .. " " .. mioFld1[nome]["петы"][tostring(testQ["idp"])] .. " " .. mioFld1[nome]["хозяин"][tostring(testQ["idp"])], nome, "guild")
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
			if id == 2 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sbS.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sbS.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("ns_str " .. testQ["idp"] .. " sb", nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
			if id == 3 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("ns_str " .. testQ["idp"] .. " skc", nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
			--выбор
			if id == 35 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\krx.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\krx.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("ns_str " .. testQ["idp"] .. " krx", nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
			if id == 36 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\yaix.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\yaix.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("ns_krt " .. testQ["idp"] .. " yaiz", nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["temp"] = nil
					testQ[myNome]["петы"]['yaiz'] = 0
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end
			--if testQ["ggConfig"] == nil and testQ["gmConfig"] == nil then
			if id == 4 then
				if testQ["temp"] == nil then
					vybor[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zs.tga")
					vybor[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zs.tga")
					testQ["temp"] = 1
				elseif testQ["temp"] == 1 then
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
					SendAddonMessage("ns_str " .. testQ["idp"] .. " zs", nome, "guild")
					testQ["kirpich"] = tonumber(testQ["kirpich"]) - 10
					testQ["nikQKR"] = antc(testQ["kirpich"])
					testQ["kamen"] = tonumber(testQ["kamen"]) - 10
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					testQ["smg"] = tonumber(testQ["smg"]) - 5
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["doska"] = tonumber(testQ["doska"]) - 5
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					testQ["temp"] = nil
					for i=1,100 do
						if vybor[i] ~= nil then
							vybor[i]:Hide()
						end
					end
				end
			end

				if nome == myNome then
					if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 then
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
					if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "zt" and id == 7 then
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
			--end
			if nome == myNome then
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 17 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 17 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 14 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 14 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 15 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 15 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 16 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 16 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 then
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
				if mioFld1[nome]["объекты"][tostring(testQ["idp"])] == "bn" and id == 11 then
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
		if testQ["kd"] == nil then
			local nome
			if testQ['sign'] ~= "1" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			SendAddonMessage("pN1","", "guild")
			SendAddonMessage("smT",nome, "guild")
			if nome == myNome then
				if tonumber(testQ["mioR"][3]) >= 1 then
					if mioFld1[nome]["объекты"][tostring(id)] == "za" then
						if arg1 == "LeftButton" then
							if arg2 == true then
								testQ["zavod"] = 1
								fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\za.tga")
								fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\za.tga")
							end
							if arg2 == false then
								testQ["zavod"] = nil
								testQ["betonX"] = 86400
								--print(testQ["beton1"],'123')
								SendAddonMessage("zvd_xxx",testQ["beton1"], "guild")
								testQ["beton1"] = nil
								SendAddonMessage("smT",nome, "guild")
								SendAddonMessage("smT st",nome, "guild")
							end
						else
							testQ["zavod"] = nil
							testQ["betonX"] = 86400
							SendAddonMessage("zvd_xxx",testQ["beton1"], "guild")
							testQ["beton1"] = nil
							SendAddonMessage("smT",nome, "guild")
							SendAddonMessage("smT st",nome, "guild")
						end
					end
				end
			else
				-- if tonumber(testQ["kamen"]) >= 5 then
				-- 	if mioFld1[nome]["объекты"][tostring(id)] == "za" then
				-- 		if arg1 == "LeftButton" then
				-- 			if arg2 == true then
				-- 				testQ["zavod"] = 1
				-- 				testQ["kamen"] = tonumber(testQ["kamen"])-5
				-- 				testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
				-- 				dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
				-- 			end
				-- 			if arg2 == false then
				-- 				testQ["zavod"] = nil
				-- 			end
				-- 		end
				-- 	end
				-- end
			end

	-- 		if nome == myNome then
	-- 			if tonumber(testQ["brevna"]) >= 1 and tonumber(testQ["stog"]) >= 1 then
	-- 				if mioFld1[nome]["объекты"][tostring(id)] == "zp" then
	-- 					if arg1 == "LeftButton" then
	-- 						if arg2 == true then
	-- 							testQ["zavodp"] = 1
	-- 							testQ["zavodpc"] = 1
	-- 							testQ["brevna"] = tonumber(testQ["brevna"])-1
	-- 							testQ["nikQB"] = antc(testQ["brevna"])
	-- 							testQ["stog"] = tonumber(testQ["stog"])-1
	-- 							testQ["nikQF"] = antc(tonumber(testQ["stog"]))
	-- 							dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
	-- 						end
	-- 						if arg2 == false then
	-- 							testQ["zavodp"] = nil
	-- 							testQ["zavodpc"] = nil
	-- 						end
	-- 					end
	-- 				end
	-- 			end
	-- 		else
	-- 			if tonumber(testQ["brevna"]) >= 5 and tonumber(testQ["stog"]) >= 5 then
	-- 				if mioFld1[nome]["объекты"][tostring(id)] == "zp" then
	-- 					if arg1 == "LeftButton" then
	-- 						if arg2 == true then
	-- 							testQ["zavodp"] = 1
	-- 							testQ["zavodpc"] = 1
	-- 							testQ["brevna"] = tonumber(testQ["brevna"])-5
	-- 							testQ["nikQB"] = antc(testQ["brevna"])
	-- 							testQ["stog"] = tonumber(testQ["stog"])-5
	-- 							testQ["nikQF"] = antc(tonumber(testQ["stog"]))
	-- 							dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
	-- 						end
	-- 						if arg2 == false then
	-- 							testQ["zavodp"] = nil
	-- 							testQ["zavodpc"] = nil
	-- 						end
	-- 					end
	-- 				end
	-- 			end
	-- 		end
			if arg1 == "MiddleButton" then
				if nome == myNome then
					if mioFld1[nome]["объекты"][tostring(id)] == "dz" then
						if testQ[myNome]["hTimer"] == nil then
							if testQ[myNome]['q_stelth'] ~= nil then
								if testQ[myNome]['q_stelth']['start'] == 1 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно определить точное местоположение персонажа: " .. testQ[myNome]['q_stelth']['mobs'],1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 2 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно определить точное местоположение персонажа: " .. testQ[myNome]['q_stelth']['mobs'] .. ", но меня заметили: опыт за квест снижен",1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 3 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Меня заметили, квест провален. Чтобы сбросить квест, нужно обновить подземелье",1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 4 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Сдать квест",1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 5 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Сдать квест со штрафом на опыт",1,"show")
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
								local x = math.random(1,tablelength(q_stelth))
								testQ[myNome]['q_stelth'] = {}
								testQ[myNome]['q_stelth']['mm'] = q_stelth_mm[x]
								local xx = math.random(1,tablelength(q_stelth[testQ[myNome]['q_stelth']['mm']]["mobs"]))
								testQ[myNome]['q_stelth']['mobs'] = q_stelth[testQ[myNome]['q_stelth']['mm']]['mobs'][xx]
								testQ[myNome]['q_stelth']['start'] = 0
								testQ["okno"] = "ns_q_stelth"
								quesT("show")
								okNo:configure(1,"show")
								rtnTextF("Нужно определить точное местоположение персонажа: " .. testQ[myNome]['q_stelth']['mobs'],1,"show")
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
								htimer(myNome)
							end
						else
							if testQ[myNome]['q_stelth'] ~= nil then
								if testQ[myNome]['q_stelth']['start'] == 1 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно определить точное местоположение персонажа: " .. testQ[myNome]['q_stelth']['mobs'],1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 2 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно определить точное местоположение персонажа: " .. testQ[myNome]['q_stelth']['mobs'] .. ", но меня заметили: опыт за квест снижен",1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 3 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Меня заметили, квест провален. Чтобы сбросить квест, нужно обновить подземелье",1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 4 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Сдать квест",1,"show")
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
								if testQ[myNome]['q_stelth']['start'] == 5 then
									testQ["okno"] = "ns_q_stelth"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Сдать квест со штрафом на опыт",1,"show")
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
				else
				end
				if nome == myNome then
					if mioFld1[nome]["объекты"][tostring(id)] == "ko" then
						if testQ[myNome]["лотерея"] ~= nil and tonumber(testQ[myNome]["лотерея"]) >= 1 then
							RandomRoll(1, 111)
						end
					end
				else
					if mioFld1[nome]["объекты"][tostring(id)] == "ko" then

					end
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "mz" then
					SendAddonMessage("#muzeum1", nome .. " " .. myNome, "guild")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "h" then
					SendAddonMessage("pN2","", "guild")
					if nome == myNome then
						if testQ[myNome]["hTimer"] == nil then
							if testQ['nsq5_end'] == nil then
								if testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999" then
									SetWhoToUI(0)
									FriendsFrame:UnregisterEvent("WHO_LIST_UPDATE")
									SendWho(1-10)
									ns_q5()
									local x1 = math.random(1,50)
									local x2 = math.random(1,50)
									local x3 = math.random(1,50)
									testQ['nsq5_1'] = ns_q5Test[x1]
									testQ['nsq5_2'] = ns_q5Test[x2]
									testQ['nsq5_3'] = ns_q5Test[x3]
									--SetWhoToUI(1)
									--FriendsFrame:RegisterEvent("WHO_LIST_UPDATE")
									testQ["okno"] = "ns_q5"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно выследить одного из этих игроков: " .. testQ['nsq5_1'] .. ", " .. testQ['nsq5_2'] .. ", " .. testQ['nsq5_3'],1,"show")
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
									htimer(myNome)
								end
							else
								testQ["okno"] = "ns_q5_end"
								quesT("show")
								okNo:configure(1,"show")
								rtnTextF("Игрок успешно ликвидирован",1,"show")
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
							if testQ['nsq5_end'] ~= nil then
								testQ["okno"] = "ns_q5_end"
								quesT("show")
								okNo:configure(1,"show")
								rtnTextF("Игрок успешно ликвидирован",1,"show")
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
								if testQ['nsq5_1'] ~= nil then
									testQ["okno"] = "ns_q5"
									quesT("show")
									okNo:configure(1,"show")
									rtnTextF("Нужно выследить одного из этих игроков: " .. testQ['nsq5_1'] .. ", " .. testQ['nsq5_2'] .. ", " .. testQ['nsq5_3'],1,"show")
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
			if arg1 == "LeftButton" then
				if arg2 == false then
				testQ["kd"] = 0.2
					if mioFld1 ~= nil then
						if mioFld1[nome] then
							if mioFld1[nome]["объекты"][tostring(id)] == "ka" then
								local x
								if mioFld1[nome]["muzeum1"] ~= nil then
									if mioFld1[nome]["muzeum1"][91] ~= nil then
										if tonumber(mioFld1[nome]["muzeum1"][91]) < 166 then
											x = math.random(1+tonumber(string.format("%u",mioFld1[nome]["muzeum1"][91]*3)),500)
										else
											x = math.random(1+tonumber(string.format("%u",166*3)),500)
										end
									else
										x = math.random(1,500)
									end
								else
									x = math.random(1,500)
								end
								if x ~= 500 then
									dmgText(x,fBtn[id],999,13,"bbbbbb")
									dmG[999]:Show()
								else
									dmgText(x,fBtn[id],999,13,"c10020")
									dmG[999]:Show()
								end
								gKam(myNome,x)
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
								fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ka.tga")
								fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ka.tga")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "tv" then
								SendAddonMessage("#domtv", nome .. " " .. myNome, "guild")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "mz" then
								SendAddonMessage("#muzeum", nome .. " " .. myNome, "guild")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "kr" then
								SendAddonMessage("#kuryatnik", nome .. " " .. myNome, "guild")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "mf" then
								SendAddonMessage("#dommf", nome .. " " .. myNome, "guild")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "ts" then
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
						end
					end
					if nome == myNome then
						if mioFld1[nome]["объекты"][tostring(id)] == "ko" then
							if testQ[myNome]["лотерея"] ~= nil and tonumber(testQ[myNome]["лотерея"]) >= 3 then
								RandomRoll(1, 333)
							end
						end
					else
						if mioFld1[nome]["объекты"][tostring(id)] == "ko" then

						end
					end
					if mioFld1 ~= nil then
						if mioFld1[nome]["объекты"][tostring(id)] == "po" then
							if nome == myNome then
								if testQ[myNome]["hTimer"] == nil then
									if testQ['iya_end'] == nil then
										if testQ['iya'] == nil then
											testQ['iya'] = "1"
										end
										if tblIya[testQ['iya']] == nil then
											testQ['iya'] = "1"
										end
										ns_iya(testQ['iya'])
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
										htimer(myNome)
										testQ['iyastart'] = 1
										SendChatMessage("Ола, Вождь! Хм.. или хола?", "OFFICER", nil, 1)
									else
										SendAddonMessage("#hQ1 iya", " ", "guild")
										SendChatMessage("Адиос, Вождь! Да, точно, он самый - адьес", "OFFICER", nil, 1)
									end
								else
									if testQ['iyastart'] ~= nil then
										if testQ['iya_end'] == nil then
											if testQ['iya'] == nil then
												testQ['iya'] = "1"
											end
											if tblIya[testQ['iya']] == nil then
												testQ['iya'] = "1"
											end
											ns_iya(testQ['iya'])
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
											SendAddonMessage("#hQ1 iya", " ", "guild")
										end
									end
								end
							end
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "s" then
							if nome == myNome then
								if testQ[myNome]["hTimer"] ~= nil then
									if testQ[myNome]["взятый_квест_b"] == nil then
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
													testQ[myNome]["взятый_квест"] = "itemQ"
													testQ[myNome]["взятый_квест_х"] = "itemQ"
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
										testQ['q3bEnd'] = nil
										if testQ['ns_alfabetQ'][1] == 1 and testQ['ns_alfabetQ'][2] == 1 and testQ['ns_alfabetQ'][3] == 1 and testQ['ns_alfabetQ'][4] == 1 and testQ['ns_alfabetQ'][5] == 1 then
											testQ['q3bEnd'] = 1
										end
										if testQ['q3bEnd'] ~= 1 then
											local q3b1,q3b2,q3b3,q3b4,q3b5
											if testQ['ns_alfabetQ'][1] ~= 1 then
												q3b1 = testQ['ns_alfabetQ'][1]
											else
												q3b1 = "выполнено"
											end
											if testQ['ns_alfabetQ'][2] ~= 1 then
												q3b2 = testQ['ns_alfabetQ'][2]
											else
												q3b2 = "выполнено"
											end
											if testQ['ns_alfabetQ'][3] ~= 1 then
												q3b3 = testQ['ns_alfabetQ'][3]
											else
												q3b3 = "выполнено"
											end
											if testQ['ns_alfabetQ'][4] ~= 1 then
												q3b4 = testQ['ns_alfabetQ'][4]
											else
												q3b4 = "выполнено"
											end
											if testQ['ns_alfabetQ'][5] ~= 1 then
												q3b5 = testQ['ns_alfabetQ'][5]
											else
												q3b5 = "выполнено"
											end
											rtnTextF("Мне срочно нужно посетить локации с буквами в названии: " .. q3b1 .. ", " .. q3b2 .. ", " .. q3b3 .. ", " .. q3b4 .. ", " .. q3b5,1,"show")
											testQ["okno"] = "q3b"
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
											testQ["okno"] = "q3bEnd"
											rtnTextF("Я успешно все выполнил",1,"show")
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
										end
									end
								else
									local xv
									if testQ[myNome]["взятый_квест_s"] == nil and (testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999") and testQ[myNome]["взятый_квест_b"] == nil then
										xv = math.random(1,2)
									end
									if xv == 1 then
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
										end
									else
										if testQ[myNome]["взятый_квест_b"] == nil then
											testQ["uno_pa"] = {}
											rand_alfabet()
											testQ["okno"] = "q3b"
											testQ[myNome]["взятый_квест_b"] = "1"
											htimer(myNome)
											local q3b1,q3b2,q3b3,q3b4,q3b5
											if testQ['ns_alfabetQ'][1] ~= 1 then
												q3b1 = testQ['ns_alfabetQ'][1]
											else
												q3b1 = "выполнено"
											end
											if testQ['ns_alfabetQ'][2] ~= 1 then
												q3b2 = testQ['ns_alfabetQ'][2]
											else
												q3b2 = "выполнено"
											end
											if testQ['ns_alfabetQ'][3] ~= 1 then
												q3b3 = testQ['ns_alfabetQ'][3]
											else
												q3b3 = "выполнено"
											end
											if testQ['ns_alfabetQ'][4] ~= 1 then
												q3b4 = testQ['ns_alfabetQ'][4]
											else
												q3b4 = "выполнено"
											end
											if testQ['ns_alfabetQ'][5] ~= 1 then
												q3b5 = testQ['ns_alfabetQ'][5]
											else
												q3b5 = "выполнено"
											end
											rtnTextF("Мне срочно нужно посетить локации с буквами в названии: " .. q3b1 .. ", " .. q3b2 .. ", " .. q3b3 .. ", " .. q3b4 .. ", " .. q3b5,1,"show")
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
										end
									end
									if xv == nil then
										if testQ[myNome]["взятый_квест_s"] ~= nil then
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
										else
											testQ['q3bEnd'] = nil
											if testQ['ns_alfabetQ'][1] == 1 and testQ['ns_alfabetQ'][2] == 1 and testQ['ns_alfabetQ'][3] == 1 and testQ['ns_alfabetQ'][4] == 1 and testQ['ns_alfabetQ'][5] == 1 then
												testQ['q3bEnd'] = 1
											end
											if testQ['q3bEnd'] ~= 1 then
												rtnTextF("Мне срочно нужно посетить локации с буквами в названии: " .. testQ['ns_alfabetQ'][1] .. ", " .. testQ['ns_alfabetQ'][2] .. ", " .. testQ['ns_alfabetQ'][3] .. ", " .. testQ['ns_alfabetQ'][4] .. ", " .. testQ['ns_alfabetQ'][5],1,"show")
												testQ["okno"] = "q3b"
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
												testQ["okno"] = "q3bEnd"
												rtnTextF("Я успешно все выполнил",1,"show")
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
											end
										end
									end
								end
							end
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "dz" then
							SendAddonMessage("pN2","", "guild")
							if nome == myNome then
								if testQ[myNome]["hTimer"] == nil then
									if testQ[myNome]["взятый_квест_xy"] == nil then
										local x = math.random(1,2)
										if x == 1 then
											SendAddonMessage("ns_dictQ3", "", "guild")
										else
											ns_q4xy()
											testQ["okno"] = "q3xy"
											quesT("show")
											okNo:configure(1,"show")
											rtnTextF("Нужно найти похищенную принцессу по звуку. Слушай. Она где то в локации: " .. testQ[myNome]["взятый_квест_xy"]['lok'] ,1,"show")
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
										htimer(myNome)
									else
										if testQ[myNome]["взятый_квест_xy_end"] ~= 1 then
											testQ["okno"] = "q3xy"
											quesT("show")
											okNo:configure(1,"show")
											rtnTextF("Нужно найти похищенную принцессу по звуку. Слушай. Она где то в локации: " .. testQ[myNome]["взятый_квест_xy"]['lok'] ,1,"show")
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
											testQ["okno"] = "q3xy_end"
											quesT("show")
											okNo:configure(1,"show")
											rtnTextF("По крайней мере ты ощущаешь запах недавно прошедшей здесь принцессы..." ,1,"show")
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
								else
									if testQ['q3dict'] ~= nil then
										SendAddonMessage("ns_dictQ3", "", "guild")
									end
									if testQ[myNome]["взятый_квест_xy"] ~= nil then
										if testQ[myNome]["взятый_квест_xy_end"] ~= 1 then
											testQ["okno"] = "q3xy"
											quesT("show")
											okNo:configure(1,"show")
											rtnTextF("Нужно найти похищенную принцессу по звуку. Слушай. Она где то в локации: " .. testQ[myNome]["взятый_квест_xy"]['lok'] ,1,"show")
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
											testQ["okno"] = "q3xy_end"
											quesT("show")
											okNo:configure(1,"show")
											rtnTextF("По крайней мере ты ощущаешь запах недавно прошедшей здесь принцессы..." ,1,"show")
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
									if testQ['q3dict'] == nil and testQ[myNome]["взятый_квест_xy"] == nil and testQ[myNome]["взятый_квест_х"] == "itemQ" then
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
									if testQ[myNome]["взятый_квест_х"] == nil or testQ[myNome]["взятый_квест_х"] == "9999" and testQ[myNome]["взятый_квест_s"] == nil and testQ['q3dict'] == nil and testQ[myNome]["взятый_квест_xy"] == nil then
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
										testQ[myNome]["взятый_квест"] = "itemQ"
										testQ[myNome]["взятый_квест_х"] = "itemQ"
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
						if mioFld1[nome]["объекты"][tostring(id)] == "h" then
							SendAddonMessage("pN2","", "guild")
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
										testQ[myNome]["взятый_квест"] = "itemQ"
										testQ[myNome]["взятый_квест_х"] = "itemQ"
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
												local quests
												if testQ[myNome]['hq1'] == nil then
													quests = pQuest["х"]
												else
													quests = pQuest["х1"]
												end
												while true do
													local x = math.random(1,tonumber(#quests))
													if testQ[myNome]["выполненные_квесты_х"][tostring(quests[x])] == nil or testQ[myNome]["выполненные_квесты_х"][tostring(quests[x])] ~= "9999" then
														if iii == tonumber(#quests) then
															SendAddonMessage("ns_dost " .. "5", myNome, "guild")
															testQ[myNome]['hq1'] = 1
															testQ["hEnd"] = 1
															break
														end
														local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(tonumber(quests[x]))
														if completed == false then
															testQ["okno"] = quests[x]
															break
														end
														iii = iii + 1
													end
												end
												if testQ["okno"] ~= nil then
													quesT("show")
													okNo:configure(1,"show")
													rtnTextF("Нужно выполнить ачивку " .. GetAchievementLink(tonumber(testQ["okno"])),1,"show")
													if ach_ach[12] == nil then
														SendAddonMessage("#achVSE", 12, "guild")
													end
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
						local strojka
						if mioFld1[nome]["объекты"][tostring(id)] == "ox" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "mx" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "hs" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "sx" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "uz" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "m1" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "skc" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "kx" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "zs" then
							strojka = 1
						end
						if mioFld1[nome]["объекты"][tostring(id)] == "krx" then
							strojka = 1
						end
						if strojka == 1 then
							SendAddonMessage("resObj " .. id, nome, "guild")
							if mioFld1[nome]["объекты"][tostring(id)] == "uz" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\uz.ogg")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "hs" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "m1" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "skc" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "ob" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "kx" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "krx" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							end
							if mioFld1[nome]["объекты"][tostring(id)] == "zs" then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hs.ogg")
							end
						end

					end
				end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "lp" then
	-- 				testQ["diffT"] = {}
	-- 				for i = 1, 100 do
	-- 					testQ["diffT"][i] = "st"
	-- 				end
	-- 				testQ["brevna"] = tonumber(testQ["brevna"])-1
	-- 				testQ["nikQB"] = antc(testQ["brevna"])
	-- 				testQ["domZ"] = "crt"
	-- 				local nome
	-- 				if testQ['sign'] ~= "1" then
	-- 					nome = GuildFrame["selectedName"]
	-- 				else
	-- 					nome = myNome
	-- 				end
	--
	-- 				for i = 1, 100 do
	-- 					fBtn[i]:Hide()
	-- 					dBtn[i]:Show()
	-- 					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
	-- 					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
	-- 				end
	-- 				testQ["domZ"] = "crt"
	-- 				for i = 1, 100 do
	-- 					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
	-- 					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\st.tga")
	-- 				end
	-- 			end

			end
			if arg1 == "RightButton" then
				testQ["kd"] = 0.2
				if dmG[999] ~= nil then
					dmG[999]:Hide()
				end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "za" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zx.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zx.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("zX " .. id, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "s" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\sx.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("sX " .. id .. " " .. 29998, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) < 999 then
	-- 				local x = math.random(1,1800)
	-- 				SendAddonMessage("bNx " .. id .. " " .. x, nome, "guild")
	-- 				local x = math.random(1,3)
	-- 				if x == 1 then
	-- 					SendChatMessage("Хмм... А что будет если оставить тут след от моей руки?", "OFFICER", nil, 1)
	-- 					testQ["brevna"] = tonumber(testQ["brevna"]) - 1
	-- 					testQ["nikQB"] = antc(testQ["brevna"])
	-- 				elseif x == 2 then
	-- 					SendChatMessage("Хмм... А что будет если оставить тут след от моей ноги?", "OFFICER", nil, 1)
	-- 					testQ["beton"] = tonumber(testQ["beton"]) - 1
	-- 					testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
	-- 				elseif x == 3 then
	-- 					SendChatMessage("Хмм... А что будет если оставить тут след от моей задницы?", "OFFICER", nil, 1)
	-- 					testQ["kamen"] = tonumber(testQ["kamen"]) - 1
	-- 					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "ms" or mioFld1[nome]["объекты"][tostring(id)] == "uz" then
	-- 				resObj(id,myNome,nome)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["объекты"][tostring(id)] .. ".ogg")
	-- 			end
				SendAddonMessage("treeX " .. id, nome, "guild")
				--treeX(nome,myNome,id)
				if mioFld1 then
					if mioFld1[nome] then
						if mioFld1[nome]["объекты"][tostring(id)] == "t" or mioFld1[nome]["объекты"][tostring(id)] == "f" then
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["объекты"][tostring(id)] .. ".ogg")
						else
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
						end
					end
				end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "m" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["объекты"][tostring(id)] .. "x.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["объекты"][tostring(id)] .. "x.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("mX " .. id, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "ar" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\as.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("aS " .. id .. " " .. 14990, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "bi" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bs.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("bS " .. id .. " " .. 14990, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "to" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bc.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("tO " .. id .. " " .. 14990, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "ko" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kx.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("kX " .. id .. " " .. 14990, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end

	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "bh" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bx.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("bH " .. id .. " " .. 14990, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "h" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\hs.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("hS " .. id .. " " .. 9999, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "sk" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\skS.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("skc " .. id .. " " .. 999, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "ts" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tc.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("tsX " .. id .. " " .. 4998, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "zp" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\zc.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\zc.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("zPx " .. id .. " " .. 9998, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "mf" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\m0.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("mFXX " .. id .. " " .. 29998, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "tv" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\tz.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\tz.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("tVxx " .. id .. " " .. 29998, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "ob" then
	-- 				if testQ["temp"] == nil then
	-- 					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
	-- 					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\ox.tga")
	-- 					testQ["temp"] = 1
	-- 				elseif testQ["temp"] == 1 then
	-- 					SendAddonMessage("oXX " .. id .. " " .. 998, nome, "guild")
	-- 					testQ["temp"] = nil
	-- 				end
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "ox" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "m1" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "kx" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "hs" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "lx" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "tz" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "zc" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "tc" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "mx" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["объекты"][tostring(id)] .. ".ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "zx" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "zs" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "sb" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "skc" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "sx" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "as" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "bc" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "bx" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "bs" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
	-- 			if mioFld1[nome]["объекты"][tostring(id)] == "m0" then
	-- 				treeX(nome,myNome,id)
	-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	-- 			end
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
		testQ["ko"] = 0
		testQ["kr"] = 0
		testQ["krx"] = 0
		for i=1,100 do
			if mioFld1 ~= nil then
				if mioFld1[nome] ~= nil then
					if mioFld1[nome]["петы"] == nil then
						mioFld1[nome]["петы"] = {}
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "s" or mioFld1[nome]["объекты"][tostring(i)] == "sx" then
						testQ["s"] = testQ["s"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "h" then
						testQ["h"] = testQ["h"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "ko" then
						testQ["ko"] = testQ["ko"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "hs" then
						testQ["hs"] = testQ["hs"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "zx" then
						testQ["za"] = testQ["za"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "zs" then
						testQ["za"] = testQ["za"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "za" then
						testQ["za"] = testQ["za"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "ts" then
						testQ["ts"] = testQ["ts"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "zp" then
						testQ["zp"] = testQ["zp"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "mf" then
						testQ["mf"] = testQ["mf"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "kr" then
						testQ["kr"] = testQ["kr"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "krx" then
						testQ["krx"] = testQ["krx"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "tv" or mioFld1[nome]["объекты"][tostring(i)] == "tz" then
						testQ["tv"] = testQ["tv"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "ar" or mioFld1[nome]["объекты"][tostring(i)] == "as" then
						testQ["ar"] = testQ["ar"]+1
					end
					if  mioFld1[nome]["объекты"][tostring(i)] == "bi" or mioFld1[nome]["объекты"][tostring(i)] == "bh" or mioFld1[nome]["объекты"][tostring(i)] == "bs" or mioFld1[nome]["объекты"][tostring(i)] == "to" or mioFld1[nome]["объекты"][tostring(i)] == "bx" or mioFld1[nome]["объекты"][tostring(i)] == "bc" then
						testQ["bi"] = testQ["bi"]+1
					end
					if  mioFld1[nome]["петы"][tostring(i)] == "gob" and id == i then
						testQ["gob"] = 1
					end
					if  mioFld1[nome]["петы"][tostring(i)] == "gom" and id == i then
						testQ["gom"] = 1
					end
				end
			end
		end
		if nome == myNome then
			if testQ[myNome]["hTimer"] ~= nil then
				if mioFld1[nome]["объекты"][tostring(id)] == "h" or mioFld1[nome]["объекты"][tostring(id)] == "sx" then
					vybor:configure(12)
					vybor[12]:SetPoint("CENTER", fBtn[id],"CENTER",96, 0)
					vybor[12]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
					vybor[12]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
					vybor[12]:Show()
					if testQ ~= nil then
						testQ["idp"] = id
						testQ["icon"] = "smg"
						testQ["picon"] = mioFld1[nome]["объекты"][tostring(id)]
					end
				end
			end
		end
-- 		if nome == myNome then
-- 			if mioFld1[nome]["объекты"][tostring(id)] == "sx" and (mioFld1[nome]["петы"][tostring(id)] == "gob" or mioFld1[nome]["петы"][tostring(id)] == "gom") then
-- 				vybor:configure(28)
-- 				vybor[28]:SetPoint("CENTER", fBtn[id],"CENTER",-96, 0)
-- 				vybor[28]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
-- 				vybor[28]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smgb.tga")
-- 				vybor[28]:Show()
-- 				if testQ ~= nil then
-- 					testQ["idp"] = id
-- 					testQ["icon"] = "smg"
-- 					testQ["picon"] = mioFld1[nome]["объекты"][tostring(id)]
-- 				end
-- 			end
-- 		end
		if testQ["ko"] == 0 then
			if mioFld1 ~= nil then
				if mioFld1[nome] ~= nil then
					if mioFld1[nome]["объекты"][tostring(id)] == "z" then
						local ko = 0
						for i = 1, 100 do
							if mioFld1[nome]["объекты"][tostring(id)] == "ko" then
								ko = 1
							end
						end
						if ko < 1 then
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
				end
			end
		end
		if testQ["krx"] == 0 and testQ["kr"] == 0 then
			if mioFld1 ~= nil then
				if mioFld1[nome] ~= nil then
					if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
						if vybor[35] == nil or not vybor[35]:IsVisible() then
							vybor:configure(35)
							vybor[35]:SetPoint("CENTER", fBtn[id],"CENTER",-1*64, -96)
							vybor[35]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\kr.tga")
							vybor[35]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\kr.tga")
							vybor[35]:Show()
							if testQ ~= nil then
								testQ["idp"] = id
								testQ["icon"] = "kr"
								testQ["picon"] = "zt"
							end
						end
					end
				end
			end
		end
--[[		if testQ["ggConfig"] == nil and testQ["gmConfig"] == nil then
			if testQ["hs"] < 1 and testQ["h"] < 1 then
				if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
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
			if testQ["tv"] < 1 and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 then
				if mioFld1[nome]["объекты"][tostring(id)] == "bn" then
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
		if tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 then
			if mioFld1[nome]["объекты"][tostring(id)] == "ba" then
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
			if mioFld1[nome]["объекты"][tostring(id+1)] == "mf" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 then
				if mioFld1[nome]["объекты"][tostring(id)] == "bn" then
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
				if mioFld1[nome]["объекты"][tostring(id)] == "bn" then
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
				if mioFld1[nome]["объекты"][tostring(id)] == "bn" and mioFld1[nome]["объекты"][tostring(id+1)] == "za" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 then
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
		--]]
		--if testQ["bbConfig"] == nil then
		if mioFld1 then
			if mioFld1[nome] then
					if mioFld1[nome]["объекты"][tostring(id)] == "z" then
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
			end
		--end
			if mioFld1 then
				if mioFld1[nome] then
				if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
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
				if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
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

				if testQ["za"] < 1 then
					if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
						if vybor[4] == nil or not vybor[4]:IsVisible() then
							vybor:configure(4)
							if tonumber(testQ["h"]) == 0 and tonumber(testQ["hs"]) == 0 then
								vybor[4]:SetPoint("CENTER", fBtn[id],"CENTER",1*64, -96)
							end
							if tonumber(testQ["h"]) ~= 0 or tonumber(testQ["hs"]) ~= 0 then
								vybor[4]:SetPoint("CENTER", fBtn[id],"CENTER",1*64, -96)
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
		end
--[[
			if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
				if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
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
		end
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 then
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
		if testQ["ggConfig"] == nil and testQ["gmConfig"] == nil then


			
		end
		if testQ["bbConfig"] == nil then
			if mioFld1[nome]["объекты"][tostring(id)] == "z" then
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
		if testQ["ggConfig"] == nil and testQ["gmConfig"] == nil then
			if tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
				if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
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
		end
		if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 or tonumber(testQ["mioFldLvl"]) == 1 or tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld1[nome]["объекты"][tostring(id)] == "t" then
				if vybor[8] == nil or not vybor[8]:IsVisible() then
					if testQ[myNome]["петы"] ~= nil then
						if mioFld1[nome]["петы"] == nil then
							mioFld1[nome]["петы"] = {}
						end
						if mioFld1[nome]["петы"][tostring(id)] == nil then
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
			if mioFld1[nome]["объекты"][tostring(id)] == "m" or mioFld1[nome]["объекты"][tostring(id)] == "mx" or mioFld1[nome]["объекты"][tostring(id)] == "hs" or mioFld1[nome]["объекты"][tostring(id)] == "ms" or mioFld1[nome]["объекты"][tostring(id)] == "uz" or mioFld1[nome]["объекты"][tostring(id)] == "zs" or mioFld1[nome]["объекты"][tostring(id)] == "zx" or mioFld1[nome]["объекты"][tostring(id)] == "skc" or mioFld1[nome]["объекты"][tostring(id)] == "sx" or mioFld1[nome]["объекты"][tostring(id)] == "zp" or mioFld1[nome]["объекты"][tostring(id)] == "bc" then
				if vybor[8] == nil or not vybor[8]:IsVisible() then
					if testQ[myNome]["петы"] ~= nil then
						if mioFld1[nome]["петы"] == nil then
							mioFld1[nome]["петы"] = {}
						end
						if mioFld1[nome]["петы"][tostring(id)] == nil then
							if testQ[myNome]["петы"]["gg"] == "gob" then
								vybor:configure(8)
								vybor[8]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
								vybor[8]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gob.tga")
								vybor[8]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gob.tga")
								vybor[8]:Show()
								if testQ ~= nil then
									testQ["idp"] = id
									testQ["icon"] = "gob"
									testQ["picon"] = mioFld1[nome]["объекты"][tostring(id)]
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
									testQ["picon"] = mioFld1[nome]["объекты"][tostring(id)]
								end
							end
						end
					end
				end
			end
		end

		if tonumber(testQ["mioFldLvl"]) == 2 or tonumber(testQ["mioFldLvl"]) == 3 or tonumber(testQ["mioFldLvl"]) == 4 or tonumber(testQ["mioFldLvl"]) == 5 or tonumber(testQ["mioFldLvl"]) == 6 or tonumber(testQ["mioFldLvl"]) == 7 then
			if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 and (mioFld1[nome]["объекты"][tostring(id-1)] ~= nil and mioFld1[nome]["объекты"][tostring(id-1)] == "s") then
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
			if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 and (mioFld1[nome]["объекты"][tostring(id+1)] ~= nil and mioFld1[nome]["объекты"][tostring(id+1)] == "s") then
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
			if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 then
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
			if mioFld1[nome]["объекты"][tostring(id)] == "bn" then
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
			if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) <= -1 then
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
		if testQ["bbConfig"] ~= nil or testQ["ggConfig"] ~= nil or testQ["gmConfig"] ~= nil then
			if mioFld1[nome]["петы"] ~= nil then
				if mioFld1[nome]["хозяин"] ~= nil then
					if mioFld1[nome]["петы"][tostring(id)] ~= nil then
						if mioFld1[nome]["хозяин"][tostring(id)] == myNome then
							
						else
							if myNome == nome or myNome == mioFld1[nome]["хозяин"][tostring(id)] then
								
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
								testQ["picon"] = mioFld1[nome]["объекты"][tostring(id)]
							end
						end
					end
				end
			end
		end]]
		--timeQ sherst
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
		if mioFld1 ~= nil then
			if mioFld1[nome] ~= nil then

				local objecty = {
					['h'] = {
						['hp'] = nil,
						['bbbb'] = 1,
					},
					['zs'] = {
						['hp'] = 14999,	
					},
					['ka'] = {
						['hp'] = nil,
					},
					['t'] = {
						['hp'] = 999,
						['bbbb'] = 1,
					},
					['ob'] = {
						['hp'] = nil,
					},
					['ko'] = {
						['hp'] = nil,
						['bbbb'] = 1,
					},
					['mz'] = {
						['hp'] = nil,
					},
					['m1'] = {
						['hp'] = 999,
					},
					['uz'] = {
						['hp'] = 999,
					},
					['bn'] = {
						['hp'] = 4999,
					},
					['sx'] = {
						['hp'] = 14999,
					},
					['hs'] = {
						['hp'] = 4999,
					},
					['ox'] = {
						['hp'] = 999,	
					},
					['kx'] = {
						['hp'] = 999,	
					},
					['skc'] = {
						['hp'] = 999,	
					},
					['sx'] = {
						['hp'] = nil,
					},
					['f'] = {
						['hp'] = 999,	
					},
					['krx'] = {
						['hp'] = 14999,	
					},
					['kr'] = {
						['hp'] = nil,	
					},
				}

				for k,v in pairs(objecty) do
					if mioFld1[nome]["объекты"][tostring(id)] == k and objecty[k]['hp'] ~= nil then
						if mioFld1[nome]["целостность"][tostring(id)] == nil then
							SendAddonMessage("ns_shMc " .. mioFld1[nome]["объекты"][tostring(id)], nome, "guild")
						else
							if tonumber(mioFld1[nome]["целостность"][tostring(id)]) < objecty[k]['hp'] then
								SendAddonMessage("ns_shMc " .. mioFld1[nome]["объекты"][tostring(id)], nome, "guild")
								
							end
						end
					end
					if testQ[myNome]["петы"] ~= nil then
						if mioFld1[nome]["объекты"][tostring(id)] == k and objecty[k]['bbbb'] ~= nil and testQ[myNome]["петы"]['bbbb'] == 1 then
							if vybor[8] == nil or not vybor[8]:IsVisible() then
								if mioFld1[nome]["петы"] == nil then
									mioFld1[nome]["петы"] = {}
								end
								if mioFld1[nome]["петы"][tostring(id)] == nil or mioFld1[nome]["петы"][tostring(id)] == "    " then
									vybor:configure(8)
									vybor[8]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
									vybor[8]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\bbbb.tga")
									vybor[8]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\bbbb.tga")
									vybor[8]:Show()
									if testQ ~= nil then
										testQ["idp"] = id
										testQ["icon"] = "bbbb"
										testQ["picon"] = "t"
									end
								end
							end
						end
					end
				end

				-- if num ~= nil and num1 == 1 then
				-- 	if mioFld1[nome]["целостность"][tostring(id)] == nil then
				-- 		print(mioFld1[nome]["объекты"][tostring(id)])
				-- 		SendAddonMessage("ns_shMc " .. mioFld1[nome]["объекты"][tostring(id)], nome, "guild")
				-- 	end
				-- end
				
				if mioFld1[nome]["объекты"][tostring(id)] == "ko" then
					GameTooltip:AddLine("Колодец желаний")
					GameTooltip:AddLine("А что будет, если кинуть в колодец лотерейный билет? Может он размокнет?")
					GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40Скинуть в колодец лотерейный билет")
					GameTooltip:AddLine("|cff99ff99СКМ: |cffFFCF40Скинуть в колодец треть лотерейного билета")

				end
				if mioFld1[nome]["объекты"][tostring(id)] == "za" then
					GameTooltip:AddLine("|cFF6495EDБетонный завод")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Потребление: 1-5 камня за попытку")
					GameTooltip:AddLine("|cff99ff99Держать ЛКМ: |cffFFCF40добывать бетон")
					GameTooltip:AddLine("|cff99ff99Не держать ЛКМ: |cffFFCF40не добывать добывать бетон. Хм, что логично..")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Доступна пристройка: кирпичный цех(требуется бетонный фундамент)")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "za" and tonumber(testQ['mioR'][3]) < 1 then
					GameTooltip:AddLine("|cffff2b2bНужно больше камня")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "m" then
					GameTooltip:AddLine("|cFF6495EDКаменоломня")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Тут можно добывать камень.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40добывать камень |cff99ff99(шансы: 1 из 500 кликов)")
					GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40сломать рудник")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "f" then
					if mioFld1[nome]["целостность"] ~= nil then
						if tonumber(mioFld1[nome]["целостность"][tostring(id)]) ~= nil then
							if tonumber(mioFld1[nome]["целостность"][tostring(id)]) <= 100 then
								GameTooltip:AddLine("Густая трава. Ну видно же!")
								GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
								GameTooltip:AddLine("шанс получить траву: |cff99ff991%")
							end
							if tonumber(mioFld1[nome]["целостность"][tostring(id)]) > 100 and tonumber(mioFld1[nome]["целостность"][tostring(id)]) <= 200 then
								GameTooltip:AddLine("Густая трава. Ну видно же!")
								GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
								GameTooltip:AddLine("шанс получить траву: |cff99ff995%")
							end
							if tonumber(mioFld1[nome]["целостность"][tostring(id)]) > 200 and tonumber(mioFld1[nome]["целостность"][tostring(id)]) <= 500 then
								GameTooltip:AddLine("Густая трава. Ну видно же!")
								GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
								GameTooltip:AddLine("шанс получить траву: |cff99ff9910%")
							end
							if tonumber(mioFld1[nome]["целостность"][tostring(id)]) > 500 and tonumber(mioFld1[nome]["целостность"][tostring(id)]) <= 900 then
								GameTooltip:AddLine("Густая трава. Ну видно же!")
								GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
								GameTooltip:AddLine("шанс получить траву: |cff99ff9950%")
							end
							if tonumber(mioFld1[nome]["целостность"][tostring(id)]) > 900 then
								GameTooltip:AddLine("Густая трава. Ну видно же!")
								GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40добывать траву")
								GameTooltip:AddLine("шанс получить траву: |cff99ff9990%")
							end
						end
					end
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "ts" then
					GameTooltip:AddLine("|cFF6495EDТоварный склад")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffff2b2bЛКМ: Отказаться от стандартной награды за лвлап и получить рандомные ресурсы")
					GameTooltip:AddLine("|cff99ff99ПКМ: |cffFFCF40сломать склад")
					GameTooltip:AddLine("|cff99ff99Шанс получить пета")
				end
				if testQ[myNome]["hTimer"] ~= nil and mioFld1[nome]["объекты"][tostring(id)] == "s" then
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
				if mioFld1[nome]["объекты"][tostring(id)] == "sx" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDСтройка: Будущий сельсовет")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40строить")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "m1" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDСтройка: Строительство музея")
					GameTooltip:AddLine("|cFF6495EDСтройка: Когда нибудь сюда можно будет привозить все награбленное, но ценное только в духовном плане")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40строить")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "mz" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDМузей")
					GameTooltip:AddLine("|cffFFCF40Обычно в музеях хранят все недостаточно ценное, чтобы применить это в реальной жизни")
					GameTooltip:AddLine("|cffFFCF40Чаще всего это художественные ценности, которые стали ничейными по причине внезапной гибели их прошлых хозяев")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Войти")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "ka" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDНесокрушимая скала")
					GameTooltip:AddLine("|cffFFCF40Ее нельзя обидеть, обмануть, разрушить...")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40добывать камень |cff99ff99(шансы: 1 из 500 кликов)")
				end
				if testQ[myNome]["hTimer"] == nil and mioFld1[nome]["объекты"][tostring(id)] == "s" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDСельсовет")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40получить квест")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - квест на эмоции")
					GameTooltip:AddLine("|cffFFCF40если есть таймер - сдать |cff99ff99магическую ткань")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Доступно 4 пристройки:")
					GameTooltip:AddLine("|cff99ff99Библиотека: |cffFFCF40увеличивает опыт для квеста в хижине")
					GameTooltip:AddLine("|cff99ff99Бухгалтерия: |cffFFCF40дает единицу опыта к товарным квестам")
					GameTooltip:AddLine("|cff99ff99Отдел логистики: |cffFFCF40ускоряет таймер")
					GameTooltip:AddLine("|cff99ff99Архив: |cffFFCF40информация о прогрессе")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "po" then
					GameTooltip:ClearLines()
					GameTooltip:AddLine("|cFF6495EDПосольство")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40получить квест")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99СКМ: " .. "|cffFFCF40Сдать квест на прием в гильдию и получить кусок карты")
					GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - обучение испанскому")
					GameTooltip:AddLine("|cffFFCF40если есть таймер - ждать окончания")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Доступна 1 пристройка:")
					GameTooltip:AddLine("|cff99ff99КПП: |cffFFCF40позволяет собирать пошлину при входе на ваш участок")
				end
				if tonumber(mioFld1[nome]["целостность"][tostring(id)]) ~= nil then
					if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) >= 999 then
						GameTooltip:AddLine("Бетонный фундамент под здание")
					end

					if mioFld1[nome]["объекты"][tostring(id)] == "bn" and tonumber(mioFld1[nome]["целостность"][tostring(id)]) < 999 then
						GameTooltip:AddLine("Только что залитый сырой бетонный фундамент, а что если тыкнуть в него..мм.. пальцем?")
						GameTooltip:AddLine("|cffff2b2bКаждая попытка мародерства: минус рандомный ресурс")
					end
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "z" then
					GameTooltip:AddLine("Слегка рыхлая сырая земля..ее что, копали?")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "t" then
					GameTooltip:AddLine("Определенно это дерево... Может у него спросить чего?")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Рубить дерево")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "sb" then
					GameTooltip:AddLine("|cFF6495EDСклад бревен")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Кладбище невинно убиенных деревьев, огороженное их трупами.")
					GameTooltip:AddLine("Каждый склад расширяет хранилище бревен на |cff99ff99100")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "sk" then
					GameTooltip:AddLine("|cFF6495EDСклад камней")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Склад камней или правильно - сад камней? Хм..")
					GameTooltip:AddLine("Каждый склад расширяет хранилище камней на |cff99ff99100")
				end

				if mioFld1[nome]["объекты"][tostring(id)] == "ar" then
					GameTooltip:AddLine("|cFF6495EDАрхив")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Тут можно узнать многие тайны..или не узнать.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Узнать свой прогресс")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "bi" then
					GameTooltip:AddLine("|cFF6495EDБиблиотека")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Плюс |cff99ff99единица опыта|cffFFCF40 к квестам в хижине")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Здесь нельзя шуметь!")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "to" then
					GameTooltip:AddLine("|cFF6495EDОтдел логистики")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cffFFCF40Ускоряет таймер вдвое! И это как минимум! Мы очень быстрые...")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "bh" then
					GameTooltip:AddLine("|cFF6495EDБухгалтерия")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Если существует (но сомневается в этом, как и все мы), квесты на шерсть и прочие товары принесут |cff99ff99единицу опыта.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Кликать бесполезно")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "uz" then
					GameTooltip:AddLine("Еще не доконца утоптанная земля. Неровности там всякие.. Ну, воон там.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Топтать. Хм.. Или утаптывать?")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40Портить все что утоптал")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "zt" then
					GameTooltip:AddLine("Очень хорошо утоптанная земля, молодец.")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "ms" then
					GameTooltip:AddLine("Эта дырка в земле очень хорошо демонстрирует, что такое заготовка под рудник")
					GameTooltip:AddLine("А может все бросить и ну его нафиг?")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40копать до упора")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40все портить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "h" then
					GameTooltip:AddLine("|cFF6495EDХижина")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Хижина, дом, бла бла. Тут можно получить квест.")
					GameTooltip:AddLine("Я серьезно: |cff99ff99ЛКМ: " .. "|cffFFCF40получить квест")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99Доступные квесты: " .. "|cffFFCF40если нет таймера - получить достижение")
					GameTooltip:AddLine("|cffFFCF40если есть таймер - сдать |cff99ff99шерсть")
					GameTooltip:AddLine("|cff99ff99Сдача шерсти: |cffFFCF40снижает таймер на рандомное время, дает рандомные плюшки")
				end
				
				if mioFld1[nome]["объекты"][tostring(id)] == "zp" then
					GameTooltip:AddLine("|cFF6495EDКирпичный цех")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Можно производить кирпичи, а можно не производить")
					GameTooltip:AddLine("|cff99ff99Зажать ЛКМ или поставить пета: " .. "|cffFFCF40производить кирпичи.")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("Для производства кирпича требуется одновременно работающий завод бетона")
					GameTooltip:AddLine("Периодически потребляет бревна и траву..хм.. И бетон, ведь это силикатные кирпичи.")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "zc" then
					GameTooltip:AddLine("|cFF6495EDКирпичный цех")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Можно производить кирпичи, а можно не производить")
					GameTooltip:AddLine("|cff99ff99ЛКМ или поставить пета: " .. "|cffFFCF40строить.")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "tv" then
					GameTooltip:AddLine("|cFF6495EDТаверна \"Ухо Гоблина\"")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Выдает квесты на получение пунктов ачивок")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Зайти внутрь")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
					GameTooltip:AddLine("|cff99ff99Сдача ткани пустоты: |cffFFCF40снижает таймер на рандомное время, дает рандомные плюшки")
					GameTooltip:AddLine("Когда то один гоблин поспорил на свое ухо и проиграл...")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "mf" then
					GameTooltip:AddLine("|cFF6495EDМебельная фабрика")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Позволяет создавать всякое деревянное. И перерабатывать.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Зайти внутрь")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "ox" then
					GameTooltip:AddLine("|cFF6495EDСтройка")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Этот обелиск такой..черный...")
					GameTooltip:AddLine("Нужно больше камней положить друг на друга")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40положить еще один камень")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "ob" then
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
					GameTooltip:AddLine ("|cffFF8C0013.4.4. |cffFFFFE0Божество не обязано отчитываться за действия над игроками своего пантеона или не состоящими в пантеонах")
					GameTooltip:AddLine ("|cffFF8C0015. |cffFFFFE0Закон обратной силы не имеет")
					GameTooltip:Show()
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "lp" then
					GameTooltip:AddLine("|cFF6495EDЛесопилка")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Позволяет распиливать деревья и не только...")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Зайти внутрь: расходует |cff99ff991 |cffFFCF40бревно")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "krx" then
					GameTooltip:AddLine("|cFF6495EDСтроительство курятника")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Ко?")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40строить")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["объекты"][tostring(id)] == "kr" then
					GameTooltip:AddLine("|cFF6495EDКурятника")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Ко.")
					GameTooltip:AddLine("|cff99ff99ЛКМ: " .. "|cffFFCF40Зайти внутрь")
					GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40разрушить")
				end
				if mioFld1[nome]["петы"][tostring(id)] ~= nil and mioFld1[nome]["петы"][tostring(id)] ~= "    " then
					fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["петы"][tostring(id)] .. ".tga")
					fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["объекты"][tostring(id)] .. ".tga")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["петы"][tostring(id)] .. ".ogg")
					if mioFld1[nome]["хозяин"] == nil then
						mioFld1[nome]["хозяин"] = {}
					end
					
					if mioFld1[nome]["хозяин"][tostring(id)] ~= nil then
						if testQ[myNome]['коды'][mioFld1[nome]["хозяин"][tostring(id)]] == nil then
							GameTooltip:AddLine("|cffcd00cdХозяин пета: |cff99ff99" .. mioFld1[nome]["хозяин"][tostring(id)])
						else
							GameTooltip:AddLine("|cffcd00cdХозяин пета: |cff99ff99" .. testQ[myNome]['коды'][mioFld1[nome]["хозяин"][tostring(id)]])
						end
					else
						GameTooltip:AddLine("|cffcd00cdХозяин пета: |cff99ff99неразборчиво")
					end
					if testQ[myNome]['коды'][mioFld1[nome]["хозяин"][tostring(id)]] == myNome then
						vybor:configure(9)
						vybor[9]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
						vybor[9]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\os.tga")
						vybor[9]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\os.tga")
						vybor[9]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "os"
							testQ["picon"] = mioFld1[nome]["объекты"][tostring(id)]
						end
					else
						vybor:configure(10)
						vybor[10]:SetPoint("CENTER", fBtn[id],"CENTER",0, 96)
						vybor[10]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\gz.tga")
						vybor[10]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\gz.tga")
						vybor[10]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "gz"
							testQ["picon"] = mioFld1[nome]["объекты"][tostring(id)]
						end
					end
				end
				if mioFld1[nome]["влияние"] ~= nil then
					if mioFld1[nome]["влияние"][tostring(id)] ~= nil then
						local skryt = mysplit(mioFld1[nome]["влияние"][tostring(id)])
						if skryt[2] ~= nil then
							if tonumber(skryt[2]) <= testQ[myNome]["характеристики"]["внимательность"] then
								GameTooltip:AddLine("Следы: " .. mioFld1[nome]["влияние"][tostring(id)])
							end
						else
							GameTooltip:AddLine("|cffcd00cdСледы: " .. mioFld1[nome]["влияние"][tostring(id)])
						end
					end
				end
			end
		end
		GameTooltip:Show()
-- 		if mioFld1[nome]["петы"] ~= nil then
-- 			if mioFld1[nome]["петы"][tostring(id)] ~= nil then
-- 				local pet
-- 				pet = mysplit(mioFld1[nome]["петы"][tostring(id)])
-- 				fBtn[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. pet[1] .. ".tga")
-- 				if mioFld1[nome]["петы"][tostring(id)] ~= "bb" then
-- 					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["петы"][tostring(id)] .. ".ogg")
-- 				else
-- 					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hr.ogg")
-- 				end
-- 			end
-- 		end
	end)
	self[id]:SetScript("OnLeave",function(self)
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if mioFld1 ~= nil then
			if mioFld1[nome] ~= nil then
				if mioFld1[nome]["объекты"][tostring(id)] == "ob" then
					SendAddonMessage("ns_dost " .. "2", myNome, "guild")
				end
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
					if mioFld1 ~= nil then
						if mioFld1[nome] ~= nil then
							if mioFld1[nome]["объекты"] ~= nil then
								fBtn[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[nome]["объекты"][tostring(id)] .. ".tga")
							end
						end
					end
				end
			end
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
fBtn:configure(16,0,256,64,64,"","");
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
		if testQ["kd"] == nil then
			local nome
			if testQ['sign'] ~= "1" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			if arg1 == "LeftButton" then
				testQ["kd"] = 1
				if mioFld == nil then
					mioFld = {}
				end
				if mioFld1[nome] == nil then
					mioFld1[nome] = {}
				end
				if mioFld1[nome][testQ["domZ"]] == nil then
					mioFld1[nome][testQ["domZ"]] = {}
				end
				if testQ["domZ"] == "kuryatnik" then
					if mioFld1[nome]["kuryatnik"][tostring(id)] == "yaiz" then
						if nsInqubator == nil then
							nsInqubator = {}
						end
						if nsInqubator[tostring(id)] == nil then
							nsInqubator[tostring(id)] = 1
						end
						if tonumber(testQ['mioR'][2]) >= 1 then
							SendAddonMessage("inqub " .. id .. " " .. "yaiz" .. " " .. nsInqubator[tostring(id)], myNome, "guild")
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaiz.mp3")
						else
							SendAddonMessage("inqub " .. id .. " " .. "yaiz" .. " " .. nsInqubator[tostring(id)] .. " 1", myNome, "guild")
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaix.mp3")
						end
						nsInqubator[tostring(id)] = 1
					end
				end
				if nome == myNome then
					if testQ["domZ"] == "muzeum1" then
						local test
						if id == 1 then
							test = 1
						end
						if id == 10 then
							test = 1
						end
						if id == 91 then
							test = 1
						end
						if id == 100 then
							test = 1
						end
						if id == 2 then
							if mioFld1[nome]["muzeum1"][1] >= 10 then
								test = 1
							end
						end
						if id == 11 then
							if mioFld1[nome]["muzeum1"][1] >= 10 then
								test = 1
							end
						end
						if id == 9 then
							if mioFld1[nome]["muzeum1"][10] >= 10 then
								test = 1
							end
						end
						if id == 20 then
							if mioFld1[nome]["muzeum1"][10] >= 10 then
								test = 1
							end
						end
						if id == 81 then
							if mioFld1[nome]["muzeum1"][91] >= 10 then
								test = 1
							end
						end
						if id == 92 then
							if mioFld1[nome]["muzeum1"][91] >= 10 then
								test = 1
							end
						end
						if id == 90 then
							if mioFld1[nome]["muzeum1"][100] >= 10 then
								test = 1
							end
						end
						if id == 99 then
							if mioFld1[nome]["muzeum1"][100] >= 10 then
								test = 1
							end
						end
						if test ~= nil then
							SendAddonMessage("#muzeum1 " .. id, nome .. " " .. myNome, "guild")
						end
					end
				end
				if testQ["domZ"] == "kuryatnik" then
					if mioFld1[nome]["kuryatnik"][tostring(id)] == "karp" then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\karp.mp3")
					end
				end
				if testQ["domZ"] == "muzeum" then
					if mioFld1[nome]["muzeum"][id] == "1" then
						if id == 1 then
							if nome == myNome then
								SendChatMessage("Кнопка аддона героически найдена и даже нажата!!!", "OFFICER", nil, 1)
							else
								SendChatMessage("Кнопка аддона героически найдена и даже нажата персонажем " .. nome, "OFFICER", nil, 1)
							end
						end
						if id == 2 then
							if nome == myNome then
								SendChatMessage("Устав внимательно прочитан. Особо интригующие места законспектированны.", "OFFICER", nil, 1)
							else
								SendChatMessage(nome .. " внимательно прочитал Устав и даже законспективровал особо интригующие места", "OFFICER", nil, 1)
							end
						end
						if id == 3 then
							if nome == myNome then
								SendChatMessage("В музее была найдена древняя давно забытая технология: топор", "OFFICER", nil, 1)
							else
								SendChatMessage("Персонажем " .. nome .. " была найдена древняя давно забытую технологию, во время посещения музея: топор", "OFFICER", nil, 1)
							end
						end
						if id == 4 then
							if nome == myNome then
								SendChatMessage("Накоплено достаточно бревен для постройки хижины. Там меня могут посетить гениальнейшие идеи долгими зимними вечерами...", "OFFICER", nil, 1)
							else
								SendChatMessage("Персонажем " .. nome .. " накоплено достаточно бревен для постройки хижины. Там его могут посетить гениальнейшие идеи долгими зимними вечерами...", "OFFICER", nil, 1)
							end
						end
						if id == 5 then
							if nome == myNome then
								SendChatMessage("Все нубские квесты в хижине выполнены. Теперь меня можно целовать везде.", "OFFICER", nil, 1)
							else
								SendChatMessage("Персонажем " .. nome .. " все нубские квесты в хижине выполнены. Чмоке штоле...", "OFFICER", nil, 1)
							end
						end
						if id == 6 then
							if nome == myNome then
								SendChatMessage("Первый камень добыт", "OFFICER", nil, 1)
							else
								SendChatMessage("Персонажем " .. nome .. " был добыт первый камень", "OFFICER", nil, 1)
							end
						end
					end
				end
				if testQ["domZ"] == "taverna" then
					if mioFld1[nome][testQ["domZ"]][tostring(id)] == "b0" then
						if testQ[myNome]["hTimer"] ~= nil then
							if testQ[myNome]["взятый_квест_t"] == nil then
								if testQ[myNome]["взятый_квест_t"] == nil or testQ[myNome]["взятый_квест_t"] ~= "9999" then
									if testQ[myNome]["itemQend"] ~= 1 then
										local qq
										while true do
											qq=math.random(1,#pQuest["items"])
											if tostring(pQuest["items"][qq]["itemName"]) == "Ткань Пустоты" then
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
									htimer(myNome)
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
									htimer(myNome)
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
				if mioFld1[nome][testQ["domZ"]][tostring(id)] == "my" then
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
				end
				if testQ["domZ"] == "muzeum" then
					if id == 1 then

					end
				end
			end
			if arg1 == "RightButton" then
				if testQ["domZ"] == "taverna" then
					if mioFld1[nome][testQ["domZ"]][tostring(id)] == "b0" then
						--mioFld1[nome]["taverna"][tostring(i)] = "pl"
					end
				end
				if mioFld1[nome][testQ["domZ"]][tostring(id)] == "my" then
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
		end
	end)
	self[id]:SetScript("OnEnter",function(self, button)
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if testQ["domZ"] == "muzeum" then
			SendAddonMessage("ns_dost " .. "3", myNome, "guild")
		end
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if testQ["domZ"] == "kuryatnik" then
			if mioFld1[nome]["kuryatnik"][tostring(id)] ~= nil and mioFld1[nome]["kuryatnik"][tostring(id)] == "karp" then
				GameTooltip:AddLine("Птенец вороны")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Ква?")
				GameTooltip:AddLine(" ")
			end
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
		if testQ["domZ"] == "muzeum" then
			if id == 1 then

			end
		end
		if testQ["domZ"] == "muzeum1" then
			if id == 1 then
				GameTooltip:AddLine("Выбрать путь развития:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Увеличение урона по дереву")
				local n = string.format("%u",tonumber(mioFld1[nome]["muzeum1"][id])/3)
				GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. n)
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. string.format("%u",tonumber(mioFld1[nome]["muzeum1"][id])))
			end
			if id == 10 then
				GameTooltip:AddLine("Выбрать путь развития:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Увеличение урона по зданиям")
				local n = string.format("%u",tonumber(mioFld1[nome]["muzeum1"][id])/3)
				GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. n)
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. string.format("%u",tonumber(mioFld1[nome]["muzeum1"][id])))
			end
			if id == 91 then
				GameTooltip:AddLine("Выбрать путь развития:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Увеличение шанса добычи камня")
				GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id])*3)
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
			end
			if id == 100 then
				GameTooltip:AddLine("Выбрать путь развития:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Увеличение шанса добычи травы")
				GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
			end
			if id == 2 then
				if mioFld1[nome]["muzeum1"][1] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение урона по деревьям")
				end
			end
			if id == 11 then
				if mioFld1[nome]["muzeum1"][1] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение урона по деревьям")
				end
			end
			if id == 9 then
				if mioFld1[nome]["muzeum1"][10] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение урона по зданиям")
				end
			end
			if id == 20 then
				if mioFld1[nome]["muzeum1"][10] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение урона по зданиям")
				end
			end
			if id == 81 then
				if mioFld1[nome]["muzeum1"][91] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение шанса добычи камня")
				end
			end
			if id == 92 then
				if mioFld1[nome]["muzeum1"][91] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение шанса добычи камня")
				end
			end
			if id == 90 then
				if mioFld1[nome]["muzeum1"][100] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение шанса добычи травы")
				end
			end
			if id == 99 then
				if mioFld1[nome]["muzeum1"][100] >= 10 then
					GameTooltip:AddLine("Выбрать путь развития:")
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff99ff99тест")
					GameTooltip:AddLine("Текущий бонус: |cff99ff99" .. string.format("%u",mioFld1[nome]["muzeum1"][id]/3))
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Вложено квестов: |cff99ff99" .. mioFld1[nome]["muzeum1"][id])
				else
					GameTooltip:AddLine("Нужно вложить 10 квестов в |cff99ff99Увеличение шанса добычи травы")
				end
			end
		end
		if testQ["domZ"] == "muzeum" then
			if mioFld1[nome]["muzeum"][1] == "1" then
				if id == 1 then
					GameTooltip:AddLine("|cff99ff99Кнопка аддона героически найдена и даже нажата!!!")
				end
			else
				if id == 1 then
					GameTooltip:AddLine("|cffDC143CНужно найти кнопку аддона и нажать ее")
				end
			end
			if mioFld1[nome]["muzeum"][2] == "1" then
				if id == 2 then
					GameTooltip:AddLine("|cff99ff99Устав внимательно прочитан. Особо интригующие места тщательно законспектированны")
				end
			else
				if id == 2 then
					GameTooltip:AddLine("|cffDC143CНужно внимательно прочитать Устав гильдии")
				end
			end
			if mioFld1[nome]["muzeum"][3] == "1" then
				if id == 3 then
					GameTooltip:AddLine("|cff99ff99Во время прогулки по музею была найдена древняя забытая технология: топор")
				end
			else
				if id == 3 then
					GameTooltip:AddLine("|cffDC143CНужно приобщиться к культуре и посетить музей")
					GameTooltip:AddLine("|cffDC143CНаграда: топор")
				end
			end
			if mioFld1[nome]["muzeum"][4] == "1" then
				if id == 4 then
					GameTooltip:AddLine("|cff99ff99Накоплено достаточно бревен для постройки хижины. Там меня могут посетить гениальнейшие идеи долгими зимними вечерами...")
				end
			else
				if id == 4 then
					GameTooltip:AddLine("|cffDC143CНужно срубить 1 дерево")
					GameTooltip:AddLine("|cffDC143CНаграда: постройка хижины")
				end
			end
			if mioFld1[nome]["muzeum"][5] == "1" then
				if id == 5 then
					GameTooltip:AddLine("|cff99ff99Все нубские квесты в хижине выполнены. Теперь меня можно целовать везде..")
				end
			else
				if id == 5 then
					GameTooltip:AddLine("|cffDC143CНужно выполнить все нубские квесты в хижине")
					GameTooltip:AddLine("|cffDC143CНаграда: постройка сельсовета")
				end
			end
			if mioFld1[nome]["muzeum"][6] == "1" then
				if id == 6 then
					GameTooltip:AddLine("|cff99ff99Первый камень добыт")
				end
			else
				if id == 6 then
					GameTooltip:AddLine("|cffDC143CНужно долбить скалу, пока с нее не выпадет камень")
					GameTooltip:AddLine("|cffDC143CНаграда: серп для сбора травы")
				end
			end
		end
		if testQ["domZ"] == "mf" and mioFld1[nome][testQ["domZ"]][tostring(id)] == "bn" then
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

		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		if testQ["domZ"] ~= nil then
			if mioFld1[nome] == nil then
				mioFld1[nome] = {}
			end
			if mioFld1[nome][testQ["domZ"]] == nil then
				mioFld1[nome][testQ["domZ"]] = {}
			end
			if mioFld1[nome][testQ["domZ"]][tostring(id)] == "my" then
				GameTooltip:AddLine("|cFF6495EDЯщик с инструментами:")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Какие забавные внутри винтики и всякие отверточки")
				GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40создать Шедевр!")
				GameTooltip:AddLine("|cff99ff99ПКМ: " .. "|cffFFCF40забрать")
			end
		end
		--qSherstTime
		if testQ["domZ"] == "taverna" then
			if mioFld ~= nil then
				if mioFld1[nome] ~= nil then
					if mioFld1[nome][testQ["domZ"]] ~= nil then
						if mioFld1[nome][testQ["domZ"]][tostring(id)] == "b0" then
							GameTooltip:AddLine("|cFF6495EDБарная стойка:")
							GameTooltip:AddLine(" ")
							GameTooltip:AddLine("Взять квест")
						end
					end
				end
			end
		end
		
		if testQ["domZ"] == "kuryatnik" then
			if testQ[myNome]['петы']['yaiz'] == 1 then
				if mioFld1[nome]["kuryatnik"][tostring(id)] == "    " then
					if vybor[36] == nil or not vybor[36]:IsVisible() then
						vybor:configure(36)
						vybor[36]:SetPoint("CENTER", dBtn[id],"CENTER",0, -96)
						vybor[36]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\yaii.tga")
						vybor[36]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\yaii.tga")
						vybor[36]:Show()
						if testQ ~= nil then
							testQ["idp"] = id
							testQ["icon"] = "yaiz"
							testQ["picon"] = "    "
						end
						GameTooltip:AddLine("|cFF6495EDПоложить яйцо на инкубацию")
					end
				end
			end			
		end
		if mioFld1[nome]["kuryatnik"] ~= nil then
			if mioFld1[nome]["kuryatnik"][tostring(id)] == "yaiz" then
				if testQ['sign'] ~= "1" then
					nome = GuildFrame["selectedName"]
				else
					nome = myNome
				end
				if mioFld1[nome]["kuryatnikCel"] ~= nil then
					if mioFld1[nome]["kuryatnikCel"][tostring(id)] ~= nil and mioFld1[nome]["kuryatnikCel"][tostring(id)] ~= "    " then
						local procent
						if nsInqubator ~= nil then
							if nsInqubator[tostring(id)] ~= nil then
								procent = (mioFld1[nome]["kuryatnikCel"][tostring(id)]+nsInqubator[tostring(id)])*100/800000
							end
						else
							procent = mioFld1[nome]["kuryatnikCel"][tostring(id)]*100/800000
						end
						if procent ~= nil then
							GameTooltip:AddLine("|cFF6495EDПроцент инкубации: |cff99ff99" .. procent .. "%")
						end
					else
						GameTooltip:AddLine("|cFF6495EDПроцент инкубации: |cff99ff99неизвестно")
					end		
				else
					GameTooltip:AddLine("|cFF6495EDПроцент инкубации: |cff99ff99неизвестно")		
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
dBtn:configure(16,0,256,64,64,"","");
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
		SendAddonMessage("pN1","", "guild")
		SendAddonMessage("smT",nome, "guild")
		if arg1 == "LeftButton" then
			if tonumber(testQ["smg"]) >= 1 then
				if id == 1 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["brevna"] = tonumber(testQ["brevna"]) + x
					testQ["nikQB"] = antc(testQ["brevna"])
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 2 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					testQ["stog"] = tonumber(testQ["stog"]) + x
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
					dmgText2(testQ["stog"],mBtn[2],802,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 3 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					testQ["kamen"] = tonumber(testQ["kamen"]) + x
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
					dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
					dmgText2(testQ["kamen"],mBtn[3],803,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 4 then
					local x = math.random(1,10)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					testQ["beton"] = tonumber(testQ["beton"]) + x
					testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
					dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
					dmgText2(string.format("%d", tonumber(testQ["beton"])),mBtn[4],804,13,"FF8C00")
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
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 11 then
					local x = math.random(1,5)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					testQ["doska"] = tonumber(testQ["doska"]) + x
					testQ["nikQD"] = antc(tonumber(testQ["doska"]))
					dmgText2(testQ["doska"],mBtn[11],811,13,"FF8C00")
					dmgText(testQ["doska"],resursy[7],107,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 13 then
					local x = math.random(1,100)
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					if testQ["lom"] == nil then
						testQ["lom"] = x
					else
						testQ["lom"] = tonumber(testQ["lom"]) + x
					end
					dmgText2(testQ["lom"],mBtn[13],813,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			if tonumber(testQ["smg"]) >= 10 then
				if id == 5 then
					testQ[myNome]["петы"]["bb"] = 1
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText2(testQ[myNome]["петы"]["bb"],mBtn[5],805,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			if tonumber(testQ["smg"]) >= 10 then
				if id == 9 then
					testQ["yi"] = tonumber(testQ["yi"])+1
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText2(testQ["yi"],mBtn[9],809,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 12 then
					testQ["b0"] = tonumber(testQ["b0"])+1
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText2(testQ["b0"],mBtn[12],812,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
				if id == 14 then
					testQ[myNome]["лотерея"] = tonumber(testQ[myNome]["лотерея"]) + 3
					SendAddonMessage("#lotpp",myNome, "guild")
					dmgText2(testQ[myNome]["лотерея"],mBtn[14],814,14,"FF8C00")
					testQ["smg"] = tonumber(testQ["smg"]) - 10
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText2(testQ["b0"],mBtn[12],812,13,"FF8C00")
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			if tonumber(testQ["smg"]) >= 30 then
				if id == 10 then
					testQ["stanok"] = tonumber(testQ["stanok"])+1
					testQ["smg"] = tonumber(testQ["smg"]) - 30
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					testQ["stanok"] = tonumber(testQ["stanok"])+1
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
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
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
					dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
					dmgText2(gomT,mBtn[7],807,13,"FF8C00")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\smg.ogg")
				end
			end
			SendAddonMessage("#ns_cahs ", id, "guild")
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
			if id == 5 then
				if testQ["bbConfig"] == nil then
					testQ["bbConfig"] = 1
					print("Бобер активирован")
				else
					testQ["bbConfig"] = nil
					print("Бобер отключен")
				end
			end
			if id == 6 then
				if testQ["ggConfig"] == nil then
					testQ["ggConfig"] = 1
					print("Гоблин активирован")
				else
					testQ["ggConfig"] = nil
					print("Гоблин отключен")
				end
			end
			if id == 7 then
				if testQ["gmConfig"] == nil then
					testQ["gmConfig"] = 1
					print("Гном активирован")
				else
					testQ["gmConfig"] = nil
					print("Гном отключен")
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
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if id == 1 then
			GameTooltip:AddLine("|cff99ff99Бревна")
			local br = 0
			for i = 1, 100 do
				if mioFld1[nome]["объекты"][tostring(i)] == "sb" then
					br = br + 1
				end
			end
			if br == 0 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 10 бревен")
			end
			if br == 1 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 100 бревен")
			end
			if br == 2 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 200 бревен")
			end
			if br == 3 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 300 бревен")
			end
			if br == 4 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 400 бревен")
			end
			if br == 5 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 500 бревен")
			end
		end

		if id == 2 then
			GameTooltip:AddLine("|cff99ff99Трава")
		end
		if id == 3 then
			GameTooltip:AddLine("|cff99ff99Камни")
			local br = 0
			for i = 1, 100 do
				if mioFld1 then
					if mioFld1[nome] then
						if mioFld1[nome]["объекты"][tostring(i)] == "sk" then
							br = br + 1
						end
					end
				end
			end
			if br == 0 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 10 камней")
			end
			if br == 1 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 100 камней")
			end
			if br == 2 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 200 камней")
			end
			if br == 3 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 300 камней")
			end
			if br == 4 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 400 камней")
			end
			if br == 5 then
				GameTooltip:AddLine("|cffFFCF40Можно добыть не более 500 камней")
			end
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
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		SendAddonMessage("smT st",nome, "guild")
		SendAddonMessage("pN1","", "guild")
		if id == 5 then
			SendAddonMessage("ns_dost " .. "7", myNome, "guild")
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
				if mBtn[2] == nil then
					mBtn:configure(2)
				else
					mBtn[2]:Show()
				end
				dmgText2(testQ["mioR"][2],mBtn[2],802,13,"FF8C00")
				if mBtn[3] == nil then
					mBtn:configure(3)
				else
					mBtn[3]:Show()
				end
				dmgText2(testQ["mioR"][3],mBtn[3],803,13,"FF8C00")
				if mBtn[4] == nil then
					mBtn:configure(4)
				else
					mBtn[4]:Show()
				end
				dmgText2(testQ["mioR"][4],mBtn[4],804,13,"FF8C00")
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
				dmgText2(testQ["mioR"][6],mBtn[8],808,13,"FF8C00")
				dmgText2(testQ["mioR"][1],mBtn[1],801,13,"FF8C00")
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
				dmgText2(testQ["mioR"][7],mBtn[11],811,13,"FF8C00")
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
					if dmG2[i] ~= nil then
						dmG2[i]:Hide()
					end
					if dmG[i] ~= nil then
						dmG[i]:Hide()
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

function petBtn:configure(id,sizex,sizey,pet,sign)
	local nome
	if dBtn[1]:IsVisible() then
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
	else
		nome = myNome
	end
	if sign == "show" then
		if self[id] == nil then
			self[id] = CreateFrame("Button", nil, UIParent, "");
			self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
			self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. pet .. ".tga")
			self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. pet .. ".tga")
			self[id]:SetScript("OnEnter",function(self, button)

				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				if pet == "yaii" then
					if mioFld1 ~= nil then
						if mioFld1[nome] ~= nil then
							GameTooltip:AddLine("|cff99ff99ЛКМ: |cFF6495EDЕсли есть трава, утеплить яйцо и ускорить инкубацию")
							GameTooltip:AddLine("|cFF6495EDЕсли травы нет, прогнать пета и замедлить инкубацию")
							if mioFld1[nome]["kuryatnikCel"] ~= nil then
								if mioFld1[nome]["kuryatnikCel"][tostring(id)] ~= nil and mioFld1[nome]["kuryatnikCel"][tostring(id)] ~= "    " then
									local procent
									if nsInqubator ~= nil then
										if nsInqubator[tostring(id)] ~= nil then
											procent = (mioFld1[nome]["kuryatnikCel"][tostring(id)]+nsInqubator[tostring(id)])*100/800000
										end
									else
										procent = mioFld1[nome]["kuryatnikCel"][tostring(id)]*100/800000
									end
									GameTooltip:AddLine("|cFF6495EDПроцент инкубации: |cff99ff99" .. procent .. "%")
								else
									GameTooltip:AddLine("|cFF6495EDПроцент инкубации: |cff99ff99неизвестно")
								end
							else
								GameTooltip:AddLine("|cFF6495EDПроцент инкубации: |cff99ff99неизвестно")
							end
						end
					end
				end
				GameTooltip:Show()
			end)
			self[id]:SetScript("OnLeave",function(self, button)
				GameTooltip:Hide()
			end)
			self[id]:SetScript("OnClick",function(self, button)
				if tonumber(testQ['mioR'][2]) >= 1 then
					SendAddonMessage("inqub " .. id .. " " .. pet .. " " .. nsInqubator[tostring(id)], myNome, "guild")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaiz.mp3")
					petBtn[id]:Hide()
				else
					SendAddonMessage("inqub " .. id .. " " .. pet .. " " .. nsInqubator[tostring(id)] .. " 1", myNome, "guild")
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaix.mp3")
					petBtn[id]:Hide()
				end
				nsInqubator[tostring(id)] = 0
			end)
			self[id]:SetSize(sizex, sizey)
			local x = math.random(-300,300)
			local y = math.random(-300,300)
			self[id]:SetPoint("CENTER", UIParent,"CENTER",x, y)
		else
			if self[id]:IsVisible() then
				local x = math.random(1,10000)
				nsInqubator[tostring(id)] = nsInqubator[tostring(id)] - x
			else
				self[id]:SetSize(sizex, sizey)
				local x = math.random(-300,300)
				local y = math.random(-300,300)
				self[id]:SetPoint("CENTER", UIParent,"CENTER",x, y)
				self[id]:Show()
			end
		end
		
	else
		if self[id] ~= nil then
			self[id]:Hide()
		end
	end
end


function btn:configure(id,posex,posey,sizex,sizey,zzid,message)
	self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	if id == 987 then
		self[id]:SetScript("OnEnter",function(self, button)
			moveBtn = moveBtn or btnRemove:new(fBtn)
			moveBtn1 = moveBtn1 or btnRemove:new(dBtn)
		end)
	end
	if id == 973 then

		btn[973]:SetPoint("LEFT", MinimapZoomOut,"RIGHT",posex, posey)
		btn[id]:RegisterForClicks("LeftButtonUp", "RightButtonDown","MiddleButtonDown")
		self[id]:SetScript("OnEnter",function(self, button)
			-- gpBtn1 = gpBtn1 or nBtn:new(1,nil,btn[973],0,0,0,0,0,13,32,32,5,"RIGHT","LEFT","TOPLEFT","TOPLEFT","DIALOG","FF8C00")
			-- gpBtn1:configure()
			-- gpBtn2 = gpBtn2 or nBtn:new(2,nil,btn[973],0,-32,0,0,0,13,32,32,10,"RIGHT","LEFT","TOPLEFT","TOPLEFT","DIALOG","FF8C00")
			-- gpBtn2:configure()
			-- gpBtn3 = gpBtn3 or nBtn:new(3,nil,btn[973],0,-64,0,0,0,13,32,32,20,"RIGHT","LEFT","TOPLEFT","TOPLEFT","DIALOG","FF8C00")
			-- gpBtn3:configure()
			-- gpBtn4 = gpBtn4 or nBtn:new(4,nil,btn[973],0,-96,0,0,0,13,32,32,25,"RIGHT","LEFT","TOPLEFT","TOPLEFT","DIALOG","FF8C00")
			-- gpBtn4:configure()
			-- gpBtn5 = gpBtn5 or nBtn:new(5,nil,btn[973],0,-128,0,0,0,13,32,32,50,"RIGHT","LEFT","TOPLEFT","TOPLEFT","DIALOG","FF8C00")
			-- gpBtn5:configure()
			-- gpBtn6 = gpBtn6 or nBtn:new(6,nil,btn[973],0,-160,0,0,0,13,32,32,100,"RIGHT","LEFT","TOPLEFT","TOPLEFT","DIALOG","FF8C00")
			-- gpBtn6:configure()
			-- gpBtn1:Show()
			-- gpBtn2:Show()
			-- gpBtn3:Show()
			-- gpBtn4:Show()
			-- gpBtn5:Show()
			-- gpBtn6:Show()
			-- gpBtn1:setOnEnter(gpBtn1_enter)
			-- gpBtn2:setOnEnter(gpBtn1_enter)
			-- gpBtn3:setOnEnter(gpBtn1_enter)
			-- gpBtn4:setOnEnter(gpBtn1_enter)
			-- gpBtn5:setOnEnter(gpBtn1_enter)
			-- gpBtn6:setOnEnter(gpBtn1_enter)
			-- gpBtn1:setOnEnter(gpBtn1_click)
			-- gpBtn2:setOnEnter(gpBtn1_click)
			-- gpBtn3:setOnEnter(gpBtn1_click)
			-- gpBtn4:setOnEnter(gpBtn1_click)
			-- gpBtn5:setOnEnter(gpBtn1_click)
			-- gpBtn6:setOnEnter(gpBtn1_click)
			btn[973]:SetPoint("LEFT", MinimapZoomOut,"RIGHT",0, posey)
			FriendsFrame:Show()
			GuildFrame:Show()
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			local rez = nsGP()
			local num = tablelength(rez)
			local rank
			local rezultat
			local pbl
			for Zc=1,GetNumGuildMembers(true) do
		    	local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
	    		if name == myNome then
	    			pbl = publicNote
	    			rezultat = mysplit(officerNote)
	    			rezultat = rezultat[3]
	    		end
	    	end
	    	-- DestroyCheckboxWindow()
			if GetNumRaidMembers() ~= 0 then
				for i = 1,num do
					if rez[tostring(i)]['nome'] ~= myNome then
						GameTooltip:AddLine("|cFF6495ED" .. rez[tostring(i)]['nome'] .. " |cffFF8C00(" .. rez[tostring(i)]['public'] .. "): |cff99ff99" .. rez[tostring(i)]['znach'])
						table.insert(gplabels, rez[tostring(i)]['nome'] .. " |cffFF8C00(" .. rez[tostring(i)]['public'] .. "): |cff99ff99" .. rez[tostring(i)]['znach'] )
					else
						GameTooltip:AddLine("|cffFF0000" .. rez[tostring(i)]['nome'] .. " |cffFF8C00(" .. rez[tostring(i)]['public'] .. "): |cff99ff99" .. rez[tostring(i)]['znach'])
						table.insert(gplabels, rez[tostring(i)]['nome'] .. " |cffFF8C00(" .. rez[tostring(i)]['public'] .. "): |cff99ff99" .. rez[tostring(i)]['znach'])
					end
				end
				
				
				createParent()
				-- checkboxes = CreateCheckboxes(parentFrame, gplabels)
				-- ShowCheckboxWindow()
			else
				GameTooltip:AddLine("|cFF6495ED" .. myNome .. " |cffFF8C00(" .. pbl .. "): |cff99ff99" .. rezultat)
			end
			FriendsFrame:Hide()
			GuildFrame:Hide()
			GameTooltip:Show()
		end)
		self[id]:SetScript("OnLeave",function(self, button)
			btn[973]:SetPoint("LEFT", MinimapZoomOut,"RIGHT",25, posey)
			-- gpBtn1:Hide()
			-- gpBtn2:Hide()
			-- gpBtn3:Hide()
			-- gpBtn4:Hide()
			-- gpBtn5:Hide()
			-- gpBtn6:Hide()
			GameTooltip:Hide()
			-- HideCheckboxWindow()

			gplabels = {}
			testQ['gpRez'] = nil
		end)
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			if arg1 == "MiddleButton" then
				RandomRoll(1, 100)
			end
			if arg1 == "LeftButton" then
				local rez = nsGP()
				local num = tablelength(rez)
				local rank
				local rezultat
				local pbl
				for Zc=1,GetNumGuildMembers(true) do
		    	local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
		    		if name == myNome then
		    			pbl = publicNote
		    			rezultat = mysplit(officerNote)
		    			rezultat = rezultat[3]
		    			rank = rankName
		    		end
		    	end
		    	if num ~= 0 then
					if rank == "Капитан" or rank == "Статик" or rank == "Лейтенант" then
						for i = 1,num do
							SendChatMessage(rez[tostring(i)]['nome'] .. "(" .. rez[tostring(i)]['public'] .. "): " .. rez[tostring(i)]['znach'], "OFFICER", nil, 1)
						end
					else
						SendChatMessage(myNome .. "(" .. pbl ..  "): " .. rezultat, "OFFICER", nil, 1)
					end
				else
					SendChatMessage(myNome .. "(" .. pbl ..  "): " .. rezultat, "OFFICER", nil, 1)
				end
			end
			if arg1 == "RightButton" then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("Цлк10об:")
				GameTooltip:AddLine("|cFF6495ED За босса: " .. "|cff99ff995 гп")
				GameTooltip:AddLine("|cFF6495ED За квартального: " .. "|cff99ff9910 гп")
				GameTooltip:AddLine("|cFF6495ED Лич: " .. "|cff99ff9920 гп")
				GameTooltip:AddLine("|cFF6495ED Без вайпов фул инст:  " .. "|cff99ff9925 гп")
				GameTooltip:AddLine("|cff00BFFFСнятие: |cFF6495EDтолько за трини и пухи с Лича минимально |cff99ff995 гп |cFF6495EDшаг ставки |cff99ff995")
				GameTooltip:AddLine("Цлк25об:")
				GameTooltip:AddLine("|cFF6495ED За босса: " .. "|cff99ff9910 гп")
				GameTooltip:AddLine("|cFF6495ED За квартального: " .. "|cff99ff9920 гп")
				GameTooltip:AddLine("|cFF6495ED Лич: " .. "|cff99ff9950 гп")
				GameTooltip:AddLine("|cFF6495ED Без вайпов фул инст:  " .. "|cff99ff9950 гп")
				GameTooltip:AddLine("|cff00BFFFСнятие:")
				GameTooltip:AddLine("|cFF6495ED Вещь: начальная ставка " .. "|cff99ff9910 гп |cFF6495EDшаг |cff99ff9910")
				GameTooltip:AddLine("|cFF6495ED Трини: " .. "|cff99ff9920 гп")
				GameTooltip:AddLine("|cFF6495ED Пухи: " .. "|cff99ff9930 гп")
				GameTooltip:AddLine("|cffFF0000Штрафы:")
				GameTooltip:AddLine("|cFF6495ED Не критичный косяк: " .. "|cff99ff99-5 гп")
				GameTooltip:AddLine("|cFF6495ED Вайп рейда: " .. "|cff99ff99-30 гп")
				GameTooltip:AddLine("РС10: |cFF6495EDза фул инст |cff99ff9925 гп")
				GameTooltip:AddLine("РС25: |cFF6495EDза фул инст |cff99ff99100 гп")
				GameTooltip:AddLine("|cff00BFFFСнятие:")
				GameTooltip:AddLine("|cFF6495ED Вещи: " .. "|cff99ff9920 гп |cFF6495EDшаг |cff99ff9910")
				GameTooltip:AddLine("|cFF6495ED Трини: " .. "|cff99ff9950 гп |cFF6495EDшаг |cff99ff9910")
				GameTooltip:AddLine("|cffFF0000Штрафы:")
				GameTooltip:AddLine("|cFF6495ED Не критичный косяк: " .. "|cff99ff99-5 гп")
				GameTooltip:AddLine("|cFF6495ED Вайп рейда: " .. "|cff99ff99-30 гп")
				GameTooltip:AddLine("ИК25: |cFF6495EDза фул инст |cff99ff9920 гп")
				GameTooltip:AddLine("|cff00BFFFСнятие: |cFF6495EDтолько за трини минимально |cff99ff9910 гп |cFF6495EDшаг ставки |cff99ff995")
				GameTooltip:AddLine("ОС25 +3:")
				GameTooltip:AddLine("|cFF6495ED За босса: " .. "|cff99ff9910 гп")
				GameTooltip:AddLine("Малигос25: |cff99ff9910гп")
				GameTooltip:AddLine("Оня25:")
				GameTooltip:AddLine("|cFF6495ED За босса: " .. "|cff99ff9915 гп")
				GameTooltip:AddLine("Накс25:")
				GameTooltip:AddLine("|cFF6495ED За квартал: " .. "|cff99ff9920 гп")
				GameTooltip:AddLine("|cFF6495ED За бессмертного: " .. "|cff99ff99200 гп")
				GameTooltip:AddLine("Ульдуар25:")
				GameTooltip:AddLine("|cFF6495ED За босса: " .. "|cff99ff9910 гп")
				GameTooltip:AddLine("|cFF6495ED Алгалон: " .. "|cff99ff9950 гп")
				GameTooltip:AddLine("|cFF6495ED За фул инст: " .. "|cff99ff9950 гп")
				GameTooltip:AddLine("|cFF6495ED Защитник ульдуара: " .. "|cff99ff99100 гп")
				GameTooltip:AddLine("|cFF6495ED Слава рейдеру ульдуара: " .. "|cff99ff99100 гп")
				GameTooltip:AddLine("ИВК25:")
				GameTooltip:AddLine("|cFF6495ED За босса: " .. "|cff99ff9910 гп")
				GameTooltip:AddLine("|cFF6495ED Без вайпов: " .. "|cff99ff99100 гп")
				GameTooltip:Show()
			end
		end)
	end
	if id == 974 then
		btn[id]:RegisterForClicks("LeftButtonUp", "RightButtonDown")
		btn[974]:SetPoint("LEFT", SendMailFrame,"BOTTOMRIGHT",posex, posey)
		self[id]:SetScript("OnEnter",function(self, button)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("|cFF6495EDПКМ: Включить покупку самогона")
			GameTooltip:Show()
			if samogon ~= nil then
				ahtunGSH("show")
				SendMailNameEditBox:SetText("Хефе")
				SendMailSubjectEditBox:SetText("Самогон")
				SendMailMoneyGold:SetText("100")
			end
		end)
		self[id]:SetScript("OnLeave",function(self, button)
			GameTooltip:Hide()
			if samogon ~= nil then
				ahtunGSH("show")
				SendMailNameEditBox:SetText("")
				SendMailSubjectEditBox:SetText("")
				SendMailMoneyGold:SetText("")
				ahtunGSH("hide")
			end
		end)
		self[id]:SetScript("OnClick",function(self, button)
			if arg1 == "LeftButton" then
				if samogon ~= nil then
					local signBtn
					SendMailMailButton:Click()
					StaticPopup1Button1:Click()
					SendMailNameEditBox:SetText("")
					SendMailSubjectEditBox:SetText("")
					SendMailMoneyGold:SetText("")
					if signBtn == nil then
						if tonumber(GetMoney()) >= 1000000 then
							SendAddonMessage("#974M", myNome .. " " .. myNome .. " " .. 1, "guild")
						else
							SendAddonMessage("#974Mn", myNome .. " " .. myNome .. " " .. 1, "guild")
						end
					end
					signBtn = 1
					btn[974]:Hide()
				end
			else
				if samogon == nil then
					samogon = 1
				else
					samogon = nil
					SendMailNameEditBox:SetText("")
					SendMailSubjectEditBox:SetText("")
					SendMailMoneyGold:SetText("")
					ahtunGSH("hide")
				end
			end
		end)
	end
	if id == 975 then
		btn[975]:SetPoint("TOPLEFT", iconQ[1],"TOPLEFT",posex, posey)
		self[id]:SetScript("OnClick",function(self, button)
			if t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s1']-1 == NS_vzlomSeifa[1] then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			else
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			end
			if NS_vzlomSeifa[1] < 10 then
				NS_vzlomSeifa[1] = NS_vzlomSeifa[1]+1
			end
			if NS_vzlomSeifa[1] > 9 then
				NS_vzlomSeifa[1] = 0
			end
			if NS_vzlomSeifa[1] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s1'] and NS_vzlomSeifa[2] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s2'] and NS_vzlomSeifa[3] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s3'] then
				SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда при взломе'], "OFFICER", nil, 1)
				puteshestvieGrafikaHide()
				sohranenieProgressa("взлом")
				testQ[myNome]['puteshestvie'] = t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда']
				PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
			end
			btn[975]:SetText(NS_vzlomSeifa[1])
		end)
	end
	if id == 976 then
		btn[976]:SetPoint("TOPLEFT", iconQ[1],"TOPLEFT",posex, posey)
		self[id]:SetScript("OnClick",function(self, button)
			
			if t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s2']-1 == NS_vzlomSeifa[2] then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			else
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			end
			if NS_vzlomSeifa[2] < 10 then
				NS_vzlomSeifa[2] = NS_vzlomSeifa[2]+1
			end
			if NS_vzlomSeifa[2] > 9 then
				NS_vzlomSeifa[2] = 0
			end
			if NS_vzlomSeifa[1] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s1'] and NS_vzlomSeifa[2] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s2'] and NS_vzlomSeifa[3] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s3'] then
				SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда при взломе'], "OFFICER", nil, 1)
				puteshestvieGrafikaHide()
				sohranenieProgressa("взлом")
				testQ[myNome]['puteshestvie'] = t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда при взломе']
				PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
			end
			btn[976]:SetText(NS_vzlomSeifa[2])
		end)
	end
	if id == 977 then
		btn[977]:SetPoint("TOPLEFT", iconQ[1],"TOPLEFT",posex, posey)
		self[id]:SetScript("OnClick",function(self, button)
			
			if t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s3']-1 == NS_vzlomSeifa[3] then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			else
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			end
			if NS_vzlomSeifa[3] < 10 then
				NS_vzlomSeifa[3] = NS_vzlomSeifa[3]+1
			end
			if NS_vzlomSeifa[3] > 9 then
				NS_vzlomSeifa[3] = 0
			end
			if NS_vzlomSeifa[1] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s1'] and NS_vzlomSeifa[2] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s2'] and NS_vzlomSeifa[3] == t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['s3'] then
				SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда при взломе'], "OFFICER", nil, 1)
				puteshestvieGrafikaHide()
				sohranenieProgressa("взлом")
				testQ[myNome]['puteshestvie'] = t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда при взломе']
				PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
			end
			btn[977]:SetText(NS_vzlomSeifa[3])
		end)
	end
	if id == 978 then
		btn[978]:SetPoint("TOPLEFT", PlayerFrame,"BOTTOMLEFT",posex, posey)
		btn[978]:SetScript("OnEnter",function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("|cFF6495EDТочка маршрута")
			GameTooltip:Show()
		end)
		btn[978]:SetScript("OnLeave",function(self)
			GameTooltip:Hide()
		end)
	end
	if id == 979 then
		self[id]:SetPoint("TOPLEFT", PlayerFrame,"BOTTOMLEFT",posex, posey)
		btn[979]:SetScript("OnEnter",function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("|cFF6495EDВернуться на точку назад")
			GameTooltip:Show()
		end)
		btn[979]:SetScript("OnLeave",function(self)
			GameTooltip:Hide()
		end)
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			if tonumber(testQ[myNome]['puteshestvie']) >= 1 then
				testQ[myNome]['puteshestvie'] = tostring(tonumber(testQ[myNome]['puteshestvie'])-1)
			end
		end)
	end
	if id == 980 then
		self[id]:SetPoint("TOPLEFT", PlayerFrame,"BOTTOMLEFT",posex, posey)
		btn[980]:SetScript("OnEnter",function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine("|cFF6495EDПерейти на точку вперед")
			GameTooltip:Show()
		end)
		btn[980]:SetScript("OnLeave",function(self)
			GameTooltip:Hide()
		end)
		self[id]:SetScript("OnClick",function(self, button)
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
			if tonumber(testQ[myNome]['puteshestvie']) < tonumber(testQ[myNome][testQ[myNome]['puteshestvieTabella']]) then
				testQ[myNome]['puteshestvie'] = tostring(tonumber(testQ[myNome]['puteshestvie'])+1)
				puteshestvieGrafikaHide()
			end
		end)
	end

	if id == 982 or id == 981 then
		self[id]:SetPoint("TOPRIGHT", WhoFrame,"TOPRIGHT",posex, posey)
	end
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
	if id ~= 973 then
		self[id]:Hide();
	end

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
btn:configure(987,0,0,32,32,"","");
btn:configure(983,-100,118,32,32,"","П")
btn:configure(978,50,0,32,32,"","")
btn:configure(979,18,0,32,32,"","<")
btn:configure(980,82,0,32,32,"",">")
btn:configure(973,25,-20,32,32,"","ГП")

btn[989]:SetScript("OnClick",function(self, button)
	if testQ["domZ"] == nil then
		btn[989]:RegisterForClicks("LeftButtonUp", "RightButtonDown")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		showFld("0",myNome)
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end

		testQ['sign'] = 0
	else
		local nome
		if testQ['sign'] ~= "1" then
			nome = GuildFrame["selectedName"]
		else
			nome = myNome
		end
		for i = 1, 100 do
			dBtn[i]:Hide()
			fBtn[i]:Show()
		end
		testQ["domZ"] = nil
		for i = 1, 100 do
			if mioFld1[nome]["петы"][tostring(i)] ~= nil and mioFld1[nome]["петы"][tostring(i)] ~= "    " then
				risPetShow(i,"show",mioFld1[nome]["петы"][tostring(i)],nome)
			end

		end
	end
end)
menu_prok = {
    { text = "Выбрать текстуру", isTitle = true},
    { text = "Слева", hasArrow = true,
		menuList = {
			{ text = "arcane_missiles", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\arcane_missiles"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3331
                else
                    if tempPokazTextur == nil then
                        pokazTextur(3331,"SpellActivationOverlays\\arcane_missiles",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3331,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "art_of_war", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\art_of_war"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3332
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3332,"SpellActivationOverlays\\art_of_war",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3332,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "blood_boil", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\blood_boil"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3333
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3333,"SpellActivationOverlays\\blood_boil",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3333,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "blood_surge", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\blood_surge"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3334
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3334,"SpellActivationOverlays\\blood_surge",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3334,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "brain_freeze", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\brain_freeze"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3335
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3335,"SpellActivationOverlays\\brain_freeze",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3335,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "daybreak", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\daybreak"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3337
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3337,"SpellActivationOverlays\\daybreak",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3337,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "eclipse_moon", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\eclipse_moon"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3338
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3338,"SpellActivationOverlays\\eclipse_moon",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3338,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "feral_omenofclarity", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\feral_omenofclarity"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3339
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3339,"SpellActivationOverlays\\feral_omenofclarity",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3339,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "focus_fire", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\focus_fire"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3340
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3340,"SpellActivationOverlays\\focus_fire",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3340,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "genericarc_01", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\genericarc_01"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3341
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3341,"SpellActivationOverlays\\genericarc_01",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3341,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "genericarc_02", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\genericarc_02"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3342
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3342,"SpellActivationOverlays\\genericarc_02",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3342,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "genericarc_04", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\genericarc_04"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3343
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3343,"SpellActivationOverlays\\genericarc_04",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3343,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "genericarc_05", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\genericarc_05"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3344
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3344,"SpellActivationOverlays\\genericarc_05",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3344,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "genericarc_06", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\genericarc_06"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3345
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3345,"SpellActivationOverlays\\genericarc_06",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3345,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "grand_crusader", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\grand_crusader"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3346
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3346,"SpellActivationOverlays\\grand_crusader",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3346,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "hot_streak", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\hot_streak"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3347
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3347,"SpellActivationOverlays\\hot_streak",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3347,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "imp_empowerment", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\imp_empowerment"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3348
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3348,"SpellActivationOverlays\\imp_empowerment",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3348,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "killing_machine", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\killing_machine"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3349
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3349,"SpellActivationOverlays\\killing_machine",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3349,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "molten_core", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\molten_core"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3350
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3350,"SpellActivationOverlays\\molten_core",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3350,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "natures_grace", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\natures_grace"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3351
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3351,"SpellActivationOverlays\\natures_grace",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3351,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "nightfall", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\nightfall"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3352
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3352,"SpellActivationOverlays\\nightfall",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3352,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "sudden_doom", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\sudden_doom"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3353
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3353,"SpellActivationOverlays\\sudden_doom",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3353,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "surge_of_light", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\surge_of_light"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3354
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3354,"SpellActivationOverlays\\surge_of_light",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3354,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "sword_and_board", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\sword_and_board"
					testQ['proki_buffs']['profil'] = 1
					testQ['proki_buffs']['spellNum'] = 3355
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3355,"SpellActivationOverlays\\sword_and_board",1,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3355,"SpellActivationOverlays\\arcane_missiles",1,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
		}
	},
	{ text = "Сверху", hasArrow = true,
		menuList = {
			{ text = "backlash", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\backlash"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3356
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3356,"SpellActivationOverlays\\backlash",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3356,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "berserk", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\berserk"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3357
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3357,"SpellActivationOverlays\\berserk",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3357,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "dark_transformation", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\dark_transformation"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3358
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3358,"SpellActivationOverlays\\dark_transformation",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3358,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "denounce", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\denounce"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3359
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3359,"SpellActivationOverlays\\denounce",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3359,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "eclipse_sun", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\eclipse_sun"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3360
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3360,"SpellActivationOverlays\\eclipse_sun",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3360,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "frozen_fingers", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\frozen_fingers"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3361
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3361,"SpellActivationOverlays\\frozen_fingers",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3361,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "fulmination", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\fulmination"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3362
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3362,"SpellActivationOverlays\\fulmination",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3362,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "fury_of_stormrage", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\fury_of_stormrage"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3363
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3363,"SpellActivationOverlays\\fury_of_stormrage",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3363,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "generictop_01", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\generictop_01"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3364
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3364,"SpellActivationOverlays\\generictop_01",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3364,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "generictop_02", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\generictop_02"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3365
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3365,"SpellActivationOverlays\\generictop_02",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3365,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "hand_of_light", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\hand_of_light"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3366
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3366,"SpellActivationOverlays\\hand_of_light",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3366,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "impact", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\impact"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3367
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3367,"SpellActivationOverlays\\impact",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3367,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "lock_and_load", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\lock_and_load"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3368
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3368,"SpellActivationOverlays\\lock_and_load",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3368,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "maelstrom_weapon", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\maelstrom_weapon"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3369
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3369,"SpellActivationOverlays\\maelstrom_weapon",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3369,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "master_marksman", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\master_marksman"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3370
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3370,"SpellActivationOverlays\\master_marksman",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3370,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "necropolis", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\necropolis"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3371
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3371,"SpellActivationOverlays\\necropolis",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3371,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "rime", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\rime"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3372
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3372,"SpellActivationOverlays\\rime",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3372,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "serendipity", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\serendipity"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3373
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3373,"SpellActivationOverlays\\serendipity",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3373,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "shooting_stars", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\shooting_stars"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3374
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3374,"SpellActivationOverlays\\shooting_stars",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3374,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "slice_and_dice", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\slice_and_dice"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3375
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3375,"SpellActivationOverlays\\slice_and_dice",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3375,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "spellactivationoverlay_0", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\spellactivationoverlay_0"
					testQ['proki_buffs']['profil'] = 3
					testQ['proki_buffs']['spellNum'] = 3376
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3376,"SpellActivationOverlays\\spellactivationoverlay_0",3,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3376,"SpellActivationOverlays\\arcane_missiles",3,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
		}
	},
	{ text = "Справа", hasArrow = true,
		menuList = {
			{ text = "genericarc_03", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\genericarc_03"
					testQ['proki_buffs']['profil'] = 2
					testQ['proki_buffs']['spellNum'] = 3377
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3377,"SpellActivationOverlays\\genericarc_03",2,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3377,"SpellActivationOverlays\\arcane_missiles",2,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "sudden_death", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "SpellActivationOverlays\\sudden_death"
					testQ['proki_buffs']['profil'] = 2
					testQ['proki_buffs']['spellNum'] = 3378
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3378,"SpellActivationOverlays\\sudden_death",2,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3378,"SpellActivationOverlays\\arcane_missiles",2,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
		}
	},
	{ text = "Центр", hasArrow = true,
		menuList = {
			{ text = "kostKluch", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "kostKluch"
					testQ['proki_buffs']['profil'] = 4
					testQ['proki_buffs']['spellNum'] = 3379
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3379,"kostKluch",4,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3379,"SpellActivationOverlays\\arcane_missiles",4,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "zelenka", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "zelenka"
					testQ['proki_buffs']['profil'] = 4
					testQ['proki_buffs']['spellNum'] = 3380
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3380,"zelenka",4,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3380,"SpellActivationOverlays\\arcane_missiles",4,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "nl", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "nl"
					testQ['proki_buffs']['profil'] = 4
					testQ['proki_buffs']['spellNum'] = 3381
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3381,"nl",4,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3381,"SpellActivationOverlays\\arcane_missiles",4,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "krovootvod", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "krovootvod"
					testQ['proki_buffs']['profil'] = 4
					testQ['proki_buffs']['spellNum'] = 3382
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3382,"krovootvod",4,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3382,"SpellActivationOverlays\\arcane_missiles",4,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
			{ text = "krov_vampira", func = function()
				if testQ['proki_buffs'] ~= nil then
					testQ['proki_buffs']['text'] = "krov_vampira"
					testQ['proki_buffs']['profil'] = 4
					testQ['proki_buffs']['spellNum'] = 3383
				else
                    if tempPokazTextur == nil then
                        pokazTextur(3383,"krov_vampira",4,"show")
                        tempPokazTextur = 1
                    else
                        pokazTextur(3383,"SpellActivationOverlays\\arcane_missiles",4,"hide")
                        tempPokazTextur = nil
                    end
				end
			end },
		}
	},
}
menuFrame_prok = CreateFrame("Frame", "ExampleMenuFrame", PlayerFrame, "UIDropDownMenuTemplate")
menuFrame_prok:SetPoint("TOPLEFT", PlayerFrame, "BOTTOMLEFT")
menuFrame_prok:SetFrameStrata("FULLSCREEN_DIALOG")
menuFrame_prok:Hide()

btn[983]:RegisterForClicks("LeftButtonUp", "RightButtonDown")
btn[983]:SetScript("OnClick",function(self, button)
	if prokIcons == nil then
		prokIcons = {}
	end
	if arg1 == "LeftButton" then
		if testQ['proki_buffs'] == nil then
			editB[4]:Show()
			editB[5]:Show()
			editB[6]:Show()
			testQ['proki_buffs'] = {}
		end
		if testQ['proki_buffs'] ~= nil then
			if testQ['proki_buffs']['name'] ~= nil and testQ['proki_buffs']['text'] ~= nil then
				prokIcons[testQ['proki_buffs']['name']] = {}
				prokIcons[testQ['proki_buffs']['name']]['profil'] = testQ['proki_buffs']['profil']
				prokIcons[testQ['proki_buffs']['name']]['icon'] = testQ['proki_buffs']['text']
				prokIcons[testQ['proki_buffs']['name']]['spellNum'] = testQ['proki_buffs']['spellNum']
				prokIcons[testQ['proki_buffs']['name']]['name'] = testQ['proki_buffs']['name']
				prokIcons[testQ['proki_buffs']['name']]['stack'] = testQ['proki_buffs']['stack']
				prokIcons[testQ['proki_buffs']['name']]['skill'] = testQ['proki_buffs']['skill']
				testQ['proki_buffs'] = nil
				myCheckButton1:Hide()
				myCheckButton2:Hide()
				myCheckButton3:Hide()
				myCheckButton4:Hide()
				myCheckButton5:Hide()
				myCheckButton6:Hide()
				myCheckButton7:Hide()
				myCheckButton8:Hide()
				myCheckButton9:Hide()
				btn[983]:Hide()
				btn[987]:Hide()
			end

		end
	end
	if arg1 == "RightButton" then
		EasyMenu(menu_prok, menuFrame_prok, PlayerFrame, 0 , 0, "MENU")
	end
end)


btn[983]:SetScript("OnEnter",function(self, button)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	if testQ['proki_buffs'] == nil then
		GameTooltip:AddLine("|cffFF8C00Добавление нового прока")
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cff99ff99ЛКМ |cffFF8C00на кнопку для ввода названия прока")
		GameTooltip:AddLine("|cffFF8C00В первое текстовое поле вбить название БАФА (возле миникарты) и нажать энтер")
		GameTooltip:AddLine("|cffFF8C00Во второе текстовое поле вбить количество стаков, если нет - 1 и нажать энтер")
		GameTooltip:AddLine("|cffFF8C00В третье текстовое поле название скилла на который нажимаем и нажать энтер")
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cff99ff99ПКМ |cffFF8C00на кнопку для выбора и просмотра текстуры прока")
		GameTooltip:AddLine("|cffFF8C00Если не вбиты данные прока, первый клик на текстуру показывает ее, второй убирает")
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cffFF8C00Чтобы удалить созданный прок, в первое текстовое поле пишем название прока и жмем энтер")
		GameTooltip:AddLine('|cffFF8C00затем пишем слово "УДАЛИТЬ" во второе текстовое поле и жмем энтер')
	end
	if prokIcons ~= nil then

		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cffFF8C00Добавленные проки:")
		if prokIcons == nil then
			prokIcons = {}
		end
		for k, v in pairs(prokIcons) do
			if k ~= nil then
				GameTooltip:AddLine(prokIcons[k]['spellNum'] .. ": " .. prokIcons[k]['name'])
			end
		end
	end
	GameTooltip:Show()
end)
btn[983]:SetScript("OnLeave",function(self, button)
	GameTooltip:Hide()
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

editB[4] = CreateFrame("EditBox", nil, UIParent, "UIPanelButtonTemplate");
editB[4]:SetSize(512, 32)
--editB[4]:SetWidth(512)
--editB[4]:SetHeight(32)
editB[4]:SetPoint("TOPLEFT", btn[983],"BOTTOMLEFT",0, 0)
editB[4]:SetFrameStrata("TOOLTIP")
editB[4]:SetMaxLetters(32000)
editB[4]:SetAutoFocus(true)
editB[4]:SetFontObject("ChatFontNormal")
editB[4]:Hide()

editB[5] = CreateFrame("EditBox", nil, UIParent, "UIPanelButtonTemplate");
editB[5]:SetSize(512, 32)
--editB[4]:SetWidth(512)
--editB[4]:SetHeight(32)
editB[5]:SetPoint("TOPLEFT", btn[983],"BOTTOMLEFT",0, -32)
editB[5]:SetFrameStrata("TOOLTIP")
editB[5]:SetMaxLetters(32000)
editB[5]:SetAutoFocus(true)
editB[5]:SetFontObject("ChatFontNormal")
editB[5]:Hide()

editB[6] = CreateFrame("EditBox", nil, UIParent, "UIPanelButtonTemplate");
editB[6]:SetSize(512, 32)
--editB[4]:SetWidth(512)
--editB[4]:SetHeight(32)
editB[6]:SetPoint("TOPLEFT", btn[983],"BOTTOMLEFT",0, -64)
editB[6]:SetFrameStrata("TOOLTIP")
editB[6]:SetMaxLetters(32000)
editB[6]:SetAutoFocus(true)
editB[6]:SetFontObject("ChatFontNormal")
editB[6]:Hide()

editB[4]:SetScript("OnEnterPressed",function(self)
	testQ['proki_buffs']['name'] = editB[4]:GetText()
	EasyMenu(menu_prok, menuFrame_prok, PlayerFrame, 0 , 0, "MENU")
	editB[4]:Hide()
end)
editB[5]:SetScript("OnEnterPressed",function(self)
	testQ['proki_buffs']['stack'] = editB[5]:GetText()
	EasyMenu(menu_prok, menuFrame_prok, PlayerFrame, 0 , 0, "MENU")
	if testQ['proki_buffs']['name'] ~= nil then
		if editB[5]:GetText() == "УДАЛИТЬ" then
			prokIcons[testQ['proki_buffs']['name']] = nil
			editB[4]:Hide()
			editB[6]:Hide()
			editB[5]:Hide()
			testQ['proki_buffs'] = nil
		end
	end
	editB[5]:Hide()
end)

editB[6]:SetScript("OnEnterPressed",function(self)
	testQ['proki_buffs']['skill'] = editB[6]:GetText()
	EasyMenu(menu_prok, menuFrame_prok, PlayerFrame, 0 , 0, "MENU")
	editB[6]:Hide()
end)

editB[4]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|cFF6495EDЗдесь написать название прока с учетом регистра")
	GameTooltip:Show()
end)

editB[5]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|cFF6495EDКоличество стаков для срабатывания прока")
	GameTooltip:Show()
end)
editB[6]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddLine("|cFF6495EDНапиши название применяемого скилла!")
	GameTooltip:Show()
end)

editB[4]:SetScript("OnLeave",function(self)
	GameTooltip:Hide()
end)
editB[6]:SetScript("OnLeave",function(self)
	GameTooltip:Hide()
end)

editB[5]:SetScript("OnLeave",function(self)
	GameTooltip:Hide()
end)

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
			if nome ~= nil then
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
				local str = ""
				for k, v in pairs(testQ["tempOtzyv"][nome]) do
					str = str .. v .. "\n"
				end
				zametka = str
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

btn[987]:SetMovable(true)
btn[987]:RegisterForDrag("LeftButton")
btn[987]:SetScript("OnDragStart", function()
	btn[987]:StartMoving()

end)
btn[987]:SetScript("OnDragStop", function()
	btn[987]:StopMovingOrSizing();
	local test1,test2,test3,test4,test5=btn[987]:GetPoint(1)
	testQ['btn987x'] = test4
	testQ['btn987y'] = test5
	moveBtn:move(50,50)
	moveBtn1:move(50,50)
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
	function GetOfficerNoteThirdWord()
	    GuildRoster()

	    local myNome = UnitName("player")
	    for i = 1, GetNumGuildMembers() do
	        local name, _, _, _, _, _, _, officerNote = GetGuildRosterInfo(i)
	        if name then
	            name = name:gsub("%-.+", "")
	            if name == myNome then
	                local words = {}
	                for word in (officerNote or ""):gmatch("%S+") do
	                    table.insert(words, word)
	                end
	                return #words >= 3 and words[3] or "—"
	            end
	        end
	    end
	    return "—"
	end
	local secondWord = GetOfficerNoteThirdWord() or "Нет данных"
	GameTooltip:AddLine("|cFF6495EDГП: |cff00BFFF" .. secondWord)
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
			testQ["miniMapConf1"] = myIconPos
			local test1,test2,test3,test4,test5=minibtn:GetPoint(1)
			testQ["mbX"] = test4
			testQ["mbY"] = test5
			UpdateMapBtn();
		end)

-- Set position
		minibtn:ClearAllPoints();
		if testQ["miniMapConf1"] ~= nil then
			minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(testQ["miniMapConf1"])),(80 * sin(testQ["miniMapConf1"])) - 52)
		else
			minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(0)), (80 * sin(0)) - 52)
		end
		pokazat=0
		pokazatChk=0
end


-- Глобальные переменные для отслеживания двойного клика
local lastClickTime = 0
local lastClickButton = nil
local clickPending = false
local clickTimer = nil

-- Функция обработки одинарного клика
local function HandleSingleClick(arg1)
    -- Оригинальный код для одинарного клика
    SendAddonMessage("ns_dost " .. "1", myNome, "guild")
    if editB[4] ~= nil and editB[4]:IsVisible() then 
        editB[4]:Hide()
        editB[5]:Hide()
        editB[6]:Hide()
    end
    
    if tostring(versAdd) == tostring(testQ["vers"]["2"]) then
        PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
        local lvl
        for Zc=1,GetNumGuildMembers(true) do
            local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, 
                  isOnline, status, class, achievementPoints, achievementRank, isMobile, 
                  canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
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
        
        if arg1 == "LeftButton" then
            local testB
            if mBtn[1] ~= nil then
                if mBtn[1]:IsVisible() then
                    testB = 1
                end
            end
            if dBtn[1] ~= nil then
                if dBtn[1]:IsVisible() then
                    testB = 1
                end
            end
            if testB ~= 1 then
                showFld("1", myNome)
            end
        end
        
        if arg1 == "RightButton" then
            if testQ['btn987x'] == nil then
                btn[987]:SetPoint("CENTER", 0, 0)
            else
                btn[987]:SetPoint("CENTER", testQ['btn987x'], testQ['btn987y'])
            end
            if not myCheckButton1:IsVisible() then
                btn[987]:Show()
                myCheckButton1:Show()
                myCheckButton2:Show()
                myCheckButton3:Show()
                myCheckButton4:Show()
                myCheckButton5:Show()
                myCheckButton6:Show()
                myCheckButton7:Show()
                myCheckButton8:Show()
                myCheckButton9:Show()
                btn[983]:Show()
            else
                btn[987]:Hide()
                myCheckButton1:Hide()
                myCheckButton2:Hide()
                myCheckButton3:Hide()
                myCheckButton4:Hide()
                myCheckButton5:Hide()
                myCheckButton6:Hide()
                myCheckButton7:Hide()
                myCheckButton8:Hide()
                myCheckButton9:Hide()
                btn[983]:Hide()
            end
        end
        
        if arg1 == "MiddleButton" then
            CreateListUI()
        end
    else
        if testQ["update"] == nil then
            testQ["update"] = 30
            SendChatMessage("Мне нужно обновить аддон: запустить файл NSQCu в папке с игрой", "OFFICER", nil, 1)
        else
            print("Мне нужно обновить аддон: запустить файл NSQCu в папке с игрой")
        end
    end
end

-- Функция обработки двойного клика
local function HandleDoubleClick(arg1)
    -- Добавьте здесь свои действия для двойного клика
    if arg1 == "LeftButton" then
    	if tostring(versAdd) == tostring(testQ["vers"]["2"]) then
	    	if gpDb_old then
	        	gpDb_old:Show()
	        else
	        	gpDb:Show()
	        end
	    else
	        if testQ["update"] == nil then
	            testQ["update"] = 30
	            SendChatMessage("Мне нужно обновить аддон: запустить файл NSQCu в папке с игрой", "OFFICER", nil, 1)
	        else
	            print("Мне нужно обновить аддон: запустить файл NSQCu в папке с игрой")
	        end
	    end
    elseif arg1 == "RightButton" then
        print("Двойной правый клик")
        -- Ваши действия для двойного правого клика
    elseif arg1 == "MiddleButton" then
        print("Двойной средний клик")
        -- Ваши действия для двойного среднего клика
    end
end

-- Основной обработчик кликов
minibtn:SetScript("OnClick", function(self, arg1)
    local currentTime = GetTime()
    
    -- Проверяем, был ли предыдущий клик недавно той же кнопкой
    if clickPending and (currentTime - lastClickTime < 0.3) and (arg1 == lastClickButton) then
        -- Это двойной клик
        if clickTimer then
            clickTimer:Cancel()
            clickTimer = nil
        end
        clickPending = false
        HandleDoubleClick(arg1)
    else
        -- Первый клик или прошло слишком много времени
        if clickTimer then
            clickTimer:Cancel()
        end
        
        clickPending = true
        lastClickTime = currentTime
        lastClickButton = arg1
        
        -- Устанавливаем таймер для обработки одинарного клика
        clickTimer = C_Timer(0.3, function()
            if clickPending then
                HandleSingleClick(lastClickButton)
                clickPending = false
            end
        end)
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
	if testQ['iya_temp'] ~= nil then
		timeElapsed = timeElapsed + elapsed
		if timeElapsed > 0.3 then
			timeElapsed = testQ['iya_temp']
			if tblIya[testQ['iya']]['sh'] == 1 then
				if time() - testQ['iya_temp'] >= 1 and time() - testQ['iya_temp'] < 2 then
					--PlaySoundFile(tblIya[testQ['iya']]['s1'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					iYaBtn[1]:SetAlpha(0.8)
				elseif time() - testQ['iya_temp'] >= 5 and time() - testQ['iya_temp'] < 6 then
					PlaySoundFile(tblIya[testQ['iya']]['s2'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					iYaBtn[6]:SetAlpha(1)
					iYaBtn[2]:SetAlpha(1)
				elseif time() - testQ['iya_temp'] >= 8 and time() - testQ['iya_temp'] < 9 then
					PlaySoundFile(tblIya[testQ['iya']]['s3'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					iYaBtn[7]:SetAlpha(1)
					iYaBtn[3]:SetAlpha(1)
				elseif time() - testQ['iya_temp'] >= 12 then
					PlaySoundFile(tblIya[testQ['iya']]['s1'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					iYaBtn[1]:SetAlpha(1)
					testQ['iya_temp'] = nil
				end
			end
			if tblIya[testQ['iya']]['sh'] == 2 or tblIya[testQ['iya']]['sh'] == 5 then
				if time() - testQ['iya_temp'] >= 1 and time() - testQ['iya_temp'] < 2 then
					--PlaySoundFile(tblIya[testQ['iya']]['s1'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					iYaBtn[1]:SetAlpha(0.8)
				elseif time() - testQ['iya_temp'] >= 3 then
					PlaySoundFile(tblIya[testQ['iya']]['s1'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					iYaBtn[1]:SetAlpha(1)
					testQ['iya_temp'] = nil
				end
			end
			if tblIya[testQ['iya']]['sh'] == 3 then
				if time() - testQ['iya_temp'] >= 1 and time() - testQ['iya_temp'] < 2 then
					--PlaySoundFile(tblIya[testQ['iya']]['s1'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					--iYaBtn[1]:SetAlpha(0.8)
				elseif time() - testQ['iya_temp'] >= 3 then
					PlaySoundFile(tblIya[testQ['iya']]['s1'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					iYaBtn[1]:SetAlpha(1)
					testQ['iya_temp'] = nil
				end
			end
			if tblIya[testQ['iya']]['sh'] == 4 then
				if time() - testQ['iya_temp'] >= 1 and time() - testQ['iya_temp'] < 2 then
					PlaySoundFile(tblIya[testQ['iya']]['tqs'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					--iYaBtn[1]:SetAlpha(0.8)
				elseif time() - testQ['iya_temp'] >= 3 then
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					if tonumber(testQ['iya']) ~= 142 then
						testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
					else
						testQ['iya'] = "1"
					end
					if testQ['iya_ser'] >= 50 then
						testQ['iya_end'] = 1
						PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
						for i = 1, 100 do
							if iYaBtnPic[i] ~= nil then
								iYaBtnPic[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtn[i] ~= nil then
								iYaBtn[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtnP[i] ~= nil then
								iYaBtnP[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtnVsp[i] ~= nil then
								iYaBtnVsp[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtnText[i] ~= nil then
								iYaBtnText[i]:Hide()
							end
						end
						if tonumber(testQ['iya']) ~= 142 then
							testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
						else
							testQ['iya'] = "1"
						end
					else
						if testQ['iya_ser'] == nil then
							testQ['iya_ser'] = 1
						else
							testQ['iya_ser'] = testQ['iya_ser'] + 1
						end
						ns_iya(testQ['iya'])
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\iya\\q.ogg")
					end

					--testQ['iya']="1"
					testQ['iya_temp'] = nil

				end
			end

			if tblIya[testQ['iya']]['sh'] == 6 then
				if time() - testQ['iya_temp'] >= 1 and time() - testQ['iya_temp'] < 2 then
					PlaySoundFile(tblIya[testQ['iya']]['tqs'])
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					--iYaBtn[1]:SetAlpha(0.8)
				elseif time() - testQ['iya_temp'] >= 3 then
					testQ['iya_temp'] = testQ['iya_temp'] - 1
					if tonumber(testQ['iya']) ~= 142 then
						testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
					else
						testQ['iya'] = "1"
					end
					if testQ['iya_ser'] >= 50 then
						testQ['iya_end'] = 1
						PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
						for i = 1, 100 do
							if iYaBtnPic[i] ~= nil then
								iYaBtnPic[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtn[i] ~= nil then
								iYaBtn[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtnP[i] ~= nil then
								iYaBtnP[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtnVsp[i] ~= nil then
								iYaBtnVsp[i]:Hide()
							end
						end
						for i = 1, 100 do
							if iYaBtnText[i] ~= nil then
								iYaBtnText[i]:Hide()
							end
						end
						if tonumber(testQ['iya']) ~= 142 then
							testQ['iya'] = tostring(tonumber(testQ['iya'])+1)
						else
							testQ['iya'] = "1"
						end
					else
					if testQ['iya_ser'] == nil then
						testQ['iya_ser'] = 1
					else
						testQ['iya_ser'] = testQ['iya_ser'] + 1
					end
						ns_iya(testQ['iya'])
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\iya\\q.ogg")
					end

					--testQ['iya']="1"
					testQ['iya_temp'] = nil

				end
			end
		end
	end
end)

local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 100 then
		timeElapsed = 0
		local nome
		if mioFld1 ~= nil then
			for k,v in pairs(mioFld1) do
				nome = k
			end
		end
		if nome == nil then
			
		else
			SendAddonMessage("rostTravy ",nome, "guild")
		end
		if testQ[myNome]['kurTimerMinus'] == nil then
			testQ[myNome]['kurTimerMinus'] = math.random(20,100)
		end
		if testQ[myNome]['kurTimer'] == nil then
			testQ[myNome]['kurTimer'] = 0
		else
			testQ[myNome]['kurTimer'] = testQ[myNome]['kurTimer'] + 1
		end
		if testQ[myNome]['kurTimer'] >= testQ[myNome]['kurTimerMinus']+1 then
			testQ[myNome]['kurTimer'] = nil
			testQ[myNome]['kurTimerMinus'] = nil
		end

		if mioFld1 ~= nil then
			if mioFld1[myNome] ~= nil then
				if mioFld1[myNome]['kuryatnik'] ~= nil then
					if testQ[myNome]['kurTimer'] == testQ[myNome]['kurTimerMinus'] then
						for i = 1,100 do
							j=tostring(i)
							if "yaiz" == mioFld1[myNome]['kuryatnik'][j] then
								if mioFld1[myNome]['kuryatnikCel'] == nil or mioFld1[myNome]['kuryatnikCel'][tostring(i)] == nil then
									petBtn:configure(i,32,32,"yaii","show")
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaiz.mp3")
								elseif mioFld1[myNome]['kuryatnikCel'][tostring(i)] ~= nil and tonumber(mioFld1[myNome]['kuryatnikCel'][tostring(i)]) >= 1 and tonumber(mioFld1[myNome]['kuryatnikCel'][tostring(i)]) < 86000 then
									petBtn:configure(i,32,32,"yaii","show")
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaiz.mp3")
								elseif mioFld1[myNome]['kuryatnikCel'][tostring(i)] ~= nil and tonumber(mioFld1[myNome]['kuryatnikCel'][tostring(i)]) >= 86000 and tonumber(mioFld1[myNome]['kuryatnikCel'][tostring(i)]) < 500000 then
									petBtn:configure(i,64,64,"yaii","show")
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaiz.mp3")
								elseif mioFld1[myNome]['kuryatnikCel'][tostring(i)] ~= nil and tonumber(mioFld1[myNome]['kuryatnikCel'][tostring(i)]) >= 500000 then
									petBtn:configure(i,128,128,"yaii","show")
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\yaiz.mp3")
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
	if timeElapsed > 10 then
		timeElapsed = 0
		if mioFld1 ~= nil then
			if mioFld1[myNome] ~= nil then
				for i = 1, 100 do
					if mioFld1[myNome]["объекты"][tostring(i)] == "t" and mioFld1[myNome]["петы"][tostring(i)] == "bbbb" then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
					end
				end
			end
		end
		if mioFld1 ~= nil then
			if mioFld1[myNome] ~= nil then
				if mioFld1[myNome]['kuryatnik'] ~= nil then
					if nsInqubator == nil then
						nsInqubator = {}
					end
					for i = 1,100 do
						j=tostring(i)
						if mioFld1[myNome]['kuryatnik'][j] == "yaiz" then
							if nsInqubator[tostring(i)] == nil then
								nsInqubator[tostring(i)] = 10
							else
								nsInqubator[tostring(i)] = nsInqubator[tostring(i)] + 10
							end
						end
					end
				end
			end
		end
-- 		for i = 1,100 do
-- 			local pet
-- 			if mioFld ~= nil then
-- 				if mioFld1[myNome] ~= nil then
-- 					local x = math.random(1,100)
-- 					if x == 100 then
-- 						if mioFld1[myNome]["объекты"][tostring(i)] == "t" then
-- 							if math.fmod(i,10) == 0 then
-- 								if mioFld1[myNome]["объекты"][tostring(math.fmod(i,100)-1)] == "z" then
-- 									SendAddonMessage("travA " .. math.fmod(i,100)-1, myNome, "guild")
-- 								end
-- 								if i == 10 then
-- 									if mioFld1[myNome]["объекты"]["20"] == "z" then
-- 										SendAddonMessage("travA " .. 20, myNome, "guild")
-- 									end
-- 								end
-- 								if i == 100 then
-- 									if mioFld1[myNome]["объекты"]["90"] == "z" then
-- 										SendAddonMessage("travA " .. 90, myNome, "guild")
-- 									end
-- 								end
-- 								if i ~= 100 and i ~= 10 then
-- 									if mioFld1[myNome]["объекты"][tostring(i-10)] == "z" then
-- 										SendAddonMessage("travA " .. i-10, myNome, "guild")
-- 									end
-- 									if mioFld1[myNome]["объекты"][tostring(i+10)] == "z" then
-- 										SendAddonMessage("travA " .. i+10, myNome, "guild")
-- 									end
-- 								end
-- 							else
-- 								if fBtn[math.fmod(i,100)-1] ~= nil and mioFld1[myNome]["объекты"][tostring(math.fmod(i,100)-1)] == "z" then
-- 									SendAddonMessage("travA " .. math.fmod(i,100)-1, myNome, "guild")
-- 								end
-- 								if mioFld1[myNome]["объекты"][tostring(math.fmod(i,100)+1)] == "z" then
-- 									SendAddonMessage("travA " .. math.fmod(i,100)+1, myNome, "guild")
-- 								end
-- 								if (i-10) >= 1 and mioFld1[myNome]["объекты"][tostring(math.fmod(i,100)-10)] == "z" then
-- 									SendAddonMessage("travA " .. math.fmod(i,100)-10, myNome, "guild")
-- 								end
-- 								if (i+10) <= 100 and mioFld1[myNome]["объекты"][tostring(math.fmod(i,100)+10)] == "z" then
-- 									SendAddonMessage("travA " .. math.fmod(i,100)+10, myNome, "guild")
-- 								end
-- 								if (i-10) <= 0 and mioFld1[myNome]["объекты"][tostring(math.fmod(i,100)+10)] == "z" then
-- 									SendAddonMessage("travA " .. math.fmod(i,100)+10, myNome, "guild")
-- 								end
-- 								if (i+10) >= 101 and mioFld1[myNome]["объекты"][tostring(math.fmod(i,100)-10)] == "z" then
-- 									SendAddonMessage("travA " .. math.fmod(i,100)-10, myNome, "guild")
-- 								end
-- 							end
-- 						end
-- 					end
-- 					if testQ["zarplatab"] == nil then
-- 						if mioFld1[myNome]["петы"] ~= nil then
-- 							if mioFld1[myNome]["петы"][tostring(i)] ~= nil then
-- 								pet = mysplit(mioFld1[myNome]["петы"][tostring(i)])
-- 							end
-- 							if pet ~= nil then
-- 								if mioFld1[myNome]["объекты"][tostring(i)] == "t" and pet[1] == "bb" then
-- 									local x = math.random(1,1000)
-- 									if x == 1 then
-- 										testQ["brevna"] = tonumber(testQ["brevna"])-1
-- 										testQ["nikQB"] = antc(testQ["brevna"])
-- 									end
-- 									treeX(myNome,myNome,i)
-- 									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
-- 								end
-- 								if mioFld1[myNome]["объекты"][tostring(i)] ~= "t" and mioFld1[myNome]["петы"][tostring(i)] == "bb" then
-- 									if mioFld1[myNome]["объекты"][tostring(i-1)] ~= nil and mioFld1[myNome]["объекты"][tostring(i-1)] == "t" then
-- 										SendAddonMessage("bbM " .. i .. " " .. i-1, myNome, "guild")
-- 										testQ["поиск_пути_бобром"] = 1
-- 									end
-- 									if mioFld1[myNome]["объекты"][tostring(i+1)] ~= nil and mioFld1[myNome]["объекты"][tostring(i+1)] == "t" and testQ["поиск_пути_бобром"] == nil then
-- 										SendAddonMessage("bbM " .. i .. " " .. i+1, myNome, "guild")
-- 										testQ["поиск_пути_бобром"] = 1
-- 									end
-- 									if mioFld1[myNome]["объекты"][tostring(i-10)] ~= nil and mioFld1[myNome]["объекты"][tostring(i-10)] == "t" and testQ["поиск_пути_бобром"] == nil then
-- 										SendAddonMessage("bbM " .. i .. " " .. i-10, myNome, "guild")
-- 										testQ["поиск_пути_бобром"] = 1
-- 									end
-- 									if mioFld1[myNome]["объекты"][tostring(i+10)] ~= nil and mioFld1[myNome]["объекты"][tostring(i+10)] == "t" and testQ["поиск_пути_бобром"] == nil then
-- 										SendAddonMessage("bbM " .. i .. " " .. i+10, myNome, "guild")
-- 										testQ["поиск_пути_бобром"] = 1
-- 									end
-- 									testQ["поиск_пути_бобром"] = nil
-- 								end
-- 								if testQ["zarplata"] == nil then
-- 									if mioFld1[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gom" then
-- 										local x = math.random(1,2)
-- 										if x == 2 then
-- 											local xx = math.random(1,500)
-- 											gKam(myNome,xx)
-- 											PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
-- 											if xx == 1 then
-- 												SendAddonMessage("gomXm " .. i, myNome, "guild")
-- 											end
-- 										end
-- 									end
-- 									if mioFld1[myNome]["объекты"][tostring(i)] == "m" and pet[1] == "gob" then
-- 										local xx = math.random(1,500)
-- 										gKam(myNome,xx)
-- 										PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\m.ogg")
-- 										if xx == 1 then
-- 											SendAddonMessage("gobXm " .. i, myNome, "guild")
-- 											if ach_ach[21] == nil then
-- 												SendAddonMessage("#achVSE", 21, "guild")
-- 											end
-- 										end
-- 									end
-- 									if (mioFld1[myNome]["объекты"][tostring(i)] == "mx" or mioFld1[myNome]["объекты"][tostring(i)] == "hs" or mioFld1[myNome]["объекты"][tostring(i)] == "ms" or mioFld1[myNome]["объекты"][tostring(i)] == "uz" or mioFld1[myNome]["объекты"][tostring(i)] == "zs" or mioFld1[myNome]["объекты"][tostring(i)] == "zx" or mioFld1[myNome]["объекты"][tostring(i)] == "skc" or mioFld1[myNome]["объекты"][tostring(i)] == "sx" or mioFld1[myNome]["объекты"][tostring(i)] == "bc") and pet[1] == "gom" then
-- 										local x = math.random(1,10000)
-- 										local xx
-- 										local xxx = math.random(1,2)
-- 										if xxx == 2 then
-- 											if x == 1 then
-- 												if testQ["gom"] == nil then
-- 													xx = math.random(1,4)
-- 													if xx == 1 then
-- 														testQ["brevna"] = tonumber(testQ["brevna"])-5
-- 														testQ["nikQB"] = antc(testQ["brevna"])
-- 													end
-- 													if xx == 2 then
-- 														testQ["stog"] = tonumber(testQ["stog"])-5
-- 														testQ["nikQF"] = antc(tonumber(testQ["stog"]))
-- 													end
-- 													if xx == 3 then
-- 														testQ["kamen"] = tonumber(testQ["kamen"])-5
-- 														testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
-- 													end
-- 													if xx == 4 then
-- 														testQ["beton"] = tonumber(testQ["beton"])-5
-- 														testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
-- 													end
-- 												end
-- 											elseif x >= 2 and x < 101 then
-- 												if testQ["gom"] == nil then
-- 													xx = math.random(1,4)
-- 													if xx == 1 then
-- 														testQ["brevna"] = -2
-- 														testQ["nikQB"] = antc(testQ["brevna"])
-- 													end
-- 													if xx == 2 then
-- 														testQ["stog"] = -2
-- 														testQ["nikQF"] = antc(tonumber(testQ["stog"]))
-- 													end
-- 													if xx == 3 then
-- 														testQ["kamen"] = -2
-- 														testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
-- 													end
-- 													if xx == 4 then
-- 														testQ["beton"] = -2
-- 														testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
-- 													end
-- 												end
-- 											elseif x >= 101 and x < 1000 then
-- 												if testQ["gom"] == nil then
-- 													xx = math.random(1,4)
-- 													if xx == 1 then
-- 														testQ["brevna"] = tonumber(testQ["brevna"])-1
-- 														testQ["nikQB"] = antc(testQ["brevna"])
-- 													end
-- 													if xx == 2 then
-- 														testQ["stog"] = tonumber(testQ["stog"])-1
-- 														testQ["nikQF"] = antc(tonumber(testQ["stog"]))
-- 													end
-- 													if xx == 3 then
-- 														testQ["kamen"] = tonumber(testQ["kamen"])-1
-- 														testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
-- 													end
-- 													if xx == 4 then
-- 														testQ["beton"] = tonumber(testQ["beton"])-1
-- 														testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
-- 													end
-- 												end
-- 											elseif x >= 1000 and x < 9500 then
-- 												resObj(i,myNome,myNome)
-- 												PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 											elseif x >= 9500 and x < 9990 then
-- 												resObj(i,myNome,myNome)
-- 												PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 												xx = math.random(1,4)
-- 												if xx == 1 then
-- 													testQ["brevna"] = tonumber(testQ["brevna"])+1
-- 													testQ["nikQB"] = antc(testQ["brevna"])
-- 												end
-- 												if xx == 2 then
-- 													testQ["stog"] = tonumber(testQ["stog"])+1
-- 													testQ["nikQF"] = antc(tonumber(testQ["stog"]))
-- 												end
-- 												if xx == 3 then
-- 													testQ["kamen"] = tonumber(testQ["kamen"])+1
-- 													testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
-- 												end
-- 												if xx == 4 then
-- 													testQ["beton"] = tonumber(testQ["beton"])+1
-- 													testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
-- 												end
-- 											elseif x >= 9991 and x <= 10000 then
-- 												resObj(i,myNome,myNome)
-- 												PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 												xx = math.random(1,4)
-- 												if xx == 1 then
-- 													testQ["brevna"] = tonumber(testQ["brevna"])+10
-- 													testQ["nikQB"] = antc(testQ["brevna"])
-- 												end
-- 												if xx == 2 then
-- 													testQ["stog"] = tonumber(testQ["stog"])+10
-- 													testQ["nikQF"] = antc(tonumber(testQ["stog"]))
-- 												end
-- 												if xx == 3 then
-- 													testQ["kamen"] = tonumber(testQ["kamen"])+10
-- 													testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
-- 												end
-- 												if xx == 4 then
-- 													testQ["beton"] = tonumber(testQ["beton"])+10
-- 													testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
-- 												end
-- 											end
-- 										end
-- 									end
-- 									if (mioFld1[myNome]["объекты"][tostring(i)] == "mx" or mioFld1[myNome]["объекты"][tostring(i)] == "hs" or mioFld1[myNome]["объекты"][tostring(i)] == "ms" or mioFld1[myNome]["объекты"][tostring(i)] == "uz" or mioFld1[myNome]["объекты"][tostring(i)] == "zs" or mioFld1[myNome]["объекты"][tostring(i)] == "zx" or mioFld1[myNome]["объекты"][tostring(i)] == "skc" or mioFld1[myNome]["объекты"][tostring(i)] == "sx" or mioFld1[myNome]["объекты"][tostring(i)] == "bc") and pet[1] == "gob" then
-- 										local x = math.random(1,10000)
-- 										if x == 1 then
-- 											if testQ["gob"] == nil then
-- 												mioFld1[myNome]["объекты"][tostring(i)] = "z"
-- 												PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\gobXm.ogg")
-- 											end
-- 										elseif x >= 2 and x < 101 then
-- 											if testQ["gob"] == nil then
-- 												mioFld1[myNome]["целостность"][tostring(i)] = x
-- 												PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
-- 											end
-- 										elseif x >= 101 and x < 1000 then
-- 											mioFld1[myNome]["целостность"][tostring(i)] = tonumber(string.format("%d", tonumber(mioFld1[myNome]["целостность"][tostring(i)]) - (x/10)))
-- 											PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
-- 										elseif x >= 1000 and x < 5000 then
-- 											resObj(i,myNome,myNome)
-- 											PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 										elseif x >= 5000 and x < 9500 then
-- 											resObj(i,myNome,myNome)
-- 											resObj(i,myNome,myNome)
-- 											resObj(i,myNome,myNome)
-- 											resObj(i,myNome,myNome)
-- 											resObj(i,myNome,myNome)
-- 											PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 										elseif x >= 9500 and x < 9990 then
-- 											mioFld1[myNome]["целостность"][tostring(i)] = tonumber(string.format("%d", tonumber(mioFld1[myNome]["целостность"][tostring(i)]) + (x/10)))
-- 											resObj(i,myNome,myNome)
-- 											PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 										elseif x >= 9991 and x <= 10000 then
-- 											mioFld1[myNome]["целостность"][tostring(i)] = tonumber(mioFld1[myNome]["целостность"][tostring(i)])+tonumber(mioFld1[myNome]["целостность"][tostring(i)])
-- 											resObj(i,myNome,myNome)
-- 											PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ms.ogg")
-- 										end
-- 									end
-- 								end
-- 							end
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
	end
end)
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 6 then
		timeElapsed = 0
		local myNome = GetUnitName("player")
		if myNome ~= "Кербес" then
			if testQ['eventAllcash'] ~= nil then
				if testQ['acX'] ~= nil then
					local x = math.random(1,2)
					if x == 1 then
						if testQ['acX'] ~= nil then
							allcash(testQ['acX'],testQ['acY'],0)
						end
					else
						if testQ['acX'] ~= nil then
							allcash(testQ['acX'],testQ['acY'],1)
						end
					end
				end
				if UnitName("target") == "Кербес" then
					testQ['eventAllcash'] = nil
					MoveViewRightStart(0)
					MoveViewLeftStart(0)
					testQ['acX'] = nil
					testQ['acY'] = nil
					PlaySoundFile("Interface\\AddOns\\NSQC\\lvlUp.ogg")
					SendChatMessage("ОН ТУТ!!!1111 падла....", "OFFICER", nil, 1)
				end
			end
		end
		if testQ["gtg"] ~= nil and gTest == nil then
			SetWhoToUI(0)
			FriendsFrame:UnregisterEvent("WHO_LIST_UPDATE")
			SendWho(tonumber(testQ["gtg"]))
			gtest()
			testQ["gtgi"] = 1
		end
		if gTest ~= nil then
			if tonumber(testQ["gtgi"]) <= tablelength(gTest) then
				if testQ['nikinabor'] == nil then
					testQ['nikinabor'] = ""
				end
				if gTest[tonumber(testQ["gtgi"])] ~= nil then
					if string.find(testQ['nikinabor'],gTest[tonumber(testQ["gtgi"])]) == nil then
						GuildInvite(gTest[tonumber(testQ["gtgi"])])

						--print("Приглашается игрок номер: " .. testQ["gtgi"] .. " " .. gTest[tonumber(testQ["gtgi"])])
						ChatFrame3:AddMessage("Приглашается " .. gTest[tonumber(testQ["gtgi"])], 1.0, 1.0, 1.0, 53, 5)
						if testQ['chStest'] == nil then
							testQ['chStest'] = {}
						end
						testQ['chStest'][gTest[tonumber(testQ["gtgi"])]] = GetTime()
						 testQ['nikinabor'] =  testQ['nikinabor'] .. gTest[tonumber(testQ["gtgi"])]
					end
					testQ["gtgi"] = tonumber(testQ["gtgi"]) + 1

				else
					testQ["gtgi"] = tonumber(testQ["gtgi"]) + 1
				end
			else
				gTest = nil
				testQ["gtgi"] = nil
				if testQ["gtg"] ~= nil then
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
	end
end)

local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 1 then
		timeElapsed = 0
		if testQ[myNome]['квест_на_эмоции_взят'] ~= nil then
			if UnitName('target') == UnitName('mouseover') then
				local rc
				if rc == nil then
					rc = LibStub("LibRangeCheck-2.0")
				end
				local xxx,yyy=rc:GetRange("target")
				if yyy ~= nil then
					if tonumber(yyy) <= 8 then
						testQ[myNome]['проверка_расстояния_эмоции'] = 1
					else
						testQ[myNome]['проверка_расстояния_эмоции'] = 2
					end
				end
			end
		end
		if WhoFrame:IsVisible() then
			if btn[982] == nil then
				btn:configure(982,0,-32,32,32,"",">")
				btn:configure(981,0,-64,32,32,"","+")
			else
				btn[982]:Show()
				btn[981]:Show()
			end
			btn[982]:SetScript("OnEnter",function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine("|cFF6495EDПринимать в гильдию игроков выше выбранного уровня. Второй клик - остановить.")
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cff99ff99Уровень игроков указывается в строке поиска ниже")
				GameTooltip:AddLine("|cff99ff99Если уровень не выбран, приглашаются игроки 1-79 уровня")
				if testQ["gtg"] == nil then
					GameTooltip:AddLine("|cff99ff99Сейчас не принимаются игроки")
				else
					GameTooltip:AddLine("|cff99ff99Принимаются игроки " .. testQ["gtg"] .. " уровня")
				end
				GameTooltip:Show()
			end)
			btn[982]:SetScript("OnLeave", function(self)
				GameTooltip:Hide();
			end)
			btn[981]:SetScript("OnEnter",function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				if WhoFrame["selectedName"] ~= nil then
					GameTooltip:AddLine("|cFF6495EDПринять в гильдию игрока " .. WhoFrame["selectedName"])
				else
					GameTooltip:AddLine("|cFF6495EDНужно выбрать игрока в списке слева")
				end
				GameTooltip:Show()
			end)
			btn[981]:SetScript("OnLeave", function(self)
				GameTooltip:Hide();
			end)
			btn[982]:SetScript("OnClick",function(self, button)
				if testQ ~= nil then
					if WhoFrameEditBox:GetText() ~= "" then
						if testQ["gtg"] == nil then
							testQ["gtg"] = tonumber(WhoFrameEditBox:GetText())
							print("Начинают приглашаться игроки от " .. WhoFrameEditBox:GetText() .. " уровня и выше")
							btn[982]:SetText("||")
						else
							testQ["gtg"] = nil
							btn[982]:SetText(">")
						end
					else
						if testQ["gtg"] == nil then
							testQ["gtg"] = 1
							print("Начинают приглашаться игроки от 1 уровня и выше")
							btn[982]:SetText("||")
						else
							testQ["gtg"] = nil
							btn[982]:SetText(">")
						end
					end
				end
			end)
			btn[981]:SetScript("OnClick",function(self, button)
				if WhoFrame["selectedName"] ~= nil then
					GuildInvite(WhoFrame["selectedName"])
					print("приглашается игрок " .. WhoFrame["selectedName"])
				end
			end)
		else
			if btn[982] ~= nil then
				btn[982]:Hide()
				btn[981]:Hide()
			end
		end
		if testQ['nsq5_end'] == nil then
			if testQ['nsq5_1'] ~= nil then
				if UnitName("target") == testQ['nsq5_1'] then
					SendChatMessage("Я лениво наблюдаю через снайперский прицел за персонажем " .. testQ['nsq5_1'], "OFFICER", nil, 1)
					testQ['nsq5_end'] = 1
				end
			end
			if testQ['nsq5_2'] ~= nil then
				if UnitName("target") == testQ['nsq5_2'] then
					SendChatMessage("Я лениво наблюдаю через снайперский прицел за персонажем " .. testQ['nsq5_2'], "OFFICER", nil, 1)
					testQ['nsq5_end'] = 1
				end
			end
			if testQ['nsq5_3'] ~= nil then
				if UnitName("target") == testQ['nsq5_3'] then
					SendChatMessage("Я лениво наблюдаю через снайперский прицел за персонажем " .. testQ['nsq5_3'], "OFFICER", nil, 1)
					testQ['nsq5_end'] = 1
				end
			end
		end
		if testQ[myNome]["настройки"]["debuff"] == "Enable" then
			if testQ['save5time'] ~= nil then
				if sBtn[19]:IsVisible() then
					sBtn[19]:Hide()
				end
				if (testQ['save5time']+testQ['save5timeF'])-GetTime() < 1 then
					testQ['save5time'] = nil
					sBtn[19]:Show()
				end
			end
			if testQ['save1time'] ~= nil then
				if sBtn[15]:IsVisible() then
					sBtn[15]:Hide()
				end
				if (testQ['save1time']+testQ['save1timeF'])-GetTime() < 1 then
					testQ['save1time'] = nil
					sBtn[15]:Show()
				end
			end
			if testQ['save2time'] ~= nil then
				if sBtn[16]:IsVisible() then
					sBtn[16]:Hide()
				end
				if (testQ['save2time']+testQ['save2timeF'])-GetTime() < 1 then
					testQ['save2time'] = nil
					sBtn[16]:Show()
				end
			end
			if testQ['save3time'] ~= nil then
				if sBtn[17]:IsVisible() then
					sBtn[17]:Hide()
				end
				if (testQ['save3time']+testQ['save3timeF'])-GetTime() < 1 then
					testQ['save3time'] = nil
					sBtn[17]:Show()
				end
			end
			if testQ['save4time'] ~= nil then
				if sBtn[18]:IsVisible() then
					sBtn[18]:Hide()
				end
				if (testQ['save4time']+testQ['save4timeF'])-GetTime() < 1 then
					testQ['save4time'] = nil
					sBtn[18]:Show()
				end
			end
			if testQ['save6time'] ~= nil then
				if sBtn[20]:IsVisible() then
					sBtn[20]:Hide()
				end
				if (testQ['save6time']+testQ['save6timeF'])-GetTime() < 1 then
					testQ['save6time'] = nil
					sBtn[20]:Show()
				end
			end
		end
		if not myCheckButton1:IsVisible() then
			if testQ["miniMapConf1"] ~= nil then
				minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(testQ["miniMapConf1"])), (80 * sin(testQ["miniMapConf1"])) - 52)
			end
		end
		if resursy[1]:IsVisible() then
			if testQ['сигнал'] == nil then
				SendAddonMessage("ns_сигнал", "1", "guild")
				testQ['сигнал'] = 1
			end
		end
		if not resursy[1]:IsVisible() then
			if testQ['сигнал'] ~= nil then
				SendAddonMessage("ns_сигнал", "0", "guild")
				testQ['сигнал'] = nil
			end
		end
		if testQ[myNome]["treeXT"] ~= nil then
			testQ[myNome]["treeXT"] = tonumber(testQ[myNome]["treeXT"]) - 1
			if testQ[myNome]["treeXT"] <= 0 then
				testQ[myNome]["treeXT"] = nil
			end
		end
		if testQ["update"] ~= nil then
			testQ["update"] = tonumber(testQ["update"]) - 1
			if testQ["update"] <= 0 then
				testQ["update"] = nil
			end
		end
		if testQ["betonX"] ~= nil then
			testQ["betonX"] = tonumber(testQ["betonX"]) - 1
			if testQ["betonX"] <= 0 then
				testQ["beton"] = tonumber(testQ["beton"]) - 5
				testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
				testQ["kamen"] = tonumber(testQ["kamen"]) + 1
				testQ["nikQK"] = antc(testQ["kamen"])
				SendChatMessage("Бетон без дела начал засыхать. Пять кубов уже превратились в камень...", "OFFICER", nil, 1)
				if tonumber(testQ["beton"]) >= 1 then
					testQ["betonX"] = 13200
				else
					testQ["betonX"] = nil
				end
			end
		end
		if UnitName("target") == "Каменный страж Мукар" or UnitName("target") == "Магистр Весара" or UnitName("target") == "Магистр Сариен" or UnitName("target") == "Магистр Бразайл" then
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
		if UnitName("target") == "Усури Златоблям" or UnitName("target") == "Usuri Brightcoin" then
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
			testQ['tankoseivy'] = nil
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
		local ebnulsa = nil
-- 		for i = 1,100 do
-- 			if mioFld ~= nil then
-- 				if mioFld1[myNome] ~= nil then
-- 					if mioFld1[myNome]["объекты"] ~= nil then
-- 						if mioFld1[myNome]["объекты"][tostring(i)] == "t" then
-- 							ebnulsa = 1
-- 						end
-- 					else
-- 						ebnulsa = 1
-- 					end
-- 				else
-- 					ebnulsa = 1
-- 				end
-- 			else
-- 				ebnulsa = 1
-- 			end
-- 			if mioFld ~= nil then
-- 				if mioFld1[myNome] ~= nil then
-- 					if mioFld1[myNome]["объекты"] ~= nil then
-- 						if mioFld1[myNome]["объекты"][tostring(i)] == "bn" and tonumber(mioFld1[myNome]["целостность"][tostring(i)]) < 999 then
-- 							mioFld1[myNome]["целостность"][tostring(i)] = tonumber(mioFld1[myNome]["целостность"][tostring(i)])+1
-- 							if fBtn[i]:IsVisible() and nome == myNome then
-- 								dmgText(mioFld1[myNome]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
-- 							end
-- 						end
-- 						if mioFld1[myNome]["объекты"][tostring(i)] == "ba" and tonumber(mioFld1[myNome]["целостность"][tostring(i)]) < 999 then
-- 							mioFld1[myNome]["целостность"][tostring(i)] = tonumber(mioFld1[myNome]["целостность"][tostring(i)])+1
-- 							if fBtn[i]:IsVisible() and nome == myNome then
-- 								dmgText(mioFld1[myNome]["целостность"][tostring(i)],fBtn[i],i,13,"FF8C00")
-- 							end
-- 						end
-- 					end
-- 					if mioFld1[myNome]["объекты"][tostring(i)] == "zp" and mioFld1[myNome]["петы"][tostring(i)] ~= nil then
-- 						testQ["zavodp"] = 1
-- 					end
-- 					if mioFld1[myNome]["объекты"][tostring(i)] == "zp" and mioFld1[myNome]["петы"][tostring(i)] == nil and testQ["zavodp"] == nil then
-- 						testQ["zavodp"] = nil
-- 					end
-- 				end
-- 			end
--		end
		if testQ["zavod"] == 1 then
			if testQ["beton1"] == nil then
				testQ["beton1"] = 0
			end
			print(testQ["beton1"],'321')
			testQ["beton1"] = tonumber(testQ["beton1"])+0.01
			dmgText(tonumber(testQ['mioR'][4])+testQ["beton1"],resursy[4],104,13,"FF8C00")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bt.ogg")
		end
-- 		if testQ["zavodp"] == 1 and testQ["zavodp"] == 1 then
-- 			if testQ["kirpich"] == nil then
-- 				testQ["kirpich"] = 0.01
-- 				testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
-- 			else
-- 				local x = math.random(1,100)
-- 				if x == 100 then
-- 					testQ["brevna"] = tonumber(testQ["brevna"]) - 1
-- 					testQ["nikQB"] = antc(testQ["brevna"])
-- 					print("Кирпичный цех расходует 1 бревно")
-- 				end
-- 				if x == 1 then
-- 					testQ["stog"] = tonumber(testQ["stog"]) - 1
-- 					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
-- 					print("Кирпичный цех расходует 1 стог травы")
-- 				end
-- 				dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
-- 				testQ["kirpich"] = tonumber(testQ["kirpich"]) + 0.01
-- 				testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
-- 				testQ["beton"] = tonumber(testQ["beton"]) - 0.01
-- 				testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
-- 				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bt.ogg")
-- 				dmgText(string.format("%d", tonumber(testQ["kirpich"])),resursy[6],106,13,"FF8C00")
-- 			end
-- 		end
-- 		if testQ[myNome]["dTimer"] == nil then
-- 			testQ[myNome]["dTimer"] = {}
-- 		end
-- 		if testQ[myNome]["dTimer"][tonumber(date("%d"))] == nil then
-- 			testQ[myNome]["dTimer"][tonumber(date("%d"))] = 1
-- 		else
-- 			testQ[myNome]["dTimer"][tonumber(date("%d"))] = testQ[myNome]["dTimer"][tonumber(date("%d"))] + 1
-- 		end
-- 		if testQ[myNome]["hTimer"] ~= nil then
-- 			local nome
-- 			if testQ['sign'] ~= "1" then
-- 				nome = GuildFrame["selectedName"]
-- 			else
-- 				nome = myNome
-- 			end
-- 			if fBtn[1] ~= nil and fBtn[1]:IsVisible() then
-- 				for i = 1, 100 do
-- 					if mioFld1 ~= nil then
-- 						if mioFld1[nome]["объекты"][tostring(i)] ~= nil and mioFld1[nome]["объекты"][tostring(i)] == "h" then
-- 							dmgText(testQ[myNome]["hTimer"],fBtn[i],i,13,"ff0000")
-- 							dmG[i]:Show()
-- 						end
-- 					end
-- 				end
-- 			end
-- 			testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 1
-- 			if tonumber(testQ[myNome]["hTimer"]) <=1 then
-- 				testQ[myNome]["hTimer"] = nil
-- 				if fBtn[1] ~= nil and fBtn[1]:IsVisible() then
-- 					for i = 1, 100 do
-- 						if mioFld1 ~= nil then
-- 							if mioFld1[nome]["объекты"][tostring(i)] == "h" then
-- 								dmgText("",fBtn[i],i,13,"ff0000")
-- 							end
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
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
		if timeElapsed > 0.01 then
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
	if fBtn[1]:IsVisible() or dBtn[1]:IsVisible() then
		timeElapsed = timeElapsed + elapsed
		if timeElapsed > 0.2 then
			timeElapsed = 0
			if testQ["kd"] ~= nil then
				testQ["kd"] = tonumber(testQ["kd"])-0.1
				if tonumber(testQ["kd"]) <= 0 then
					testQ["kd"] = nil
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
		if SendMailFrame:IsVisible() and not OpenMailFrame:IsVisible() then
			if btn[974] == nil or not btn[974]:IsVisible() then
				btn:configure(974,-30,105,128,64,"","Купить самогон")
				btn[974]:Show()
			else
				--btn[974]:Hide()
			end
		else
			if btn[974] ~= nil then
				btn[974]:Hide()
			end
			ahtunGSH("hide")
			proverkaPervogoNazhatiyaPochty = nil
		end
		if testQ[myNome]['q_stelth'] ~= nil then
			if testQ[myNome]['q_stelth']['start'] == 0 then
				SendChatMessage("Мне нужно проследить за персонажем: " .. testQ[myNome]['q_stelth']['mobs'], "OFFICER", nil, 1)
				testQ[myNome]['q_stelth']['start'] =  1
			end
		end
		if testQ[myNome]['q_stelth'] ~= nil then
			if testQ[myNome]['q_stelth']['start'] == 1 or testQ[myNome]['q_stelth']['start'] == 2 then
				if UnitName('party1') ~= nil then
					testQ[myNome]['q_stelth']['start'] =  3
						SendChatMessage("Нас слишком много. Такую толпу легко заметят. Квест провален.", "OFFICER", nil, 1)
				end
				if testQ[myNome]['q_stelth']['start'] == 1 then
					if UnitName('target') == testQ[myNome]['q_stelth']['mobs'] then
						testQ[myNome]['q_stelth']['start'] =  4
						SendChatMessage("Информация получена", "OFFICER", nil, 1)
					end
				end
				if testQ[myNome]['q_stelth']['start'] == 2 then
					if UnitName('target') == testQ[myNome]['q_stelth']['mobs'] then
						testQ[myNome]['q_stelth']['start'] =  5
						SendChatMessage("Информация получена... Криво, но наверное сойдет.", "OFFICER", nil, 1)
					end
				end
				if GetZoneText() == testQ[myNome]['q_stelth']['mm'] then
					for i=1, 32 do
						local name,__,__,__,__,__,__,__ = UnitBuff("player",i)
						if name == "Невидимость" or name == "Незаметность" or name == "Притвориться мертвым" then
							testQ[myNome]['q_stelth']['start'] =  3
							SendChatMessage("Меня обнаружили из за использования запретной магии, это окончательный провал. А чем тут делают харакирю?", "OFFICER", nil, 1)
						end
					end
				end
			end
		end
		if ach_ach == nil then
			ach_ach = {}
		end
		if GuildMemberDetailFrame:IsVisible() then
			btn[989]:ClearAllPoints()
			btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
		end

-- 		if testQ[myNome]["петы"]["bb"] ~= nil then
-- 			if ach_ach[18] == nil then
-- 				SendAddonMessage("#achVSE", 18, "guild")
-- 			end
-- 		end
-- 		if testQ[myNome]["петы"]["gg"] ~= nil then
-- 			if testQ[myNome]["петы"]["gg"] == "gob" then
-- 				if ach_ach[19] == nil then
-- 					SendAddonMessage("#achVSE", 11, "guild")
-- 				end
-- 			end
-- 			if testQ[myNome]["петы"]["gg"] == "gom" then
-- 				if ach_ach[20] == nil then
-- 					SendAddonMessage("#achVSE", 20, "guild")
-- 				end
-- 			end
-- 		end
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

		--if VerF == nil or not VerF:IsVisible() then
			--if testQ["fontVers"] ~= nil then
				--testQ["fontVers"]=nil
			--end
		--end
		--if testQ["vers"] ~= nil then
			--if tostring(versAdd) ~= tostring(testQ["vers"]["2"]) then
				--if VerF == nil or not VerF:IsVisible() then
					--if testQ["fontVers"] == nil then
						--testQ["fontVers"]=5
					--end
					--versFail(testQ["fontVers"])
					--btn[990]:SetPoint("CENTER", VerF, "CENTER", -400, 470)
					--btn[990]:Show()
					--VerF:Show()
				--end
				--if VerF ~= nil and VerF:IsVisible() then
					--if testQ["VerF"] ~= nil and testQ["VerF"] ~= 600 then
						--testQ["VerF"] = testQ["VerF"] - 1
						--VerF:Show()
						--VerF:SetPoint("CENTER", UIParent, "CENTER", testQ["VerF"], -355)
						--VerF:SetFont('Fonts\\FRIZQT__.TTF', testQ["fontVers"])
					--end
				--end
			--else
				--if VerF ~= nil and VerF:IsVisible() then
					--VerF:Hide()
					--btn[990]:Hide()
				--end
			--end
		--end
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
									testQ['ochered_skillov_eventa'] = nil
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


local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 0.1 then

		timeElapsed = 0
		if testQ[myNome]['puteshestvie'] ~= nil then
			btn[980]:Show()
			btn[979]:Show()
			btn[978]:Show()
			btn[978]:SetText(testQ[myNome]['puteshestvie'])
			if iconQ[1] ~= nil and iconQ[1]:IsVisible() and t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['sh'] == "взлом сейфа" then
				if btn[975] == nil then
					btn:configure(975,-64,224,64,64,"","0")
					btn:configure(976,0,224,64,64,"","0")
					btn:configure(977,64,224,64,64,"","0")
					if NS_vzlomSeifa == nil then
						NS_vzlomSeifa = {}
					end
					NS_vzlomSeifa[1] = 0
					NS_vzlomSeifa[2] = 0
					NS_vzlomSeifa[3] = 0
				end
				btn[975]:Show()
				btn[976]:Show()
				btn[977]:Show()
			else
				if btn[975] ~= nil then
					btn[975]:Hide()
					btn[976]:Hide()
					btn[977]:Hide()
				end
			end
		else
			if btn[980] ~= nil then
				btn[980]:Hide()
				btn[979]:Hide()
				btn[978]:Hide()
			end
		end
		if testQ[myNome]['puteshestvie'] ~= nil then
			local x,y = GetPlayerMapPosition("player")
			local kont = tostring(GetCurrentMapContinent())
			local lok = tostring(GetCurrentMapZone())
			cepochkiQuestov(testQ[myNome]['puteshestvieTabella'],testQ[myNome]['puteshestvie'],kont,lok,x,y,myNome)
		end
		if testQ['koza'] ~= nil then
			if GetUnitSpeed('player') == 0 then
				local myNome = GetUnitName("player")
				SendAddonMessage("ns_Kz ", myNome, "guild")
			else
				if testQ['koza'] >= 0 then
					testQ['koza'] = testQ['koza'] - 1
					print(testQ['koza'])
				else
					SendAddonMessage("#hQ1 bi0", myNome, "guild")
					testQ['koza'] = nil
				end
			end
		end
	end
end)

local txtNum = 1
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 1 then
		timeElapsed = 0

		local _, classUnit = UnitClass("player")
		-- if testQ["метка охотника"] then
		-- 	if classUnit == "HUNTER" then
		-- 		for slot = 1, 24, 1 do
		-- 		    local debuffName = UnitDebuff("target", slot);
		-- 		    if debuffName == "Метка охотника" then
		-- 		        for trackingIndex = 1, GetNumTrackingTypes(), 1 do
		-- 		            local name, texture, active, category = GetTrackingInfo(trackingIndex);
		-- 		            if UnitCreatureType("target") ~= nil then
		-- 		                if string.find(name, string.utf8sub(UnitCreatureType("target"), 2, 6)) then
		-- 		                    if texture ~= GetTrackingTexture(trackingIndex) then
		-- 		                        SetTracking(trackingIndex);
		-- 		                    end;
		-- 		                end;
		-- 		            end;
		-- 		        end;
		-- 		    end;
		-- 		end;
		-- 	end
		-- end

		if CalendarViewEventCloseButton ~= nil then
			CalendarViewEventCloseButton:RegisterForClicks("RightButtonDown","LeftButtonDown")
			CalendarViewEventCloseButton:SetScript("OnClick",function(self)
				if arg1 == "RightButton" then
					a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13=CalendarGetEventInfo()
					if string.sub(a13,2,2) == "" then
						a13 = a13.."0"
					end
					SendChatMessage("О: " .. a10 .. " числа " .. " в " .. a12 .. ":" .. a13 .. ": " .. a2, "GUILD", nil, 1)
				end
				if arg1 == "LeftButton" then
					CalendarViewEventFrame:Hide()
				end
			end)
		end
		if CalendarCreateEventCloseButton ~= nil then
			CalendarCreateEventCloseButton:RegisterForClicks("RightButtonDown","LeftButtonDown")
			CalendarCreateEventCloseButton:SetScript("OnClick",function(self)
				if arg1 == "RightButton" then
					a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13=CalendarGetEventInfo()
					if string.sub(a13,2,2) == "" then
						a13 = a13.."0"
					end
					SendChatMessage("О: " .. a10 .. " числа " .. " в " .. a12 .. ":" .. a13 .. ": " .. a2, "GUILD", nil, 1)
				end
				if arg1 == "LeftButton" then
					CalendarCreateEventFrame:Hide()
				end
			end)
		end
		if not btn[983]:IsVisible() then
			testQ['proki_buffs'] = nil
		end
		if testQ['oslep'] ~= nil then
			if testQ['oslep']['time'] >= 1 then
				osleplenie(testQ['oslep']['sila'])
				testQ['oslep']['time'] = testQ['oslep']['time'] - 1
			else
				testQ['oslep'] = nil
				osleplenie(0)
			end
		end
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
			--Minimap:SetScale(0.5)
		end

		if testQ["dom"] == 1 then
			local nome
			if testQ['sign'] ~= "1" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			if mioFld1 ~= nil then
				if nome == testQ["domNome"] then
					for i = 1, 100 do
						fBtn[i]:Hide()
						dBtn[i]:Show()
						dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[testQ["domNome"]][testQ["domZ"]][tostring(i)] ..".tga")
						dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[testQ["domNome"]][testQ["domZ"]][tostring(i)] ..".tga")
					end
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
			if mioFld1 ~= nil then
				if nome == testQ["mfNome"] then
					for i = 1, 100 do
						dBtn[i]:Show()
						dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[testQ["mfNome"]]["mf"][tostring(i)] ..".tga")
						dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[testQ["mfNome"]]["mf"][tostring(i)] ..".tga")
					end
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
			if mioFld1 ~= nil then
				if nome == testQ["b0Nome"] then
					for i = 1, 100 do
						if mioFld ~= nil then
							if mioFld1[testQ["b0Nome"]] ~= nil then
								if mioFld1[testQ["b0Nome"]]["taverna"] ~= nil then

									dBtn[i]:Show()

									dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[testQ["b0Nome"]]["taverna"][tostring(i)] ..".tga")
									dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[testQ["b0Nome"]]["taverna"][tostring(i)] ..".tga")
								end
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
				if mgznZ:IsVisible() then
					dmgText1(dmgT,mgznZ,105,13,"FF8C00")
				end
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

-- 		if resursy[1] ~= nil and resursy[1]:IsVisible() then
-- 			if dmG[101] == nil or not dmG[101]:IsVisible() then
-- 				if testQ['sign'] ~= "1" then
-- 					nome = GuildFrame["selectedName"]
-- 				else
-- 					nome = myNome
-- 				end
-- 				SendAddonMessage("smT",nome, "guild")
-- 			end
-- 			for i = 101, 200 do
-- 				if dmG[i] ~= nil then
-- 					dmG[i]:Show()
-- 				end
-- 			end
-- 		end

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
		if testQ[myNome]["настройки"]["np"] == "Enable" then
			if testQ['np'] ~= 1 then
				testQ['np'] = 1
			end
		end
		if testQ[myNome]["настройки"]["np"] == "Disable" then
			if testQ['np'] ~= nil then
				testQ['np'] = nil
			end
		end
		if testQ[myNome]["настройки"]["trash"] == "Enable" then
			if NSdebuf ~= 1 then
				NSdebuf = 1
			end
		end
		if testQ[myNome]["настройки"]["trash"] == "Disable" then
			if NSdebuf ~= nil then
				NSdebuf = nil
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

-- 		if pokazatChk==0 then
-- 				myCheckButton1:Hide()
-- 				myCheckButton2:Hide()
-- 				myCheckButton3:Hide()
-- 				myCheckButton4:Hide()
-- 				myCheckButton5:Hide()
-- 				myCheckButton6:Hide()
-- 				myCheckButton7:Hide()
-- 				btn[998]:Hide()
-- 				btn[997]:Hide()
-- 		end
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
			testQ['tankoseivy'] = 1
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
		if testQ[myNome]["настройки"]["np"]==nil or testQ[myNome]["настройки"]["np"]=="Disable" then
			myCheckButton8:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["np"]=="Enable" then
			myCheckButton8:SetChecked(true)
		end
		if testQ[myNome]["настройки"]["trash"]==nil or testQ[myNome]["настройки"]["trash"]=="Disable" then
			myCheckButton9:SetChecked(false)
		end
		if testQ[myNome]["настройки"]["trash"]=="Enable" then
			myCheckButton9:SetChecked(true)
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

			myCheckButton1:SetChecked(false)
		elseif testQ[myNome]["настройки"]["esc"]=="Enable" then
			myCheckButton1:SetChecked(true)

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
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:SetScript("OnUpdate", function(self, elapsed)
	local myNome = GetUnitName("player")
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 1 then
		timeElapsed = 0

		if testQ["старт"] ~= nil then
			skillBtn:configure(1,-220,-150,64,64,"","")
			skillBtn:configure(2,-155,-150,64,64,"","")
			skillBtn:configure(3,-90,-150,64,64,"","")
			skillBtn:configure(4,-25,-150,64,64,"","")
		else
			if skillBtn[1] ~= nil then
				for i = 1, 100 do
					if skillBtn[i] ~= nil then
						skillBtn[i]:Hide()
					end
				end
			end
		end
		if testQ[myNome]["dTimer"] == nil then
			testQ[myNome]["dTimer"] = {}
		end
		if testQ[myNome]["dTimer"][tonumber(date("%d"))+1] ~= nil then
			testQ[myNome]["dTimer"][tonumber(date("%d"))+1] = nil
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
					if mioFld1 ~= nil then
						if mioFld1[nome]["объекты"][tostring(i)] ~= nil and mioFld1[nome]["объекты"][tostring(i)] == "h" then
							dmgText(testQ[myNome]["hTimer"],fBtn[i],i,13,"ff0000")
							dmG[i]:Show()
						end
					end
				end
			end

			testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - 1
			if tonumber(testQ[myNome]["hTimer"]) <=1 then
				testQ[myNome]["hTimer"] = nil
				if fBtn[1] ~= nil and fBtn[1]:IsVisible() then
					for i = 1, 100 do
						if mioFld1 ~= nil then
							if mioFld1[nome]["объекты"][tostring(i)] == "h" then
								dmgText("",fBtn[i],i,13,"ff0000")
							end
						end
					end
				end
			end
		end
		if testQ[myNome]["взятый_квест_xy"] ~= nil then
			if testQ[myNome]["взятый_квест_xy"]['timer'] ~= nil then
				local myNome = GetUnitName("player")
				if testQ[myNome]["взятый_квест_xy"] ~= nil then
					if ns_q4xy ~= nil then
						if testQ[myNome]["взятый_квест_xy_end"] ~= 1 then
							ns_q4xy()
						end
					end
				end
			end
		end
	end
end)
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:SetScript("OnUpdate", function(self, elapsed)
	local myNome = GetUnitName("player")
	if testQ then
		if testQ[myNome] then
			if testQ[myNome]["взятый_квест_xy"] ~= nil then

				timeElapsed = timeElapsed + elapsed
				if testQ[myNome]["взятый_квест_xy_end"] ~= 1 then
					if testQ[myNome]["взятый_квест_xy"]['timer'] ~= nil then
						if timeElapsed > tonumber(testQ[myNome]["взятый_квест_xy"]['timer']) then
							timeElapsed = 0
							if GetZoneText() == testQ[myNome]["взятый_квест_xy"]['lok'] then
								PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
							end
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

myCheckButton1 = createCheckbutton(UIParent, -100, 350, "Отключить спам от гильдквестов");
myCheckButton1.tooltip = "Сообщения от гильдквестов будут появляться белым текстов в первой вкладке";
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
myCheckButton3 = createCheckbutton(UIParent, -100, 310, "Включить визуальные эффекты для танкосейвов");
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

myCheckButton8 = createCheckbutton(UIParent, -100, 210, "Альтарнативные полоски хп");
myCheckButton8.tooltip = "ПКМ: переключить привязку - центр экрана/здоровье цели";
myCheckButton8:RegisterForClicks("RightButtonDown", "LeftButtonDown")
myCheckButton8:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if arg1 == "LeftButton" then
			if testQ[myNome]["настройки"]["np"]=="Disable" or testQ[myNome]["настройки"]["np"]==nil then
				testQ[myNome]["настройки"]["np"]="Enable"
				myCheckButton8:SetChecked(true)
			elseif testQ[myNome]["настройки"]["np"]=="Enable" then
				testQ[myNome]["настройки"]["np"]="Disable"
				myCheckButton8:SetChecked(false)
			end
		else
			if testQ['np_inviz'] == nil then
				testQ['np_inviz'] = 1
				print("Включена привязка к центру экрана")
			else
				testQ['np_inviz'] = nil
				print("Включена привязка к фрейму цели")
			end
		end
	end
);
myCheckButton9 = createCheckbutton(UIParent, -100, 190, "Скрыть нахер бафы дебафы");
myCheckButton9:SetScript("OnClick",
	function()
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
		if testQ[myNome]["настройки"]["trash"]=="Disable" or testQ[myNome]["настройки"]["trash"]==nil then
			testQ[myNome]["настройки"]["trash"]="Enable"
			myCheckButton9:SetChecked(true)
		elseif testQ[myNome]["настройки"]["trash"]=="Enable" then
			testQ[myNome]["настройки"]["trash"]="Disable"
			myCheckButton9:SetChecked(false)
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
myCheckButton1:Hide()
myCheckButton2:Hide()
myCheckButton3:Hide()
myCheckButton4:Hide()
myCheckButton5:Hide()
myCheckButton6:Hide()
myCheckButton7:Hide()
myCheckButton8:Hide()
myCheckButton9:Hide()
