btn = {};
function btn:configure(id,posex,posey,sizex,sizey,zzid,message)
    self[id] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
    self[id]:SetPoint("CENTER",posex, posey)
    self[id]:SetSize(sizex, sizey)
    self[id]:SetText(message)
    self[id]:Hide();
    if id==7 or id==1 or id==2 then
    self[id]:SetScript("OnClick",function(self, button)
           SendChatMessage(zzid, "OFFICER", nil, 1) end)
    else
    self[id]:SetScript("OnClick",function(self, button)
           SendChatMessage(zzid, "GUILD", nil, 1) end)
    end
end

-- вместо цикла явная индексация, так как у тебя один фиг ifы
-- видимо я так понял имеет значение порядок создания кнопок
btn:configure(1,0,400,300,30,"#zzs","Взять квест");
btn:configure(2,0,370,300,30,"#zzr","Сдать квест");
btn:configure(3,0,340,300,30,"#zzz","Взять бонусный квест вне лимита");
btn:configure(4,0,310,300,30,"#zzy","Сдать бонусный квест вне лимита");
btn:configure(5,0,280,300,30,"#zzt","Узнать свой гилдлвл");
btn:configure(8,-400,400,100,30,"","тест");
btn:configure(7,0,250,300,30,"#zzp","Отказаться от квеста");



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
    if pokazat~=1 then
        ii=6
        btn[ii] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
        btn[ii]:SetPoint("CENTER",0,220)
        btn[ii]:SetSize(300, 30)
        btn[ii]:SetText("Закрыть")
        btn[ii]:Hide();
        btn[ii]:SetScript("OnClick", function(self, button)
        for ii=1,7 do
            btn[ii]:Hide();
        end
        pokazat=0
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
        end)
        for ii=1,7 do
            btn[ii]:Show();
        end
        pokazat=1
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Green.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Green.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Green.png")
    else
        for ii=1,7 do
            btn[ii]:Hide();
        end
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
        pokazat=0

    end
end)


if framePos==nil then
    framePos={}
end
btn[8]:SetScript("OnClick",function(self, button)
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
    btn[8]:Disable()
elseif sender==myNome and message=="start" then
    framePos[1]=1
    btn[8]:Enable()
elseif sender==myNome and message=="скрыть" then
    btn[8]:Hide()
elseif sender==myNome and message=="показать" then
    btn[8]:Show()
    btn[8]:Disable()
end


end
)


local frameTime = CreateFrame("FRAME")
local timeElapsed = 0
frameTime:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	if timeElapsed > 1 then
		timeElapsed = 0
		if mioTime < 2 then
            mioTime=mioTime+1
            posmioX, posmioY = GetPlayerMapPosition("player");
            mioCel=sqrt((nXres-posmioX)^2+(nYres-posmioY)^2)
        elseif mioTime >= 2 then
            posmioXN, posmioYN = GetPlayerMapPosition("player");
            mioCel1=sqrt((nXres-posmioXN)^2+(nYres-posmioYN)^2)
            if mioCel > mioCel1 then
                btn[8]:SetText("тепло")
                btn[8]:Enable()
            else
                btn[8]:SetText("холодно")
                btn[8]:Disable()
            end
            mioTime=1
        end
   end
end)




