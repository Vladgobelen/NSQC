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
function npc_scan:configure(id,Rx,Ry)
	self[id] = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
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
npcTime=1
local UpdateSpeed = 1
local ScrollMax = (UIParent:GetWidth() * UIParent:GetEffectiveScale()) -- max scroll width
local xmove = 0.5 -- move this much each update
local f = CreateFrame("Frame")
f.Text1 = f:CreateFontString()
f.Text1:SetFontObject(GameFontNormal)
f.Text1:SetText("")
f.Text1:SetPoint("LEFT", UIParent)
kolicToch=0

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
	if npcScan ~= nil then
	npcOX, npcOY = GetPlayerMapPosition("player")
	npcOK=GetCurrentMapContinent()
	npcOK=tostring(npcOK)
	npcOL=GetNumMapLandmarks()
	npcOL=tostring(npcOL)

	if WorldMapFrame:IsVisible() ~= nil then

		i=0
		nomeRar={}

		for key, val in pairs(npcScan[npcOK][npcOL]) do
			i=i+1
			nomeRar[i] = key
		end

		for j=1, #nomeRar do
			for key, val in pairs(npcScan[npcOK][npcOL][nomeRar[j]]) do
				for key, val in pairs(npcScan[npcOK][npcOL][nomeRar[j]][key]) do
					if key == "x" then
						xRar = val

					end
					if key == "y" then
						yRar = val
					end
				end

				xRar = tonumber(xRar)
				yRar = tonumber(yRar)

				npcRisX,npcRisY=getPOS(xRar,yRar)


				kolicToch=kolicToch+1
				testXY(kolicToch,npcRisX,npcRisY)


			end
			j=j+1
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
		npcTime=npcTime+2

	end
	end


	--if framePos["X"]~=nil then
		--XXX,YYY=getPOS(framePos["X"],framePos["Y"])
		--xxx,yyy=GetCursorPosition();
	--end



end)
