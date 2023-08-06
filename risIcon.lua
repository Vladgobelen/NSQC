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
iconRisText2={}
tochki = {}
icN = 1
iconCh = {}
iconChText = {}
--1-16   17-32   33-48 49-64
function iconCh:configure(id,Rx,Ry)
	self[id] = self[id] or CreateFrame("FRAME", "myAddonIconFrame", WorldMapDetailFrame)
	self[id]:SetSize(Rx, Ry)
	--self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT")
end

function iconChText:configure(id,Rx,Ry,x,y)
	self[id] = iconCh[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\libs\\ch.png")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT", x, y)
end

function chMuestro(iCh,X0,Y0)
	iconCh:configure(iCh,576,384)
	iconChText:configure(iCh,32,32,X0,Y0)
	iconCh:configure(iCh,X0,Y0)
	iconChText:configure(iCh,32,32,X0,Y0)
	iconCh[iCh]:SetFrameStrata("TOOLTIP")
	iconChText[iCh]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT", X0, Y0)
end



function iconRis:configure(id,Rx,Ry)
	self[id] = self[id] or CreateFrame("FRAME", "myAddonIconFrame", WorldMapDetailFrame)
	self[id]:SetSize(Rx, Ry)
	--self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT")
end

function iconRisText:configure(id,Rx,Ry,x,y,nRis)
	self[id] = iconRis[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\" .. nRis ..".tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT", x, y)
end

function iconRisText2:configure(id,Rx,Ry,x,y,nRis)
	self[id] = iconRis[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\" .. nRis ..".tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("TOPLEFT", WorldMapDetailFrame,"TOPLEFT", x, y)
end




function setka()
mostraKrtl2("Show",0,0,0,650,50,1,3)
mostraKrtl2("Show",50,0,50,650,50,1,3)
mostraKrtl2("Show",100,0,100,650,50,1,3)
mostraKrtl2("Show",150,0,150,650,50,1,3)
mostraKrtl2("Show",200,0,200,650,50,1,3)
mostraKrtl2("Show",250,0,250,650,50,1,3)
mostraKrtl2("Show",300,0,300,650,50,1,3)
mostraKrtl2("Show",350,0,350,650,50,1,3)
mostraKrtl2("Show",400,0,400,650,50,1,3)
mostraKrtl2("Show",450,0,450,650,50,1,3)
mostraKrtl2("Show",500,0,500,650,50,1,3)
mostraKrtl2("Show",550,0,550,650,50,1,3)
mostraKrtl2("Show",600,0,600,650,50,1,3)
mostraKrtl2("Show",650,0,650,650,50,1,3)
mostraKrtl2("Show",700,0,700,650,50,1,3)
mostraKrtl2("Show",750,0,750,650,50,1,3)
mostraKrtl2("Show",800,0,800,650,50,1,3)
mostraKrtl2("Show",850,0,850,650,50,1,3)
mostraKrtl2("Show",900,0,900,650,50,1,3)
mostraKrtl2("Show",950,0,950,650,50,1,3)
mostraKrtl2("Show",1000,0,1000,650,50,1,3)
mostraKrtl2("Show",0,0,1000,0,50,1,3)
mostraKrtl2("Show",0,50,1000,50,50,1,3)
mostraKrtl2("Show",0,100,1000,100,50,1,3)
mostraKrtl2("Show",0,150,1000,150,50,1,3)
mostraKrtl2("Show",0,200,1000,200,50,1,3)
mostraKrtl2("Show",0,250,1000,250,50,1,3)
mostraKrtl2("Show",0,300,1000,300,50,1,3)
mostraKrtl2("Show",0,350,1000,350,50,1,3)
mostraKrtl2("Show",0,400,1000,400,50,1,3)
mostraKrtl2("Show",0,450,1000,450,50,1,3)
mostraKrtl2("Show",0,500,1000,500,50,1,3)
mostraKrtl2("Show",0,550,1000,550,50,1,3)
mostraKrtl2("Show",0,600,1000,600,50,1,3)
mostraKrtl2("Show",0,650,1000,650,50,1,3)
end
function mostraKrtl2(signalKrt,X0,Y0,X1,Y1,S,S1,diametr)
    if signalKrt=="Show" then
        tochki[icN] = true
        iconRis:configure(icN,576,384)
        iconRisText:configure(icN,diametr,diametr,X0,Y0,121212)
        local x0 = X0
        local y0 = Y0
        local x1 = X1
        local y1 = Y1

        local dx = x1 - x0
        local dy = y1 - y0


        local i0 = 1
        local i1 = S
        local step = S1
        local stepCount = (i1 - i0) / step


        dirX = dx / stepCount
        dirY = dy / stepCount


        local resX = x0
        local resY = y0
        for i=i0,i1,step do
            icN = icN+i
            tochki[icN] = true
            resX = resX + dirX
            resY = resY + dirY
            iconRis:configure(icN,resX,resY)
            iconRisText:configure(icN,diametr,diametr,1,1,121212)
            iconRis[icN]:SetFrameStrata("TOOLTIP")
            iconRisText[icN]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT", resX, resY)

		end
    else
        iconRisText[icN][signalKrt](iconRisText[icN])
    end
end
function krtHide(signalKrt)
	if #tochki ~= nil then
		for key, val in pairs(tochki) do
			if tochki[key] == true then
				iconRis[key]["Hide"](iconRis[key])
			end
		end
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
