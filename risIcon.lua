iconRis={}
iconRisText={}
iconRisText2={}
iconRisBO={}
tochki = {}
iconRisEv3={}
iconRisEvO3 ={}
icN = 1
iconCh = {}
iconChText = {}
iconRisEv3 = {}
iconRisEvent3 = {}
iconRisEvent3Tex={}
iconQ = {}
iconQText = {}
mgznIcon = {}
mgznText = {}

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
function iconQ:configure()
	self[1] = self[1] or CreateFrame("FRAME", "myAddonIconFrame", UIParent)
	self[1]:SetSize(512, 396)
end
function iconQText:configure()
	self[1] = iconQ[1]:CreateTexture("myAddonIcon", "OVERLAY")
	self[1]:SetTexture("Interface\\AddOns\\NSQC\\libs\\quest.tga")
	self[1]:SetSize(512, 396)
	self[1]:SetPoint("CENTER", UIParent,"CENTER", 0, 0)
end
function mgznIcon:configure()
	self[1] = self[1] or CreateFrame("FRAME", "myAddonIconFrame", UIParent)
	self[1]:SetSize(768, 512)
end
function mgznText:configure()
	self[1] = mgznIcon[1]:CreateTexture("myAddonIcon", "OVERLAY")
	self[1]:SetTexture("Interface\\AddOns\\NSQC\\libs\\quest.tga")
	self[1]:SetPoint("CENTER", UIParent,"CENTER", 0, 0)
	self[1]:SetSize(768, 700)
end
function magazin(sign)
	GameTooltip:Hide()
	if sign == "show" then
		if mgznIcon[1] == nil then
			mgznIcon:configure()
			mgznText:configure()
			mgznIcon[1]:SetFrameStrata("DIALOG")
			mgznText[1]:SetPoint("CENTER", UIParent,"CENTER",-80,48)
			if mgznZ == nil then
				mgznZ = CreateFrame("Button", nil, UIParent, "");
				mgznZ:SetFrameStrata("FULLSCREEN_DIALOG")
				mgznZ:SetPoint("BOTTOMLEFT", resursy[5],"BOTTOMLEFT",0, 0)
				mgznZ:SetSize(64, 64)
				mgznZ:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				mgznZ:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\smg.tga")
				--mgznZ:SetFrameStrata("LOW")
				mgznZ:SetScript("OnEnter",function(self)
					GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
					GameTooltip:AddLine("|cff99ff99Валюта")
					GameTooltip:AddLine("|cffFFCF40Иногда падает с квеста на шерсть и прочую ткань")
					GameTooltip:AddLine("|cffFFCF40Можно купить на аукционе: |cff99ff99\"Обычное письмо\" |cffFFCF40от персонажа \"Хефе\"")
					GameTooltip:AddLine("|cff99ff99ЛКМ: |cffFFCF40Открыть/Закрыть магазин")
					GameTooltip:Show()
				end)
				mgznZ:SetScript("OnLeave",function(self)
					GameTooltip:Hide()
				end)
				mgznZ:SetScript("OnClick",function(self)
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\clc.ogg")
					if testQ["magSign"] == nil then
						dmgText1(testQ["smg"],mgznZ,1005,11,"FF8C00")
						dmG1[1005]:Show()
						dmG1[1005]:SetFrameStrata("TOOLTIP")
						mgznIcon[1]:Show()
						for i = 1, 100 do
							fBtn[i]:Hide()
						end
						resursy[5]:Hide()
						mgznZ:Show()
						mgznZ:SetFrameStrata("LOW")
					else
						dmgText1("",mgznZ,1005,22,"FF8C00")
						mgznIcon[1]:Hide()
						for i = 1, 100 do
							fBtn[i]:Show()
							if mBtn[i] ~= nil then
								mBtn[i]:Hide()
							end
						end
						if not resursy[5]:IsVisible() and not mgznZ:IsVisible() then
							for i = 1, 10000 do
								if dmG1[i] ~= nil then
									dmG1[i]:Hide()
								end
								if dmG2[i] ~= nil then
									dmG2[i]:Hide()
								end
							end
						end
						dmgText(testQ["brevna"],resursy[1],101,22,"FF8C00")
						dmgText(testQ["stog"],resursy[2],102,22,"FF8C00")
						dmgText(testQ["kamen"],resursy[3],103,22,"FF8C00")
						dmgText(string.format("%d", tonumber(testQ["beton"])),resursy[4],104,13,"FF8C00")
						dmgText(testQ["smg"],resursy[5],105,22,"FF8C00")
						resursy[5]:Show()
						btn[989]:Show()
					end
					GameTooltip:Hide()
				end)
			else
				dmgText1(testQ["smg"],mgznZ,1005,22,"FF8C00")
				dmG1[1005]:Show()
				dmG1[1005]:SetFrameStrata("TOOLTIP")
				mgznZ:Show()
				GameTooltip:Hide()
			end
		else
			mgznIcon[1]:Show()
		end
	else
		if mgznIcon[1] ~= nil then
			mgznIcon[1]:Hide()
		end
	end
end
function iconRis:configure(id,Rx,Ry)
	self[id] = self[id] or CreateFrame("FRAME", "myAddonIconFrame", WorldMapDetailFrame)
	self[id]:SetSize(Rx, Ry)
	--self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT")
end
function iconRisEv3:configure(id,Rx,Ry)
	self[id] = self[id] or CreateFrame("FRAME", "myAddonIconFrame", WorldMapDetailFrame)
	self[id]:SetSize(Rx, Ry)
	--self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT")
end
function iconRisEvent3:configure(id,Rx,Ry)
	self[id] = self[id] or CreateFrame("FRAME", "myAddonIconFrame", UIParent)
	self[id]:SetSize(Rx, Ry)
	--self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT")
end

function iconRisText:configure(id,Rx,Ry,x,y,nRis)
	self[id] = iconRis[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\" .. nRis ..".tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT", WorldMapDetailFrame,"BOTTOMLEFT", x, y)
end
function iconRisBO:configure(id,Rx,Ry,x,y,nRis)
	self[id] = iconRis[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\121212.tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("CENTER", WorldMapDetailFrame,"BOTTOMLEFT", x, y)
end
function iconRisEvO3:configure(id,Rx,Ry,x,y,nRis)
	self[id] = iconRisEv3[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\" .. nRis ..".tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("CENTER", WorldMapDetailFrame,"BOTTOMLEFT", x, y)
end
function iconRisEvent3Tex:configure(id,Rx,Ry,x,y,nRis)
	self[id] = iconRisEvent3[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface/COMMON/Indicator-Green.png")
	self[id]:SetPoint("CENTER", UIParent,"BOTTOMLEFT", x, y)
end
function quesT(sign)
	if sign == "show" then
		if iconQ[1] == nil then
			iconQ:configure()
			iconQText:configure()
			iconQ[1]:SetFrameStrata("FULLSCREEN_DIALOG")
			iconQText[1]:SetPoint("CENTER", UIParent,"CENTER",0,0)
		else
			iconQ[1]:Show()
		end
	else
		if iconQ[1] ~= nil then
			iconQ[1]:Hide()
		end
	end
end

function bo(n,n1)
	for k, v in pairs(mapTables[testQ["эвент1"]]) do
		if type(k)=="string" then
		tKont = k
	end
		for k, v in pairs(mapTables[testQ["эвент1"]][k]) do
			if type(k)=="string" then
				tLok = k
			end
		end
	end
	iconRis:configure(n,n,n1)
	local xx,yy = getPOS(tonumber(mapTables[testQ["эвент1"]][tKont][tLok][tostring(n)]["x"]), tonumber(mapTables[testQ["эвент1"]][tKont][tLok][tostring(n)]["y"]))
	iconRisBO:configure(n,n1,n1,xx,yy,121212)
	iconRis[n]:SetFrameStrata("TOOLTIP")
	iconRisBO[n]:SetPoint("CENTER", WorldMapDetailFrame,"BOTTOMLEFT",xx,yy )
end
function event3(n,n1,show)
	if show == "show" then
		if iconRisEvent3[1] == nil then
			iconRisEvent3:configure(1,576,384)
			iconRisEvent3Tex:configure(1,n1,n1,0,0,121212)
			iconRisEvent3Tex[n]:SetSize(n1, n1)
			iconRisEvent3[1]:SetFrameStrata("BACKGROUND")
			iconRisEvent3Tex[1]:SetPoint("CENTER", UIParent,"CENTER",0,0)
		else
			if not iconRisEvent3[1]:IsVisible() then
				iconRisEvent3[1]:Show()
				iconRisEvent3Tex[1]:SetSize(n1, n1)
			else
				iconRisEvent3Tex[1]:SetSize(n1, n1)
			end
		end
	else
		if iconRisEvent3[1] ~= nil then
			iconRisEvent3[1]:Hide()
		end
	end
end
function ev3(tabella,n,n1)
	for k, v in pairs(mapTables[tabella]) do
		if type(k)=="string" then
		tKont = k
	end
		for k, v in pairs(mapTables[tabella][k]) do
			if type(k)=="string" then
				tLok = k
			end
		end
	end
	iconRisEv3:configure(n,576,384)
	local xx,yy = getPOS(tonumber(mapTables[tabella][tKont][tLok][tostring(n)]["x"]), tonumber(mapTables[tabella][tKont][tLok][tostring(n)]["y"]))
	iconRisEvO3:configure(n,n1,n1,xx,yy,121212)
	iconRisEv3[n]:SetFrameStrata("TOOLTIP")
	iconRisEvO3[n]:SetPoint("CENTER", WorldMapDetailFrame,"BOTTOMLEFT",xx,yy )
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
