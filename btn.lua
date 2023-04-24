Astrolabe = DongleStub("Astrolabe-0.4")
Astrolabe.MinimapUpdateTime = 0.1
versAdd=61
local myNome = GetUnitName("player")
ChatFrame1:AddMessage("NSQC: Клик левой кнопкой: показать аддон/скрыть аддон");
ChatFrame1:AddMessage("NSQC: Клик правой кнопкой: показать информацию");
btn = {};
function btn:configure(id,posex,posey,sizex,sizey,zzid,message)
    self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");



    self[id]:SetPoint("CENTER",posex, posey)
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
            if testQ[myNome]["лвл_квестов"]~=2 then
                SendChatMessage(zzid, "OFFICER", nil, 1)

            elseif testQ[myNome]["лвл_квестов"]==2 then
                SendChatMessage("#aam", "OFFICER", nil, 1)

            end
        else
            SendChatMessage(zzid, "OFFICER", nil, 1)
        end

    end)

    elseif id==3 or id==4 or id==5 or id==6 then
    self[id]:SetScript("OnClick",function(self, button)
           SendChatMessage(zzid, "GUILD", nil, 1) end)
    end
    if id==8 then
            self[id]:SetScript("OnClick",function(self, button)
                if testQ[myNome]["лвл_квестов"]~=2 then
                    SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)
                elseif testQ[myNome]["лвл_квестов"]==2 then
                    vypolnenaLiAch=testQ[myNome]["взятый_квест"]
                    chisloPunktop=testQ[myNome]["квест_лвл2"][vypolnenaLiAch]
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
                    pokazatRezult=chisloPunktop-j
                    SendChatMessage("Осталось выполнить " .. pokazatRezult .. " пунктов ачивки " .. vypolnenaLiAch .. " " .. GetAchievementLink(vypolnenaLiAch) .. " из " .. chisloPunktop, "GUILD", nil, 1)
                end

                end)
    end
end

-- вместо цикла явная индексация, так как у тебя один фиг ifы
-- видимо я так понял имеет значение порядок создания кнопок
btn:configure(1,0,350,300,30,"#zzs","Взять квест");
btn:configure(2,0,320,300,30,"#zzr","Сдать квест");
btn:configure(3,0,290,300,30,"#zzz","Взять бонусный квест вне лимита");
btn:configure(4,0,260,300,30,"#zzy","Сдать бонусный квест вне лимита");
btn:configure(5,0,230,300,30,"#zzt","Узнать свой гилдлвл");
btn:configure(99,-400,400,100,30,"","тест");
btn:configure(7,0,200,300,30,"#zzp","Отказаться от квеста");
btn:configure(8,0,170,300,30,"","Узнать текущий квест");
btn:configure(9,250,350,200,30,"","Ролл");
btn:configure(10,250,320,200,30,"#ltr 1","Лотерея одним куском");
btn:configure(11,250,290,200,30,"#ltr 3","Лотерея тремя кусками");




local minibtn = CreateFrame("Button", nil, Minimap)
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

--[[btn[1]:EnableKeyboard(1);
btn[1]:SetScript("OnKeyDown",function(self,key)
	if GetBindingFromClick(key)=="TOGGLEGAMEMENU" then
		for ii=1,11 do
            btn[ii]:Hide();
        end
        pokazat=0
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
	end
end);
--]]
minibtn:SetScript("OnClick", function()
    minibtn:RegisterForClicks("LeftButtonDown", "RightButtonDown")
    if arg1=="LeftButton" then
        if pokazat~=1 then
            ii=6
            btn[ii] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
            btn[ii]:SetPoint("CENTER",0,140)
            btn[ii]:SetSize(300, 30)
            btn[ii]:SetText("Закрыть")
            btn[ii]:Hide();
            btn[ii]:SetScript("OnClick", function(self, button)
            for ii=1,11 do
                btn[ii]:Hide();
            end
            pokazat=0
            minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
            minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
            minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
            end)
            for ii=1,11 do
                btn[ii]:Show();
            end
            pokazat=1
            minibtn:SetNormalTexture("Interface/COMMON/Indicator-Green.png")
            minibtn:SetPushedTexture("Interface/COMMON/Indicator-Green.png")
            minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Green.png")
        else
            for ii=1,11 do
                btn[ii]:Hide();
            end
            minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
            minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
            minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
            pokazat=0
        end
    elseif arg1=="RightButton" then
        print ("Информация:")
        print ("Версия NSQC: " .. versAdd)
        print ("#zzs - взять квест")
        print ("#zzr - сдать квест")
        print ("#zzz - взять бонусный квест")
        print ("#zzy - сдать бонусный квест")
        print ("#zzt - узнать свой гильдлвл")
        print ("#zzp - отказаться от квеста")
        print ("!заметка [текст заметки] - добавть информацию о себе")
        print ("!заметка+ [текст заметки] - дополнить информацию о себе")
        print ("В гильдчат: " .. myNome .. " покажи предмет [название предмета]")
        print ("В гильдчат: " .. myNome .. " !ачивка [название ачивки ИЛИ статистики]")

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


	if timeElapsed > 1 then
		timeElapsed = 0
		if testQ==nil then
            testQ={}
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
		mioKont,mioLok,mioX,mioY=Astrolabe:GetCurrentPlayerPosition()
		mioKont=tonumber(mioKont)
		nKont=tonumber(nKont)
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
                                hshXY=time()
                                myHSH=framePos["hshXY"]
                                myHSH1=string.sub(myHSH, 1,1)
                                myHSH2=string.sub(myHSH, 3,3)
                                myHSH3=string.sub(myHSH, 5,5)
                                local hshXY4 = math.random(0, 9)
                                local hshXY5 = math.random(0, 9)
                                local hshXY6 = math.random(0, 9)
                                hshSend=myHSH2 .. hshXY4 .. myHSH1 .. hshXY5 .. myHSH3 .. hshXY6
                                SendChatMessage(hshSend .. " Я вернулся на маршрут", "GUILD", nil, 1)
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
        btn[2]:Disable()
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
        if testQ[myNome]["лвл_квестов"]~=2 then
            testComplit=testQ[myNome]["взятый_квест"]
            id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(testComplit)
            if completed ~= true then
                btn[2]:Disable()
                btn[2]:SetText("Ачивка не выполнена")
                btn[1]:Disable()
                btn[1]:SetText("Ачивка не выполнена")
            else
                btn[2]:Enable()
                btn[2]:SetText("Сдать квест")
            end
        elseif testQ[myNome]["лвл_квестов"]==2 then
            vypolnenaLiAch=testQ[myNome]["взятый_квест"]
            count = GetAchievementNumCriteria(vypolnenaLiAch)
            chisloPunktop=testQ[myNome]["квест_лвл2"][vypolnenaLiAch]
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
            if j<chisloPunktop then
                btn[2]:Disable()
                btn[2]:SetText("Ачивка не выполнена")
                btn[1]:Disable()
                btn[1]:SetText("Ачивка не выполнена")
            else
                btn[2]:Enable()
                btn[2]:SetText("Сдать квест")
            end
        end

    end

   end

end)




