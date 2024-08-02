local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
	local classUnit = UnitClass("player")
	testQ['sBtnRX'] = 32 -- Ширина иконок скиллов
	testQ['sBtnRY'] = 32 -- Высота иконок скиллов
	testQ['sBtn1X'] = 128 -- Координата первой иконки скиллов по иксу
	testQ['sBtn1Y'] = 128 -- Координата первой иконки скиллов по игреку
	testQ['sBtn2X'] = 160 -- Координата второй иконки скиллов по иксу
	testQ['sBtn2Y'] = 128 -- Координата второй иконки скиллов по игреку
	testQ['sBtn3X'] = 192 -- Координата третьей иконки скиллов по иксу
	testQ['sBtn3Y'] = 128 -- Координата третьей иконки скиллов по игреку
	testQ['sBtn4X'] = 224 -- Координата четвертой иконки скиллов по иксу
	testQ['sBtn4Y'] = 128 -- Координата четвертой иконки скиллов по игреку
	prok_set1 = {
		["Rx"] = 128,
		["Ry"] = 256,
		["x"] = -200,
		["y"] = 0,
	}
	prok_set2 = {
		["Rx"] = 128,
		["Ry"] = 256,
		["x"] = 200,
		["y"] = 0,
	}
	prok_set3 = {
		["Rx"] = 256,
		["Ry"] = 128,
		["x"] = 0,
		["y"] = 200,
	}
	prok_set4 = {
		["Rx"] = 0,
		["Ry"] = 0,
		["x"] = 0,
		["y"] = 0,
	}
if classUnit == "Паладин" then
	tblIcons = {
		["Щит небес"] = {
			["icon"] = "Interface\\Icons\\Spell_Holy_BlessingOfProtection",
			["name"] = "Щит небес",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Священный щит"] = {
			["icon"] = "Interface\\Icons\\Ability_Paladin_BlessedMending",
			["name"] = "Священный щит",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Праведное неистовство"] = {
			["icon"] = "Interface\\Icons\\Spell_Holy_SealOfFury",
			["name"] = "Праведное неистовство",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["prok"] = "Interface\\AddOns\\NSQC\\gob.ogg"
		},
		["Великое благословение неприкосновенности"] = {
			["icon"] = "Interface\\Icons\\Spell_Nature_LightningShield",
			["name"] = "Великое благословение неприкосновенности",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Печать повиновения"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_InnerRage",
			["name"] = "Печать повиновения",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Правосудие света"] = {
				["icon"] = "Interface\\Icons\\Spell_Holy_RighteousFury",
				["name"] = "Правосудие света",
				["pos"] = 0,
				["buf"] = nil,
				["debuf"] = nil,
				["prok"] = nil,
				["srav"] = "b",
				["seiv"] = nil,
		},
		["Молот праведника"] = {
				["icon"] = "Interface\\Icons\\Ability_Paladin_HammeroftheRighteous",
				["name"] = "Молот праведника",
				["pos"] = 0,
				["buf"] = nil,
				["debuf"] = nil,
				["prok"] = nil,
				["srav"] = "b",
				["seiv"] = nil,
		},
		["Щит мстителя"] = {
				["icon"] = "Interface\\Icons\\Spell_Holy_AvengersShield",
				["name"] = "Щит мстителя",
				["pos"] = 0,
				["buf"] = nil,
				["debuf"] = nil,
				["prok"] = nil,
				["srav"] = "b",
				["seiv"] = nil,
		},
		["Щит праведности"] = {
				["icon"] = "Interface\\Icons\\Ability_Paladin_ShieldofVengeance",
				["name"] = "Щит праведности",
				["pos"] = 0,
				["buf"] = nil,
				["debuf"] = nil,
				["prok"] = nil,
				["srav"] = "b",
				["seiv"] = nil,
		},
		["Освящение"] = {
				["icon"] = "Interface\\Icons\\Spell_Holy_InnerFire",
				["name"] = "Освящение",
				["pos"] = 1,
				["buf"] = nil,
				["debuf"] = nil,
				["prok"] = nil,
				["srav"] = "b",
				["seiv"] = nil,
		},
	}

end
if classUnit == "Воин" then
	tblIcons = {
		["Удар грома"] = {
			["icon"] = "Interface\\Icons\\Spell_Nature_ThunderClap",
			["name"] = "Удар грома",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Кровавая ярость"] = {
			["icon"] = "Interface\\Icons\\Ability_Racial_BloodRage",
			["name"] = "Кровавая ярость",
			["pos"] = 0,
			["buf"] = 1,
			["prok"] = nil,
			["srav"] = "m",
			["seiv"] = nil,
		},
		["Реванш"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_Revenge",
			["name"] = "Реванш",
			["pos"] = 0,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = 1,
			["srav"] = "b",
			["seiv"] = nil,
			["prok"] = "Interface\\AddOns\\NSQC\\punto.ogg"
		},
		["Раскол брони"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_Sunder",
			["name"] = "Раскол брони",
			["pos"] = 0,
			["buf"] = nil,
			["debuf"] = 1,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Деморализующий крик"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_WarCry",
			["name"] = "Деморализующий крик",
			["pos"] = 1,
			["buf"] = 0,
			["debuf"] = 1,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Боевой крик"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_BattleShout",
			["name"] = "Боевой крик",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Блок щитом"] = {
			["icon"] = "Interface\\Icons\\Ability_Defend",
			["name"] = "Блок щитом",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = "Interface\\AddOns\\NSQC\\gob.ogg",
		},
		["Победный раш"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_Devastate",
			["name"] = "Победный раш",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = 1,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Рассекающий удар"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_Cleave",
			["name"] = "Рассекающий удар",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Возмездие"] = {
			["icon"] = "Interface\\Icons\\Ability_Warrior_Challange",
			["name"] = "Возмездие",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = "Interface\\AddOns\\NSQC\\gob.ogg",
		},
		["Мощный удар щитом"] = {
			["icon"] = "Interface\\Icons\\INV_Shield_05",
			["name"] = "Мощный удар щитом",
			["pos"] = 0,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
	}
end
if classUnit == "Друид" then
	tblIcons = {
		["Дикий рев"] = {
			["icon"] = "Interface\\Icons\\Ability_Druid_SkinTeeth",
			["name"] = "Дикий рев",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Размах (медведь)"] = {
			["icon"] = "Interface\\Icons\\INV_Misc_MonsterClaw_03",
			["name"] = "Размах (медведь)",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Исступление"] = {
			["icon"] = "Interface\\Icons\\Ability_Druid_Enrage",
			["name"] = "Исступление",
			["pos"] = 0,
			["buf"] = 1,
			["prok"] = nil,
			["srav"] = "m",
			["seiv"] = nil,
		},
		["Растерзать"] = {
			["icon"] = "Interface\\Icons\\Ability_Druid_Lacerate",
			["name"] = "Растерзать",
			["pos"] = 0,
			["buf"] = nil,
			["debuf"] = 1,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Устрашающий рев"] = {
			["icon"] = "Interface\\Icons\\Ability_Druid_DemoralizingRoar",
			["name"] = "Устрашающий рев",
			["pos"] = 1,
			["buf"] = 0,
			["debuf"] = 1,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Волшебный огонь (зверь)"] = {
			["icon"] = "Interface\\Icons\\Spell_Nature_FaerieFire",
			["name"] = "Волшебный огонь (зверь)",
			["pos"] = 1,
			["buf"] = 0,
			["debuf"] = 1,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Шипы"] = {
			["icon"] = "Interface\\Icons\\Spell_Nature_Thorns",
			["name"] = "Шипы",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Дубовая кожа"] = {
			["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
			["name"] = "Дубовая кожа",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = "Interface\\AddOns\\NSQC\\gob.ogg",
		},
		["Увечье (медведь)"] = {
			["icon"] = "Interface\\Icons\\Ability_Druid_Mangle2",
			["name"] = "Увечье (медведь)",
			["pos"] = 0,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
	}
end
if classUnit == "Разбойник" or classUnit == "Разбойница" then
	tblIcons = {
		["Мясорубка"] = {
			["icon"] = "Interface\\Icons\\Ability_Rogue_SliceDice",
			["name"] = "Мясорубка",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Маленькие хитрости"] = {
			["icon"] = "Interface\\Icons\\Ability_Rogue_TricksOftheTrade",
			["name"] = "Маленькие хитрости",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
		["Ускользание"] = {
			["icon"] = "Interface\\Icons\\Spell_Shadow_ShadowWard",
			["name"] = "Ускользание",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = "Interface\\AddOns\\NSQC\\gob.ogg",
		},
	}
end
if classUnit == "Рыцарь смерти" then
	tblIcons = {
		["Смерть и разложение"] = {
			["icon"] = "Interface\\Icons\\Spell_Shadow_DeathAndDecay",
			["name"] = "Смерть и разложение",
			["pos"] = 0,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = 1,
			["runyl"] = 1,
			["runyn"] = 1,
		},
		["Озноб"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_IceTouch",
			["name"] = "Озноб",
			["pos"] = 0,
			["buf"] = 0,
			["debuf"] = 1,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = nil,
			["runyl"] = 1,
			["runyn"] = nil,
		},
		["Мор"] = {
			["icon"] = "Interface\\Icons\\Spell_Shadow_PlagueCloud",
			["name"] = "Мор",
			["pos"] = 0,
		},
		["Кровавая чума"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_EmpowerRuneBlade",
			["name"] = "Кровавая чума",
			["pos"] = 0,
			["buf"] = 0,
			["debuf"] = 1,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = nil,
			["runyl"] = nil,
			["runyn"] = 1,
		},
		["Удар смерти"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_Butcher2",
			["name"] = "Удар смерти",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = nil,
			["runyl"] = 1,
			["runyn"] = 1,
		},
		["Кровавый удар"] = {
			["icon"] = "Interface\\Icons\\Spell_Deathknight_DeathStrike",
			["name"] = "Кровавый удар",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = 1,
			["runyl"] = nil,
			["runyn"] = nil,
		},
		["Вскипание крови"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_BloodBoil",
			["name"] = "Вскипание крови",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = 1,
			["runyl"] = nil,
			["runyn"] = nil,
		},
		["Удар плети"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_ScourgeStrike",
			["name"] = "Удар плети",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = nil,
			["runyl"] = 1,
			["runyn"] = 1,
		},
		["Взрыв трупа"] = {
			["icon"] = "Interface\\Icons\\Ability_Creature_Disease_02",
			["name"] = "Взрыв трупа",
			["pos"] = 1,
			["buf"] = nil,
			["debuf"] = nil,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = nil,
			["runyl"] = nil,
			["runyn"] = nil,
		},
		["Незыблемость льда"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_IceBoundFortitude",
			["name"] = "Незыблемость льда",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = "Interface\\AddOns\\NSQC\\gob.ogg",
			["runyk"] = nil,
			["runyl"] = nil,
			["runyn"] = nil,
		},
		["Зимний горн"] = {
			["icon"] = "Interface\\Icons\\INV_Misc_Horn_02",
			["name"] = "Зимний горн",
			["pos"] = 0,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
			["runyk"] = nil,
			["runyl"] = nil,
			["runyn"] = nil,
		},
		["Захват рун"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_RuneTap",
			["name"] = "Захват рун",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = nil,
		},
		["Незыблемость льда"] = {
			["icon"] = "Interface\\Icons\\Spell_DeathKnight_IceBoundFortitude",
			["name"] = "Незыблемость льда",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = nil,
		},
		["Костяной щит"] = {
			["icon"] = "Interface\\Icons\\INV_Chest_Leather_13",
			["name"] = "Костяной щит",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = nil,
		},
		["Кровавая метка"] = {
			["icon"] = "Interface\\Icons\\Ability_Hunter_RapidKilling",
			["name"] = "Кровавая метка",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = nil,
		},
		["Кровавая метка"] = {
			["icon"] = "Interface\\Icons\\Ability_Hunter_RapidKilling",
			["name"] = "Кровавая метка",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = nil,
			["seiv"] = 1,
			["prok"] = nil,
		},
	}
end
if classUnit == "Жрец" or classUnit == "Жрица" then
	tblIcons = {
		["Внутренний огонь"] = {
			["icon"] = "Interface\\Icons\\Spell_Holy_InnerFire",
			["name"] = "Внутренний огонь",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
	}
end
if classUnit == "Шаман" or classUnit == "Шаманка" then
	tblIcons = {
		["Водный щит"] = {
			["icon"] = "Interface\\Icons\\Ability_Shaman_WaterShield",
			["name"] = "Водный щит",
			["pos"] = 1,
			["buf"] = 1,
			["debuf"] = 0,
			["prok"] = nil,
			["srav"] = "b",
			["seiv"] = nil,
		},
	}
end
function sBtn:configure(id)
	if self[id] == nil then
		self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
	else
		self[id]:Show()
	end
	if id == 1 then
		self[id]:SetSize(testQ['sBtnRX'], testQ['sBtnRY'])
		self[id]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn1X'], testQ['sBtn1Y'])
	end
	if id == 2 then
		self[id]:SetSize(testQ['sBtnRX'], testQ['sBtnRY'])
		self[id]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn2X'], testQ['sBtn2Y'])
	end
	if id == 3 then
		self[id]:SetSize(testQ['sBtnRX'], testQ['sBtnRY'])
		self[id]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn3X'], testQ['sBtn3Y'])
	end
	if id == 4 then
		self[id]:SetSize(testQ['sBtnRX'], testQ['sBtnRY'])
		self[id]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn4X'], testQ['sBtn4Y'])
	end
	if id == 15 then
		self[id]:SetSize(8, 8)
		self[id]:SetPoint("CENTER", UIParent,"CENTER",122, 148)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\save1.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\save1.tga")
	end
	if id == 16 then
		self[id]:SetSize(8, 8)
		self[id]:SetPoint("CENTER", UIParent,"CENTER",131, 148)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\save2.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\save2.tga")
	end
	if id == 17 then
		self[id]:SetSize(8, 8)
		self[id]:SetPoint("CENTER", UIParent,"CENTER",139, 148)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\save3.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\save3.tga")
	end
	if id == 18 then
		self[id]:SetSize(8, 8)
		self[id]:SetPoint("CENTER", UIParent,"CENTER",148, 148)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\save4.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\save4.tga")
	end
	if id == 19 then
		self[id]:SetSize(8, 8)
		self[id]:SetPoint("CENTER", UIParent,"CENTER",157, 148)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\save5.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\save5.tga")
	end
	if id == 20 then
		self[id]:SetSize(8, 8)
		self[id]:SetPoint("CENTER", UIParent,"CENTER",166, 148)
		self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\save6.tga")
		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\save6.tga")
	end
	self[id]:EnableMouse(false)
	self[id]:Hide()
end
if sBtn[1] == nil then
	sBtn:configure(1)
	sBtn:configure(2)
	sBtn:configure(3)
	sBtn:configure(4)
	sBtn:configure(15)
	sBtn:configure(16)
	sBtn:configure(17)
	sBtn:configure(18)
	sBtn:configure(19)
	sBtn:configure(20)
end
end)
