btn={}
for ii=0,4 do
    btn[ii] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
    if ii==0 then
        btn[ii]:SetPoint("CENTER",0, 400)
        btn[ii]:SetSize(300, 30)
        btn[ii]:SetText("Взять квест")
        btn[ii]:Hide();
        btn[ii]:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzs", "GUILD", nil, 1)
        end)
    end
    if ii==1 then
        btn[ii]:SetPoint("CENTER",0, 370)
        btn[ii]:SetSize(300, 30)
        btn[ii]:SetText("Сдать квест")
        btn[ii]:Hide();
        btn[ii]:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzr", "GUILD", nil, 1)
        end)
    end
    if ii==2 then
        btn[ii]:SetPoint("CENTER",0,340)
        btn[ii]:SetSize(300, 30)
        btn[ii]:SetText("Взять бонусный квест вне лимита")
        btn[ii]:Hide();
        btn[ii]:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzz", "GUILD", nil, 1)
        end)
    end
    if ii==3 then
        btn[ii]:SetPoint("CENTER",0,310)
        btn[ii]:SetSize(300, 30)
        btn[ii]:SetText("Сдать бонусный квест вне лимита")
        btn[ii]:Hide();
        btn[ii]:SetScript("OnClick", function(self, button)
        SendChatMessage("#zzy", "GUILD", nil, 1)
        end)
    end
    if ii==4 then
        btn[ii]:SetPoint("CENTER",0,280)
        btn[ii]:SetSize(300, 30)
        btn[ii]:SetText("Узнать свой гильдлвл")
        btn[ii]:Hide();
        btn[ii]:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzt", "GUILD", nil, 1)
        end)
    end
end

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
        ii=5
        btn[ii] = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
        btn[ii]:SetPoint("CENTER",0,250)
        btn[ii]:SetSize(300, 30)
        btn[ii]:SetText("Закрыть")
        btn[ii]:Hide();
        btn[ii]:SetScript("OnClick", function(self, button)
        for ii=0,5 do
            btn[ii]:Hide();
        end
        pokazat=0
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
        end)
        for ii=0,5 do
            btn[ii]:Show();
        end
        pokazat=1
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Green.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Green.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Green.png")
    else
        for ii=0,5 do
            btn[ii]:Hide();
        end
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
        pokazat=0

    end
end)




