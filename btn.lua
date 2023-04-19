Astrolabe = DongleStub("Astrolabe-0.4")
Astrolabe.MinimapUpdateTime = 0.1
versAdd=27
local myNome = GetUnitName("player")
print("NSQC: Клик левой кнопкой: показать аддон/скрыть аддон")
print("NSQC: Клик правой кнопкой: показать информацию")
btn = {};
function btn:configure(id,posex,posey,sizex,sizey,zzid,message)
    self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
    self[id]:SetPoint("CENTER",posex, posey)
    self[id]:SetSize(sizex, sizey)
    self[id]:SetText(message)
    self[id]:Hide();

    if id==7 or id==1 or id==2 then
    self[id]:SetScript("OnClick",function(self, button)
        SendChatMessage(zzid, "OFFICER", nil, 1)
        if id==2 or id==7 then
            testQ[myNome]["взятый_квест"]="9999"
        end
    end)

    else
    self[id]:SetScript("OnClick",function(self, button)
           SendChatMessage(zzid, "GUILD", nil, 1) end)
    end
    if id==8 then
            self[id]:SetScript("OnClick",function(self, button)
                SendChatMessage(GetAchievementLink(testQ[myNome]["взятый_квест"]), "GUILD", nil, 1)

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
btn:configure(9,-400,400,100,30,"","тест");
btn:configure(7,0,200,300,30,"#zzp","Отказаться от квеста");
btn:configure(8,0,170,300,30,"","Узнать текущий квест");


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
            for ii=1,8 do
                btn[ii]:Hide();
            end
            pokazat=0
            minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
            minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
            minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
            end)
            for ii=1,8 do
                btn[ii]:Show();
            end
            pokazat=1
            minibtn:SetNormalTexture("Interface/COMMON/Indicator-Green.png")
            minibtn:SetPushedTexture("Interface/COMMON/Indicator-Green.png")
            minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Green.png")
        else
            for ii=1,8 do
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
        print ("В гильдчат: " .. myNome .. " покажи предмет [название предмета]")
    end
end)


if framePos==nil then
    framePos={}
end
btn[9]:SetScript("OnClick",function(self, button)
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
    btn[9]:Disable()
elseif sender==myNome and message=="start" then
    framePos[1]=1
    btn[9]:Enable()
elseif sender==myNome and message=="скрыть" then
    btn[9]:Hide()
elseif sender==myNome and message=="показать" then
    btn[9]:Show()
    btn[9]:Disable()
end


end
)








local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed


	if timeElapsed > 1 then
		timeElapsed = 0



		mioKont,mioLok,mioX,mioY=Astrolabe:GetCurrentPlayerPosition()
		mioKont=tonumber(mioKont)
		nKont=tonumber(nKont)
		mioLok=tonumber(mioLok)
		nLok=tonumber(nLok)
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
                                SendChatMessage(hsh .. " Я вернулся на маршрут", "GUILD", nil, 1)
                                testRasstoyanie=0
                            else
                            end
                        end

                    elseif mioTime >= 2 then
                        posmioXN, posmioYN = GetPlayerMapPosition("player");
                        mioCel1=sqrt((nXres-posmioXN)^2+(nYres-posmioYN)^2)
                        if mioCel > mioCel1 then
                            btn[9]:SetText("тепло")
                            btn[9]:Enable()
                        else
                            btn[9]:SetText("холодно")
                            btn[9]:Disable()
                        end
                        mioTime=1
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
        testComplit=testQ[myNome]["взятый_квест"]
        id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch = GetAchievementInfo(testComplit)
        btn[7]:Enable()
        btn[7]:SetText("Отказаться от квеста")
        btn[8]:Enable()
        btn[8]:SetText("Узнать текущий квест")
        if completed ~= true then
            btn[2]:Disable()
            btn[2]:SetText("Ачивка не выполнена")

        else
            btn[2]:Enable()
            btn[2]:SetText("Сдать квест")
        end
    end

   end

end)




