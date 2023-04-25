--[[ Создание фрейма, который будет содержать текстуру иконки
iconFrame1 = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
iconFrame1:SetSize(12, 12)
iconFrame1.iconTexture = iconTexture1
iconFrame1:SetScript("OnMouseUp", function() print("Clicked on myAddon icon!") end)

-- Создание текстуры иконки
iconTexture1 = iconFrame:CreateTexture("myAddonIcon", "OVERLAY")
iconTexture1:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
iconTexture1:SetSize(12, 12)
iconTexture1:SetPoint("CENTER", 110, 110)
-- Установка позиции фрейма на карте/миникарте
iconFrame1:SetHeight(12)
iconFrame1:SetWidth(12)
-- Показ фрейма на карте/миникарте
iconFrame1:Show()
--]]
iconRis={}
iconRisText={}
function iconRis:configure(idI,razmerXI,razmerYI,iconTextI)
	self[idI] = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
	self[idI]:SetSize(razmerXI, razmerYI)
	self[idI].iconTexture = iconTextI
	self[idI]:Show()
end

function iconRisText:configure(idT,razmerXT,razmerYT,XT,YT)
	self[idT] = iconFrame:CreateTexture("myAddonIcon", "OVERLAY")
	self[idT]:SetTexture("Interface\\AddOns\\NSQC\\2.tga")
	self[idT]:SetSize(razmerXT, razmerYT)
	self[idT]:SetPoint("CENTER", 0, 0)
	self[idT]:SetHeight(razmerXT)
	self[idT]:SetWidth(razmerYT)
end


iRis=1
local UpdateSpeed = 1
local fRis = CreateFrame("Frame")
fRis.Text1 = fRis:CreateFontString()

fRis.UpdateSpeed = UpdateSpeed
fRis:SetScript("OnUpdate", function(self, elapsed)
	self.UpdateSpeed = self.UpdateSpeed - elapsed
	if self.UpdateSpeed > 0 then
		return
	end

	self.UpdateSpeed = UpdateSpeed
	mioXRis, mioYRis = GetPlayerMapPosition("player");
	XXXRis,YYYRis=getPOS(mioXRis,mioYRis)
	iconRis:configure(iRis,12,12,iconRisText[iRis])
	iconRisText:configure(iRis,12,12,XXXRis,YYYRis)
	iconRisText[iRis]:SetPoint("BOTTOMLEFT", XXXRis, YYYRis)
	print (XXXRis)
	print (XXX)
	iconRis[iRis]:Show()
	iconRisText[iRis]:Show()
	iRis=iRis+1




end)
