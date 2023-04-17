local current = GetCurrentResolution()
if current then
	width, height = string.match(select(current, GetScreenResolutions()), "(%d+)x(%d+)")
end

-- Создание фрейма, который будет содержать текстуру иконки
iconFrame = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
iconFrame:SetSize(12, 12)
iconFrame.iconTexture = iconTexture
iconFrame:SetScript("OnMouseUp", function() print("Clicked on myAddon icon!") end)

-- Создание текстуры иконки
iconTexture = iconFrame:CreateTexture("myAddonIcon", "OVERLAY")
iconTexture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
iconTexture:SetSize(12, 12)
iconTexture:SetPoint("CENTER", 0, 0)
-- Установка позиции фрейма на карте/миникарте
iconFrame:SetHeight(12)
iconFrame:SetWidth(12)
-- Показ фрейма на карте/миникарте
iconFrame:Show()


--[[local myButton = CreateFrame("Button", "MyButtonName", Minimap, "UIPanelButtonTemplate")
myButton:SetSize(16, 16)
myButton:SetPoint("CENTER", Minimap, 10, -10)
myButton:SetText("")
myButton:SetNormalFontObject("GameFontNormal")
myButton:SetHighlightFontObject("GameFontHighlight")
myButton:SetScript("OnClick", function()
--Ваш код
end)--]]




local UpdateSpeed = 1
local ScrollMax = (UIParent:GetWidth() * UIParent:GetEffectiveScale()) -- max scroll width
local xmove = 0.5 -- move this much each update
local f = CreateFrame("Frame")
f.Text1 = f:CreateFontString()
f.Text1:SetFontObject(GameFontNormal)
f.Text1:SetText("желтые глюки ползут по экрану медленно медленно, плавно плавно..")
f.Text1:SetPoint("LEFT", UIParent)

local xos = -f.Text1:GetWidth() -- Set to start offscreen by the width ofm the text
f.UpdateSpeed = UpdateSpeed
f:SetScript("OnUpdate", function(self, elapsed)
	self.UpdateSpeed = self.UpdateSpeed - elapsed
	if self.UpdateSpeed > 0 then
		return
	end
	self.UpdateSpeed = UpdateSpeed
	xos = xos + xmove
	if xos > ScrollMax then -- we're offscreen to the right so...
		xos =  -self.Text1:GetWidth() -- reset to the left again
	end
	if nXres~=nil or nYres~=nil then
	xxx,yyy=GetCursorPosition();

YYY=1-nYres
YYY1=GetScreenWidth()
iconFrame:SetPoint("BOTTOMLEFT", 566-7, 395-45)
end

	f.Text1:SetPoint("LEFT", UIParent, xos, 0) -- reposition the text to its new location
end)
