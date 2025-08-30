local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
--команды для управления квестами
local nik=sender
local nome
local myNome = GetUnitName("player")
if testQ['sign'] ~= "1" then
	nome = GuildFrame["selectedName"]
else
	nome = myNome
end

local msg = mysplit(message)
local kodMsg = mysplit(kod)
if testQ==nil then
	testQ={}
end
if testQ[myNome]==nil then
	testQ[myNome]={}
end

if kodMsg[1] == "nsAUKend" then
	if gpBtn ~= nil then
		gpBtn:Hide()
		gpBtn:killall()
	end
	gpBtn = nil
	testQ["raidAUK"] = nil
	testQ["raidAUKPobeda"] = nil
	testQ["raidAUKPobeda_gp"] = nil
	testQ[myNome]['nsAUKpredmet'] = nil
end
if kodMsg[1] == "nsYourLog" and kodMsg[2] == myNome and not gpDb then
    -- Парсим строку вида "1743534269 Шеф 9134_Рубиновое_святилище_10 5 18sP"
    local timestamp, rl, raid_id, gp, targets = message:match("^(%d+)%s+(%S+)%s+(%S+)%s+([-+]?%d+)%s+(.+)$")
    
    if not timestamp then
        print("Не удалось распарсить строку:", message)
        return
    end
    
    -- Преобразуем timestamp в "ЧЧ:ММ"
    local time = date("%H:%M", timestamp)
    
    -- Преобразуем raid_id в читаемое название (убираем цифры в начале, если есть)
    local raid = raid_id:gsub("^%d+_", "")
    
    -- Обрабатываем targets
    local decodedTargets = {}
    for word in targets:gmatch("%S+") do
        -- Проверяем, есть ли этот ID в таблице соответствия
        if gpDb_old and gpDb_old.nsUnitID_tbl and gpDb_old.nsUnitID_tbl[word] then
            table.insert(decodedTargets, gpDb_old.nsUnitID_tbl[word])
        else
            table.insert(decodedTargets, word)
        end
    end
    
    -- Собираем обратно в строку
    local finalTargets = table.concat(decodedTargets, " ")
    
    gpDb_old:AddLogEntry(time, gp, rl, raid, finalTargets)
end

if kodMsg[1] == "ns_duel" and msg[2] == myNome then
	if duelBtn == nil then
		duelBtn = {}
	end
	duelBtn[msg[1]..'1'] = nBtn:new(1,ns_duelTrue,UIParent,200,165,30,-25,-50,13,256,64,"Принять","CENTER","CENTER","TOPLEFT","TOPLEFT","BACKGROUND","FF8C00",msg[1],0)
	duelBtn[msg[1]..'2'] = nBtn:new(2,ns_duelFalse,UIParent,200,100,30,-25,-50,13,256,64,"Отказаться","CENTER","CENTER","TOPLEFT","TOPLEFT","BACKGROUND","FF8C00",msg[1],0)
	duelBtn[msg[1]..'1']:configure()
	duelBtn[msg[1]..'2']:configure()
	duelBtn[msg[1]..'1']:setOnUpdate(duelOnUpdate,duelBtn[msg[1]..'1']:getSaveNome())
end
if kodMsg[1] == "ns_duel_otkaz" and message == myNome then
	nsMyDuel = nil
end
if 	kodMsg[1] == "nsAUK" then
	if not textWindow or not textWindow:IsVisible() then
		TextWindow(message)
		
		testQ["raidAUK"] = {}
		testQ["raidAUKPobeda"] = nil
		testQ["raidAUKPobeda_gp"] = nil
	else
		DestroyTextWindow()
		if testQ["raidAUKPobeda_gp"] ~= nil then
			SendChatMessage(testQ["raidAUKPobeda"] .. " побеждает, поставив " .. testQ["raidAUKPobeda_gp"] .. " ГП", "RAID_WARNING", nil, 1)
		end
		testQ["raidAUK"] = nil
		testQ["raidAUKPobeda"] = nil
		testQ["raidAUKPobeda_gp"] = nil
	end
end

if kodMsg[1] == "tipaTvoyKod" then
	if testQ[myNome]['коды'] == nil then
		 testQ[myNome]['коды'] = {}
	end
	if testQ[myNome]['коды']['nome'] == nil then
		testQ[myNome]['коды']['nome'] = {}
	end
	testQ[myNome]['коды'][message] = kodMsg[2]
	testQ[myNome]['коды']['nome'][kodMsg[2]] = message
end

if kodMsg[1] == "otdatKoy" then
	if testQ[myNome]['коды'] == nil then
		 testQ[myNome]['коды'] = {}
	end
	if testQ[myNome]['коды']['nome'] == nil then
		testQ[myNome]['коды']['nome'] = {}
	end
	testQ[myNome]['коды'][msg[1]] = msg[2]
	testQ[myNome]['коды']['nome'][msg[2]] = msg[1]
end
if testQ[myNome]["q33nik"]==nil then
	testQ[myNome]["q33nik"]={}
end
if kodMsg[1] == "ns_q3dict_end" and message == myNome then
	testQ['q3dict'] = nil
end
if kodMsg[1] == "ns_Kz_end" then
	testQ['koza'] = nil
end

if kodMsg[1] == "ns_Kz_start" and msg[1] == myNome then
	testQ['koza'] = 600
end
if kodMsg[1] == "ns_oslep" and kodMsg[2] == myNome then
	testQ['oslep'] = {}
	testQ['oslep']['time'] = tonumber(msg[1])
	testQ['oslep']['sila'] = tonumber(msg[2])
end
if kodMsg[1] == "ns_allcash" then
	local testKont = tostring(GetCurrentMapContinent())
	local testLok = tostring(GetCurrentMapZone())
	if testKont == msg[1] and testLok == msg[2] then
		testQ['acX'] = msg[3]
		testQ['acY'] = msg[4]
	else
		testQ['acX'] = nil
		testQ['acY'] = nil
	end
end
if kodMsg[1] == "iya_temp_x" and message == myNome then
	testQ['iya_end'] = nil
end
if kodMsg[1] == "ns_q3dict_get" and msg[1] == myNome then
	quesT("show")
	okNo:configure(1,"show")
	rtnTextF("Тебя охватывает жажда крови. Убивай, чтобы выполнить квест.",1,"show")
-- 	if ach_ach[12] == nil then
-- 		SendAddonMessage("#achVSE", 12, "guild")
-- 	end
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
	testQ['q3dict'] = 1
	testQ["okno"] = 'q3dict'
end
if kodMsg[1] == "ns_rostTravy" and kodMsg[2] == nome then
	for i = 1, 100 do
		if string.utf8sub(message,(i*2)-1,i*2) ~= "##" then
			mioFld1[myNome]["объекты"][tostring(i)] = ns_obj(string.utf8sub(message,(i*2)-1,i*2))
			fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. ns_obj(string.utf8sub(message,(i*2)-1,i*2)) .. ".tga")
			fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. ns_obj(string.utf8sub(message,(i*2)-1,i*2)) .. ".tga")
		end
	end
end

if kodMsg[1] == "#yIm" then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[message] == nil then
		mioFld[message] = {}
	end
	if mioFld[message]["mf"] == nil then
		mioFld[message]["mf"] = {}
	end
	mioFld[message]["mf"][tostring(kodMsg[2])] = "my"
	testQ["mf"] = 1
	testQ["mfNome"] = message
end
if kodMsg[1] == "dostPOL" and kodMsg[2] == myNome then
	if message == "1" then
		SendChatMessage("Кнопка аддона героически найдена и даже нажата..невероятно. *вжжжжж спецэффекты всякие там*", "OFFICER", nil, 1)
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ach.ogg")
	end
	if message == "2" then
		SendChatMessage("Вдалеке за Обелиском я вижу здание музея. Культура это хорошо. Нужно развиваться, иначе пиздец", "OFFICER", nil, 1)
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ach.ogg")
	end
	if message == "3" then
		SendChatMessage("В музее я нахожу давно забытую технологию: Топор *оглядывается в поисках других игроков*", "OFFICER", nil, 1)
		--print("Возле Обелиска я нахожу давно забытую технологию: Топор *оглядывается в поисках других игроков*")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ach.ogg")
	end
	if message == "4" then
		SendChatMessage("Накоплено достаточно бревен для постройки хижины. Там меня могут посетить гениальнейшие идеи долгими зимними вечерами...", "OFFICER", nil, 1)
		--print("Накоплено достаточно бревен для постройки хижины. Там меня могут посетить гениальнейшие идеи долгими зимними вечерами...")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ach.ogg")
	end
	if message == "5" then
		SendChatMessage("Все нубские квесты в хижине выполнены. Теперь меня можно целовать везде.", "OFFICER", nil, 1)
		--print("Все нубские квесты в хижине выполнены. Теперь меня можно целовать везде.")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ach.ogg")
	end
	if message == "6" then
		SendChatMessage("Первый камень добыт, кстати, он тяжелый.. Под камнем валяется старый ржавый серп. А за какой конец его правильно брать?", "OFFICER", nil, 1)
		--print("Все нубские квесты в хижине выполнены. Теперь меня можно целовать везде.")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\ach.ogg")
	end
end
if kodMsg[1] == "#b0" then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[message] == nil then
		mioFld[message] = {}
	end
	if mioFld[message]["taverna"] == nil then
		mioFld[message]["taverna"] = {}
	end
	mioFld[message]["taverna"][tostring(kodMsg[2])] = "b0"
	testQ["b0Show"] = 1
	testQ["b0Nome"] = message
end
if kodMsg[1] == "#yImx" then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[message] == nil then
		mioFld[message] = {}
	end
	if mioFld[message]["mf"] == nil then
		mioFld[message]["mf"] = {}
	end
	mioFld[message]["mf"][tostring(kodMsg[2])] = "bn"
	testQ["mf"] = 1
	testQ["mfNome"] = sender
end
if kodMsg[1] == "ns_cstr" and nome == msg[1] then
	if fBtn[1]:IsVisible() then
		mioFld1[msg[1]]["объекты"][tostring(kodMsg[2])] = kodMsg[3]
		mioFld1[msg[1]]["целостность"][tostring(kodMsg[2])] = kodMsg[4]
		fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. kodMsg[3] .. ".tga")
		fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. kodMsg[3] .. ".tga")
	end
end

if kodMsg[1] == "ns_m2" and nome == message then
	if fBtn[1]:IsVisible() then
		mioFld1[msg[1]]["объекты"][tostring(kodMsg[2])] = kodMsg[3]
		mioFld1[msg[1]]["целостность"][tostring(kodMsg[2])] = kodMsg[4]
		fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. kodMsg[3] .. ".tga")
		fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. kodMsg[3] .. ".tga")
	end
end
if kodMsg[1] == "ns_yres" and nome == kodMsg[3] then
	if msg[1] ~= nil then
		dmgText(msg[1],resursy[1],101,13,"FF8C00")
	end
	if msg[2] ~= nil then
		dmgText(msg[2],resursy[2],102,13,"FF8C00")
	end
	if msg[3] ~= nil then
		dmgText(msg[3],resursy[3],103,13,"FF8C00")
	end
	if msg[4] ~= nil then
		dmgText(string.format("%d", tonumber(msg[4])),resursy[4],104,13,"FF8C00")
	end
	if msg[5] ~= nil then
		dmgText(msg[5],resursy[5],105,13,"FF8C00")
	end
	if msg[6] ~= nil then
		dmgText(string.format("%d", tonumber(msg[6])),resursy[6],106,13,"FF8C00")
	end
	if msg[7] ~= nil then
		dmgText(msg[7],resursy[7],107,13,"FF8C00")
	end
	if mgznZ ~= nil then
		dmgText1(msg[5],mgznZ,1005,11,"FF8C00")
		dmgT = msg[5]
	else
		dmgT = msg[5]
	end
end
if kodMsg[1] == "#domtv" and msg[1] == myNome then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[myNome] == nil then
		mioFld[myNome] = {}
	end
	if mioFld[myNome]["taverna"] == nil then
		mioFld[myNome]["taverna"] = {}
		for i = 1, 100 do
			mioFld[myNome]["taverna"][tostring(i)] = "pl"
		end
	end
	local tv = mioFld[myNome]["taverna"]["1"]
	for i = 2, 100 do
		tv = tv .. mioFld[myNome]["taverna"][tostring(i)]
	end
	if sender == myNome then
		SendAddonMessage("#mioTV " .. msg[2], tv, "guild")
	else
		if testQ["traktirshik"] == 1 then
			SendAddonMessage("#mioTV " .. msg[2], tv, "guild")
		else
			SendChatMessage("Закрыто", "OFFICER", nil, 1)
		end
	end
end
if kodMsg[1] == "ns_st" and kodMsg[2] == myNome then
	--if testQ["mioR"] == nil then
		testQ["mioR"] = {}
	--end
	for i = 1, 7 do
		testQ["mioR"][i] = msg[i]
	end
end

if kodMsg[1] == "#munusItem" and message == myNome then
	krt["podskazki"] = tonumber(krt["podskazki"]) - 1
	testQ["kamen"] = tonumber(testQ["kamen"]) - 1
	testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
	testQ["brevna"] = tonumber(testQ["brevna"]) - 1
	testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
	testQ["stog"] = tonumber(testQ["stog"]) - 1
	testQ["nikQF"] = antc(tonumber(testQ["stog"]))
	testQ["beton"] = tonumber(testQ["beton"]) - 1
	testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
	testQ["smg"] = tonumber(testQ["smg"]) - 1
	testQ["nikQS"] = antc(testQ["smg"])
	testQ["doska"] = tonumber(testQ["doska"]) - 1
	testQ["nikQD"] = antc(testQ["doska"])
	testQ["kirpich"] = tonumber(testQ["kirpich"]) - 1
	testQ["nikQKR"] = antc(testQ["kirpich"])
end
if kodMsg[1] == "#dommf" and msg[1] == myNome then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[myNome] == nil then
		mioFld[myNome] = {}
	end
	if mioFld[myNome]["mf"] == nil then
		mioFld[myNome]["mf"] = {}
		for i = 1, 100 do
			mioFld[myNome]["mf"][tostring(i)] = "bn"
		end
	end
	local tv = mioFld[myNome]["mf"]["1"]
	for i = 2, 100 do
		tv = tv .. mioFld[myNome]["mf"][tostring(i)]
	end
	SendAddonMessage("#mioMF " .. msg[2], tv, "guild")
end
if kodMsg[1] == "#resursy" and message == myNome then
	SendAddonMessage("#resursy1", "Бревна: " .. testQ["brevna"], "guild")
	SendAddonMessage("#resursy1", "Трава: " .. testQ["stog"], "guild")
	SendAddonMessage("#resursy1", "Камень: " .. testQ["kamen"], "guild")
	SendAddonMessage("#resursy1", "Бетон: " .. testQ["beton"], "guild")
	SendAddonMessage("#resursy1", "Самогон: " .. testQ["smg"], "guild")
	SendAddonMessage("#resursy1", "Кирпич: " .. testQ["kirpich"], "guild")
	SendAddonMessage("#resursy1", "Доска: " .. testQ["doska"], "guild")
end

if kodMsg[1] == "#gmlist" and message == myNome then
	for i = 1, #gmList do
		SendAddonMessage("#yanegm", gmList[i], "guild")
	end
end
if kodMsg[1] == "награда" and kodMsg[2] == myNome then
	SendAddonMessage("#hQ1itemQ ", "1", "guild")
end
if kodMsg[1] == "#mioTV" and kodMsg[2] == myNome then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[sender] == nil then
		mioFld[sender] = {}
	end
	if mioFld[sender]["taverna"] == nil then
		mioFld[sender]["taverna"] = {}
	end
	for i = 1, 100 do
		mioFld[sender]["taverna"][tostring(i)] = message:sub((i*2)-1,i*2)
	end
	testQ["dom"] = 1
	testQ["domZ"] = "taverna"
	testQ["domNome"] = sender
end
if kodMsg[1] == "#mioMZ" and kodMsg[3] == myNome then
	mioFld1[kodMsg[2]]["muzeum"] = {}
	if testQ["domZ"] == nil then
		for i = 1, 100 do
			fBtn[i]:Hide()
			dBtn[i]:Show()
			if message:sub(i,i) == "n" then
				dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\e1.tga")
				dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\e1.tga")
				mioFld1[kodMsg[2]]["muzeum"][i] = "n"
			end
			if message:sub(i,i) == "1" then
				dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\em.tga")
				dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\em.tga")
				mioFld1[kodMsg[2]]["muzeum"][i] = "1"
			end
		end
		testQ["domZ"] = "muzeum"
	end
end
if kodMsg[1] == "kRt1" and kodMsg[3] == myNome then
	testQ['testKrt'] = nil
	mioFld1[kodMsg[2]]["kuryatnik"] = {}
	if testQ["domZ"] == nil then
		for i = 1, 50 do
			j=tostring(i)
			fBtn[i]:Hide()
			dBtn[i]:Show()
			if message:utf8sub(i*4-3,i*4) == "    " then
				dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
				dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
				mioFld1[kodMsg[2]]["kuryatnik"][j] = "    "
			end
			if message:utf8sub(i*4-3,i*4) ~= "    " then
				dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. message:utf8sub(i*4-3,i*4) .. ".tga")
				dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. message:utf8sub(i*4-3,i*4) .. ".tga")
				mioFld1[kodMsg[2]]["kuryatnik"][j] = message:utf8sub(i*4-3,i*4)
				testQ['testKrt'] = 1
			end
		end
	end
end

if kodMsg[1] == "kRt2" and kodMsg[3] == myNome then
	for i = 1, 50 do
		fBtn[i+50]:Hide()
		dBtn[i+50]:Show()
		if message:utf8sub(i*4-3,i*4) == "    " then
			dBtn[i+50]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
			dBtn[i+50]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
			mioFld1[kodMsg[2]]["kuryatnik"][tostring(i+50)] = "    "
		end
		if message:utf8sub(i*4-3,i*4) ~= "    " then
			dBtn[i+50]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. message:utf8sub(i*4-3,i*4) .. ".tga")
			dBtn[i+50]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. message:utf8sub(i*4-3,i*4) .. ".tga")
			mioFld1[kodMsg[2]]["kuryatnik"][tostring(i+50)] = message:utf8sub(i*4-3,i*4)
			testQ['testKrt'] = 1
		end
	end
	testQ["domZ"] = "kuryatnik"
	for i = 1, 100 do
		risPetShow(i,"hide","","")
	end
	local testYaiz
	for i = 1, 100 do
		j = tostring(i)
		if mioFld1[nome]['kuryatnik'][j] ~= "    " then
			testYaiz = 1
		end
	end
	if testYaiz == nil then
		if testQ[myNome]["петы"]['yaiz'] == nil or testQ[myNome]["петы"]['yaiz'] == 0 then
			if testQ['testKrt'] == nil then
				if testQ['sign'] == "1" then
					showFld("1",myNome)
				else
					showFld("0",myNome)
				end
				for i = 1, 100 do
					dBtn[i]:Hide()
				end
			end
			if testQ[myNome]['puteshestvie'] == nil then
				testQ[myNome]['puteshestvie'] = "0"
				PlaySoundFile("Interface\\AddOns\\NSQC\\start.ogg")
				testQ[myNome]['puteshestvieTabella'] = "fenix"
				testQ[myNome][testQ[myNome]['puteshestvieTabella']] = "0"
			end
			local x,y = GetPlayerMapPosition("player")
			local kont = tostring(GetCurrentMapContinent())
			local lok = tostring(GetCurrentMapZone())
			ns_FLAGnaClick = 1
			testQ['fx'] = nil
			testQ['fy'] = nil
			cepochkiQuestov(testQ[myNome]['puteshestvieTabella'],testQ[myNome]['puteshestvie'],kont,lok,x,y,myNome)
		end
	end
end
if kodMsg[1] == "kRt3" and kodMsg[3] == myNome then
	if mioFld1 ~= nil then
		if mioFld1[kodMsg[2]] ~= nil then
			mioFld1[kodMsg[2]]["kuryatnik"] = {}
			for i = 1, 50 do
				j=tostring(i)
				if message:utf8sub(i*4-3,i*4) == "    " then
					mioFld1[kodMsg[2]]["kuryatnik"][j] = "    "
				end
				if message:utf8sub(i*4-3,i*4) ~= "    " then
					mioFld1[kodMsg[2]]["kuryatnik"][j] = message:utf8sub(i*4-3,i*4)
				end
			end
		end
	end
end

if kodMsg[1] == "kRt4" and kodMsg[3] == myNome then
	if mioFld1 ~= nil then
		if mioFld1[kodMsg[2]] ~= nil then
			for i = 1, 50 do
				if message:utf8sub(i*4-3,i*4) == "    " then
					mioFld1[kodMsg[2]]["kuryatnik"][tostring(i+50)] = "    "
				end
				if message:utf8sub(i*4-3,i*4) ~= "    " then
					mioFld1[kodMsg[2]]["kuryatnik"][tostring(i+50)] = message:utf8sub(i*4-3,i*4)
				end
			end
		end
	end
end
if kodMsg[1] == "yAiz_xxx" then
	showFld("1",myNome)
	for i = 1, 100 do
		if dBtn[1]:IsVisible() then
			dBtn[i]:Hide()
		end
	end
end
if kodMsg[1] == "kRc1" then
	if mioFld1 ~= nil then
		if mioFld1[kodMsg[3]] ~= nil then
			if mioFld1[kodMsg[3]]["kuryatnik"] ~= nil then
			mioFld1[kodMsg[3]]["kuryatnikCel"] = {}
			
				for i = 1, 50 do
					j = tostring(i)
					if message:utf8sub(i*4-3,i*4) == "    " then
						mioFld1[kodMsg[3]]["kuryatnikCel"][j] = "    "
						if mioFld1[kodMsg[3]]["kuryatnik"][j] == "yaiz" then
							if dBtn[1]:IsVisible() then
								dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
								dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
								mioFld1[kodMsg[3]]["kuryatnikCel"][tostring(i)] = nil
								mioFld1[kodMsg[3]]["kuryatnik"][j] = "    "
							end
						end
					end
					if message:utf8sub(i*4-3,i*4) ~= "    " then
						mioFld1[kodMsg[3]]["kuryatnikCel"][j] = numeCod(message:utf8sub(i*4-3,i*4))
					end
				end
			end
		end
	end
end

if kodMsg[1] == "kRc2" then
	if mioFld1 ~= nil then
		if mioFld1[kodMsg[3]] ~= nil then
			if mioFld1[kodMsg[3]]["kuryatnikCel"] ~= nil then
				for i = 1, 50 do
					j=tostring(i)
					if message:utf8sub(i*4-3,i*4) == "    " then
						mioFld1[kodMsg[3]]["kuryatnikCel"][tostring(i+50)] = "    "
						if mioFld1[kodMsg[3]]["kuryatnik"][tostring(i+50)] == "yaiz" then
							if dBtn[1]:IsVisible() then
								dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
								dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\krt.tga")
								mioFld1[kodMsg[3]]["kuryatnikCel"][tostring(i+50)] = nil
								mioFld1[kodMsg[3]]["kuryatnik"][tostring(i+50)] = "    "
							end
						end
					end
					if message:utf8sub(i*4-3,i*4) ~= "    " then
						mioFld1[kodMsg[3]]["kuryatnikCel"][tostring(i+50)] = numeCod(message:utf8sub(i*4-3,i*4))
					end
				end
			end
		end
	end
end
if kodMsg[1] == "kRcN" then
	if mioFld1 ~= nil then
		if mioFld1[kodMsg[2]] ~= nil then
			if mioFld1[kodMsg[2]]["kuryatnikCel"] ~= nil then
				mioFld1[kodMsg[2]]["kuryatnikCel"][tostring(kodMsg[3])] = 100
			else
				mioFld1[kodMsg[2]]["kuryatnikCel"] = {}
				mioFld1[kodMsg[2]]["kuryatnikCel"][tostring(kodMsg[3])] = 100
			end
		end
	end
end
if kodMsg[1] == "kArp" then
	if mioFld1 ~= nil then
		if mioFld1[message] ~= nil then
			if message == myNome then
				testQ[message]["петы"]['yaiz'] = nil
				testQ[message]["петы"]['karp'] = 1
			end
			if mioFld1[message]['kuryatnik'] ~= nil then
				mioFld1[message]['kuryatnik'][tostring(kodMsg[2])] = 'karp'
				if dBtn[1]:IsVisible() then
					dBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\karp.tga")
					dBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\karp.tga")
				end
			end
		end
	end
end
if kodMsg[1] == "ns_krt" then
	if mioFld1 ~= nil then
		if mioFld1[message] ~= nil then
			mioFld1[message]['kuryatnik'][tostring(kodMsg[2])] = "yaiz"
			if dBtn[1]:IsVisible() then
				dBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\yaiz.tga")
				dBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\yaiz.tga")
			end
		end
	end
end
if kodMsg[1] == "#mioMZ1" and kodMsg[3] == myNome then
	if kodMsg[4] ~= nil then
		mioFld1[kodMsg[2]]["muzeum1"] = {}
		for i = 1, 100 do
			if message:sub((i*2)-1,(i*2)-1) == " " then
				mioFld1[kodMsg[2]]["muzeum1"][i] = 0
			end
			if message:sub(i*2,i*2) == " " and message:sub((i*2)-1,(i*2)-1) ~= " " then
				mioFld1[kodMsg[2]]["muzeum1"][i] = tonumber(numeCod(message:sub((i*2)-1,(i*2)-1)))
			end
			if message:sub(i*2,i*2) ~= " " and message:sub((i*2)-1,(i*2)-1) ~= " " then
				mioFld1[kodMsg[2]]["muzeum1"][i] = tonumber(numeCod(message:sub((i*2)-1,i*2)))
			end
			mioFld1[kodMsg[2]]["muzeum1"][101] = tonumber(message:sub(201,203))
		end
	else
		mioFld1[kodMsg[2]]["muzeum1"] = {}
		if testQ["domZ"] == nil or testQ["domZ"] == "muzeum1" then
			for i = 1, 100 do
				fBtn[i]:Hide()
				dBtn[i]:Show()
				if message:sub((i*2)-1,(i*2)-1) == " " then
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\e1.tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\e1.tga")
					mioFld1[kodMsg[2]]["muzeum1"][i] = 0
				end
				if message:sub(i*2,i*2) == " " and message:sub((i*2)-1,(i*2)-1) ~= " " then
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\em.tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\em.tga")
					mioFld1[kodMsg[2]]["muzeum1"][i] = tonumber(numeCod(message:sub((i*2)-1,(i*2)-1)))
				end
				if message:sub(i*2,i*2) ~= " " and message:sub((i*2)-1,(i*2)-1) ~= " " then
					dBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\em.tga")
					dBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\em.tga")
					mioFld1[kodMsg[2]]["muzeum1"][i] = tonumber(numeCod(message:sub((i*2)-1,i*2)))
				end
				mioFld1[kodMsg[2]]["muzeum1"][101] = tonumber(message:sub(201,203))
				if tonumber(message:sub(201,203)) ~= 0 then
					if mioFld1[kodMsg[2]]["muzeum1"][tonumber(message:sub(201,203))] ~= 0 then
						dBtn[tonumber(message:sub(201,203))]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\e2.tga")
						dBtn[tonumber(message:sub(201,203))]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\e2.tga")
					else
						dBtn[tonumber(message:sub(201,203))]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\e3.tga")
						dBtn[tonumber(message:sub(201,203))]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\e3.tga")
					end
				end
			end
			testQ["domZ"] = "muzeum1"
		end
	end
end

-- if kodMsg[1] == "#mioMZach" and kodMsg[2] == myNome then
-- 	acha = {}
-- 	for i = 1, 100 do
-- 		if message:sub(i,i) == "1" then
-- 			acha[i] = 1
-- 		else
-- 			acha[i] = nil
-- 		end
-- 	end
-- end
if kodMsg[1] == "#mioMF" then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[sender] == nil then
		mioFld[sender] = {}
	end
	if mioFld[sender]["mf"] == nil then
		mioFld[sender]["mf"] = {}
	end
	for i = 1, 100 do
		mioFld[sender]["mf"][tostring(i)] = message:sub((i*2)-1,i*2)
	end
	testQ["dom"] = 1
	testQ["domZ"] = "mf"
	testQ["domNome"] = sender
end
testGM=gmTest(sender)
if kodMsg[1] == "dostDEL" and kodMsg[2] == myNome and testGM ~= nil then
	ach_ach[tonumber(message)] = nil
end
if kodMsg[1] == "построить" and kodMsg[2] == myNome and testGM ~= nil then
	if mioFld ~= nil then
		if mioFld[myNome] ~= nil then
			if mioFld[myNome]["объекты"] ~= nil then
				mioFld[myNome]["объекты"][tostring(kodMsg[3])] = message
			end
		end
	end
end
if kodMsg[1] == "xTime" and kodMsg[2] == myNome and testGM ~= nil then
	testQ[myNome]["hTimer"] = tonumber(message)
end
if kodMsg[1] == "#hQ1x" and kodMsg[2] == myNome then
	testQ[myNome]["взятый_квест_b"] = nil
	testQ[myNome]["взятый_квест_х"] = nil
	testQ[myNome]["взятый_квест_t"] = nil
	testQ["taverna_num_q"] = nil
	testQ[myNome]["взятый_квест_s"] = nil
	if testQ[myNome]["выполненные_квесты_х"] == nil then
		testQ[myNome]["выполненные_квесты_х"] = {}
	end
	testQ[myNome]["выполненные_квесты_х"][message] = nil
	testQ[myNome]["взятый_квест"] = nil
	testQ["okno"] = nil
	testQ[myNome]["itemQend"] = nil
	testQ[myNome]["q33end"] = nil
	testQ[myNome]["взятый_квест_xy"] = nil
	testQ[myNome]["взятый_квест_xy_end"] = nil
	if ach_ach[15] == nil then
		SendAddonMessage("#achVSE", 15, "guild")
	end
	ns_q5Test = nil
	testQ['nsq5_1'] = nil
	testQ['nsq5_2'] = nil
	testQ['nsq5_3'] = nil
	testQ['nsq5_end'] = nil
	testQ[myNome]['q_stelth'] = nil
	testQ['iyastart'] = nil
	testQ['iya_end'] = nil
	testQ['iya_ser'] = 0
end

if kodMsg[1] == "rasstoyanie" then
	if mapTables == nil then
		mapTables = {}
	end
	if mapTables["lokRasstoyanie"] == nil then
		mapTables["lokRasstoyanie"] = {}
	end
	if mapTables["lokRasstoyanie"][tostring(kodMsg[2])] == nil then
		mapTables["lokRasstoyanie"][tostring(kodMsg[2])] = {}
	end
	mapTables["lokRasstoyanie"][tostring(kodMsg[2])][tostring(kodMsg[3])] = tonumber(message)
end
if kodMsg[1] == "event1" then
	if testQ ~= nil then
		testQ["event1"] = {}
		for i=1,100 do
			testQ["event1"][i] = i
		end
	end
end
if kodMsg[1] == "nagradaPP" and kodMsg[2] == myNome and testGM ~= nil then
	testQ["vyborNagrady"] = 1
end
if kodMsg[1] == "nMapPoint" then
	if mapTables == nil then
		mapTables = {}
	end
	if mapTables["nMapPoint"] == nil then
		mapTables["nMapPoint"] = {}
	end
	if mapTables["nMapPoint"][tostring(kodMsg[2])] == nil then
		mapTables["nMapPoint"][tostring(kodMsg[2])] = {}
	end
	if mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])] == nil then
		mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])] = {}
	end
	if mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])][tostring(kodMsg[4])] == nil then
		mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])][tostring(kodMsg[4])] = {}
	end
	mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])][tostring(kodMsg[4])]["x"] = tonumber(kodMsg[5])
	mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])][tostring(kodMsg[4])]["y"] = tonumber(kodMsg[6])
	mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])][tostring(kodMsg[4])]["f"] = tonumber(kodMsg[7])
	mapTables["nMapPoint"][tostring(kodMsg[2])][tostring(kodMsg[3])][tostring(kodMsg[4])]["p"] = message
end
if kodMsg[1] == "xTimex" and kodMsg[2] == myNome and testGM ~= nil then
	if testQ[myNome]["hTimer"] ~= nil then
		testQ[myNome]["hTimer"] = tonumber(testQ[myNome]["hTimer"]) - tonumber(message)
	end
end

if kodMsg[1] == "FailPointEvent1" then
	if iconRis[tonumber(testQ["event1"][tonumber(message)])] ~= nil then
		iconRis[tonumber(testQ["event1"][tonumber(message)])]:Hide()
	end
	testQ["event1"][tonumber(message)]=9999
end
if kodMsg[1] == "vyborNagradyX" and message == myNome then
	testQ["vyborNagrady"] = nil
end
if  kodMsg[1] == "NSGaddChatKL" then
	if mapTables == nil then
		mapTables = {}
	end
	mapTables[kodMsg[2]] = {}
	mapTables[kodMsg[2]][tostring(msg[1])]={}
	mapTables[kodMsg[2]][tostring(msg[1])][tostring(msg[2])]={}
	testQ["tempTabKont"] = msg[1]
	testQ["tempTabLok"] = msg[2]
end
if  kodMsg[1] == "NSGChatX" then
	local kk=1
	for i=1+(tonumber(kodMsg[2])-1)*50,tonumber(kodMsg[2])*50 do
		j = tostring(i)
		if msg[kk] ~= nil then
			if mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] == nil then
				mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] = {}
			end
			mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j]["x"] = tonumber("0." .. msg[kk])
			kk=kk+1
		else
			break
		end
	end
end
local guokInf = string.gsub(message, "%s+", "")
if kodMsg[1] == "#zMYzt" and sender == myNome then
	for guok=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(guok)
		if name == sender then
			local test=string.sub(officerNote,2,2)
			if test~="" then
			local gildLvl = string.utf8sub(officerNote, 1, 1)
			local gildExp = string.utf8sub(officerNote, 2, 5)
			SendChatMessage("*" .. sender .. ": " .. gildLvl .. " гильдлвл" .. " и " .. gildExp .. " опыта", "officer", nil, 1)
			local gildLvlN = tonumber (gildLvl)
			local gildExpN = tonumber (gildExp)
			if gildLvl == "0" then
				local gildExpN = 4 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("Доступен 1 квест в сутки. При лвлапе: 4 сумки из ткани пустоты или ресурсы." , "officer", nil, 1)
			elseif gildLvl == "1" then
				local gildExpN = 8 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("Доступен 1 квест в сутки. При лвлапе: две сумки из ледяной ткани или ресурсы" , "officer", nil, 1)
			elseif gildLvl == "2" then
				local gildExpN = 16 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("Доступны 2 квеста в сутки. При лвлапе 4 сумки из ледяной ткани или ресурсы" , "officer", nil, 1)
				--SendChatMessage("*При лвлапе: повышение до Констебля. Что то одно из пятой ячейки ГБ, кроме серой кошки, письма и маунтов ИЛИ лотерейный билет. " , "officer", nil, 1)
			elseif gildLvl == "3" then
				local gildExpN = 32 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Доступны 3 квеста в сутки. При лвлапе: повышение до Мл. Капрала. Ледовая сумка или три лотерейных билета. " , "officer", nil, 1)
			elseif gildLvl == "4" then
				local gildExpN = 64 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Доступны 4 квеста в сутки. При лвлапе: Повышение до Капрала. 2 ледовые сумки или четыре лотерейных билета. " , "officer", nil, 1)
			elseif gildLvl == "5" then
				local gildExpN = 128 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Доступны 5 квестов в сутки. При лвлапе: повышение до Сержанта. 4 ледовые сумки или 5 лотерейных билетов." , "officer", nil, 1)
			elseif gildLvl == "6" then
				local gildExpN = 256 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
				SendChatMessage("*Доступны 6 квестов в сутки. При лвлапе: ??? или ??? " , "officer", nil, 1)
			elseif gildLvl == "7" then
				local gildExpN = 512 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "8" then
				local gildExpN = 1024 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			elseif gildLvl == "9" then
				local gildExpN = 2048 - gildExpN
				SendChatMessage("*" .. sender .. ": до лвлапа осталось " .. gildExpN .. " опыта" , "officer", nil, 1)
			end
			else
				SendChatMessage("*" .. sender .. ", ты еще не делал квестов", "officer", nil, 1)
			end
		else
		end
	end
end
if kodMsg[1] == "bNx" then
	if mioFld ~= nil then
		if mioFld[message] ~= nil then
			if mioFld[message]["целостность"] ~= nil then
				mioFld[message]["целостность"][tostring(kodMsg[2])] = tonumber(mioFld[message]["целостность"][tostring(kodMsg[2])]) - tonumber(kodMsg[3])
			end
		end
	end
end
if kodMsg[1] == "mioPety" and kodMsg[2] == myNome then
	testQ[myNome]['петы'] = {}
	if message ~= nil then
		for i = 1, tonumber(string.utf8len(message))/4 do
			testQ[myNome]['петы'][message:utf8sub((i*4)-3,i*4)] = 1
		end
	end
end
if kodMsg[1] == "ns_tuC" and kodMsg[2] == nome then
	if fBtn[1]:IsVisible() then
		for i = 1, 50 do
			if message:utf8sub((i*4)-3,(i*4)-3) ~= " " then
				if message:utf8sub(i*4-2,i*4-2) == " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i)] = tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-3)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-3))),fBtn[i],i,13,"FF8C00")
				end
				if message:utf8sub(i*4-2,i*4-2) ~= " " and message:utf8sub(i*4-1,i*4-1) == " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i)] = tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-2)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-2))),fBtn[i],i,13,"FF8C00")
				end
				if message:utf8sub(i*4-1,i*4-1) ~= " " and message:utf8sub(i*4,i*4) == " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i)] = tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-1)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-1))),fBtn[i],i,13,"FF8C00")
				end
				if message:utf8sub(i*4,i*4) ~= " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i)] = tonumber(numeCod(message:utf8sub((i*4)-3,i*4)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,i*4))),fBtn[i],i,13,"FF8C00")
				end
			end
		end
	end
end
if kodMsg[1] == "ns_tuC1" and kodMsg[2] == nome then
	if fBtn[1]:IsVisible() then
		for i = 1, 50 do
			if message:utf8sub((i*4)-3,(i*4)-3) ~= " " then
				if message:utf8sub(i*4-2,i*4-2) == " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i+50)] = tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-3)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-3))),fBtn[i+50],i+50,13,"FF8C00")
				end
				if message:utf8sub(i*4-2,i*4-2) ~= " " and message:utf8sub(i*4-1,i*4-1) == " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i+50)] = tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-2)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-2))),fBtn[i+50],i+50,13,"FF8C00")
				end
				if message:utf8sub(i*4-1,i*4-1) ~= " " and message:utf8sub(i*4,i*4) == " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i+50)] = tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-1)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,(i*4)-1))),fBtn[i+50],i+50,13,"FF8C00")
				end
				if message:utf8sub(i*4,i*4) ~= " " then
					mioFld1[kodMsg[2]]["целостность"][tostring(i+50)] = tonumber(numeCod(message:utf8sub((i*4)-3,i*4)))
					dmgText(tonumber(numeCod(message:utf8sub((i*4)-3,i*4))),fBtn[i+50],i+50,13,"FF8C00")
				end
			end
		end
	end
end
if kodMsg[1] == "ns_pstrMZ" and msg[1] == nome then
	mioFld1[msg[1]]["объекты"][tostring(kodMsg[2])] = "mz"
	fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\mz.tga")
	fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\mz.tga")
end
if kodMsg[1] == "ns_pstrH" and msg[1] == nome then
	mioFld1[msg[1]]["объекты"][tostring(kodMsg[2])] = "h"
	fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\h.tga")
	fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\h.tga")
end
if kodMsg[1] == "ns_pstrS" and msg[1] == nome then
	mioFld1[msg[1]]["объекты"][tostring(kodMsg[2])] = "s"
	fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\s.tga")
	fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\s.tga")
end

if kodMsg[1] == "MioFldO1" and kodMsg[2] == myNome then
	SendAddonMessage("#muzeum1", nome .. " " .. myNome .. " " .. 1, "guild")
	testQ[myNome]['петы'] = nil
	if pQuest == nil then
		pQuest = {}
	end
	if pQuest["х"] == nil then
		pQuest["х"] = {}
	end
	if pQuest["х1"] == nil then
		pQuest["х1"] = {}
	end
	if mapTables == nil then
		mapTables = {}
	end
	if mapTables["lokRasstoyanie"] == nil then
		mapTables["lokRasstoyanie"] = {}
	end
	pQuest["х"][1]=964
	pQuest["х"][2]=545
	pQuest["х"][3]=546
	pQuest["х"][4]=845
	pQuest["х"][5]=750
	pQuest["х"][6]=1017
	pQuest["х"][7]=1243
	pQuest["х"][8]=153
	pQuest["х"][9]=627
	pQuest["х"][1]=621
	pQuest["х"][11]=776
	pQuest["х"][12]=728
	pQuest["х"][13]=736
	pQuest["х"][14]=126
	pQuest["х"][15]=1556
	pQuest["х"][16]=629
	pQuest["х"][17]=628
	pQuest["х"][18]=633
	pQuest["х"][19]=631
	pQuest["х1"][1]=2716
	pQuest["х1"][2]=890
	pQuest["х1"][3]=16
	pQuest["х1"][4]=892
	pQuest["х1"][5]=1165
	pQuest["х1"][6]=2076
	pQuest["х1"][7]=2077
	pQuest["х1"][8]=2078
	pQuest["х1"][9]=2097
	pQuest["х1"][10]=2084

	if pQuest["items"] == nil then
		pQuest["items"] = {}
	end
	if pQuest["items"][1] == nil then
		pQuest["items"][1] = {}
	end
	if pQuest["items"][2] == nil then
		pQuest["items"][2] = {}
	end
	if pQuest["items"][3] == nil then
		pQuest["items"][3] = {}
	end
	if pQuest["items"][4] == nil then
		pQuest["items"][4] = {}
	end
	if pQuest["items"][5] == nil then
		pQuest["items"][5] = {}
	end
	if pQuest["items"][6] == nil then
		pQuest["items"][6] = {}
	end
	if pQuest["items"][7] == nil then
		pQuest["items"][7] = {}
	end
	if pQuest["items"][8] == nil then
		pQuest["items"][8] = {}
	end
	if pQuest["items"][9] == nil then
		pQuest["items"][9] = {}
	end
	if pQuest["items"][10] == nil then
		pQuest["items"][10] = {}
	end
	if pQuest["items"][11] == nil then
		pQuest["items"][11] = {}
	end
	if pQuest["items"][12] == nil then
		pQuest["items"][12] = {}
	end
	if pQuest["items"][13] == nil then
		pQuest["items"][13] = {}
	end
	if pQuest["items"][14] == nil then
		pQuest["items"][14] = {}
	end
	if pQuest["items"][15] == nil then
		pQuest["items"][15] = {}
	end
	pQuest["items"][1]["itemNum"] = "2"
	pQuest["items"][1]["itemEnStuck"] = "100"
	pQuest["items"][1]["itemName"] = "Шерсть"
	pQuest["items"][2]["itemNum"] = "1"
	pQuest["items"][2]["itemEnStuck"] = "100"
	pQuest["items"][2]["itemName"] = "Шерсть"
	pQuest["items"][3]["itemNum"] = "3"
	pQuest["items"][3]["itemEnStuck"] = "100"
	pQuest["items"][3]["itemName"] = "Шерсть"
	pQuest["items"][4]["itemNum"] = "4"
	pQuest["items"][4]["itemEnStuck"] = "100"
	pQuest["items"][4]["itemName"] = "Шерсть"
	pQuest["items"][5]["itemNum"] = "5"
	pQuest["items"][5]["itemEnStuck"] = "100"
	pQuest["items"][5]["itemName"] = "Шерсть"
	pQuest["items"][6]["itemNum"] = "1"
	pQuest["items"][6]["itemEnStuck"] = "100"
	pQuest["items"][6]["itemName"] = "Магическая ткань"
	pQuest["items"][7]["itemNum"] = "2"
	pQuest["items"][7]["itemEnStuck"] = "100"
	pQuest["items"][7]["itemName"] = "Магическая ткань"
	pQuest["items"][8]["itemNum"] = "3"
	pQuest["items"][8]["itemEnStuck"] = "100"
	pQuest["items"][8]["itemName"] = "Магическая ткань"
	pQuest["items"][9]["itemNum"] = "4"
	pQuest["items"][9]["itemEnStuck"] = "100"
	pQuest["items"][9]["itemName"] = "Магическая ткань"
	pQuest["items"][10]["itemNum"] = "5"
	pQuest["items"][10]["itemEnStuck"] = "100"
	pQuest["items"][10]["itemName"] = "Магическая ткань"
	pQuest["items"][11]["itemNum"] = "1"
	pQuest["items"][11]["itemEnStuck"] = "100"
	pQuest["items"][11]["itemName"] = "Ткань Пустоты"
	pQuest["items"][12]["itemNum"] = "2"
	pQuest["items"][12]["itemEnStuck"] = "100"
	pQuest["items"][12]["itemName"] = "Ткань Пустоты"
	pQuest["items"][13]["itemNum"] = "3"
	pQuest["items"][13]["itemEnStuck"] = "100"
	pQuest["items"][13]["itemName"] = "Ткань Пустоты"
	pQuest["items"][14]["itemNum"] = "4"
	pQuest["items"][14]["itemEnStuck"] = "100"
	pQuest["items"][14]["itemName"] = "Ткань Пустоты"
	pQuest["items"][15]["itemNum"] = "5"
	pQuest["items"][15]["itemEnStuck"] = "100"
	pQuest["items"][15]["itemName"] = "Ткань Пустоты"
	if mapTables["lokRasstoyanie"]["1"] == nil then
		mapTables["lokRasstoyanie"]["1"] = {}
	end
	if mapTables["lokRasstoyanie"]["2"] == nil then
		mapTables["lokRasstoyanie"]["2"] = {}
	end
	if mapTables["lokRasstoyanie"]["2"] == nil then
		mapTables["lokRasstoyanie"]["2"] = {}
	end
	if mapTables["lokRasstoyanie"]["3"] == nil then
		mapTables["lokRasstoyanie"]["3"] = {}
	end
	if mapTables["lokRasstoyanie"]["99"] == nil then
		mapTables["lokRasstoyanie"]["99"] = {}
	end
	mapTables["lokRasstoyanie"]["1"]["18"] = 0.00087
	mapTables["lokRasstoyanie"]["1"]["17"] = 0.000499
	mapTables["lokRasstoyanie"]["1"]["4"] = 0.00067
	mapTables["lokRasstoyanie"]["1"]["10"] = 0.003676
	if mapTables["lokRasstoyanie"]["99"] == nil then
		mapTables["lokRasstoyanie"]["99"] = {}
	end
	mapTables["lokRasstoyanie"]["99"]["1"] = 0.003
	if mapTables["lokRasstoyanie"]["2"] == nil then
		mapTables["lokRasstoyanie"]["2"] = {}
	end
	mapTables["lokRasstoyanie"]["2"]["14"] = 0.002
	mapTables["lokRasstoyanie"]["2"]["28"] = 0.0021
	mapTables["lokRasstoyanie"]["3"]["2"] = 0.007
	
	mioFld1 = {}
	if mioFld1[kodMsg[5]] == nil then
		mioFld1[kodMsg[5]] = {}
	end
	mioFld1[kodMsg[5]]["объекты"] = {}
	mioFld1[kodMsg[5]]["целостность"] = {}
	mioFld1[kodMsg[5]]["петы"] = {}
	for i = 1, 35 do
		j = tostring(i)
		mioFld1[kodMsg[5]]["объекты"][j] = msg[i]
		fBtn[i]:Show()
		fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
		fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
	end
	SendAddonMessage("smT st",nome, "guild")
	if nome ~= myNome then
		for i = 1, 100 do
			if petBtn[i] ~= nil then
				petBtn[i]:Hide()
			end
		end
	end
end

if kodMsg[1] == "MioFldO2" and kodMsg[2] == myNome then
	for i = 1, 35 do
		j = tostring(i+35)
		mioFld1[kodMsg[5]]["объекты"][j] = msg[i]
		fBtn[tonumber(j)]:Show()
		fBtn[tonumber(j)]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
		fBtn[tonumber(j)]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
	end
end
if kodMsg[1] == "MioFldO3" and kodMsg[2] == myNome then
	for i = 1, 30 do
		j = tostring(i+70)
		mioFld1[kodMsg[5]]["объекты"][j] = msg[i]
		fBtn[tonumber(j)]:Show()
		fBtn[tonumber(j)]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
		fBtn[tonumber(j)]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
	end
	for i = 1, 100 do
		dmgText("",fBtn[i],i,13,"bbbbbb")
	end
	SendAddonMessage("smT",nome, "guild")
end

if kodMsg[1] == "MFP1" and kodMsg[3] == myNome then
	if message ~= nil then
		if mioFld1 == nil then
			mioFld1 = {}
		end
		if mioFld1[kodMsg[2]] == nil then
			mioFld1[kodMsg[2]] = {}
		end
		if mioFld1[kodMsg[2]]['петы'] == nil then
			mioFld1[kodMsg[2]]['петы'] = {}
		end
		for i = 1, 50 do
			mioFld1[kodMsg[2]]["петы"][tostring(i)] = message:utf8sub((i*4)-3,i*4)
			if mioFld1[kodMsg[2]]["петы"][tostring(i)] ~= nil and mioFld1[kodMsg[2]]["петы"][tostring(i)] ~= "    " then
				risPetShow(i,"show",mioFld1[kodMsg[2]]["петы"][tostring(i)],kodMsg[2])
			end

		end

	end
end

if kodMsg[1] == "MFP2" and kodMsg[3] == myNome then
	if message ~= nil then
		for i = 1, 50 do
			local j = tostring(i+50)
			mioFld1[kodMsg[2]]["петы"][tostring(j)] = message:utf8sub((i*4)-3,i*4)
			if mioFld1[kodMsg[2]]["петы"][tostring(j)] ~= nil and mioFld1[kodMsg[2]]["петы"][tostring(j)] ~= "    " then
				risPetShow(tonumber(j),"show",mioFld1[kodMsg[2]]["петы"][tostring(j)],kodMsg[2])
			end
		end
	end
end
if kodMsg[1] == "MFH1" and kodMsg[3] == myNome then
	if message ~= nil then
		if mioFld1[kodMsg[2]]['хозяин'] == nil then
			mioFld1[kodMsg[2]]['хозяин'] = {}
		end
		for i = 1, 50 do
			mioFld1[kodMsg[2]]["хозяин"][tostring(i)] = message:utf8sub((i*4)-3,i*4)
			if mioFld1[kodMsg[2]]["хозяин"][tostring(i)] ~= nil and mioFld1[kodMsg[2]]["хозяин"][tostring(i)] ~= "    " then
			end

		end
	end
end

if kodMsg[1] == "MFH2" and kodMsg[3] == myNome then
	if message ~= nil then
		for i = 1, 50 do
			local j = tostring(i+50)
			mioFld1[kodMsg[2]]["хозяин"][tostring(j)] = message:utf8sub((i*4)-3,i*4)
			if mioFld1[kodMsg[2]]["хозяин"][tostring(j)] ~= nil and mioFld1[kodMsg[2]]["хозяин"][tostring(j)] ~= "    " then
			end
		end
	end
end
if kodMsg[1] == "MioFldH1" and kodMsg[2] == myNome then
	for i = 1, 35 do
		j = tostring(i)
		mioFld1[kodMsg[5]]["петы"][j] = msg[i]
		--fBtn[tonumber(j)]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
		--fBtn[tonumber(j)]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. msg[i] .. ".tga")
	end
end
if kodMsg[1] == "камни" and kodMsg[2] == myNome and testGM~=nil then
	testQ["kamen"] = tonumber(message)
	testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "бревна" and kodMsg[2] == myNome and testGM~=nil then
	testQ["brevna"] = tonumber(message)
	testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "бревнаP" and kodMsg[2] == myNome and testGM~=nil then
	testQ["brevna"] = tonumber(testQ["brevna"])+1
	testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "трава" and kodMsg[2] == myNome and testGM~=nil then
	testQ["stog"] = tonumber(message)
	testQ["nikQF"] = antc(tonumber(testQ["stog"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "бетон" and kodMsg[2] == myNome and testGM~=nil then
	testQ["beton"] = tonumber(message)
	testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "самогон" and kodMsg[2] == myNome and testGM~=nil then
	testQ["smg"] = tonumber(message)
	testQ["nikQS"] = antc(tonumber(testQ["smg"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "доска" and kodMsg[2] == myNome and testGM~=nil then
	testQ["doska"] = tonumber(message)
	testQ["nikQD"] = antc(tonumber(testQ["doska"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "кирпич" and kodMsg[2] == myNome and testGM~=nil then
	testQ["kirpich"] = tonumber(message)
	testQ["nikQKR"] = antc(tonumber(testQ["kirpich"]))
	testQ["fRand6"] = 1
end
if kodMsg[1] == "ns_bbbb" then
	if mioFld1 ~= nil then
		if mioFld1[message] ~= nil then
			if mioFld1[message]['петы'] ~= nil then
				mioFld1[message]['петы'][kodMsg[2]] = "bbbb"
				if kodMsg[4] ~= nil then
					mioFld1[message]['петы'][kodMsg[4]] = nil
					mioFld1[message]['хозяин'][kodMsg[4]] = nil
					risPetShow(tonumber(kodMsg[4]),"hide","bbbb",message)
					fBtn[tonumber(kodMsg[4])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[message]['объекты'][tostring(kodMsg[4])] .. ".tga")
					fBtn[tonumber(kodMsg[4])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[message]['объекты'][tostring(kodMsg[4])] .. ".tga")
				end
				if mioFld1[message]['хозяин'] == nil then
					mioFld1[message]['хозяин'] = {}
				end
				mioFld1[message]['хозяин'][kodMsg[2]] = kodMsg[3]
				if fBtn[1]:IsVisible() then
					risPetShow(tonumber(kodMsg[2]),"show","bbbb",message)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\bbbb.ogg")
				end
			end
		end
	end
end

if kodMsg[1] == "bB" then
	if mioFld == nil then
		mioFld = {}
	end
	if mioFld[message] == nil then
		mioFld[message] = {}
	end
	if mioFld[message]["петы"] == nil then
		mioFld[message]["петы"] = {}
	end
	if mioFld[message]["хозяин"] == nil then
		mioFld[message]["хозяин"] = {}
	end
	mioFld[message]["петы"][tostring(kodMsg[2])] = "bb"
	mioFld[message]["хозяин"][tostring(kodMsg[2])] = sender
	testQ["fRandDb"] = 1
	testQ["fRandDbnome"] = message
	if message == myNome then
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\hr.ogg")
	end
end
if kodMsg[1] == "poyavlenie_dreva" then
	if mioFld1 ~= nil then
		if mioFld1[message] ~= nil then
			mioFld1[message]["объекты"][tostring(kodMsg[2])] = "t"
			if fBtn[1]:IsVisible() then
				fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\t.tga")
				fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\t.tga")
			end
		end
	end
end
if kodMsg[1] == "poyavlenie_travy" then
	if mioFld1 ~= nil then
		if mioFld1[message] ~= nil then
			mioFld1[message]["объекты"][tostring(kodMsg[2])] = "f"
			mioFld1[message]["целостность"][tostring(kodMsg[2])] = 1
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\tx.ogg")
			if fBtn[1]:IsVisible() then
				fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\f.tga")
				fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\f.tga")
			end
			SendAddonMessage("ns_bbbb " .. kodMsg[3] .. " " .. mioFld1[message]["хозяин"][kodMsg[2]] .. " " .. kodMsg[2], message, "guild")
		end
	end
end

if kodMsg[1] == "goB" then
	if mioFld[message] ~= nil then
		if mioFld ~= nil then
			if mioFld[message]["петы"] == nil then
				mioFld[message]["петы"] = {}
			end
			if mioFld[message]["хозяин"] == nil then
				mioFld[message]["хозяин"] = {}
			end
			mioFld[message]["петы"][tostring(kodMsg[2])] = kodMsg[3]
			mioFld[message]["хозяин"][tostring(kodMsg[2])] = sender
			testQ["fRandDb"] = 1
			testQ["fRandDbnome"] = message
			if message == myNome then
				PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. kodMsg[3] .. ".ogg")
			end
		end
	end
end
-- if kodMsg[1] == "MioFld" then
-- 	if mioFld == nil then
-- 		mioFld = {}
-- 	end
-- 	if mioFld[sender] == nil then
-- 		mioFld[sender] = {}
-- 	end
-- 	if mioFld[sender][kodMsg[3]] == nil then
-- 		mioFld[sender][kodMsg[3]] = {}
-- 	end
-- 	for i = 1, 100 do
-- 		j = tostring(i)
-- 		mioFld[sender][kodMsg[3]][j] = msg[i]
-- 	end
-- 	if mioFld[sender]["подсказки"] == nil then
-- 		mioFld[sender]["подсказки"] = {}
-- 	end
-- 	testQ["fRand2"] = kodMsg[4]
-- 	testQ["fRand2name"] = kodMsg[2]
-- end
if kodMsg[1] == "obgIz" and msg[1] == nome then
	dmgText(kodMsg[3],fBtn[tonumber(kodMsg[2])],tonumber(kodMsg[2]),13,"FF8C00")
	dmG[tonumber(kodMsg[2])]:Show()
	if mioFld1 == nil then
		mioFld1 = {}
	end
	if mioFld1[nome] ~= nil then
		if mioFld1[nome]["целостность"] == nil then
			mioFld1[nome]["целостность"] = {}
		end
		mioFld1[nome]["целостность"][kodMsg[2]] = kodMsg[3]
	end
end
if kodMsg[1] == "travA" then
	if fBtn[1]:IsVisible() then
		if nome == msg[1] then
			fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\f.tga")
			fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\f.tga")
			if mioFld1[msg[1]]["целостность"] == nil then
				mioFld1[msg[1]]["целостность"] = {}
			end
			mioFld1[msg[1]]["объекты"][tostring(kodMsg[2])] = "f"
			mioFld1[msg[1]]["целостность"][tostring(kodMsg[2])] = 1
			dmgText(1,fBtn[tonumber(kodMsg[2])],tonumber(kodMsg[2]),13,"FF8C00")
			dmG[tonumber(kodMsg[2])]:Show()
		end
	end
end
if kodMsg[1] == "zemlYa" then
	if fBtn[1]:IsVisible() then
		if nome == msg[1] then
			fBtn[tonumber(kodMsg[2])]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\z.tga")
			fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\z.tga")
			mioFld1[msg[1]]["объекты"][tostring(kodMsg[2])] = "z"
			mioFld1[msg[1]]["целостность"][tostring(kodMsg[2])] = 1
			dmgText("",fBtn[tonumber(kodMsg[2])],tonumber(kodMsg[2]),13,"FF8C00")
		end
	end
end
if kodMsg[1] == "oS" then
	if mioFld1 ~= nil then
		if mioFld1[message] ~= nil then
			mioFld1[message]["петы"][tostring(kodMsg[2])] = nil
			mioFld1[message]["хозяин"][tostring(kodMsg[2])] = nil
			if fBtn[tonumber(kodMsg[2])]:IsVisible() then
				fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[message]["объекты"][tostring(kodMsg[2])] .. ".tga")
			end
			if sender == myNome then
				testQ[myNome]['петы'][kodMsg[3]] = 1
			end
			risPetShow(tonumber(kodMsg[2]),"hide","","")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. kodMsg[3] .. ".ogg")
		end
	end
end
if kodMsg[1] == "gZ" then
	local petZ = kodMsg[3]
	mioFld1[message]["петы"][tostring(kodMsg[2])] = nil
	mioFld1[message]["хозяин"][tostring(kodMsg[2])] = nil
	if fBtn[tonumber(kodMsg[2])]:IsVisible() then
		fBtn[tonumber(kodMsg[2])]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld1[message]["объекты"][tostring(kodMsg[2])] .. ".tga")
	end
	if kodMsg[4] == testQ[myNome]["коды"]['nome'][myNome] then
		testQ[myNome]["петы"][petZ] = 1
	end
	risPetShow(tonumber(kodMsg[2]),"hide","","")
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. petZ .. ".ogg")
end

if kodMsg[1] == "bbM" then
	if mioFld ~= nil then
		if mioFld[message] ~= nil then
			if mioFld[message]["подсказки"] == nil then
				mioFld[message]["подсказки"] = {}
			end
			if mioFld[message]["целостность"] == nil then
				mioFld[message]["целостность"] = {}
			end
			if mioFld[message]["хозяин"] == nil then
				mioFld[message]["хозяин"] = {}
			end
			mioFld[message]["петы"][tostring(kodMsg[3])] = mioFld[message]["петы"][tostring(kodMsg[2])]
			mioFld[message]["хозяин"][tostring(kodMsg[3])] = mioFld[message]["хозяин"][tostring(kodMsg[2])]
			mioFld[message]["хозяин"][tostring(kodMsg[2])] = nil
			mioFld[message]["петы"][tostring(kodMsg[2])] = nil
			testQ["fRand4"] = 1
			testQ["fRand4Nome"] = message
		end
	end
end

if kodMsg[1] == "gomXm" and message == myNome then
	if mioFld ~= nil then
		if mioFld[message] ~= nil then
			if mioFld[message]["подсказки"] == nil then
				mioFld[message]["подсказки"] = {}
			end
			local xx = math.random(1,5)
			local x = math.random(1,5)
			if xx == 1 then
				if x == 1 then
					testQ["brevna"] = tonumber(testQ["brevna"]) - 1
					testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
				elseif x == 2 then
					testQ["stog"] = tonumber(testQ["stog"]) - 1
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
				elseif x == 3 then
					testQ["kamen"] = tonumber(testQ["kamen"]) - 1
					testQ["nikQK"] = antc(tonumber(testQ["kamen"]))
				elseif x == 4 then
					testQ["beton"] = tonumber(testQ["beton"]) - 1
					testQ["nikQBT"] = antc(tonumber(testQ["beton"]))
				elseif x == 3 then
					testQ["smg"] = tonumber(testQ["smg"]) - 1
					testQ["nikQS"] = antc(tonumber(testQ["smg"]))
					testQ["zarplata"] = 10000
				end
			end
			dmgText(testQ["brevna"],resursy[1],101,13,"FF8C00")
			dmgText(testQ["stog"],resursy[2],102,13,"FF8C00")
			dmgText(testQ["kamen"],resursy[3],103,13,"FF8C00")
			dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
			dmgText(testQ["smg"],resursy[5],105,13,"FF8C00")
		end
		if message == myNome then
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\gobXm.ogg")
		end
	end
end

if kodMsg[1] == "lom" then
	if mioFld ~= nil then
		if mioFld[message] ~= nil then
			if mioFld[message]["подсказки"] == nil then
				mioFld[message]["подсказки"] = {}
			end
			if mioFld[message]["целостность"] == nil then
				mioFld[message]["целостность"] = {}
			end
			mioFld[message]["целостность"][tostring(kodMsg[2])] = tonumber(mioFld[message]["целостность"][tostring(kodMsg[2])]) - tonumber(kodMsg[3])
			if tonumber(mioFld[message]["целостность"][tostring(kodMsg[2])]) <= -1000 then
				mioFld[message]["объекты"][tostring(kodMsg[2])] = "z"
			end
			testQ["fRand4"] = 1
			testQ["fRand4Nome"] = message
		end
	end
	print(sender,myNome)
	if message == myNome or sender == myNome then
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
end



if  kodMsg[1] == "NSGChatY" then
	local kk=1
	for i=1+(tonumber(kodMsg[2])-1)*50,tonumber(kodMsg[2])*50 do
		j = tostring(i)
		if msg[kk] ~= nil then
			if mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] == nil then
				mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j] = {}
			end
			mapTables[kodMsg[3]][tostring(testQ["tempTabKont"])][tostring(testQ["tempTabLok"])][j]["y"] = tonumber("0." .. msg[kk])
			kk=kk+1
		else
			SendChatMessage("Маршрут " .. kodMsg[3] .. " добавлен", "OFFICER", nil, 1)
			break
		end
	end
end

if string.find (kod, "#q33q") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33q"] = message
	testQ[myNome]["взятый_квест"] = "q33"
	btn[7]:Enable()
	btn[8]:Enable()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end
if string.find (kod, "#q33nik1") and string.find (kod, myNome) and testGM ~= nil then
	if testQ[myNome]["q33nik"][1] ~= 1 then
		testQ[myNome]["q33nik"][1] = message
	end
end
if string.find (kod, "#q33nik2") and string.find (kod, myNome) and testGM ~= nil then
	if testQ[myNome]["q33nik"][2] ~= 1 then
		testQ[myNome]["q33nik"][2] = message
	end
end
if string.find (kod, "#q33nik3") and string.find (kod, myNome) and testGM ~= nil then
	if testQ[myNome]["q33nik"][3] ~= 1 then
		testQ[myNome]["q33nik"][3] = message
	end
end
if string.find (kod, "#q33fnd") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33fnd"] = message
end
if string.find (kod, "#q33ans") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q33ans"] = message
end

if kod == "#krt7772" and string.find (message, myNome) and testGM ~= nil then
	if krt == nil then
		krt = {}
	end
	krt["777"] = 2
end
if kod == "#krt7773" and string.find (message, myNome) and testGM ~= nil then
	if krt == nil then
		krt = {}
	end
	krt["777"] = 3
end

if testQ ~= nil then

	if string.find (kod, "#qUpdateS1") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест"] = message
	end
	if string.find (kod, "#qUpdate2v") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["квест_лвл2"] == nil then
			testQ[myNome]["квест_лвл2"] = {}
		end
		if testQ[myNome]["квест_лвл3"] == nil then
			testQ[myNome]["квест_лвл3"] = {}
		end
		testQ[myNome]["лвл_квестов"] = tostring(message)
	end
	if string.find (kod, "#qUpdateS2") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест"] = message
	end
	if string.find (kod, "#qUpdateSqKol2") and string.find (kod, myNome) and testGM ~= nil then
		local q = testQ[myNome]["взятый_квест"]
		testQ[myNome]["квест_лвл2"][q] = message
	end
	if string.find (kod, "#qUpdateS3") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест"] = message
	end
	if string.find (kod, "#qUpdateSF") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q33q"] = message
	end
	if string.find (kod, "#qUpdateSq33q") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q33ans"] = message
	end
	if string.find (kod, "#qUpdateQ3F") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q33fnd"] = message
	end
	if testQ[myNome]["q33nik"] == nil then
		testQ[myNome]["q33nik"] = {}
	end
	if string.find (kod, "#qUpdateSNik1") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["q33nik"][1] ~= 1 then
			testQ[myNome]["q33nik"][1] = message
		end
	end
	if string.find (kod, "#qUpdateSNik2") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["q33nik"][2] ~= 1 then
			testQ[myNome]["q33nik"][2] = message
		end
	end
	if string.find (kod, "#qUpdateSNik3") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["q33nik"][3] ~= 1 then
			testQ[myNome]["q33nik"][3] = message
		end
	end
	if string.find (kod, "#qUpdateQ32") and string.find (kod, myNome) and testGM ~= nil then
		local q = message
		if q ~= "9999" then
			q=tonumber(q)
		end
		testQ[myNome]["взятый_квест"] = q
	end
	if string.find (kod, "#qUpdate3pNum") and string.find (kod, myNome) and testGM ~= nil then
		local num = message
		num = tonumber(num)
		local q = testQ[myNome]["взятый_квест"]
		if testQ[myNome]["квест_лвл3"] == nil then
			testQ[myNome]["квест_лвл3"] = {}
		end
		testQ[myNome]["квест_лвл3"][q] = num
	end
	if string.find (kod, "#qUpdate3_2vz") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест3_2"] = message
	end
	if string.find (kod, "#qUpdate3_1vz") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["взятый_квест3_1"] = message
	end
	if string.find (kod, "#qUpdate3rez") and string.find (kod, myNome) and testGM ~= nil then
		if testQ[myNome]["квест_лвл3"] == nil then
			testQ[myNome]["квест_лвл3"] = {}
		end
		local q = testQ[myNome]["взятый_квест"]
		testQ[myNome]["квест_лвл3"][q] = message
	end
	if string.find (kod, "#qUpq3S") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q3Stat"] = tonumber(message)
	end
	if string.find (kod, "#qUp3StatNum") and string.find (kod, myNome) and testGM ~= nil then
		testQ[myNome]["q3StatNum"] = tonumber(message)
	end

end
if string.find (kod, "#q3Stat") and string.find (kod, myNome) and testGM ~= nil then
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10 = GetAchievementCriteriaInfo(tonumber(message), 1)
	SendAddonMessage("#q3otvStat", arg4, "guild")
	SendChatMessage("У меня выполненно " .. arg4 .. " пунктов ачивки " .. GetAchievementLink(tonumber(message)), "OFFICER", nil, 1)
	testQ[myNome]["q3StatTemp"] = tonumber(message)
	testQ[myNome]["q3StatNum"] = tonumber(arg4)
end
if string.find (kod, "#q3stStart") and string.find (kod, myNome) and testGM ~= nil then
	testQ[myNome]["q3Stat"] = testQ[myNome]["q3StatTemp"]
	testQ[myNome]["взятый_квест"] = "q3Stat"
	btn[7]:Enable()
	btn[8]:Enable()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end

if string.find (kod, "#otLadkaNS") and string.find (kod, myNome) and testGM ~= nil then
	local msg = mysplit(message)
	print (message)
	local x,y=otladka(msg[1],msg[2],msg[3],msg[4],msg[5],msg[6],msg[7])
	SendAddonMessage("NSGadd", x .. " " .. y, "guild")
end
if kod == "#ch1ernilaC" and testGM ~= nil then
	if msg[6] == "chern1" then
		if krt == nil then
			krt = {}
		end
		if krt["chernila"] == nil then
			krt["chernila"] = {}
		end
		if krt["chernila"][msg[1]] == nil then
			krt["chernila"][msg[1]] = {}
		end
		if krt["chernila"][msg[1]][msg[2]] == nil then
			krt["chernila"][msg[1]][msg[2]] = {}
		end
		if krt["chernila"][msg[1]][msg[2]][msg[3]] == nil then
			krt["chernila"][msg[1]][msg[2]][msg[3]] = {}
		end
		krt["chernila"]["nomer"] = msg[1]
		krt["chernila"]["kont"] = msg[2]
		krt["chernila"]["lok"] = msg[3]
		krt["chernila"]["msg"] = 1
		krt["chernila"]["cel"] = 1
		krt["chernila"]["podskazki"] = 1
		krt["chernila"][msg[1]][msg[2]][msg[3]]["x"] = msg[4]
		krt["chernila"][msg[1]][msg[2]][msg[3]]["y"] = msg[5]
	end
	if msg[6] == "mapQuest" then
		if testQ == nil then
			testQ = {}
		end
		if testQ["mapQuest"] == nil then
			testQ["mapQuest"] = {}
		end
		if testQ["mapQuest"][msg[1]] == nil then
			testQ["mapQuest"][msg[1]] = {}
		end
		if testQ["mapQuest"][msg[1]][msg[2]] == nil then
			testQ["mapQuest"][msg[1]][msg[2]] = {}
		end
		if testQ["mapQuest"][msg[1]][msg[2]][msg[3]] == nil then
			testQ["mapQuest"][msg[1]][msg[2]][msg[3]] = {}
		end
		testQ["mapQuest"]["nomer"] = msg[1]
		testQ["mapQuest"]["kont"] = msg[2]
		testQ["mapQuest"]["lok"] = msg[3]
		testQ["mapQuestMsg"] = 1
		testQ["mapQuestCel"] = 1
		testQ["mapQuestPod"] = 1
		testQ["mapQuest"][msg[1]][msg[2]][msg[3]]["x"] = msg[4]
		testQ["mapQuest"][msg[1]][msg[2]][msg[3]]["y"] = msg[5]
	end
end
if kod == "#chernilaCMsg" and testGM ~= nil then
	if krt~= nil then
		if krt["chernila"] ~= nil then
			if krt["chernila"]["msg"] == 1 then
				krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["msg"] = txtXor(message)
			end
		end
	end
	if testQ["mapQuestMsg"] == 1 then
		testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["msg"] = txtXor(message)
	end
end
if kod == "#chernilaCel" and testGM ~= nil then
	if krt ~= nil then
		if krt["chernila"] ~= nil then
			if krt["chernila"]["cel"] == 1 then
				krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["cel"] = txtXor(message)
			end
		end
	end
	if testQ["mapQuestCel"] == 1 then
		testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["cel"] = txtXor(message)
	end
end
if kodMsg[1] == "#ch1ernilaPod" and testGM ~= nil then
	if krt ~= nil then
		if  krt["chernila"] ~= nil then
			if krt["chernila"]["podskazki"] == 1 then
				if krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"] == nil then
					krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"] = {}
				end
				kodMsgStr = tostring(kodMsg[2])
				if kodMsgStr ~= kodMsg[3] then
					krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
				end
				if kodMsgStr == kodMsg[3] then
					krt["chernila"][krt["chernila"]["nomer"]][krt["chernila"]["kont"]][krt["chernila"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
					SendChatMessage("База чернил обновлена " .. krt["chernila"]["nomer"], "OFFICER", nil, 1)
					krt["chernila"]["nomer"] = nil
					krt["chernila"]["kont"] = nil
					krt["chernila"]["lok"] = nil
					krt["chernila"]["cel"] = nil
					krt["chernila"]["msg"] = nil
					krt["chernila"]["podskazki"] = nil
				end
			end
		end
	end
	if testQ["mapQuestPod"] == 1 then
		kodMsgStr = tostring(kodMsg[2])
		if kodMsgStr ~= kodMsg[3] then
			if testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"] == nil then
				testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"] = {}
			end
			testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
		end
		if kodMsgStr == kodMsg[3] then
			testQ["mapQuest"][testQ["mapQuest"]["nomer"]][testQ["mapQuest"]["kont"]][testQ["mapQuest"]["lok"]]["podskazki"][kodMsgStr] = txtXor(message)
			SendChatMessage("База территориальных квестов обновлена " .. testQ["mapQuest"]["nomer"], "OFFICER", nil, 1)
			testQ["mapQuest"]["nomer"] = nil
			testQ["mapQuest"]["kont"] = nil
			testQ["mapQuest"]["lok"] = nil
			testQ["mapQuestMsg"] = nil
			testQ["mapQuestCel"] = nil
			testQ["mapQuestPod"] = nil
		end
	end
end

if string.find (kod, "#qMapQuest") and string.find (message, myNome) and testGM ~= nil then
	testQ["mapQuest"]["текущий"] = msg[2]
	if testQ ~= nil then
		if testQ["mapQuest"] ~= nil then
			if testQ["mapQuest"]["список"] == nil then
				testQ["mapQuest"]["список"] = {}
			end
			if testQ["mapQuest"]["список"] ~= nil then
				if testQ["mapQuest"]["список"][msg[2]] ~= "9999" then
					testQ["mapQuest"]["список"][msg[2]] = 1
					local kont, lok, x1, y1, m, c = mapQuest(msg[2])
					SendChatMessage(txtXor(c), "OFFICER", nil, 1)
				else
					SendChatMessage("Я уже делал териториальный квест " .. msg[2], "OFFICER", nil, 1)
				end
			end
		end
	end
end
if kod == "#M1QP" and message == myNome then
	if krt ~= nil then
		if krt["777"] == nil then
			if krt["podskazki"] == nil then
				krt["podskazki"] = 1
			else
				krt["podskazki"] = krt["podskazki"] + 1
			end
		end
		if krt["777"] == 3 then
			if krt["evO3"] == nil then
				krt["evO3"] = {}
				krt["evO3"]=1
			else
				krt["evO3"] = krt["evO3"]+1
			end
		end
	end
	if testQ ~= nil then
		if testQ["mapQuest"] ~= nil then
			if testQ["mapQuest"]["текущий"] ~= nil and testQ["mapQuest"]["текущий"] ~= "9999" then
				if testQ["mapQuest"]["podskazki"] == nil then
					testQ["mapQuest"]["podskazki"] = 1
					mapQuestP(testQ["mapQuest"]["текущий"])
					local msgQ = txtXor(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
					SendChatMessage(msgQ, "SAY", DEFAULT_CHAT_FRAME.editBox.languageID);
					--print(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
				else
					mapQuestP(testQ["mapQuest"]["текущий"])
					local x = tablelength(testQ["mapQuest"]["podskazkiRez"])
					if tonumber(testQ["mapQuest"]["podskazki"]) <= tonumber(x) then
						testQ["mapQuest"]["podskazki"] = testQ["mapQuest"]["podskazki"] + 1
						local msgQ = txtXor(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
						SendChatMessage(msgQ, "SAY", DEFAULT_CHAT_FRAME.editBox.languageID);
						--print(testQ["mapQuest"]["podskazkiRez"][tostring(testQ["mapQuest"]["podskazki"])])
						if tonumber(testQ["mapQuest"]["podskazki"]) >= tonumber(x) then
							testQ["mapQuest"]["podskazki"] = nil
						end
					end
				end
			end
		end
	end
end
if kod == "gKick" and sender == myNome then
    local kickList = {}
    local kickCount = 0
    testQ["gKick"] = {}
    
    -- Define rank and level thresholds with their corresponding offline days requirements
    local rankThresholds = {
        ["Мл. Констебль"] = true,
        ["И.О. Констебля"] = true
    }
    
    local levelThresholds = {
        [29] = 3,  -- level ≤ 29: 3 days offline
        [39] = 4,  -- level ≤ 39: 4 days offline
        [49] = 5,  -- level ≤ 49: 5 days offline
        [59] = 6,  -- level ≤ 59: 6 days offline
        [69] = 7,  -- level ≤ 69: 7 days offline
        [79] = 8,  -- level ≤ 79: 8 days offline
        [80] = 14 -- level = 80: 14 days offline
    }
    
    for i = 1, GetNumGuildMembers(true) do
        if kickCount >= 10 then break end
        
        local name, rankName, _, level, _, _, publicNote, officerNote, _, _, _, _, _, _, _, _, _ = GetGuildRosterInfo(i)
        testQ["gKick"][i] = officerNote

        -- Check if member meets the criteria for kicking
        if rankThresholds[rankName] then
            level = tonumber(level)
            local ofInfo = mysplit(officerNote)
            
            -- Check officer note and public note conditions
            if (officerNote == "" and publicNote == "") or (tonumber(ofInfo[1]) == 0 and tonumber(ofInfo[3]) == 0 and publicNote == "") then
                local requiredDays = nil
                
                -- Find the required offline days for this level
                for maxLevel, days in pairs(levelThresholds) do
                    if level <= maxLevel then
                        requiredDays = days
                        break
                    end
                end
                
                if requiredDays then
                    local yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(i)
                    daysOffline = tonumber(daysOffline) or 0
                    
                    if daysOffline >= requiredDays and yearsOffline ~= nil then
                        -- Check if player hasn't been processed already
                        if not string.find(testQ['spisok'] or '', name) then
                            GuildUninvite(name)
                            local message = string.format("%s %s %d лвл %d лет %d месяцев %d дней %d часов", 
                                rankName, name, level, yearsOffline, monthsOffline, daysOffline, hoursOffline)
                            SendChatMessage(message, "OFFICER", nil, 1)
                            testQ['spisok'] = (testQ['spisok'] or '') .. name
                            
                            -- Add to kick list
                            if not kickList[name] then
                                kickList[name] = true
                                kickCount = kickCount + 1
                            end
                        end
                    end
                end
            end
        end
    end
    
    FriendsFrame:Hide()
end

if kod == "gUp" and sender == myNome then
	local testMacro
	for i=1,36 do
		testMacro = GetMacroInfo(i)
		if testMacro ~= nil then
			testMacro = mysplit(testMacro)
			if testMacro[1] == "NSQC" then
				EditMacro(i, "NSQC", 134414, "пусто")
			end
		end
	end
	local kickList
	testQ["gUp"] = {}
	for Zc=1,GetNumGuildMembers(true) do
		local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
		testQ["gUp"][Zc] = officerNote
		level = tonumber(level)
		if string.find(testQ['spisok'],name) == nil then
			if rankName == "И.О. Констебля" then
			print(rankName,name)
			testQ['spisok'] = testQ['spisok'] .. name
				if officerNote == "" and publicNote == "" then
					--SendChatMessage(name .. " " .. level .. " лвл " .. rankName, "OFFICER", nil, 1)
					--print(name .. " " .. level .. " лвл " .. yearsOffline .. " лет " .. monthsOffline .. " месяцев " .. daysOffline .. " дней " .. hoursOffline .. " часов")
					GuildPromote(name)
					if kickList == nil then
						kickList = "/gpromote " .. name .. "\n"
					else
						kickList = kickList .. "/gpromote " .. name .. "\n"
					end
				end
				if message ~= "" then
                    GuildPromote(name)
				end
			end
		end
	end
	local testMacro
	for i=1,36 do
		testMacro = GetMacroInfo(i)
		if testMacro ~= nil then
			testMacro = mysplit(testMacro)
			if testMacro[1] == "NSQC" then
				EditMacro(i, "NSQC", 134414, kickList)
			end
		end
	end
	FriendsFrame:Hide()
end

if kod=="#prEnGD" and msg[1] == myNome and gmTest~=nil then
	if testQ ~= nil then
		if testQ[myNome] ~= nil then
			testQ[myNome]["zzlf"] = tonumber(msg[2])
		end
	end
end
if kod=="#podskNum" and msg[1] == myNome then
	if krt ~= nil then
		krt["podskazki"] = tonumber(msg[2])
	end
end

if kod=="#shMp" and msg[1] == myNome then
		SendAddonMessage("#mioPdsk " .. myNome, krt["podskazki"], "guild")
end
if kod=="#chd" and msg[1] == myNome then
	if testQ["chD"] == nil then
		testQ["chD"] = {}
	end
	testQ["chD"][tostring(msg[2])] = tonumber(msg[3])
end
if kodMsg[1] == "#itemQName" and kodMsg[2] == myNome then
	testQ[myNome]["itemName"] = message
end
if kodMsg[1] == "#itemQNum" and kodMsg[2] == myNome then
	testQ[myNome]["itemNum"] = message
end
if kodMsg[1] == "#itemQ" and kodMsg[2] == myNome then
	testQ[myNome]["взятый_квест"] = message
	btn[7]:Enable()
	btn[8]:Enable()
	btn[1]:Hide()
	btn[2]:Show()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end
if kodMsg[1] == "#itemQEnStuck" and kodMsg[2] == myNome then
	testQ[myNome]["itemEnStuck"] = message
end
if kodMsg[1] == "#отправить_заметку" and kodMsg[2] == myNome then
	if GuildMemberDetailFrame:IsVisible() then
		testQ["tempZametka"] = {}
		testQ["tempZametka"][kodMsg[3]] = message
	end
end
if kodMsg[1] == "#очистка_отзывов" then
	if GuildMemberDetailFrame:IsVisible() then
		if testQ["tempOtzyv"] == nil then
        	testQ["tempOtzyv"] = {}
    	end
		testQ["tempOtzyv"][message] = {}
	end
end
if kodMsg[1] == "#отправить_отзыв" and kodMsg[2] == myNome then
	table.insert(testQ["tempOtzyv"][kodMsg[3]],message)
end
if kodMsg[1] == "pamyatkaNS" and sender == myNome then
	if zametki[kodMsg[2]] == nil then
		zametki[kodMsg[2]] = {}
	end
	zametki[kodMsg[2]] = message
	SendChatMessage("Заметка о персонаже " .. kodMsg[2] .. " добавлена", "OFFICER", nil, 1)
end
if kod == "NSVersion" then
        SendAddonMessage("Текущая версия", versAdd .. "." .. versAddDop, "guild")
end
if kod=="NSGadd" then
if string.find (message, "#aaa") or string.find (message, "#aao") then
	if string.find (message, myNome) then
		msg1 = mysplit(message)
		msg1TestLvl=msg1[1]
		if msg1TestLvl=="#aaa" then
			msg1 = msg1[3]
			msg1 = tonumber(msg1)
			id, name, points, completed, month, day, year, description, flags, icon, rewardText, 	isGuildAch = GetAchievementInfo(msg1)
			if completed == true then
				SendAddonMessage("NSGadd", "#aab " .. msg1, "guild")
			else
				SendAddonMessage("NSGadd", "#aac " .. msg1, "guild")
			end
		elseif msg1TestLvl=="#aao" then
			msg1 = msg1[3]
			msg1 = tonumber(msg1)
			id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
			if completed == true then
				SendAddonMessage("NSGadd", "#aap " .. msg1, "guild")
			else
				SendAddonMessage("NSGadd", "#aaq " .. msg1, "guild")
			end
		end
	end
end
local myNome = GetUnitName("player")
if string.find (message, "#aaf") and string.find (message, myNome) then
	if testQ[myNome]["лвл_квестов"]~="2" and testQ[myNome]["лвл_квестов"]~="3" then
		proverka_komandy=mysplit(message)
		msg1=proverka_komandy[3]
		msg1 = tonumber(msg1)
		id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
		if completed == true then
			SendAddonMessage("NSGadd", "#aag " .. msg1, "guild")
			SendChatMessage("Я выполнил ачивку " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) , "OFFICER", nil, 1)
			btn[1]:Enable()
			btn[1]:Show()
			btn[7]:Disable()
			btn[7]:SetText("Нет взятых квестов")
			btn[8]:Disable()
			btn[8]:SetText("Нет взятых квестов")
			btn[2]:Hide()
			btn[2]:Disable()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
			SendChatMessage("*Квест еще не выполнен.", "OFFICER", nil, 1)
		end
	elseif testQ[myNome]["лвл_квестов"]=="2" then
		proverka_komandy=mysplit(message)
		msg1=proverka_komandy[3]
		msg1=tonumber(msg1)
		if testQ[myNome]["квест_лвл2"][msg1] ~= nil then
			mozhnoLiSdatChislo11=testQ[myNome]["квест_лвл2"][msg1]
		else
			msg1=tostring(msg1)
			mozhnoLiSdatChislo11=testQ[myNome]["квест_лвл2"][msg1]
		end
		msg1=tonumber(msg1)
		mozhnoLiSdatChislo11=tonumber(mozhnoLiSdatChislo11)
		j=0
		k=0

		count = GetAchievementNumCriteria(msg1)
		for i=1, count do
			local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msg1, i);
			prov=completed
			if prov == true then
				j=j+1
			else
				k=k+1
			end
			i=i+1
		end
		if j>=mozhnoLiSdatChislo11 then
			SendAddonMessage("NSGadd", "#zzk " .. j .. " " .. msg1 .. " " .. mozhnoLiSdatChislo11, "guild")
			SendChatMessage("Я сделал " .. j .. " пунктов ачивки " .. GetAchievementLink(msg1) .. " из " .. mozhnoLiSdatChislo11, "OFFICER", nil, 1)
			btn[1]:Enable()
			btn[1]:Show()
			btn[1]:SetText("Взять квест")
			testQ[myNome]["взятый_квест"]="9999"
		else
		end
	elseif testQ[myNome]["лвл_квестов"]=="3" then
		if testQ[myNome]["взятый_квест3_2"] == "vzyat" then
			proverka_komandy=mysplit(message)
			msg1=proverka_komandy[3]
			msg1 = tonumber(msg1)
			if testQ[myNome]["квест_лвл3"][msg1] ~= nil then
				mozhnoLiSdatChislo=testQ[myNome]["квест_лвл3"][msg1]
			else
				msg1 = tostring(msg1)
				mozhnoLiSdatChislo=testQ[myNome]["квест_лвл3"][msg1]
			end
			msg1 = tonumber(msg1)
			mozhnoLiSdatChislo=tonumber(mozhnoLiSdatChislo)
			j=0
			k=0
			count = GetAchievementNumCriteria(msg1)
			for i=1, count do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msg1, i);
				prov=completed
				if prov == true then
					j=j+1
				else
					k=k+1
				end
				i=i+1
			end

			if j>=mozhnoLiSdatChislo then
				SendAddonMessage("NSGadd", "#zzk " .. j .. " " .. msg1 .. " " .. mozhnoLiSdatChislo, "guild")
				SendChatMessage("Я сделал " .. j .. " пунктов ачивки " ..  GetAchievementLink(msg1) .. " из " .. mozhnoLiSdatChislo, "OFFICER", nil, 1)
				btn[1]:Enable()
				btn[1]:Show()
				btn[1]:SetText("Взять квест")
				testQ[myNome]["взятый_квест"]="9999"
			else
			end
		elseif testQ[myNome]["взятый_квест3_1"] == "vzyat" then
			proverka_komandy=mysplit(message)
			msg1=proverka_komandy[3]
			msg1 = tonumber(msg1)
			id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(msg1)
			if completed == true then
				SendAddonMessage("NSGadd", "#aag " .. msg1, "guild")
				SendChatMessage("Я выполнил ачивку " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) , "OFFICER", nil, 1)
				btn[1]:Enable()
				btn[1]:Show()
				btn[1]:SetText("Взять квест")
				testQ[myNome]["взятый_квест"]="9999"
			else
				SendChatMessage("*Квест еще не выполнен.", "OFFICER", nil, 1)
			end
		end
	end
end

if string.find (message, "#aa3") and string.find (message, myNome) then
	testQ[myNome]["лвл_квестов"]="3"
end

if string.find (message, "!crtb") and sender == myNome then
	print("1")
	if rangeGen == nil then
		rangeGen = {}
	end
	local uni = UnitGUID("Target")
	uni = tostring(uni)
	if rangeGen[uni] == nil then
		rangeGen[uni] = {}
	end
	rangeGen[uni] = {}
	local n,ni = UnitName("target")
	rangeGen[uni]["имя"] = n
	rangeGen[uni]["айди"] = uni

end

if string.find (message, "#aah") or string.find (message, "#aan") then
	if string.find (message, myNome) then
		msgQLVL2 = mysplit(message)
		if msgQLVL2[1] == "#aah" then
			testQ[myNome]["лвл_квестов"]="2"
			msgQLVL2 = msgQLVL2[3]
			msgQLVL2 = tonumber(msgQLVL2)
			j=0
			k=0
			count = GetAchievementNumCriteria(msgQLVL2)
			for i=1, count do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgQLVL2, i);
				prov=completed
				if prov == true then
					j=j+1
				else
					k=k+1
				end
				i=i+1
			end
			if k==0 then
				SendAddonMessage("NSGadd", "#aai " .. msgQLVL2, "guild")
			else
				SendAddonMessage("NSGadd", "#aaj " .. k .. " " .. count .. " " .. msgQLVL2, "guild")
			end
		elseif msgQLVL2[1] == "#aan" then
			testQ[myNome]["лвл_квестов"]="3"
			msgQLVL2 = msgQLVL2[3]
			msgQLVL2 = tonumber(msgQLVL2)
			j=0
			k=0
			count = GetAchievementNumCriteria(msgQLVL2)
			for i=1, count do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgQLVL2, i);
				prov=completed
				if prov == true then
					j=j+1
				else
					k=k+1
				end
				i=i+1
			end
			if k==0 then
				SendAddonMessage("NSGadd", "#aar " .. msgQLVL2, "guild")
			else
				SendAddonMessage("NSGadd", "#aas " .. k .. " " .. count .. " " .. msgQLVL2, "guild")
			end
		end
	end
end
if message == "#показывайАчивкуСтатУже" then
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10 = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["q3Stat"]), 1)
	SendChatMessage(sender .. ", сейчас у меня выполнено " .. arg4 .. " пунктов ачивки " .. testQ[myNome]["q3Stat"], "officer", nil, 1)
	SendAddonMessage("NSGadd", "#дайДоброНаСтат", "guild")
end
local myNome = GetUnitName("player")
if string.find (message, "#aae") or string.find (message, "#aaq") then
	if string.find (message, myNome) then
		msg13 = mysplit(message)
		if msg13[1] == "#aae" then
			if testQ[myNome]["квест_лвл3"] == nil then
				testQ[myNome]["квест_лвл3"] = {}
			end
			msg13 = msg13[3]
			testQ[myNome]["взятый_квест"]=msg13
			table.insert(testQ[myNome]["квест_лвл3"],msg13)
			testQ[myNome]["взятый_квест3_1"]="vzyat"
			testQ[myNome]["взятый_квест3_2"]="nevzyat"
			SendAddonMessage("NSGadd", "#показать_ачивку3один", "guild")
		elseif msg13[1] == "#aaq" then
			if testQ[myNome]["квест_лвл3"] == nil then
				testQ[myNome]["квест_лвл3"] = {}
			end
			msg13 = msg13[3]
			testQ[myNome]["взятый_квест"]=msg13
			table.insert(testQ[myNome]["квест_лвл3"],msg13)
			testQ[myNome]["взятый_квест3_2"]="vzyat"
			testQ[myNome]["взятый_квест3_1"]="nevzyat"
		end
		btn[7]:Enable()
		btn[8]:Enable()
		btn[7]:SetText("Отменить квест")
		btn[8]:SetText("Узнать квест")
	end
end
if msg[1] == "#показал_ачивку3один" and msg[2] == myNome then
	SendChatMessage(sender .. ", ачивка " .. GetAchievementLink(testQ[myNome]["взятый_квест"]) .. " еще не выполнена", "OFFICER", nil, 1)
	SendAddonMessage("NSGadd", "#ачивка_3один_нету", "guild")
end
if string.find (message, "#xxx") and string.find (message, myNome) then
	btn[1]:Enable()
	btn[1]:Show()
	btn[1]:SetText("Взять квест")
	testQ[myNome]["взятый_квест"]="9999"
	testQ[myNome]["q33q"]=nil
	testQ[myNome]["q33nik"][1] = nil
	testQ[myNome]["q33nik"][2] = nil
	testQ[myNome]["q33nik"][3] = nil
	testQ[myNome]["взятый_квест3_2"] = nil
	testQ[myNome]["взятый_квест3_1"] = nil
	testQ[myNome]["q3Stat"] = nil
	testQ[myNome]["q3stStart"] = nil
	testQ[myNome]["q3StatNum"] = nil
	testQ[myNome]["q3StatTemp"] = nil
	testQ[myNome]["itemName"] = nil
	testQ[myNome]["itemNum"] = nil
	testQ[myNome]["itemEnStuck"] = nil
	testQ[myNome]["itemQend"] = nil
	SendAddonMessage("NSGadd", "#qUpdate", "guild")
	btn[7]:Disable()
	btn[7]:SetText("Нет взятых квестов")
	btn[8]:Disable()
	btn[8]:SetText("Нет взятых квестов")
	btn[2]:Hide()
	btn[2]:Disable()
end

if string.find (message, "#questTimerID2") and sender == myNome then
	testQ["timerID2"] = 60
	btn[2]:Disable()
	btn[1]:Disable()
end

if string.find (message, "#aak") and string.find (message, myNome) then
	msgVzyalQ2=mysplit(message)
	msgVzyalQ2=msgVzyalQ2[3]
	msgVzyalQ2=tonumber(msgVzyalQ2)
	if testQ[myNome]==nil then
		testQ[myNome]={}
	end
	if testQ[myNome]["квест_лвл2"]==nil then
		testQ[myNome]["квест_лвл2"]={}
	end
	if testQ[myNome]["квест_лвл3"]==nil then
		testQ[myNome]["квест_лвл3"]={}
	end
	if testQ[myNome]["лвл_квестов"] == "2" then
		count = GetAchievementNumCriteria(msgVzyalQ2)
		count = tonumber(count)
		testQ[myNome]["квест_лвл2"][msgVzyalQ2]=count
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		SendAddonMessage("NSGadd", "#qUpdate", "guild")
		SendAddonMessage("NSGadd", "#отобразить_квест_ачивки_нум", "guild")
	end
	if testQ[myNome]["лвл_квестов"] == "3" then
		count = GetAchievementNumCriteria(msgVzyalQ2)
		count = tonumber(count)
		testQ[myNome]["квест_лвл3"][msgVzyalQ2]=count
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		SendAddonMessage("NSGadd", "#qUpdate", "guild")
		SendAddonMessage("NSGadd", "#отобразить_квест_ачивки_нум", "guild")
	end
end

if msg[1] == "#ShowAchAAK" and msg[2] == myNome then
	SendChatMessage(sender .. " ачивка " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) .. " еще не выполнена", "OFFICER", nil, 1)
	SendAddonMessage("NSGadd", "#ачивкуПоказал", "guild")
end

if string.find (message, "#cls") and sender == myNome then
	testQ[myNome]["отключить_поиск"]="тру"
	testQ[myNome]["старт_поиска_нпц"] = time()

end



if string.find (message, "#krt") and sender == myNome then
	if krt == nil then
		krt = {}
	else
		if krt["777"] == nil then
			local testKont = GetCurrentMapContinent()
			testKont = tonumber(testKont)
			if testKont == 1 then
				local lok = GetCurrentMapZone()
				lok = tonumber(lok)
				if lok == 0 then
					if krt["99"] == nil then
						btnF:SetChecked(true)
						krt["99"] = true
						if krt["1"] == true then
							mostraKrtl2("Show",316,576,316,576,1,1,12)
							mostraKrtl2("Show",316,576,316,576,1,1,12)
							mostraKrtl2("Show",320,580,410,569,50,1,3)
						end
						if krt["2"] == true then
							mostraKrtl2("Show",496,554,496,554,1,1,12)
							mostraKrtl2("Show",496,554,496,554,1,1,12)
							mostraKrtl2("Show",500,558,490,508,50,1,3)
						end
						if krt["3"] == true then
							mostraKrtl2("Show",616,561,616,561,1,1,12)
							mostraKrtl2("Show",616,561,616,561,1,1,12)
							mostraKrtl2("Show",620,565,617,510,100,1,3)
						end
						if krt["4"] == true then
							mostraKrtl2("Show",316,421,316,421,1,1,12)
							mostraKrtl2("Show",316,421,316,421,1,1,12)
							mostraKrtl2("Show",320,425,325,370,100,1,3)
						end
						if krt["5"] == true then
							mostraKrtl2("Show",471,426,471,426,1,1,12)
							mostraKrtl2("Show",471,426,471,426,1,1,12)
							mostraKrtl2("Show",471,426,550,500,100,1,3)
						end
						if krt["6"] == true then
							mostraKrtl2("Show",611,436,611,436,1,1,12)
							mostraKrtl2("Show",611,436,611,436,1,1,12)
							mostraKrtl2("Show",615,440,610,390,100,1,3)
						end
						if krt["7"] == true then
							mostraKrtl2("Show",326,311,326,311,1,1,12)
							mostraKrtl2("Show",326,311,326,311,1,1,12)
							mostraKrtl2("Show",330,315,362,250,50,1,3)
						end
						if krt["8"] == true then
							mostraKrtl2("Show",421,321,676,371,1,1,12)
							mostraKrtl2("Show",421,321,676,371,1,1,12)
							mostraKrtl2("Show",425,325,525,344,100,1,3)
						end
						if krt["9"] == true then
							mostraKrtl2("Show",660,346,660,346,1,1,12)
							mostraKrtl2("Show",660,346,660,346,1,1,12)
							mostraKrtl2("Show",664,350,534,360,200,1,3)
						end
						if krt["10"] == true then
							mostraKrtl2("Show",296,151,296,151,1,1,12)
							mostraKrtl2("Show",296,151,296,151,1,1,12)
							mostraKrtl2("Show",300,155,307,250,50,1,3)
						end
						if krt["11"] == true then
							mostraKrtl2("Show",471,246,676,451,1,1,12)
							mostraKrtl2("Show",471,246,676,451,1,1,12)
							mostraKrtl2("Show",475,250,500,275,50,1,3)
						end
						if krt["12"] == true then
							mostraKrtl2("Show",586,226,586,226,1,1,12)
							mostraKrtl2("Show",586,226,586,226,1,1,12)
							mostraKrtl2("Show",590,230,540,217,100,1,3)
						end
						if krt["13"] == true then
							mostraKrtl2("Show",381,106,381,106,1,1,12)
							mostraKrtl2("Show",381,106,381,106,1,1,12)
							mostraKrtl2("Show",385,110,410,118,50,1,3)
						end
						if krt["14"] == true then
							mostraKrtl2("Show",456,46,456,46,1,1,12)
							mostraKrtl2("Show",456,46,456,46,1,1,12)
							mostraKrtl2("Show",460,50,550,43,50,1,3)
						end
						if krt["15"] == true then
							mostraKrtl2("Show",596,36,596,36,1,1,12)
							mostraKrtl2("Show",596,36,596,36,1,1,12)
							mostraKrtl2("Show",600,40,548,140,50,1,3)
						end

						if krt["999"] ~= nil then
							local num = 1
							local x = 973
							local y = 637
							for i=1,krt["999"] do
								chMuestro(num,x,y)
								num = num + 1
								y = y - 32
							end
							local chern = krt["999"]
							for i = 1, krt["999"] do
								if chern >=1 then
									if krt["1"] == true and krt["2"] == true and chern >= 1 then
										mostraKrtl2("Show",320,580,500,558,150,1,3)
										chern = chern - 1
									end
									if krt["2"] == true and krt["5"] == true and chern >= 1 then
										mostraKrtl2("Show",500,558,475,430,150,1,3)
										chern = chern - 1
									end
									if krt["5"] == true and krt["3"] == true and chern >= 1 then
										mostraKrtl2("Show",471,426,620,565,100,1,3)
										chern = chern - 1
									end
									if krt["3"] == true and krt["6"] == true and chern >= 1 then
										mostraKrtl2("Show",620,565,615,440,100,1,3)
										chern = chern - 1
									end
									if krt["6"] == true and krt["12"] == true and chern >= 1 then
										mostraKrtl2("Show",615,440,590,230,100,1,3)
										chern = chern - 1
									end
									if krt["12"] == true and krt["10"] == true and chern >= 1 then
										mostraKrtl2("Show",590,230,300,155,150,1,3)
										chern = chern - 1
									end
									if krt["10"] == true and krt["4"] == true and chern >= 1 then
										mostraKrtl2("Show",300,155,320,425,150,1,3)
										chern = chern - 1
									end
									if krt["4"] == true and krt["7"] == true and chern >= 1 then
										mostraKrtl2("Show",320,425,330,315,100,1,3)
										chern = chern - 1
									end
									if krt["7"] == true and krt["14"] == true and chern >= 1 then
										mostraKrtl2("Show",330,315,460,50,150,1,3)
										chern = chern - 1
									end
									if krt["14"] == true and krt["15"] == true and chern >= 1 then
										mostraKrtl2("Show",460,50,600,40,150,1,3)
										chern = chern - 1
									end
									if krt["15"] == true and krt["1"] == true and chern >= 1 then
										mostraKrtl2("Show",600,40,320,580,300,1,3)
										chern = chern - 1
									end
									if krt["8"] == true and chern >= 1 then
										mostraKrtl2("Show",425,325,680,375,200,1,3)
										chern = chern - 1
									end
									if krt["9"] == true and chern >= 1 then
										mostraKrtl2("Show",664,350,250,381,200,1,3)
										chern = chern - 1
									end
									if krt["11"] == true and chern >= 1 then
										mostraKrtl2("Show",475,250,680,455,200,1,3)
										chern = chern - 1
									end
									if krt["13"] == true and chern >= 1 then
										mostraKrtl2("Show",385,110,700,210,200,1,3)
										chern = chern - 1
									end
								else
									break
								end
							end
						end
					end
				else
					krt["99"] = nil
					krtHide("Hide")
					btnF:SetChecked(false)
				end
			end
		else
			if krt["777"] == 2 then
			local lok = GetCurrentMapZone()
			lok = tonumber(lok)
				if lok == 10 then
					if krt["99"] == nil then
						krt["99"] = true
						btnF:SetChecked(true)
						if krt["21"] == true then
							mostraKrtl2("Show",96,546,96,46,1,1,12)
							mostraKrtl2("Show",96,546,96,46,1,1,12)
							mostraKrtl2("Show",100,550,132,475,50,1,3)
						end
						if krt["22"] == true then
							mostraKrtl2("Show",171,371,171,371,1,1,12)
							mostraKrtl2("Show",171,371,171,371,1,1,12)
							mostraKrtl2("Show",175,375,275,435,100,1,3)
						end
						if krt["23"] == true then
							mostraKrtl2("Show",446,536,446,536,1,1,12)
							mostraKrtl2("Show",446,536,446,536,1,1,12)
							mostraKrtl2("Show",450,540,500,500,50,1,3)
						end
						if krt["24"] == true then
							mostraKrtl2("Show",561,446,561,446,1,1,12)
							mostraKrtl2("Show",561,446,561,446,1,1,12)
							mostraKrtl2("Show",565,450,613,500,100,1,3)
						end
						if krt["25"] == true then
							mostraKrtl2("Show",671,561,671,561,1,1,12)
							mostraKrtl2("Show",671,561,671,561,1,1,12)
							mostraKrtl2("Show",675,565,750,564,50,1,3)
						end
						if krt["26"] == true then
							mostraKrtl2("Show",816,559,816,559,1,1,12)
							mostraKrtl2("Show",816,559,816,559,1,1,12)
							mostraKrtl2("Show",820,563,795,500,50,1,3)
						end
							if krt["27"] == true then
							mostraKrtl2("Show",621,71,621,71,1,1,12)
							mostraKrtl2("Show",621,71,621,71,1,1,12)
							mostraKrtl2("Show",625,75,750,103,50,1,3)
						end
						if krt["28"] == true then
							mostraKrtl2("Show",846,121,846,121,1,1,12)
							mostraKrtl2("Show",846,121,846,121,1,1,12)
							mostraKrtl2("Show",850,125,750,122,50,1,3)
						end
						if krt["29"] == true then
							mostraKrtl2("Show",71,96,71,96,1,1,12)
							mostraKrtl2("Show",71,96,71,96,1,1,12)
							mostraKrtl2("Show",75,100,250,74,100,1,3)
						end
						if krt["30"] == true then
							mostraKrtl2("Show",396,46,396,46,1,1,12)
							mostraKrtl2("Show",396,46,396,46,1,1,12)
							mostraKrtl2("Show",400,50,250,150,100,1,3)
						end
						if krt["31"] == true then
							mostraKrtl2("Show",96,246,96,246,1,1,12)
							mostraKrtl2("Show",96,246,96,246,1,1,12)
							mostraKrtl2("Show",100,250,250,240,100,1,3)
						end
						if krt["32"] == true then
							mostraKrtl2("Show",296,361,296,361,1,1,12)
							mostraKrtl2("Show",296,361,296,361,1,1,12)
							mostraKrtl2("Show",300,365,450,346,200,1,3)
						end
						if krt["33"] == true then
							mostraKrtl2("Show",371,296,371,296,1,1,12)
							mostraKrtl2("Show",371,296,371,296,1,1,12)
							mostraKrtl2("Show",375,300,500,328,100,1,3)
						end
						if krt["34"] == true then
							mostraKrtl2("Show",896,246,896,246,1,1,12)
							mostraKrtl2("Show",896,246,896,246,1,1,12)
							mostraKrtl2("Show",900,250,750,285,100,1,3)
						end

						if krt["21"] == true and krt["22"] == true then
							if testQ["evO0102"] == true then
								mostraKrtl2("Show",100,550,175,375,100,1,3)
							end
						end
						if krt["22"] == true and krt["23"] == true then
							if testQ["evO0203"] == true then
								mostraKrtl2("Show",175,375,450,540,150,1,3)
							end
						end
						if krt["23"] == true and krt["24"] == true then
							if testQ["evO0304"] == true then
								mostraKrtl2("Show",450,540,565,450,100,1,3)
							end
						end
						if krt["24"] == true and krt["25"] == true then
							if testQ["evO0405"] == true then
								mostraKrtl2("Show",565,450,675,565,100,1,3)
							end
						end
						if krt["25"] == true and krt["26"] == true then
							if testQ["evO0506"] == true then
								mostraKrtl2("Show",675,565,820,563,100,1,3)
							end
						end
						if krt["26"] == true and krt["27"] == true then
							if testQ["evO0607"] == true then
								mostraKrtl2("Show",820,563,625,75,200,1,3)
							end
						end
						if krt["27"] == true and krt["28"] == true then
							if testQ["evO0708"] == true then
								mostraKrtl2("Show",625,75,850,125,100,1,3)
							end
						end
						if krt["28"] == true and krt["29"] == true then
							if testQ["evO0809"] == true then
								mostraKrtl2("Show",850,125,75,100,300,1,3)
							end
						end
						if krt["29"] == true and krt["30"] == true then
							if testQ["evO0910"] == true then
								mostraKrtl2("Show",75,100,400,50,200,1,3)
							end
						end
						if krt["30"] == true and krt["31"] == true then
							if testQ["evO1011"] == true then
								mostraKrtl2("Show",400,50,100,250,200,1,3)
							end
						end
						if krt["31"] == true then
							if testQ["evO11"] == true then
								mostraKrtl2("Show",100,250,1000,190,400,1,3)
							end
						end
						if krt["32"] == true then
							if testQ["evO12"] == true then
								mostraKrtl2("Show",300,365,1000,275,400,1,3)
							end
						end
						if krt["33"] == true then
							if testQ["evO13"] == true then
								mostraKrtl2("Show",375,300,1000,440,400,1,3)
							end
						end
						if krt["34"] == true then
							if testQ["evO14"] == true then
								mostraKrtl2("Show",900,250,0,460,400,1,3)
							end
						end

					else
						krt["99"] = nil
						krtHide("Hide")
						btnF:SetChecked(false)
					end
				end


			end
		end
	end
end

if string.find (message, "#opn") and sender == myNome then
	testQ[myNome]["отключить_поиск"]=nil
end

if string.find (message, "#crtPoint") and sender == myNome then
	SendAddonMessage("NSGadd", "!следить", "guild")
end

if string.find (message, "#ahtng") and sender == myNome then
	testQ=nil
end

if msg[1] == "#verS" and msg[2] == myNome then
	testQ["vers"] = {}
	testQ["vers"]["1"] = versAdd
	testQ["vers"]["2"] = msg[3]
end

if string.find (message, "#zz_x") and string.find (message, myNome) and testGM~=nil then
	testQ[myNome]["zzl"] = nil
	testQ[myNome]["btn3"] = 1
	if testQ[myNome]["zzlf"] ~= nil then
		testQ[myNome]["zzlf"] = testQ[myNome]["zzlf"] - bonusQuestF
	else
		testQ[myNome]["zzlf"] = 0
	end
end

if string.find (message, "#killdpoq") and string.find (message, myNome) and testGM~=nil then
	testQ[myNome]["zzl"] = nil
	testQ[myNome]["btn3"] = 1
	testQ[myNome]["zzlf"] = 0
end

if string.find (message, "#nuovoPoint") and sender ~= myNome then
nPoint=mysplit(message)
npcXY(nPoint[2],nPoint[3],nPoint[4],nPoint[5],nPoint[6])
print ("Приняты координаты " .. nPoint[6] .. " от " .. sender)
end

if string.find (message, "!следить") and sender == myNome then
	if WorldMapFrame:IsVisible() == nil then
		if npcScan == nil then
			npcScan = {}
		end
		testNpcScanDal = nil
		npcSK=GetCurrentMapContinent()
		npcSK=tostring(npcSK)
		npcSL=GetCurrentMapZone()
		npcSL=tostring(npcSL)
		if npcScan[npcSK] == nil then
			npcScan[npcSK] = {}
		end
		if npcScan[npcSK][npcSL] == nil then
			npcScan[npcSK][npcSL] = {}
		end
		local unitNome=UnitName("target")
		if unitNome ~= nil then
			npcPX, npcPY = GetPlayerMapPosition("player")
			npcPX=tostring(npcPX)
			npcPY=tostring(npcPY)
			if npcScan[npcSK][npcSL][unitNome] == nil then
				npcCount=1
				npcCount=tostring(npcCount)
				npcScan[npcSK][npcSL][unitNome] = {}
				npcScan[npcSK][npcSL][unitNome][npcCount] = {}
				npcScan[npcSK][npcSL][unitNome][npcCount]["x"] = npcPX
				npcScan[npcSK][npcSL][unitNome][npcCount]["y"] = npcPY
				SendAddonMessage("NSGadd", "#nuovoPoint " .. npcSK .. " " .. npcSL .. " " .. npcPX .. " " .. npcPY .. " " .. unitNome, "guild")
			else
				x,y=GetPlayerMapPosition("player")
				nomeRar={}
				npcTestToch={}
				i=0
				for key, val in pairs(npcScan[npcSK][npcSL]) do
					i=i+1
					nomeRar[i] = key
				end
				for j=1, #nomeRar do
					for key, val in pairs(npcScan[npcSK][npcSL][nomeRar[j]]) do
						for key, val in pairs(npcScan[npcSK][npcSL][nomeRar[j]][key]) do
							if key == "x" then
								xRar = val
							end
							if key == "y" then
								yRar = val
							end
						end
						npcRasstoyanie=sqrt((xRar-x)^2+(yRar-y)^2)

						if npcRasstoyanie<=0.04 then
							table.insert(npcTestToch, "тру")
						end
					end
					j=j+1
				end
				for i = 1, #npcTestToch do
					if npcTestToch[i] == "тру" then
						print ("Эта точка для юнита " .. unitNome .. " уже есть в базе")
						testNpcScanDal = 0
						break
					end
				end
				if testNpcScanDal ~= 0 then
					npcCount = (tablelength(npcScan[npcSK][npcSL][unitNome])) + 1
					npcCount=tostring(npcCount)
					npcPX=tostring(npcPX)
					npcPY=tostring(npcPY)
					npcScan[npcSK][npcSL][unitNome][npcCount] = {}
					npcScan[npcSK][npcSL][unitNome][npcCount]["x"] = npcPX
					npcScan[npcSK][npcSL][unitNome][npcCount]["y"] = npcPY
					SendAddonMessage("NSGadd", "#nuovoPoint " .. npcSK .. " " .. npcSL .. " " .. npcPX .. " " .. npcPY .. " " .. unitNome, "guild")
				end
			end
		else
			print ("Выбери цель")
		end
	else
		print ("Закрой карту")
	end
end

if string.find (message, "#aal") and string.find (message, myNome) then
	if testQ[myNome]==nil then
		testQ[myNome]={}
	end
	if testQ[myNome]["квест_лвл2"]==nil then
		testQ[myNome]["квест_лвл2"]={}
	end
	if testQ[myNome]["квест_лвл3"]==nil then
		testQ[myNome]["квест_лвл3"]={}
	end
	if testQ[myNome]["лвл_квестов"] == "2" then
		msgVzyalQ2=mysplit(message)
		msgVzyalQ2=msgVzyalQ2[3]
		j=0
		k=0
		count = GetAchievementNumCriteria(msgVzyalQ2)
		for i=1, count do
			local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgVzyalQ2, i);
			prov=completed
			if prov == true then
				j=j+1
			else
				k=k+1
			end
			i=i+1
		end
		j=j+3
		testQ[myNome]["квест_лвл2"][msgVzyalQ2]=j
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		SendAddonMessage("NSGadd", "#показать_ачивку3много", "guild")
	elseif testQ[myNome]["лвл_квестов"] == "3" then
		msgVzyalQ2=mysplit(message)
		msgVzyalQ2=msgVzyalQ2[3]
		msgVzyalQ2=tonumber(msgVzyalQ2)
		j=0
		k=0
		count = GetAchievementNumCriteria(msgVzyalQ2)
		for i=1, count do
			local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(msgVzyalQ2, i);
			prov=completed
			if prov == true then
				j=j+1
			else
				k=k+1
			end
			i=i+1
		end
		j=j+3
		testQ[myNome]["квест_лвл3"][msgVzyalQ2]=j
		testQ[myNome]["взятый_квест"]=msgVzyalQ2
		testQ[myNome]["взятый_квест3_2"]="vzyat"
		testQ[myNome]["взятый_квест3_1"]="nevzyat"
		SendAddonMessage("NSGadd", "#показать_ачивку3много", "guild")
	end
	btn[7]:Enable()
	btn[8]:Enable()
	btn[7]:SetText("Отменить квест")
	btn[8]:SetText("Узнать квест")
end
if msg[1] == "#показалАчивку3много" and msg[2] == myNome then
	local count = GetAchievementNumCriteria(tonumber(testQ[myNome]["взятый_квест"]))
	j=0
	k=0
	for i=1, count do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["взятый_квест"]), i);
		local prov=completed
		if prov == true then
			j=j+1
		else
			k=k+1
		end
	end
	SendChatMessage(sender .. ", доступно " .. k .. " пунктов ачивки " .. GetAchievementLink(tonumber(testQ[myNome]["взятый_квест"])) .. " из " .. count, "officer", nil, 1)
	SendAddonMessage("NSGadd", "#выдайДоброНаАчивку3много", "guild")
end
if testGM~=nil then
local testXY
testXY=mysplit(message)
if testXY[1]=="#zzn" then
	framePos["hshXY"]=testXY[1]


    nX={}
    nY={}

    nX[1]=string.sub(testXY[2],1,1)
    nY[1]=string.sub(testXY[2],2,2)
    nX[2]=string.sub(testXY[2],3,3)
    nY[2]=string.sub(testXY[2],4,4)
    nX[3]=string.sub(testXY[2],5,5)
    nY[3]=string.sub(testXY[2],6,6)
    nX[4]=string.sub(testXY[2],7,7)
    nY[4]=string.sub(testXY[2],8,8)
    nX[5]=string.sub(testXY[2],9,9)
    nY[5]=string.sub(testXY[2],10,10)
    nX[6]=string.sub(testXY[2],11,11)
    nY[6]=string.sub(testXY[2],12,12)
    nX[7]=string.sub(testXY[2],13,13)
    nY[7]=string.sub(testXY[2],14,14)
    nX[8]=string.sub(testXY[2],15,15)
    nY[8]=string.sub(testXY[2],16,16)
    nXres=nX[1]..nX[2]..nX[3]..nX[4]..nX[5]..nX[6]..nX[7]..nX[8]
    nYres=nY[1]..nY[2]..nY[3]..nY[4]..nY[5]..nY[6]..nY[7]..nY[8]
	nXres="0."..nXres
	nYres="0."..nYres
	mioTime=1
	testRasstoyanie=0
	nKont=testXY[3]
	nLok=testXY[4]
	framePos["X"]=nXres
	framePos["Y"]=nYres
	framePos["kont"]=nKont
	framePos["lok"]=nLok
	framePos["mapViz"]=testXY[5]
end
end

end
end
)


local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 0.1 then
		timeElapsed = 0
		local myNome = GetUnitName("player")
		--if UnitHealth("player") == 0 then
			--if StaticPopup1Button2:IsVisible() then
				--StaticPopup1Button1:ClearAllPoints()
				--StaticPopup1Button1:SetPoint("CENTER", UIParent,"CENTER",333, 333)
			--end
		--end
		if testQ['np_inviz'] ~= nil then
			if UnitAffectingCombat("player") == 1 then
				local poison
				for i = 1, 16 do
					if UnitDebuff('target',i) ~= nil then
						if string.find(UnitDebuff('target',i), "Смертельный яд") then
							local o,t,tr,f,fi,s=UnitDebuff('target',i)
							poison = f
						end
					end
				end
				if poison ~= nil then
					if tonumber(poison) == 0 then
						if testQ['np_inviz'] == nil then
							unIcon(index+2999,100,6,razmer,7,"rg1p","hide",frame,"BOTTOMLEFT","TOPLEFT")
							unIcon(index+2999,100,6,razmer,7,"rg1p","show",frame,"BOTTOMLEFT","TOPLEFT")
						else
							unIcon(2999,100,6,1,10,"rg1p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							unIcon(2999,100,6,1,10,"rg1p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						end
						unText[2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg1p.tga")
					end
					if tonumber(poison) == 1 then
						if testQ['np_inviz'] == nil then
							unIcon(index+2999,100,6,razmer,7,"rg2p","hide",frame,"BOTTOMLEFT","TOPLEFT")
							unIcon(index+2999,100,6,razmer,7,"rg2p","show",frame,"BOTTOMLEFT","TOPLEFT")
						else
							unIcon(2999,100,6,1,10,"rg2p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							unIcon(2999,100,6,1,10,"rg2p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						end
						unText[2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg2p.tga")
					end
					if tonumber(poison) == 2 then
						if testQ['np_inviz'] == nil then
							unIcon(index+2999,100,6,razmer,7,"rg3p","hide",frame,"BOTTOMLEFT","TOPLEFT")
							unIcon(index+2999,100,6,razmer,7,"rg3p","show",frame,"BOTTOMLEFT","TOPLEFT")
						else
							unIcon(2999,100,6,1,10,"rg3p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							unIcon(2999,100,6,1,10,"rg3p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						end
						unText[2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg3p.tga")
					end
					if tonumber(poison) == 3 then
						if testQ['np_inviz'] == nil then
							unIcon(index+2999,100,6,razmer,7,"rg4p","hide",frame,"BOTTOMLEFT","TOPLEFT")
							unIcon(index+2999,100,6,razmer,7,"rg4p","show",frame,"BOTTOMLEFT","TOPLEFT")
						else
							unIcon(2999,100,6,1,10,"rg4p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							unIcon(2999,100,6,1,10,"rg4p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						end
						unText[2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg4p.tga")
					end
					if tonumber(poison) == 4 then
						if testQ['np_inviz'] == nil then
							unIcon(index+2999,100,6,razmer,7,"rg5p","hide",frame,"BOTTOMLEFT","TOPLEFT")
							unIcon(index+2999,100,6,razmer,7,"rg5p","show",frame,"BOTTOMLEFT","TOPLEFT")
						else
							unIcon(2999,100,6,1,10,"rg5p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							unIcon(2999,100,6,1,10,"rg5p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						end
						unText[2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg5p.tga")
					end
					if tonumber(poison) == 5 then
						if testQ['np_inviz'] == nil then
							unIcon(index+2999,100,6,razmer,7,"rg6p","hide",frame,"BOTTOMLEFT","TOPLEFT")
							unIcon(index+2999,100,6,razmer,7,"rg6p","show",frame,"BOTTOMLEFT","TOPLEFT")
						else
							unIcon(2999,100,6,1,10,"rg6p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							unIcon(2999,100,6,1,10,"rg6p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						end
						unText[2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg6p.tga")
					end
				else
					if testQ['np_inviz'] == nil then
						unIcon(index+2999,100,6,razmer,7,"rg1","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+2999,100,6,razmer,7,"rg1","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(2999,100,6,1,10,"rg1","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						unIcon(2999,100,6,1,10,"rg1","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg1.tga")

				end
				local cp = GetComboPoints("player","target")
				if tonumber(cp) == 0 then
					if testQ['np_inviz'] == nil then
						unIcon(index+1999,100,6,razmer,1,"rg1","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+1999,100,6,razmer,1,"rg1","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1999,100,6,1,4,"rg1","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						unIcon(1999,100,6,1,4,"rg1","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg1.tga")
				end
				if tonumber(cp) == 1 then
					if testQ['np_inviz'] == nil then
						unIcon(index+1999,100,6,razmer,1,"rg2","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+1999,100,6,razmer,1,"rg2","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1999,100,6,1,4,"rg2","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						unIcon(1999,100,6,1,4,"rg2","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg2.tga")
				end
				if tonumber(cp) == 2 then
					if testQ['np_inviz'] == nil then
						unIcon(index+1999,100,6,razmer,1,"rg3","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+1999,100,6,razmer,1,"rg3","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1999,100,6,1,4,"rg3","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						unIcon(1999,100,6,1,4,"rg3","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg3.tga")
				end
				if tonumber(cp) == 3 then
					if testQ['np_inviz'] == nil then
						unIcon(index+1999,100,6,razmer,1,"rg4","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+1999,100,6,razmer,1,"rg4","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1999,100,6,1,4,"rg4","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						unIcon(1999,100,6,1,4,"rg4","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg4.tga")
				end
				if tonumber(cp) == 4 then
					if testQ['np_inviz'] == nil then
						unIcon(index+1999,100,6,razmer,1,"rg5","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+1999,100,6,razmer,1,"rg5","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1999,100,6,1,4,"rg5","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						unIcon(1999,100,6,1,4,"rg5","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg5.tga")
				end
				if tonumber(cp) == 5 then
					if testQ['np_inviz'] == nil then
						unIcon(index+1999,100,6,razmer,1,"rg6","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+1999,100,6,razmer,1,"rg6","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1999,100,6,1,4,"rg6","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						unIcon(1999,100,6,1,4,"rg6","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg6.tga")
				end
				local m = UnitMana("player")
				local mm = UnitManaMax("player")
				local manaRez = m*100/mm
				local health = UnitHealth('target')
				local hm = UnitHealthMax('target')
				local healthRez = health*100/hm
				if testQ['np_inviz'] == nil then
				else
					unIcon(1000,100,6,1,-38,"rage0","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					--unT[1000]:SetFrameStrata("FULLSCREEN")
				end
				unIcon(1030,healthRez,6,1,-38,"rage","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
				unText[1030]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rage.tga")
				unText[1030]:SetWidth(healthRez)
				if testQ['np_inviz'] == nil then
					unIcon(index+999,100,5,razmer,0,"rage0","show",frame,"BOTTOMLEFT","TOPLEFT")
					--unT[index+999]:SetFrameStrata("FULLSCREEN")
				else
					unIcon(12999,100,6,1,0,"rage0","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					--unT[12999]:SetFrameStrata("FULLSCREEN")
				end

				local dru
				for i = 1, 24 do
					if UnitBuff("player",i) == "Облик кошки" then
						dru = 1
					end
					if UnitBuff("player",i) == "Облик медведя" or UnitBuff("player",i) == "Облик лютого медведя" then
						dru = 2
					end
				end
				if (UnitClass("player") == "Разбойник" or UnitClass("player") == "Разбойни  ца") or dru == 1 then
					if testQ['np_inviz'] == nil then
						unIcon(index,manaRez,5,razmer,0,"rage5","show",frame,"BOTTOMLEFT","TOPLEFT")
					else

						unIcon(1005,manaRez,6,1,0,"rage5","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1005]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rage2.tga")
				end
				if UnitClass("player") == "Воин" or dru == 2 then
					if testQ['np_inviz'] == nil then
						unIcon(index,manaRez,5,razmer,0,"rage1","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1005,manaRez,6,1,0,"rage1","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1005]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rage1.tga")
				end
				if UnitClass("player") ~= "Разбойник" and UnitClass("player") ~= "Разбойница" and dru == nil and UnitClass("player") ~= "Воин" then
					if testQ['np_inviz'] == nil then
						unIcon(index,manaRez,5,razmer,0,"rage5","show",frame,"BOTTOMLEFT","TOPLEFT")
					else
						unIcon(1005,manaRez,6,1,0,"rage5","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
					end
					unText[1005]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rage5.tga")
				end
				if testQ['np_inviz'] ~= nil then
					unText[1005]:SetWidth(manaRez)

				end
				if testQ['np_inviz'] == nil then
					for i = 1, 4 do
						sBtn[i]:ClearAllPoints()
					end
					sBtn[1]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",1, 1)
					sBtn[2]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",24, 1)
					sBtn[3]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",48, 1)
					sBtn[4]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",72, 1)
					sBtn[1]:SetWidth(24)
					sBtn[1]:SetHeight(24)
					sBtn[2]:SetWidth(24)
					sBtn[2]:SetHeight(24)
					sBtn[3]:SetWidth(24)
					sBtn[3]:SetHeight(24)
					sBtn[4]:SetWidth(24)
					sBtn[4]:SetHeight(24)
				else
					sBtn[1]:SetWidth(32)
					sBtn[1]:SetHeight(32)
					sBtn[2]:SetWidth(32)
					sBtn[2]:SetHeight(32)
					sBtn[3]:SetWidth(32)
					sBtn[3]:SetHeight(32)
					sBtn[4]:SetWidth(32)
					sBtn[4]:SetHeight(32)
					for i = 1, 4 do
						sBtn[i]:ClearAllPoints()
					end
					sBtn[1]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn1X'], testQ['sBtn1Y'])
					sBtn[2]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn2X'], testQ['sBtn2Y'])
					sBtn[3]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn3X'], testQ['sBtn3Y'])
					sBtn[4]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn4X'], testQ['sBtn4Y'])
				end
			else
				unIcon(12999,100,6,1,-4,"rage0","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
				unIcon(1005,manaRez,6,1,-4,"rage1","hide",frame,"BOTTOMLEFT","TOPLEFT")
				unIcon(1999,100,6,1,4,"rg5","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
				unIcon(2999,100,6,1,10,"rg5p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
				unIcon(1000,100,6,1,-44,"rage0","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
				unIcon(1030,healthRez,6,1,-44,"rage","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
			end
		end
		if UnitName("target") ~= "Хранитель энергии Эрегос" then
			if testQ[myNome]["настройки"]["auk"] == "Enable" then
				if classUnit == "Воин" or classUnit == "Паладин" or classUnit == "Рыцарь смерти" or classUnit == "Друид" then
					if UnitAffectingCombat("player") == 1 then
						local __,mt = UnitDetailedThreatSituation("player", "target")
						if UnitName("target") ~= nil then
							if tonumber(mt) ~= 3 then
								--PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
							end
						end
						local __,p1 = UnitDetailedThreatSituation("party1", "target")
						local __,p2 = UnitDetailedThreatSituation("party2", "target")
						local __,p3 = UnitDetailedThreatSituation("party3", "target")
						local __,p4 = UnitDetailedThreatSituation("party4", "target")
						local __,p5 = UnitDetailedThreatSituation("party5", "target")
						if tankNS ~= nil then
							if GetUnitName("party1") ~= tankNS and GetUnitName("party2") ~= tankNS and GetUnitName("party3") ~= tankNS and GetUnitName("party4") ~= tankNS and GetUnitName("party5") ~= tankNS then
								if tonumber(p1) == 3 or tonumber(p1) == 2 or tonumber(p2) == 3 or tonumber(p2) == 2 or tonumber(p3) == 3 or tonumber(p3) == 2 or tonumber(p4) == 3 or tonumber(p4) == 2 or tonumber(p5) == 3 or tonumber(p5) == 2 then
									PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
								end
							end
						end
					end
				end
			end
		end
		if UnitAffectingCombat("player") == 1 then
			if classUnit == "Рыцарь смерти" then
				if testQ[myNome]["настройки"]["debuff"] == "Enable" then
					local x,y = GetSpellCooldown("Кровоотвод")
					if x == 0 then
						if not sBtn[19]:IsVisible() then
							sBtn[19]:Show()
						end
					end
					local x1,y1 = GetSpellCooldown("Кровь вампира")
					if x1 == 0 then
						if not sBtn[15]:IsVisible() then
							sBtn[15]:Show()
						end
					end
					local x2,y2 = GetItemCooldown("Проржавевший костяной ключ")
					if x2 == 0 then
						if not sBtn[16]:IsVisible() then
							sBtn[16]:Show()
						end
					end
					local x3,y3 = GetSpellCooldown("Антимагический панцирь")
					if x3 == 0 then
						if not sBtn[17]:IsVisible() then
							sBtn[17]:Show()
						end
					end
					local x4,y4 = GetSpellCooldown("Незыблемость льда")
					if x4 == 0 then
						if not sBtn[18]:IsVisible() then
							sBtn[18]:Show()
						end
					end
					local x5,y5 = GetSpellCooldown("Захват рун")
					if x5 == 0 then
						if not sBtn[20]:IsVisible() then
							print('1')
							sBtn[20]:Show()
						end
					end
				end
			end
			testQ["skills"] = {}
			if testQ[myNome]["настройки"]["auk"] == "Enable" then
				if classUnit == "Шаман" or classUnit == "Шаманка" then
					if not TempEnchant1:IsVisible() then
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					end
					local shit = nil
					local tankSH = nil
					local r1 = UnitGroupRolesAssigned("party1")
					local r4 = UnitGroupRolesAssigned("party2")
					local r7 = UnitGroupRolesAssigned("party3")
					local r10 = UnitGroupRolesAssigned("party4")
					if r1 == true then
						tankSH = 1
						for i = 1, 24 do
							local x = UnitBuff("party1",i)
							if x == "Щит земли" then
								shit = 1

							end
						end
					end
					if r4 == true then
						tankSH = 1
						for i = 1, 24 do
							local x = UnitBuff("party2",i)
							if x == "Щит земли" then
								shit = 1
								tankSH = 1
							end
						end
					end
					if r7 == true then
						tankSH = 1
						for i = 1, 24 do
							local x = UnitBuff("party3",i)
							if x == "Щит земли" then
								shit = 1
								tankSH = 1
							end
						end
					end
					if r10 == true then
						tankSH = 1
						for i = 1, 24 do
							local x = UnitBuff("party4",i)
							if x == "Щит земли" then
								shit = 1
								tankSH = 1
							end
						end
					end
					if tankSH == 1 then
						if shit ~= 1 then
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\t.ogg")
						end
					end
				end
				--/dump Grid2LayoutHeader1UnitButton1:IsVisible()
				if testQ["skills"] == nil then
					testQ["skills"] = {}
				end
				if tblIcons then
					for k, v in pairs(tblIcons) do
						ochered(tblIcons[k]["name"],tblIcons[k]["pos"],tblIcons[k]["debuf"],tblIcons[k]["buf"],tblIcons[k]["prok"],tblIcons[k]["srav"],tblIcons[k]["seiv"],tblIcons[k]["runyk"],tblIcons[k]["runyl"],tblIcons[k]["runyn"])
					end
				end
				i = 1
				for k, v in pairs(testQ["skills"]) do
					local x,y,z = GetSpellCooldown(v)
					if testQ["skills"][k] ~= nil then
						if sBtn[i] ~= nil then
							if tblIcons[v]["icon"] ~= nil then
								sBtn[i]:SetNormalTexture(tblIcons[v]["icon"])
							end
							if x ~= nil and x ~= 0 then
								--print(x)
								--print(GetTime())
								--print (x,testQ["skills"][k])
								if tonumber((string.format("%u",(tonumber(x) - tonumber(GetTime() - tonumber(y)))))) ~= 0 then
									sBtn[i]:SetText(string.format("%u",(tonumber(x) - tonumber(GetTime() - tonumber(y)))))
								else
									sBtn[i]:SetText("")
								end
							else
								sBtn[i]:SetText("")
							end
							sBtn[i]:Show()
							i = i + 1
						end
					else
						if sBtn[i] ~= nil then
							sBtn[i]:SetNormalTexture("")
							sBtn[i]:Hide()
							i = i +1
						end
					end
				end

				if tablelength(testQ["skills"]) < 4 then
					for i = tablelength(testQ["skills"])+1, 4 do
						if sBtn[i] ~= nil then
							sBtn[i]:SetNormalTexture("")
						end
					end
				end
			else
				for i = 1, 4 do
					if sBtn[1] ~= nil then
						sBtn[i]:SetNormalTexture("")
					end
				end
			end
		else
			for i = 1, 4 do
				if sBtn[i] ~= nil and sBtn[i]:IsVisible() then
					sBtn[i]:SetNormalTexture("")
				end
			end
			for i = 15,20 do
				if sBtn[i] ~= nil then
					if sBtn[i]:IsVisible() then
						sBtn[i]:Hide()
					end
				end
			end
		end
		--[[if IsUsableSpell("Реванш") then
			sBtn[1]:SetNormalTexture("Interface\\Icons\\Ability_Warrior_Revenge")
			PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
		else
			if IsUsableSpell("Удар грома") then

			else
				sBtn[1]:SetNormalTexture("")
			end
		end
		if IsUsableSpell("Удар грома") then
			if IsUsableSpell("Реванш") then
				if GetSpellCooldown("Удар грома") == 0 then
					sBtn[2]:SetNormalTexture("Interface\\Icons\\Spell_Nature_ThunderClap")
				else
					sBtn[2]:SetNormalTexture("")
				end
			else
				sBtn[2]:SetNormalTexture("")
				if GetSpellCooldown("Удар грома") == 0 then
					sBtn[1]:SetNormalTexture("Interface\\Icons\\Spell_Nature_ThunderClap")
				else
					sBtn[1]:SetNormalTexture("")
				end
			end
		else
			if IsUsableSpell("Реванш") then
				sBtn[2]:SetNormalTexture("")
			else
				sBtn[1]:SetNormalTexture("")
				sBtn[2]:SetNormalTexture("")
			end
		end--]]
	end
end)
local txtNum = 1

local function OnEvent(self, event, isLogin, isReload)
	--SendAddonMessage("NSGadd", "#qUpdate", "guild")
	SendAddonMessage("NSGadd", "#ver", "guild")
	testQ['spisok'] = ""
	testQ["skills"] = nil
	SendAddonMessage("daiMneMojKod ", "", "guild")
	if not GpDb then
		gpDb_old = gpDb_old or GpDb_old:new({})
	end
	testQ['frames'] = testQ['frames'] or {}
    RestoreFramePositions(testQ['frames'])
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", OnEvent)

local function OnEvent1(self, event, isLogin, isReload)
	local myNome = GetUnitName("player")
	if testQ[myNome]["взятый_квест_b"] ~= nil then
		local test
		for i = 1, #testQ["uno_pa"] do
			if testQ["uno_pa"][i] == GetMinimapZoneText() then
				test = 1
			end
		end
		if test ~= 1 then
			local x = 0
			for i = 1, 5 do
				if string.find(strlower(GetMinimapZoneText()),strlower(testQ['ns_alfabetQ'][i])) ~= nil then
					testQ['ns_alfabetQ'][i] = 1
					table.insert(testQ["uno_pa"],GetMinimapZoneText())
					break
				else
					x = x + 1
				end
			end
			if NS_temp_loc2q == nil then
				NS_temp_loc2q = ""
			end
			if x == 5 then
				if string.find(NS_temp_loc2q, strlower(GetMinimapZoneText())) then
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("В этой локации нет нужных мне букв, начинаю заново")
					else
						SendChatMessage("В этой локации нет нужных мне букв, начинаю заново", "SAY", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				else
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("В этой локации нет нужных мне букв, начинаю заново")
					else
						SendChatMessage("В этой локации нет нужных мне букв, начинаю заново", "OFFICER", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				end
				for i = 1, 5 do
					testQ['ns_alfabetQ'][i] = testQ['ns_alfabetQ1'][i]
				end
				testQ["bukv"] = nil
				testQ["uno_pa"] = {}
			else
				testQ["bukv"] = ""
				for i = 1, 5 do
					if testQ['ns_alfabetQ'][i] ~= 1 then
						testQ["bukv"] = testQ["bukv"] .. testQ['ns_alfabetQ'][i]
					end
				end
				if string.find(NS_temp_loc2q, strlower(GetMinimapZoneText())) then
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("Локация добавлена. Остались буквы: " .. testQ["bukv"])
					else
						SendChatMessage("Локация добавлена. Остались буквы: " .. testQ["bukv"], "SAY", nil, 1)
					end
					
				else
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("Локация добавлена. Остались буквы: " .. testQ["bukv"])
					else
						SendChatMessage("Локация добавлена. Остались буквы: " .. testQ["bukv"], "OFFICER", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				end
			end
		end
	end
end

local f1 = CreateFrame("Frame")
f1:RegisterEvent("ZONE_CHANGED_INDOORS")
f1:SetScript("OnEvent", OnEvent1)

local function OnEvent2(self, event, isLogin, isReload)
	local myNome = GetUnitName("player")
	if testQ[myNome]["взятый_квест_b"] ~= nil then
		local test
		for i = 1, #testQ["uno_pa"] do
			if testQ["uno_pa"][i] == GetMinimapZoneText() then
				test = 1
			end
		end
		if test ~= 1 then
			local x = 0
			for i = 1, 5 do
				if string.find(strlower(GetMinimapZoneText()),strlower(testQ['ns_alfabetQ'][i])) ~= nil then
					testQ['ns_alfabetQ'][i] = 1
					table.insert(testQ["uno_pa"],GetMinimapZoneText())
					break
				else
					x = x + 1
				end
			end
			if NS_temp_loc2q == nil then
				NS_temp_loc2q = ""
			end
			if x == 5 then
				if string.find(NS_temp_loc2q, strlower(GetMinimapZoneText())) then
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("В этой локации нет нужных мне букв, начинаю заново")
					else
						SendChatMessage("В этой локации нет нужных мне букв, начинаю заново", "SAY", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				else
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("В этой локации нет нужных мне букв, начинаю заново")
					else
						SendChatMessage("В этой локации нет нужных мне букв, начинаю заново", "OFFICER", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				end
				for i = 1, 5 do
					testQ['ns_alfabetQ'][i] = testQ['ns_alfabetQ1'][i]
				end
				testQ["bukv"] = nil
				testQ["uno_pa"] = {}
			else
				testQ["bukv"] = ""
				for i = 1, 5 do
					if testQ['ns_alfabetQ'][i] ~= 1 then
						testQ["bukv"] = testQ["bukv"] .. testQ['ns_alfabetQ'][i]
					end
				end
				if string.find(NS_temp_loc2q, strlower(GetMinimapZoneText())) then
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("Локация добавлена. Остались буквы: " .. testQ["bukv"])
					else
						SendChatMessage("Локация добавлена. Остались буквы: " .. testQ["bukv"], "SAY", nil, 1)
					end
					
				else
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("Локация добавлена. Остались буквы: " .. testQ["bukv"])
					else
						SendChatMessage("Локация добавлена. Остались буквы: " .. testQ["bukv"], "OFFICER", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				end
			end
		end
	end
end


local f2 = CreateFrame("Frame")
f2:RegisterEvent("ZONE_CHANGED")
f2:SetScript("OnEvent", OnEvent2)

local function OnEvent3(self, event, isLogin, isReload)
	local myNome = GetUnitName("player")
	if testQ[myNome]["взятый_квест_b"] ~= nil then
		local test
		for i = 1, #testQ["uno_pa"] do
			if testQ["uno_pa"][i] == GetMinimapZoneText() then
				test = 1
			end
		end
		if test ~= 1 then
			local x = 0
			for i = 1, 5 do
				if string.find(strlower(GetMinimapZoneText()),strlower(testQ['ns_alfabetQ'][i])) ~= nil then
					testQ['ns_alfabetQ'][i] = 1
					table.insert(testQ["uno_pa"],GetMinimapZoneText())
					break
				else
					x = x + 1
				end
			end
			if NS_temp_loc2q == nil then
				NS_temp_loc2q = ""
			end
			if x == 5 then
				if string.find(NS_temp_loc2q, strlower(GetMinimapZoneText())) then
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("В этой локации нет нужных мне букв, начинаю заново")
					else
						SendChatMessage("В этой локации нет нужных мне букв, начинаю заново", "SAY", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				else
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("В этой локации нет нужных мне букв, начинаю заново")
					else
						SendChatMessage("В этой локации нет нужных мне букв, начинаю заново", "OFFICER", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				end
				for i = 1, 5 do
					testQ['ns_alfabetQ'][i] = testQ['ns_alfabetQ1'][i]
				end
				testQ["bukv"] = nil
				testQ["uno_pa"] = {}
			else
				testQ["bukv"] = ""
				for i = 1, 5 do
					if testQ['ns_alfabetQ'][i] ~= 1 then
						testQ["bukv"] = testQ["bukv"] .. testQ['ns_alfabetQ'][i]
					end
				end
				if string.find(NS_temp_loc2q, strlower(GetMinimapZoneText())) then
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("Локация добавлена. Остались буквы: " .. testQ["bukv"])
					else
						SendChatMessage("Локация добавлена. Остались буквы: " .. testQ["bukv"], "SAY", nil, 1)
					end
					
				else
					if testQ[myNome]["настройки"]["esc"] == "Enable" then
						print("Локация добавлена. Остались буквы: " .. testQ["bukv"])
					else
						SendChatMessage("Локация добавлена. Остались буквы: " .. testQ["bukv"], "OFFICER", nil, 1)
					end
					NS_temp_loc2q = NS_temp_loc2q .. strlower(GetMinimapZoneText())
				end
			end
		end
	end
end
local f3 = CreateFrame("Frame")
f3:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f3:SetScript("OnEvent", OnEvent3)

--[[
local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
local myNome = GetUnitName("player")
	if InterfaceOptionsCombatTextPanelHealing["value"] == "0" then
		if arg2 == "SPELL_HEAL" then
			testQ["cmbtNum"] = "+" .. tostring(arg12/1000):gsub("[.]", ",")
			testQ["cmbtTime"] = 1
		end
	end
end)--]]

-- local myNome = GetUnitName("player")
-- local GC_Sniffer = CreateFrame("Frame")
-- GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
-- GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
-- 	--bdf(myNome)
-- end)

local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GC_Sniffer:SetScript("OnEvent", function (timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
local myNome = GetUnitName("player")
	--print (arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17)
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
	if testQ[myNome]['q_stelth'] ~= nil then
		if GetZoneText() == testQ[myNome]['q_stelth']['mm'] then
			if testQ[myNome]['q_stelth']['start'] == 1 then
				if arg2 == "UNIT_DIED" then
					testQ[myNome]['q_stelth']['start'] = 2
					SendChatMessage("Я издаю слишком много шума и оставляю много следов. Это непрофессионально и количество опыта за квест будет снижено. ", "OFFICER", nil, 1)
				end
			elseif testQ[myNome]['q_stelth']['start'] == 2 then
				if arg2 == "UNIT_DIED" then
					testQ[myNome]['q_stelth']['start'] = 3
					SendChatMessage("Меня обнаружили, это окончательный провал. А чем тут делают харакирю?", "OFFICER", nil, 1)
				end
			end
		end
	end
	if testQ[myNome]["настройки"]["debuff"] == "Enable" then
		if arg10 == "Кровоотвод" then
			testQ['save5time'],testQ['save5timeF'] = GetSpellCooldown("Кровоотвод")
		end
		if arg10 == "Кровь вампира" then
			testQ['save1time'],testQ['save1timeF'] = GetSpellCooldown("Кровь вампира")
		end
		if arg10 == "Затвердевшая кожа" then
			testQ['save2time'],testQ['save2timeF'] = GetItemCooldown("Проржавевший костяной ключ")
		end
		if arg10 == "Антимагический панцирь" then
			testQ['save3time'],testQ['save3timeF'] = GetSpellCooldown("Антимагический панцирь")
		end
		if arg10 == "Незыблемость льда" then
			testQ['save4time'],testQ['save4timeF'] = GetSpellCooldown("Незыблемость льда")
		end
		if arg10 == "Захват рун" then
			testQ['save6time'],testQ['save6timeF'] = GetSpellCooldown("Захват рун")
		end
	end
		-- local x = GetScreenWidth()
		-- local y = GetScreenHeight()
		-- local buf

		-- if prokIcons ~= nil then
		-- 	for k, v in pairs(prokIcons) do
		-- 		for j, l in pairs(prokIcons[k]) do


		-- 		if arg2 == "SPELL_AURA_APPLIED" or arg2 == "SPELL_CAST_SUCCESS" then
		-- 				if arg4 == myNome then
		-- 					if arg10 == prokIcons[k]["name"] or arg10 == prokIcons[k]["skill"] then
		-- 						local tempStack
		-- 						for i = 1, 24 do
		-- 							local bNome,__,__,numStack = UnitBuff(myNome,i)
		-- 							if arg2 == "SPELL_CAST_SUCCESS" then
		-- 								if prokIcons[k]["name"] == bNome then
		-- 									if tonumber(numStack) ==  tonumber(prokIcons[k]["stack"])-1 then
		-- 										tempStack = 1
		-- 									end
		-- 								end
		-- 							end
		-- 							if arg2 == "SPELL_AURA_APPLIED" then
		-- 								if prokIcons[k]["name"] == bNome then
		-- 									if tonumber(prokIcons[k]["stack"]) == 0 then
		-- 										tempStack = 1
		-- 									end
		-- 									if tonumber(numStack) == 0 then
		-- 										numStack = 1
		-- 									end
		-- 									if tonumber(numStack) ==  tonumber(prokIcons[k]["stack"]) then
		-- 										tempStack = 1
		-- 									end
		-- 								end
		-- 							end
		-- 						end
		-- 						if tempStack == 1 then
		-- 							if prokIcons[k]["profil"] == 4 then
		-- 								unIcon(tonumber(prokIcons[k]["spellNum"]),x,y,0+prok_set4["x"],0+prok_set4["y"],prokIcons[k]["icon"],"show",UIParent,"CENTER","CENTER")
		-- 							end
		-- 							if prokIcons[k]["profil"] == 1 then
		-- 								unIcon(tonumber(prokIcons[k]["spellNum"]),prok_set1["Rx"],prok_set1["Ry"],0+prok_set1["x"],0+prok_set1["y"],prokIcons[k]["icon"],"show",UIParent,"CENTER","CENTER")
		-- 							end
		-- 							if prokIcons[k]["profil"] == 2 then
		-- 								unIcon(tonumber(prokIcons[k]["spellNum"]),prok_set2["Rx"],prok_set2["Ry"],0+prok_set2["x"],0+prok_set2["y"],prokIcons[k]["icon"],"show",UIParent,"CENTER","CENTER")
		-- 							end
		-- 							if prokIcons[k]["profil"] == 3 then
		-- 								unIcon(tonumber(prokIcons[k]["spellNum"]),prok_set3["Rx"],prok_set3["Ry"],0+prok_set3["x"],0+prok_set3["y"],prokIcons[k]["icon"],"show",UIParent,"CENTER","CENTER")
		-- 							end
		-- 						end
		-- 					end
		-- 				end
		-- 			end
		-- 			if arg2 == "UNIT_DIED" and arg7 == myNome then
		-- 				if arg7 == myNome then
		-- 					if arg10 == prokIcons[k]["name"] then
		-- 						unIcon(tonumber(prokIcons[k]["spellNum"]),x,y,0,00,0,"hide",UIParent,"CENTER","CENTER")
		-- 					end
		-- 				end
		-- 			end
		-- 			if arg2 == "SPELL_AURA_REMOVED" then
		-- 				if arg7 == myNome then
		-- 					if arg10 == prokIcons[k]["name"] then
		-- 						unIcon(tonumber(prokIcons[k]["spellNum"]),x,y,0,00,0,"hide",UIParent,"CENTER","CENTER")
		-- 					end
		-- 				end
		-- 			end
		-- 		end
		-- 	end
		-- end
		if testQ['q3dict'] ~= nil then
			if arg2 == 'PARTY_KILL' then
				if arg4 == myNome then
					if tempNIK == nil then
						tempNIK = ""
					end
					if not string.find(tempNIK,arg7) then
						SendAddonMessage("ns_dictQ3_test",arg7, "guild")
						tempNIK = tempNIK .. arg7
					end
				end
			end
		end
	-- if arg2 == "SWING_DAMAGE" then
	-- 	if arg7 == myNome then
	-- 		if arg12 ~= nil then
	-- 			print (arg4 .. " По: " .. arg7 .. " resisted " .. arg12 .. 
	-- 			" blocked: " .. arg13 .. " absorbed: " .. arg14 .. " critical: " .. arg15)
	-- 		else
	-- 			print (arg4 .. " По: " .. arg7 .. " amount: " .. arg9)
	-- 		end
	-- 	end
	-- end
	-- if arg2 == "SPELL_DAMAGE" then
	-- 	if arg7 == myNome then
	-- 		if arg12 ~= nil then
	-- 			print (arg4 .. " По: " .. arg7 .. " resisted " .. arg12 .. 
	-- 			" blocked: " .. arg13 .. " absorbed: " .. arg14)
	-- 		else
	-- 			print (arg4 .. " По: " .. arg7 .. " amount: " .. arg9)
	-- 		end
	-- 	end
	-- end
	-- if arg2 == "SPELL_MISS" then
	-- 	if arg7 == myNome then
	-- 		print(arg7 .. " увернулся от удара " .. arg4)
	-- 	end
	-- end 
	if arg2 == "UNIT_DIED" and arg7 == myNome then
		SendAddonMessage("duelXXX", myNome, "guild")
	end
	if testQ['pary'] ~= nil then
		if arg2 == "SWING_MISSED" and (arg4 == myNome or arg4 == "Jylikk" or arg4 == "Непонятный" or arg4 == "Showmeblood" or arg7 == myNome or arg7 == "Jylikk" or arg7 == "Непонятный" or arg7 == "Showmeblood" or arg7 == "Яумервцлк")then
			--print (arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17)
			--print (arg4,arg7,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19,arg20,arg21,arg22,arg23)
			if arg9 == "PARRY" then
				SendChatMessage(arg7 .. " парировал атаку " .. arg4 , "OFFICER", nil, 1)
			end
		end

-- 		if arg2 == "SWING_MISSED" and (arg7 == myNome or arg7 == "Jylikk" or arg7 == "Непонятный" or arg7 == "Showmeblood")then
-- 			--print (arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17)
-- 			--print (arg4,arg7,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19,arg20,arg21,arg22,arg23)
-- 			if arg9 == "PARRY" then
-- 				SendChatMessage(arg7 .. " парировал атаку " .. arg4 , "OFFICER", nil, 1)
-- 			end
-- 		end
	--print (arg2,arg4,arg7,arg10,arg12,arg13)
	end
end)
