versAdd=213
bonusQuestF = 30
local myNome = GetUnitName("player")
ChatFrame1:AddMessage("NSQC: Клик левой кнопкой: показать аддон/скрыть аддон");
ChatFrame1:AddMessage("NSQC: Клик правой кнопкой: показать информацию");

btn = {};
function btn:configure(id,posex,posey,sizex,sizey,zzid,message)
	self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
	self[id]:SetFrameStrata("TOOLTIP")
	if id == 996 then
		self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"TOPLEFT",posex, posey)
	else
		self[id]:SetPoint("CENTER",posex, posey)
	end
	self[id]:SetSize(sizex, sizey)
	self[id]:SetText(message)
	self[id]:Hide();
	if id==9 then
		self[id]:SetScript("OnClick",function(self, button)
			RandomRoll(1, 100)
		end)
	end

	if id==10 then
		self[id]:SetScript("OnClick",function(self, button)
			RandomRoll(1, 333)
		end)
	end

	if id==11 then
		self[id]:SetScript("OnClick",function(self, button)
			RandomRoll(1, 111)
		end)
	end
	if id==7 or id==1 or id==2 then
	self[id]:SetScript("OnClick",function(self, button)

		if id==2 then
			btn[2]:Disable()
			testQ["timerID2"] = 60
			if testQ[myNome]["взятый_квест"] ~= "q33" and testQ[myNome]["взятый_квест"] ~= "q3Stat" then
				if testQ[myNome]["лвл_квестов"]~=2 and testQ[myNome]["лвл_квестов"]~=3 then
					SendAddonMessage("NSGadd", zzid, "guild")
				elseif testQ[myNome]["лвл_квестов"]==2 then
					SendAddonMessage("NSGadd", "#aam", "guild")
				elseif testQ[myNome]["лвл_квестов"]==3 then
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
			SendAddonMessage("NSGadd", "#questTimerID2", "guild")
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
		   SendAddonMessage("NSGadd", zzid, "guild") end)
	end
	if id==8 then
			self[id]:SetScript("OnClick",function(self, button)
				if testQ[myNome]["взятый_квест"] ~= "q33" and testQ[myNome]["взятый_квест"] ~="q3Stat" then
					if testQ[myNome]["уровень_квестов"]~="2" and testQ[myNome]["уровень_квестов"]~="3" then
						SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)
					end
					if testQ[myNome]["уровень_квестов"]=="2" then
						proverkaVypolneniyaKvestySachivkoj(myNome,2)
					end
					if testQ[myNome]["уровень_квестов"]=="3" and testQ[myNome]["взятый_квест3_1"] == "vzyat" then
						SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)
					end
					if testQ[myNome]["уровень_квестов"]=="3" and testQ[myNome]["взятый_квест3_2"] == "vzyat" then
						proverkaVypolneniyaKvestySachivkoj(myNome,3)
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
		end)
	end
	if id == 14 then
		self[id]:SetScript("OnClick",function(self, button)
			SendAddonMessage("NSGadd", "#ver", "guild")
		end)
	end
	if id == 15 then
		self[id]:SetScript("OnClick",function(self, button)
			SendAddonMessage("NSGadd", "#u", "guild")
		end)
	end
	if id == 998 then
		self[id]:SetScript("OnClick",function(self, button)
			SendAddonMessage("NSGadd", "#ahtng", "guild")
		end)
	end
	if id == 997 then
		self[id]:SetScript("OnClick",function(self, button)
			SendAddonMessage("NSGadd", "#zzp", "guild")
		end)
	end
	if id == 996 then
		self[id]:SetScript("OnClick",function(self, button)
			SendAddonMessage("NSGadd", "#2t", "guild")
		end)
	end
	if id == 4 then
		self[id]:SetScript("OnClick",function(self, button)
			SendAddonMessage("NSGadd", "#zzguild " .. testQ[myNome]["zzlf"], "guild")
		end)
	end
	if id == 3 then
		self[id]:SetScript("OnClick",function(self, button)

		end)
	end
	if id == 777 then
		self[id]:SetScript("OnClick",function(self, button)
			local testKont = GetCurrentMapContinent()
			local lok = GetCurrentMapZone()
			local x,y = GetPlayerMapPosition("player")
			local n
			testKont = tostring(testKont)
			lok = tostring(lok)
			if marsh == nil then
				marsh = {}
			end
			if marsh[testKont] == nil then
				marsh[testKont] = {}
				marsh[testKont]["testKont"] = testKont
			end
			if marsh[testKont][lok] == nil then
				marsh[testKont][lok] = {}
				marsh[testKont][lok]["testLok"] = lok
			end
			local tablen = tablelength(marsh[testKont][lok])
			n = tablen
			n = tostring(n)
			marsh[testKont][lok][n] = {}
			marsh[testKont][lok][n]["x"] = x
			marsh[testKont][lok][n]["y"] = y
			print (n)
		end)
	end
	if id == 999999 then
		self[id]:SetScript("OnClick",function(self, button)
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
btn:configure(998,-83,250,70,32,"#ahtng","СБРОС");
btn:configure(997,-13,250,70,32,"#zzp","ОТМЕНА");
btn:configure(996,-5,19,32,32,"#krt","К");
btn:configure(777,-300,-75,200,32,"#marsh","");
btn:configure(999999,635,310,32,32,"#","");

btn[15]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|cFF6495EDПоказать Устав гильдии(в первой вкладке чата)")
	GameTooltip:Show()
end)
btn[15]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

btn[14]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|cFF6495EDПроверить доступные обновления")
	GameTooltip:Show()
end)
btn[14]:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end)

btn[3]:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|c006495EDБонусный квест. Доступен всегда.")
	GameTooltip:AddLine("|c00FFFFE0Каждые 20 принятых игроков принесут 3 опыта и кусок карты")
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


btnF = CreateFrame("CheckButton", "myCheckButton_GlobalName", parentFrame, "ChatConfigCheckButtonTemplate");
btnF:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"TOPLEFT",-5,-18)
btnF:SetText("CheckBox Name");
btnF:SetFrameStrata("TOOLTIP")
btnF:SetScript("OnClick",
  function()
	SendAddonMessage("NSGadd", "#krt", "guild")
	testQ["startChern"] = nil
	testQ["start"] = nil
	if testQ["evO0102"] ~= true then
		testQ["evO0102"] = nil
	end
	if testQ["evO0203"] ~= true then
		testQ["evO0203"] = nil
	end
	if testQ["evO0304"] ~= true then
		testQ["evO0304"] = nil
	end
	if testQ["evO0405"] ~= true then
		testQ["evO0405"] = nil
	end
	if testQ["evO0506"] ~= true then
		testQ["evO0506"] = nil
	end
	if testQ["evO0607"] ~= true then
		testQ["evO0607"] = nil
	end
	if testQ["evO0708"] ~= true then
		testQ["evO0708"] = nil
	end
	if testQ["evO0809"] ~= true then
		testQ["evO0809"] = nil
	end
	if testQ["evO0910"] ~= true then
		testQ["evO0910"] = nil
	end
	if testQ["evO1011"] ~= true then
		testQ["evO1011"] = nil
	end
	if testQ["evO11"] ~= true then
		testQ["evO11"] = nil
	end
	if testQ["evO12"] ~= true then
		testQ["evO12"] = nil
	end
	if testQ["evO13"] ~= true then
		testQ["evO13"] = nil
	end
	if testQ["evO14"] ~= true then
		testQ["evO14"] = nil
	end
  end)

minibtn = CreateFrame("Button", nil, Minimap)
minibtn:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("|cFF6495EDNSQC|cFF808080-|cff00BFFF".. versAdd)
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("|cffFF8C00ЛКМ|cffFFFFE0 - открыть аддон")
	GameTooltip:AddLine("|cffF4A460ПКМ|cffFFFFE0 - показать настройки (когда аддон открыт)")
	GameTooltip:AddLine("|cffFFFFE0Тягать кнопку можно, когда аддон открыт")
	GameTooltip:Show()
end)
minibtn:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
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
	minibtn:RegisterForClicks("LeftButtonUp", "RightButtonDown")
	if arg1=="LeftButton" then
		if pokazat~=1 then
			ii=6
			btn[ii] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
			btn[ii]:SetFrameStrata("TOOLTIP")
			btn[ii]:SetPoint("CENTER",0,150)
			btn[ii]:SetSize(300, 30)
			btn[ii]:SetText("Закрыть")
			btn[ii]:Hide();
			btn[ii]:SetScript("OnClick", function(self, button)
			for ii=1,15 do
				btn[ii]:Hide();
			end
			pokazat=0
			minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
			end)
			for ii=1,15 do
				btn[ii]:Show();
			end
			pokazat=1
			myCheckButton1:Hide()
			myCheckButton2:Hide()
			btn[998]:Hide()
			btn[997]:Hide()
			pokazatChk=0
			minibtn:SetNormalTexture("Interface/COMMON/Indicator-Green.png")
			minibtn:SetPushedTexture("Interface/COMMON/Indicator-Green.png")
			minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Green.png")
		else
			for ii=1,15 do
				btn[ii]:Hide();
			end
			minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
			minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
			pokazat=0
			myCheckButton1:Hide()
			myCheckButton2:Hide()
			btn[998]:Hide()
			btn[997]:Hide()
			pokazatChk=0
		end
	elseif arg1=="RightButton" then
		if pokazat==1 then
			print ("Информация:")
			print ("NSQC-" .. versAdd)
			print ("!заметка [текст заметки] - добавть информацию о себе")
			print ("!заметка+ [текст заметки] - дополнить информацию о себе")
			print ("В гильдчат: " .. myNome .. " покажи предмет [название предмета]")
			print ("В гильдчат: " .. myNome .. " !ачивка [название ачивки ИЛИ статистики]")
			for ii=1,15 do
				btn[ii]:Hide();
			end
			myCheckButton1:Show()
			myCheckButton2:Show()
			btn[998]:Show()
			btn[997]:Show()
			pokazat=0
			pokazatChk=1
		elseif pokazat==0 then
			for ii=1,15 do
				btn[ii]:Show();
			end
			myCheckButton1:Hide()
			myCheckButton2:Hide()
			btn[998]:Hide()
			btn[997]:Hide()
			pokazat=1
			pokazatChk=0
		end
	end
end)


if framePos==nil then
	framePos={}
end
btn[99]:SetScript("OnClick",function(self, button)
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





local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 0.5 then
		timeElapsed = 0

		if WorldMapFrame:IsVisible() then
			if krt == nil then
				krt = {}
			end
			if krt["777"] == nil then
				if krt["podskazki"] ~= nil then
					if krt["chernila"] ~= nil then
						local rez
						local numPod=1
						krt["quest"] = {}
						chern1P(1)
						for i=1, tablelength(krt["chernila"])-1 do
							j=tostring(i)
							if testQ["chD"][j] == nil then
								chern1P(i)
								for k=1,tablelength(krt["chernila"]["podskazkiRez"]) do
									l=tostring(k)
									if numPod <= krt["podskazki"] then
										krt["quest"][j.. " " ..l]=krt["chernila"]["podskazkiRez"][l]
										numPod = numPod + 1
									else
										break
									end
								end
							end
						end
						rez = "Подсказки:\n"
						for k, v in pairs(krt["quest"]) do
							rez = rez .. k .. " " .. v .. "\n"
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
				local x,y = GetPlayerMapPosition("player")
				if testQ["chD"] == nil then
					testQ["chD"] = {}
				end
				for i=1,14 do
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
									if mioCel <= 0.0009 then
										SendChatMessage(m, "OFFICER", nil, 1)
										if krt["999"] == nil then
											krt["999"] = 1
										else
											krt["999"] = krt["999"]+1
										end
										testQ["chD"][j] = 1
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
						local x,y = GetPlayerMapPosition("player")
						local kont, lok, x1, y1, m = mapQuest(testQ["mapQuest"]["текущий"])
						if testKont == kont then
							if testLok == lok then
								local mioCel=sqrt((x-x1)^2+(y-y1)^2)
								if mioCel <= 0.0009 then
									SendChatMessage(m, "OFFICER", nil, 1)
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
			local testKont = GetCurrentMapContinent()
			testKont = tostring(testKont)
			local lok = GetCurrentMapZone()
			lok = tostring(lok)
			local x,y = GetPlayerMapPosition("player")
			local par1 = testQ["start"]
			if mapTables[testQ["start"]] ~= nil then
				if mapTables[testQ["start"]][testKont] ~= nil then
					if mapTables[testQ["start"]][testKont][lok] ~= nik then
						if mapTables[testQ["start"]][testKont] ~= nil then
							if mapTables[testQ["start"]][testKont][lok]["testLok"] == lok then
								if mapTables[testQ["start"]] ~= nil and testKont == mapTables[testQ["start"]][testKont]["testKont"] then
									local mioCel=sqrt((x-mapTables[testQ["start"]][testKont][lok]["1"]["x"])^2+(y-mapTables[testQ["start"]][testKont][lok]["1"]["y"])^2)
									if mioCel < 0.010 then
										PlaySoundFile("Interface\\AddOns\\NSQC\\start.ogg")
										testQ["marshF"] = {}
										testQ["marshF"][1] = 1
										testQ["старт"]=1
										SendChatMessage("Старт маршрута", "OFFICER", nil, 1)
									end
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
			local xxx = (testMarsh(par1,0.020))
			if xxx < 1 then
				SendChatMessage("Я проиграл", "OFFICER", nil, 1)
				PlaySoundFile("Interface\\AddOns\\NSQC\\gob.ogg")
				testQ["старт"] = 0
				testQ["num"] = nil
				testQ["marshF"] = nil
			end
		end
end)




local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 0.01 then
		timeElapsed = 0

		if krt ~= nil then
			if krt["777"] == 2 then
				if testQ["startChern"] == nil then
					testFchern("evO0102",21,22)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0203",22,23)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0304",23,24)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0405",24,25)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0506",25,26)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0607",26,27)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0708",27,28)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0809",28,29)
				end
				if testQ["startChern"] == nil then
					testFchern("evO0910",29,30)
				end
				if testQ["startChern"] == nil then
					testFchern("evO1011",30,31)
				end
				if testQ["startChern"] == nil then
					testFchern("evO11",31,31)
				end
				if testQ["startChern"] == nil then
					testFchern("evO12",32,32)
				end
				if testQ["startChern"] == nil then
					testFchern("evO13",33,33)
				end
				if testQ["startChern"] == nil then
					testFchern("evO14",34,34)
				end
			end
		end





		if testQ["timerID2"] ~= nil then
			testQ["timerID2"] = tonumber(testQ["timerID2"])
			testQ["timerID2"] = testQ["timerID2"]-0.02
			local btnT1 = string.format("%02d", testQ["timerID2"])
			btn[2]:SetText(btnT1)
			btn[1]:SetText(btnT1)
			btn[2]:Disable()
			btn[1]:Disable()
			if testQ["timerID2"] <= 1 then
				testQ["timerID2"] = nil
			end
		end
		if testQ["timerID2"] == nil then
			if pokazat == 1 then
				btn[2]:SetText("Сдать квест")
				btn[2]:Enable()
				btn[1]:Enable()
				btn[1]:SetText("Взять квест")
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

		if testQ[myNome]["настройки"]["esc"]==nil or testQ[myNome]["настройки"]["esc"]=="Disable" then
			btn[1]:EnableKeyboard(0);
			myCheckButton1:EnableKeyboard(0);
			myCheckButton1:SetChecked(false)
		elseif testQ[myNome]["настройки"]["esc"]=="Enable" then
			myCheckButton1:SetChecked(true)
			btn[1]:EnableKeyboard(1);
			myCheckButton1:EnableKeyboard(1);
			btn[1]:SetScript("OnKeyDown",function(self,key)
			if GetBindingFromClick(key)=="TOGGLEGAMEMENU" then
				for ii=1,15 do
					btn[ii]:Hide();
				end
				myCheckButton1:Hide()
				myCheckButton2:Hide()
				btn[998]:Hide()
				btn[997]:Hide()
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
				myCheckButton1:Hide()
				myCheckButton2:Hide()
				btn[998]:Hide()
				btn[997]:Hide()
				pokazatChk=0
				pokazat=0
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

		if testQ==nil then
			testQ={}
		end
	if testQ[myNome]==nil then
		testQ[myNome]={}
	end
	if testQ[myNome]["взятый_квест"]==nil or testQ[myNome]["взятый_квест"]=="9999" then
		btn[2]:Hide()
		btn[2]:SetText("Нет взятых квестов")
		btn[7]:Disable()
		btn[7]:SetText("Нет взятых квестов")
		btn[8]:Disable()
		btn[8]:SetText("Нет взятых квестов")
	elseif testQ[myNome]["взятый_квест"]~=nil or testQ[myNome]["взятый_квест"]~="9999" then
		btn[7]:Enable()
		btn[7]:SetText("Отказаться от квеста")
		btn[8]:Enable()
		btn[8]:SetText("Узнать текущий квест")
		if testQ[myNome]["лвл_квестов"]~=2 and testQ[myNome]["лвл_квестов"]~=3 then
			testComplit=testQ[myNome]["взятый_квест"]
			testComplit=tonumber(testComplit)
			if testComplit ~= nil then
				id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(testComplit)
			end
			if completed ~= true then
				btn[2]:Disable()
				if pokazat == 1 then
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
						btn[2]:Show()
						btn[1]:Hide()
					else
						btn[2]:Hide()
					end
				btn[2]:SetText("Сдать квест")
			end
		elseif testQ[myNome]["лвл_квестов"]==2 then
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
				if pokazat == 1 then
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
				if pokazat == 1 then
						btn[2]:Show()
						btn[1]:Hide()
					else
						btn[2]:Hide()
					end
				btn[2]:SetText("Сдать квест")
			end
		elseif testQ[myNome]["лвл_квестов"]==3 then
			if testQ[myNome]["взятый_квест"] ~= "q33" and testQ[myNome]["взятый_квест"] ~= "q3Stat" then
				if testQ[myNome]["взятый_квест3_1"] == "vzyat" then
					testComplit=testQ[myNome]["взятый_квест"]
					testComplit=tonumber(testComplit)
					id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(testComplit)
					if completed ~= true then
						btn[2]:Disable()
						if pokazat == 1 then
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
						if pokazat == 1 then
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
				btn[1]:Hide()
				local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10 = GetAchievementCriteriaInfo(tonumber(testQ[myNome]["q3Stat"]), 1)
				local tQ = tonumber(testQ[myNome]["q3StatNum"])
				local tQ1 = tQ+5
				local tQ2 = tonumber(arg4)
				if tQ2 < tQ1 then
					btn[2]:Disable()
					if pokazat == 1 then
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
						btn[2]:Show()
						btn[1]:Hide()
					else
						btn[2]:Hide()
					end
						btn[2]:SetText("Сдать квест")
				end

			end
			if testQ[myNome]["взятый_квест"] == "q33" then
				btn[1]:Hide()
				if testQ[myNome]["q33nik"][1] ~= 1 or testQ[myNome]["q33nik"][2] ~= 1 or testQ[myNome]["q33nik"][3] ~= 1 then
					btn[2]:Disable()
					if pokazat == 1 then
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
						btn[2]:Show()
						btn[1]:Hide()
					else
						btn[2]:Hide()
					end
						btn[2]:SetText("Сдать квест")
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

		if testQ[myNome]["настройки"]["esc"]=="Disable" or testQ[myNome]["настройки"]["esc"]==nil then
			testQ[myNome]["настройки"]["esc"]="Enable"
			myCheckButton1:SetChecked(true)
		elseif testQ[myNome]["настройки"]["esc"]=="Enable" then
			testQ[myNome]["настройки"]["esc"]="Disable"
			myCheckButton1:SetChecked(false)
		end
	end
);



myCheckButton2 = createCheckbutton(UIParent, -100, 330, "Отображение ролла");
myCheckButton1:SetFrameLevel(256)
myCheckButton2:SetFrameLevel(256)
myCheckButton2.tooltip = "Скрывать ли ролл в офицерском чате";
myCheckButton2:SetScript("OnClick",
	function()
		if testQ[myNome]["настройки"]["roll"]=="Disable" or testQ[myNome]["настройки"]["roll"]==nil then
			testQ[myNome]["настройки"]["roll"]="Enable"
			myCheckButton2:SetChecked(true)
		elseif testQ[myNome]["настройки"]["roll"]=="Enable" then
			testQ[myNome]["настройки"]["roll"]="Disable"
			myCheckButton2:SetChecked(false)
		end

	end
);

