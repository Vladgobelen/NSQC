--[[ Создание фрейма, который будет содержать текстуру иконки
iconFrame1 = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
iconFrame1:SetSize(12, 12)
iconFrame1:SetPoint("BOTTOMLEFT")
-- Создание текстуры иконки
iconTexture1 = iconFrame1:CreateTexture("myAddonIcon", "OVERLAY")
iconTexture1:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
iconTexture1:SetSize(12, 12)
iconTexture1:SetPoint("BOTTOMLEFT", 0, 0)

--]]
iconRis={}
iconRisText={}

function iconRis:configure(id,Rx,Ry)
	self[id] = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT")
end

function iconRisText:configure(id,Rx,Ry,x,y,nRis)
	self[id] = iconRis[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\test\\rez-" .. nRis ..".tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT", x, y)
end

function mostraKrtM1x1(signalKrt)
	if signalKrt=="Show" then
		jj=20
		j=394
		for i=0,16 do
			iconRis:configure(i,545,350)
			iconRisText:configure(i,9.1,6,0,0,i)
			iconRis[i]:SetPoint("BOTTOMLEFT", jj, j)
			jj=jj+9.1
		end
		jj=20
		j=394-6
		for i=64,80 do
			iconRis:configure(i,545,350)
			iconRisText:configure(i,9.1,6,0,0,i)
			iconRis[i]:SetPoint("BOTTOMLEFT", jj, j)
			jj=jj+9.1
		end
	elseif signalKrt=="Hide" then
		for i=0,16 do
			iconRisText[i][signalKrt](iconRisText[i])
		end
		for i=64,80 do
			iconRisText[i][signalKrt](iconRisText[i])
		end
	end
end

function mostraKrtM11x11(signalKrt)

	if signalKrt=="Show" then
		ranges = {{1, 16}, {65, 80},{129,144},{193,208},{257,272},{321,336},{385,400},{449,464}}
		j=394
		for range,value in pairs(ranges) do
			jj=20
			for rangeT=value[1],value[2] do
				print (rangeT)
				iconRis:configure(rangeT,545,350)
				iconRisText:configure(rangeT,9.1,6,0,0,rangeT)
				iconRis[rangeT]:SetPoint("BOTTOMLEFT", jj, j)
				jj=jj+9.1
			end
			j=j-6
		end
	else

	end
end














--[[
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

	iconRis:configure(iRis,128,128)
	iconRisText:configure(iRis,128,128,0,0)
	iconRis[iRis]:SetPoint("BOTTOMLEFT", XXXRis, YYYRis)
	iconRis[iRis]:Show()
	iRis=iRis+1

end)
--]]
