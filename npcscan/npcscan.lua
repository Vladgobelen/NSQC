npc_scan={}
npc_scan_Text={}

function npc_scan:configure(id,Rx,Ry)
	self[id] = CreateFrame("FRAME", "myAddonIconFrame", WorldMapFrame)
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT")
end

function npc_scan_Text:configure(id,Rx,Ry,x,y)
	self[id] = npc_scan[id]:CreateTexture("myAddonIcon", "OVERLAY")
	self[id]:SetTexture("Interface\\AddOns\\NSQC\\npcscan\\2.tga")
	self[id]:SetSize(Rx, Ry)
	self[id]:SetPoint("BOTTOMLEFT", x, y)
end


function testXY(x,y,text)
npc_scan:configure(1,545,350)
npc_scan_Text:configure(1,12,12,0,0)
npc_scan[1]:SetPoint("BOTTOMLEFT", x, y)
npc_scan[1]:Show()
npc_scan_Text[1]:Show()
end

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
	npcPX, npcPY = GetPlayerMapPosition("player")
	npcSK=GetCurrentMapContinent()
	npcSL=GetNumMapLandmarks()





	if framePos["X"]~=nil then
		XXX,YYY=getPOS(framePos["X"],framePos["Y"])
		--xxx,yyy=GetCursorPosition();
	end



end)
