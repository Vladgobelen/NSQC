

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

--[[
myButton = CreateFrame("Button", "MyButtonName", Minimap, "UIPanelButtonTemplate")
myButton:SetSize(16, 16)
myButton:SetText("")
		myButton:SetPoint("BOTTOMLEFT", Minimap, XXX, YYY)

myButton:SetNormalFontObject("GameFontNormal")
myButton:SetHighlightFontObject("GameFontHighlight")
myButton:SetScript("OnClick", function()
--Ваш код
end)
--]]



local UpdateSpeed = 1
local ScrollMax = (UIParent:GetWidth() * UIParent:GetEffectiveScale()) -- max scroll width
local xmove = 0.5 -- move this much each update
local f = CreateFrame("Frame")
f.Text1 = f:CreateFontString()
f.Text1:SetFontObject(GameFontNormal)
f.Text1:SetText("")
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
	if framePos["X"]~=nil then
		XXX,YYY=getPOS(framePos["X"],framePos["Y"])
		--xxx,yyy=GetCursorPosition();
	end
	iconFrame:SetPoint("BOTTOMLEFT", XXX, YYY)
	mioKont,mioLok,mioX,mioY=Astrolabe:GetCurrentPlayerPosition()
	mioKont=tonumber(mioKont)
	nKont=tonumber(framePos["kont"])
	mioLok=tonumber(mioLok)
	nLok=tonumber(framePos["lok"])
	testMapviz1=framePos["mapViz"]
	testMapviz1=tonumber(testMapviz1)
	testMapviz2=GetCurrentMapAreaID()
	testMapviz2=tonumber(testMapviz2)
	if testMapviz1==testMapviz2 then
		iconFrame:Show()
	else
		iconFrame:Hide()
	end
--posX, posY = GetPlayerMapPosition("player");(posX*575)+15, ((1-posY)*386)+10)






	f.Text1:SetPoint("LEFT", UIParent, xos, 0) -- reposition the text to its new location
end)
