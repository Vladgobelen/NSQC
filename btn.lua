versAdd=269
versAddDop=10
bonusQuestF = 30
local myNome = GetUnitName("player")
ChatFrame1:AddMessage("NSQC: Клик левой кнопкой: показать аддон/скрыть аддон");
ChatFrame1:AddMessage("NSQC: Клик правой кнопкой: показать информацию");
btn = {};
editB = {}
fBtn = {}

function fBtn:configure(id,posex,posey,sizex,sizey,zzid,message)
	self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	self[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	self[id]:SetPoint("CENTER",posex, posey)
	self[id]:SetSize(sizex, sizey)
	self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\z.tga")
	self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\z.tga")
	self[id]:Hide();
	self[id]:SetScript("OnClick",function(self, button)
		local nome = GuildFrame["selectedGuildMemberName"]
		if mioFld[nome]["объекты"][tostring(id)] == "t" then
			if tonumber(mioFld[nome]["целостность"][tostring(id)]) >=1 then
				if krt ~= nil then
					if krt["podskazki"] ~= nil then
						if testQ["трудовые_ресурсы"] == nil then
							testQ["трудовые_ресурсы"] = {}
							testQ["трудовые_ресурсы"] = 0
						end
						if tonumber(testQ["трудовые_ресурсы"]) <= tonumber(krt["podskazki"]) then
							if nome == myNome then
								mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-50
							else
								mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-10
							end
							--fBtn[id]:SetText(mioFld[nome]["целостность"][tostring(id)])
							testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+1
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\axe.ogg")
							SendAddonMessage("obgIz " .. id .. " " .. mioFld[nome]["целостность"][tostring(id)], nome, "guild")
						else
							if nome == myNome then
								mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-10
							else
								mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-3
							end
							--fBtn[id]:SetText(mioFld[nome]["целостность"][tostring(id)])
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\axe.ogg")
							SendAddonMessage("obgIz " .. id .. " " .. mioFld[nome]["целостность"][tostring(id)], nome, "guild")
						end
					end
				end
			else

			end
		end
	end)
	self[id]:SetScript("OnEnter",function(self)
		btn[989]:Show()
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
	elseif id == 990 then

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
			minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
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
					SendChatMessage("Нужно достать " .. testQ[myNome]["itemNum"] .. " стаков " .. testQ[myNome]["itemName"] .. " и прислать по почте персонажу Железобетонс", "OFFICER", nil, 1)
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
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
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
			SendMail("Железобетонс", "Квест на сбор предметов", "")
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

btn[989]:SetScript("OnClick",function(self, button)
	PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
	if not fBtn[1]:IsVisible() then
		if not GuildRosterShowOfflineButton:GetChecked() then
			local nome = GuildFrame["selectedGuildMemberName"]
			testQ["fRand1"] = math.random(1,1000000)
			SendAddonMessage("shMFld " .. testQ["fRand1"], nome, "guild")
		else
			for i=1,100 do
				fBtn[i]:Hide()
				btn[989]:ClearAllPoints()
				btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
			end
		end
	else
		for i=1,100 do
			fBtn[i]:Hide()
			btn[989]:ClearAllPoints()
			btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
		end
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
	local nome = GuildFrame["selectedGuildMemberName"]
	if testQ["клик994"] == nil then
		SendAddonMessage("zametkaNS", str, "guild")
			--editB[1]:SetText("")
	end
end)

editB[2]:SetScript("OnEditFocusLost",function(self)
	local str = editB[2]:GetText()
	local nome = GuildFrame["selectedGuildMemberName"]
	if testQ["клик993"] == nil then
		SendAddonMessage("pamyatkaNS " .. nome, str, "guild")
	end
end)

editB[3]:SetScript("OnEditFocusLost",function(self)
	local str = editB[3]:GetText()
	local nome = GuildFrame["selectedGuildMemberName"]
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
	local nome = GuildFrame["selectedGuildMemberName"]
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
	local nome = GuildFrame["selectedGuildMemberName"]
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
	local nome = GuildFrame["selectedGuildMemberName"]
	local zametka
	SendAddonMessage("#получить_отзыв", nome, "guild")
	if testQ ~= nil then
		if testQ["tempOtzyv"] ~= nil then
			if testQ["tempOtzyv"][nome] == nil or testQ["tempOtzyv"][nome] == "" then
				zametka = "Отзывы об игроке. Заполняются кем угодно, видит кто угодно. Пока отзывов об этом персонаже нет."
			else
				zametka = testQ["tempOtzyv"][nome]
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
	local nome = GuildFrame["selectedGuildMemberName"]
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
	local nome = GuildFrame["selectedGuildMemberName"]
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
	local nome = GuildFrame["selectedGuildMemberName"]
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
	local nome = GuildFrame["selectedGuildMemberName"]
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
	minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
	minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
	minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
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
	minibtn:RegisterForClicks("LeftButtonUp", "RightButtonDown")
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
				minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
				minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
				minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
			end)
			for ii=3,15 do
				btn[ii]:Show();
			end
			if myCheckButton1:IsVisible() then
				showRB(myNome)
			end
			pokazatChk=0
			minibtn:SetNormalTexture("Interface/COMMON/Indicator-Green.png")
			minibtn:SetPushedTexture("Interface/COMMON/Indicator-Green.png")
			minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Green.png")
			pokazat=1
		else
			for ii=3,15 do
				btn[ii]:Hide();
			end
			minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
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
local myNome = GetUnitName("player")
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
	frameTextu[i]:SetTexture(1,1,1)
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
local myNome = GetUnitName("player")
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 1 then
		timeElapsed = 0

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

local myNome = GetUnitName("player")
local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 0.5 then
		timeElapsed = 0
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


		local face = GetPlayerFacing()
		local x,y = GetPlayerMapPosition("player")
		local testKont = tostring(GetCurrentMapContinent())
		local testLok = tostring(GetCurrentMapZone())
		if mapTables["lokRasstoyanie"][testKont] ~= nil then
			if mapTables["lokRasstoyanie"][testKont][testLok] ~= nil then
				if testKont == "2" and testLok == "15" then
					local mioCel = sqrt((x-0.55834645032883)^2+(y-0.52947282791138)^2)
					if mioCel <= (tonumber(mapTables["lokRasstoyanie"][testKont][testLok]))*2 and (face < 1.5 or face > 2) then
						PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\sh.ogg")
						if face > 1 and face < 2.5 then
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
		if testQ[myNome]["настройки"] == nil then
			testQ[myNome]["настройки"]={}
		end
		if testQ[myNome]["настройки"]["watch"]=="Enable" then
			WatchFrame:Hide()
		end
		if testQ[myNome]["настройки"]["watch"]=="Disable" then
			WatchFrame:Show()
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

		if testQ["fRand2"] ~= nil and (tonumber(testQ["fRand2"]) == tonumber(testQ["fRand1"]))then
			if GuildFrame:IsVisible() then
				if not GuildRosterShowOfflineButton:GetChecked() then
					local nome = GuildFrame["selectedGuildMemberName"]
					if not fBtn[1]:IsVisible() then
						for i=1,100 do
							j = tostring(i)
							fBtn[i]:Show()
							btn[989]:ClearAllPoints()
							btn[989]:SetPoint("BOTTOMLEFT", fBtn[10],"TOPRIGHT",0, 0)
							fBtn[i]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][j] .. ".tga")
							fBtn[i]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][j] .. ".tga")
							if mioFld[nome]["целостность"][tostring(i)] < 999 then
								fBtn[i]:SetText(mioFld[nome]["целостность"][tostring(i)])
							end
						end
					end
				end
			end
			testQ["fRand2"] = nil
			testQ["fRand1"] = nil
		end
		if testQ["fRand3"] == 1 then
			local nome = GuildFrame["selectedGuildMemberName"]
			for i = 1,100 do
				if tonumber(mioFld[nome]["целостность"][tostring(i)]) < 999 then
					fBtn[i]:SetText(mioFld[nome]["целостность"][tostring(i)])
				end
			end
			testQ["fRand3"] = nil
		end
		if btn[6] == nil or not btn[6]:IsVisible() then
			btn[2]:Hide()
			btn[1]:Hide()
		end

		local face = GetPlayerFacing()
		local x,y = GetPlayerMapPosition("player")
		local testKont = tostring(GetCurrentMapContinent())
		local testLok = tostring(GetCurrentMapZone())
		if mapTables["lokRasstoyanie"][testKont] ~= nil then
			if mapTables["lokRasstoyanie"][testKont][testLok] ~= nil then
				if face > 1.7 and face < 1.9 then
					local mioCel = sqrt((x-0.55834645032883)^2+(y-0.52947282791138)^2)
					if mioCel <= (tonumber(mapTables["lokRasstoyanie"][testKont][testLok]))/2 then
						SetView(5)
						rtnTextF("надпись",1,"show")
					else
						rtnTextF("надпись",1,"hide")
					end
				else
					rtnTextF("надпись",1,"hide")
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
				if mapTables["lokRasstoyanie"][tKont][tLok] ~= nil then
					if mioCel >= tonumber(mapTables["lokRasstoyanie"][tKont][tLok])*2 then
						marSh()
					end
				else
					if mioCel >= 0.9 then
						marSh()
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
		if testQ[myNome]["настройки"] == nil then
			testQ[myNome]["настройки"]={}
		end
		if testQ[myNome]["настройки"]["debuff"]=="Enable" then
			debuffHide("Hide")
		else
			debuffHide("Show")
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
					if testQ[myNome]["itemNum"] ~= 1 then
						if tempRez[2] ~= nil then
							for i=2,tonumber(testQ[myNome]["itemNum"]) do
								tempRez1 = tempRez1 + tonumber(tempRez[i])
							end
						end
					end
					if tempRez1 == tonumber(testQ[myNome]["itemNum"]) then
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
				minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
				minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
				minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
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
				minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
				minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
				minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
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

