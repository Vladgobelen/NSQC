--[[ Создание фрейма, который будет содержать текстуру иконки
iconFrame1 = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
iconFrame1:SetSize(12, 12)
iconFrame1:SetPoint("BOTTOMLEFT")
-- Создание текстуры иконки
iconTexture1 = iconFrame1:CreateTexture("myAddonIcon", "OVERLAY")
iconTexture1:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
iconTexture1:SetSize(12, 12)
iconTexture1:SetPoint("BOTTOMLEFT", 0, 0)


iconRis={}
iconRisText={}

function iconRis:configure(id,Rx,Ry)
	self[id] = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT")
end

function iconRisText:configure(id,Rx,Ry,x,y)
	self[id] = iconRis[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT", x, y)
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
	mioKontRis,mioLokRis,mioXRis,mioYRis=Astrolabe:GetCurrentPlayerPosition()
	XXXRis,YYYRis=getPOS(mioXRis,mioYRis)

	iconRis:configure(iRis,12,12)
	iconRisText:configure(iRis,12,12,0,0)
	iconRis[iRis]:SetPoint("BOTTOMLEFT", XXXRis, YYYRis)
	iconRis[iRis]:Show()
	iRis=iRis+1

end)--]]
