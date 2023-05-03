npc_scan={}
npc_scan_Text={}
--[[
function createMark(id,x,y)
    local mark = _G["myAddonIconFrame"..id] or CreateFrame("FRAME", "myAddonIconFrame"..id, WorldMapFrame)
    mark:SetSize(40, 40)
    mark:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", x, -y)
    mark.texture = mark.texture or mark:CreateTexture("myAddonIcon", "OVERLAY")
    mark.texture:SetTexture("Interface\AddOns\NSQC\npcscan\2.tga")
    mark.texture:SetAllPoints()
    mark:Show()
    mark.texture:Show()
end
--]]
function npc_scan:configure(id,Rx,Ry,x,y)
	self[id] =  self[id] or CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("CENTER", WorldMapFrame, "BOTTOMLEFT", x, y)
end

function npc_scan_Text:configure(id,Rx,Ry,x,y)
	self[id] = npc_scan[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\npcscan\\2.tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:ClearAllPoints();
	self[id]:SetAllPoints();
	self[id]:SetPoint("CENTER", WorldMapFrame, "BOTTOMLEFT", x, y)
end


function testXY(id,x,y)
	npc_scan:configure(id,12,12)
	npc_scan_Text:configure(id,12,12,0,0)
	npc_scan[id]:SetPoint("CENTER", WorldMapDetailFrame, "BOTTOMLEFT", x, y)

end

local UpdateSpeed = 0.1
local ScrollMax = (UIParent:GetWidth() * UIParent:GetEffectiveScale()) -- max scroll width
local xmove = 105 -- move this much each update
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
	npcTime=1
	testText=0
	kolicToch=0
	local myNome = GetUnitName("player")

	if testQ[myNome]["отключить_поиск"] ~= "тру" then
	if npcScan ~= nil then

	npcOX, npcOY = GetPlayerMapPosition("player")
	npcOK=GetCurrentMapContinent()
	npcOK=tostring(npcOK)
	if npcScan[npcOK] == nil then
		npcScan[npcOK] = {}
	end
	npcOL=GetCurrentMapZone()
	npcOL=tostring(npcOL)
	if npcScan[npcOK][npcOL] == nil then
		npcScan[npcOK][npcOL] = {}
	end
	testl=tablelength(npcScan[npcOK][npcOL])
	testl=tonumber(testl)

	if testl~=0 then

		if WorldMapFrame:IsVisible() ~= nil then

			iNpc=0
			nomeRar={}

			for key, val in pairs(npcScan[npcOK][npcOL]) do
				iNpc=iNpc+1
				nomeRar[iNpc] = key
			end
			jNpc=0
			for jNpc=1, #nomeRar do
				for key, val in pairs(npcScan[npcOK][npcOL][nomeRar[jNpc]]) do
					for key, val in pairs(npcScan[npcOK][npcOL][nomeRar[jNpc]][key]) do
						if key == "x" then
							xRar = val

						end
						if key == "y" then
							yRar = val
						end
					end
					x,y=GetPlayerMapPosition("player")
					npcRasstoyanieSch=sqrt((xRar-x)^2+(yRar-y)^2)

					if npcRasstoyanieSch <= 0.04 then

						for i=1,36 do
							testMacro=GetMacroInfo(i)
							if testMacro~=nil then
								testMacro=mysplit(testMacro)
								if testMacro[1] == "NSQC" then
									EditMacro(i, "NSQC", 134414, "/target " .. nomeRar[jNpc] )
								end
							end
						end
						f.Text1:SetText("Возможно рядом " .. nomeRar[jNpc])
					end
					if UnitName("Target")==nomeRar[jNpc] then
							PlaySoundFile("Interface\\AddOns\\NSQC\\gob.ogg")
							for i=1,36 do
							testMacro=GetMacroInfo(i)
							if testMacro~=nil then
								testMacro=mysplit(testMacro)
								if testMacro[1] == "NSQC" then
									EditMacro(i, "NSQC", 134414, "/target " .. nomeRar[jNpc])

									btn[999]:Show()
								end
							end
						end
					end
					xRar = tonumber(xRar)
					yRar = tonumber(yRar)
					npcRisX,npcRisY=getPOS(xRar,yRar)
					kolicToch=kolicToch+1
					local testPlk=GetCurrentMapContinent()
					local testPll=GetCurrentMapZone()
						testXY(kolicToch,npcRisX,npcRisY)

						npc_scan[kolicToch]:Show()
						npcIc = {}
						npcIc[kolicToch] = nomeRar[kolicToch]
						npc_scan_Text[kolicToch]:Show()
						if MouseIsOver(npc_scan[kolicToch]) then
							print (npcIc[kolicToch])
						end



				end
				jNpc=jNpc+1
			end
			kk=kolicToch
			kolicToch=0
			if npcTime > 1 then
				for i=1, kk do
					npc_scan[i]:Hide()
					npc_scan_Text[i]:Hide()
					npc_scan[i]:ClearAllPoints()
					npc_scan_Text[i]:ClearAllPoints()
				end
				npcTime=0
			end
			npcTime=npcTime+1

		end
	else
		chisloIconok=tablelength(npc_scan)
		chisloIconok=tonumber(chisloIconok)
		if npc_scan[1] ~= nil then

			for i=1, chisloIconok do
					if npc_scan[i] ~= nil then
						npc_scan[i]:Hide()
						npc_scan_Text[i]:Hide()
						npc_scan[i]:ClearAllPoints()
						npc_scan_Text[i]:ClearAllPoints()
					end
				i=i+1
			end
		end
	end
	end
	else
		btn[999]:Hide()
		f.Text1:SetText("")
	end

	if testQ[myNome]["отключить_поиск"] == "тру" then
		btn[12]:Enable()
		btn[12]:SetText("Включить поиск")
		chisloIconok=tablelength(npc_scan)
		chisloIconok=tonumber(chisloIconok)
		if npc_scan[1] ~= nil then

			for i=1, chisloIconok do
					if npc_scan[i] ~= nil then
						npc_scan[i]:Hide()
						npc_scan_Text[i]:Hide()
						npc_scan[i]:ClearAllPoints()
						npc_scan_Text[i]:ClearAllPoints()
					end
				i=i+1
			end
		end
	end
	if testQ[myNome]["отключить_поиск"] ~= "тру" then
		btn[12]:Disable()
		btn[12]:SetText("Поиск включен")

	end

	if WorldMapFrame:IsVisible() == nil  then
		f.Text1:SetText("")
	end
	--if framePos["X"]~=nil then
		--XXX,YYY=getPOS(framePos["X"],framePos["Y"])
		--xxx,yyy=GetCursorPosition();
	--end

	if WorldMapDetailFrame:IsMouseOver() then


	end
f.Text1:SetPoint("LEFT", UIParent, 555, 0)

end)
