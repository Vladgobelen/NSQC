local btn = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
btn:SetPoint("CENTER",0, 400)
btn:SetSize(300, 30)
btn:SetText("Взять квест")
btn:Hide();
btn:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzs", "GUILD", nil, 1)
end)

local btn1 = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
btn1:SetPoint("CENTER",0, 370)
btn1:SetSize(300, 30)
btn1:SetText("Сдать квест")
btn1:Hide();
btn1:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzr", "GUILD", nil, 1)
end)

local btn2 = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
btn2:SetPoint("CENTER",0,340)
btn2:SetSize(300, 30)
btn2:SetText("Взять бонусный квест вне лимита")
btn2:Hide();
btn2:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzz", "GUILD", nil, 1)
end)

local btn3 = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
btn3:SetPoint("CENTER",0,310)
btn3:SetSize(300, 30)
btn3:SetText("Сдать бонусный квест вне лимита")
btn3:Hide();
btn3:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzy", "GUILD", nil, 1)
end)

local btn4 = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
btn4:SetPoint("CENTER",0,280)
btn4:SetSize(300, 30)
btn4:SetText("Узнать свой гильдлвл")
btn4:Hide();
btn4:SetScript("OnClick", function(self, button)
	SendChatMessage("#zzt", "GUILD", nil, 1)
end)

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

local pokazat=0
minibtn:SetScript("OnClick", function()

    if pokazat~=1 then

        local btn5 = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
        btn5:SetPoint("CENTER",0,250)
        btn5:SetSize(300, 30)
        btn5:SetText("Закрыть")
        btn5:SetScript("OnClick", function(self, button)
        btn:Hide();
        btn1:Hide();
        btn2:Hide();
        btn3:Hide();
        btn4:Hide();
        btn5:Hide();
        pokazat=0
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Red.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Red.png")
        end)

        btn:Show();
        btn1:Show();
        btn2:Show();
        btn3:Show();
        btn4:Show();
        btn5:Show();
        pokazat=1
        minibtn:SetNormalTexture("Interface/COMMON/Indicator-Green.png")
        minibtn:SetPushedTexture("Interface/COMMON/Indicator-Green.png")
        minibtn:SetHighlightTexture("Interface/COMMON/Indicator-Green.png")

        else


    end
end)




