versAdd=136
bonusQuestF = 20
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
            if testQ[myNome]["лвл_квестов"]~=2 and testQ[myNome]["лвл_квестов"]~=3 then
                SendAddonMessage("NSGadd", zzid, "guild")
            elseif testQ[myNome]["лвл_квестов"]==2 then
                SendAddonMessage("NSGadd", "#aam", "guild")
            elseif testQ[myNome]["лвл_квестов"]==3 then
                SendAddonMessage("NSGadd", "#aat", "guild")
            end
        elseif id == 1 then
            SendAddonMessage("NSGadd", zzid, "guild")
            SendChatMessage("ВOЖДЬ", "guild", nil, 1)
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
                if testQ[myNome]["лвл_квестов"]~=2 and testQ[myNome]["лвл_квестов"]~=3 then
                    SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)
                elseif testQ[myNome]["лвл_квестов"]==2 then
                    proverkaVypolneniyaKvestySachivkoj(myNome,2)
                elseif testQ[myNome]["лвл_квестов"]==3 and testQ[myNome]["взятый_квест3_1"] == "vzyat" then
                     SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)
                elseif testQ[myNome]["лвл_квестов"]==3 and testQ[myNome]["взятый_квест3_2"] == "vzyat" then
                    proverkaVypolneniyaKvestySachivkoj(myNome,3)
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
            SendAddonMessage("NSGadd", "#krt", "guild")
        end)
    end
    if id == 4 then
        self[id]:SetScript("OnClick",function(self, button)
            SendAddonMessage("NSGadd", "#zzy " .. testQ[myNome]["zzlf"], "guild")
        end)
    end
    if id == 3 then
        self[id]:SetScript("OnClick",function(self, button)
            SendChatMessage("Нужно принять в гильдию 20 новых игроков", "GUILD", nil, 1)
            print ("Нажми \"Щ\". Затем выбери внизу вкладку \"Кто\"")
            print ("В строке поиска снизу напиши диапазон лвлов (лучше всего по 5). например: 1-5, 6-10, 11-15 итд")
            print ("Затем пиши в чате: /ginvite ник")
            print ("Для удобства команду /ginvite лучше скопировать в буфер обмена с тремя пробелами в конце и вставлять.")
        end)
    end
end

-- вместо цикла явная индексация, так как у тебя один фиг ifы
-- видимо я так понял имеет значение порядок создания кнопок
btn:configure(1,0,300,300,30,"#zzs","Взять квест");
btn:configure(2,0,300,300,30,"#zzr","Сдать квест");
btn:configure(3,-135,270,30,30,"#zzz","?");
btn:configure(4,15,270,270,30,"#zzy","Сдать бонусный квест вне лимита");
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



btnF = CreateFrame("CheckButton", "myCheckButton_GlobalName", parentFrame, "ChatConfigCheckButtonTemplate");
btnF:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"TOPLEFT",-5,-18)
btnF:SetText("CheckBox Name");
btnF:SetFrameStrata("TOOLTIP")
btnF:SetScript("OnClick",
  function()
    SendAddonMessage("NSGadd", "#krt", "guild")
  end)


local minibtn = CreateFrame("Button", nil, Minimap)
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

local myIconPos = 0

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
    UpdateMapBtn();
end)
-- Set position
minibtn:ClearAllPoints();
minibtn:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)),(80 * sin(myIconPos)) - 52)
pokazat=0
pokazatChk=0







minibtn:SetScript("OnClick", function()
    minibtn:RegisterForClicks("LeftButtonDown", "RightButtonDown")
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








local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed


	if timeElapsed > 0.01 then
		timeElapsed = 0

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
            if krt[777] ~= nil and krt[777] == 2 then
                if krt[7770105] == nil then
                    krt[7770105] = 0
                end
                if krt[7770502] == nil then
                    krt[7770502] = 0
                end
                if krt[7770207] == nil then
                    krt[7770207] = 0
                end
                if krt[7770703] == nil then
                    krt[7770703] = 0
                end
                if krt[7770304] == nil then
                    krt[7770304] = 0
                end
                if krt[7770415] == nil then
                    krt[7770415] = 0
                end
                if krt[7771516] == nil then
                    krt[7771516] = 0
                end
                if krt[7771613] == nil then
                    krt[7771613] = 0
                end
                if krt[7771314] == nil then
                    krt[7771314] = 0
                end
                if krt[7771409] == nil then
                    krt[7771409] = 0
                end
                if krt[77709] == nil then
                    krt[77709] = 0
                end
                if krt[77712] == nil then
                    krt[77712] = 0
                end
                if krt[77706] == nil then
                    krt[77706] = 0
                end
                if krt[77710] == nil then
                    krt[77710] = 0
                end


                if krt[20105] == nil then
                    if krt[21] == true and krt[25] == true then
                        krt[7770105] = krt[7770105] + 1
                        krt[20105] = 1
                    end
                end
                if krt[20502] == nil then
                    if krt[25] == true and krt[22] == true then
                        krt[7770502] = krt[7770502] + 1
                        krt[20502] = 1
                    end
                end
                if krt[20207] == nil then
                    if krt[22] == true and krt[27] == true then
                        krt[7770207] = krt[7770207] + 1
                        krt[20207] = 1
                    end
                end
                if krt[20703] == nil then
                    if krt[27] == true and krt[23] == true then
                        krt[7770703] = krt[7770703] + 1
                        krt[20703] = 1
                    end
                end
                if krt[20304] == nil then
                    if krt[23] == true and krt[24] == true then
                        krt[7770304] = krt[7770304] + 1
                        krt[20304] = 1
                    end
                end
                if krt[20415] == nil then
                    if krt[24] == true and krt[35] == true then
                        krt[7770415] = krt[7770415] + 1
                        krt[20415] = 1
                    end
                end
                if krt[21516] == nil then
                    if krt[35] == true and krt[36] == true then
                        krt[7771516] = krt[7771516] + 1
                        krt[21516] = 1
                    end
                end
                if krt[21613] == nil then
                    if krt[36] == true and krt[33] == true then
                        krt[7771613] = krt[7771613] + 1
                        krt[21613] = 1
                    end
                end
                if krt[21314] == nil then
                    if krt[33] == true and krt[34] == true then
                        krt[7771314] = krt[7771314] + 1
                        krt[21314] = 1
                    end
                end
                if krt[21409] == nil then
                    if krt[34] == true and krt[29] == true then
                        krt[7771409] = krt[7771409] + 1
                        krt[21409] = 1
                    end
                end
                if krt[209] == nil then
                    if krt[29] == true then
                        krt[77709] = krt[77709] + 1
                        krt[209] = 1
                    end
                end
                if krt[212] == nil then
                    if krt[32] == true then
                        krt[77712] = krt[77712] + 1
                        krt[212] = 1
                    end
                end
                if krt[206] == nil then
                    if krt[32] == true then
                        krt[77706] = krt[77706] + 1
                        krt[206] = 1
                    end
                end
                if krt[210] == nil then
                    if krt[32] == true then
                        krt[77710] = krt[77710] + 1
                        krt[210] = 1
                    end
                end
            end
        end

        if WorldMapFrame:IsVisible()~=nil then
            if WorldMapFrameSizeUpButton:IsVisible()~=nil then
                btn[996]:Show()
                btnF:Hide()
            else
            end
            if WorldMapFrameSizeDownButton:IsVisible()~=nil then
                btn[996]:Hide()
                btnF:Show()
            else
            end
        else
            btn[996]:Hide()
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
                for ii=1,11 do
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
                for ii=1,11 do
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
                                SendChatMessage("Я сбежал с маршрута", "GUILD", nil, 1)
                                testRasstoyanie=1
                            else
                            end
                        else
                            if testRasstoyanie~=0 then
                                local hshStran3
                                hshStran3=hshSenderNomeC(myNome)
                                SendChatMessage(hshStran3 .. " Я вернулся на маршрут", "GUILD", nil, 1)
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
                btn[2]:Enable()
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
                btn[2]:Enable()
                if pokazat == 1 then
                        btn[2]:Show()
                        btn[1]:Hide()
                    else
                        btn[2]:Hide()
                    end
                btn[2]:SetText("Сдать квест")
            end
        elseif testQ[myNome]["лвл_квестов"]==3 then
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
                    btn[2]:Enable()
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
                    btn[2]:Enable()
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
