

--//Так же для удобства редактирования выношу сюда же и текстурки со шрифтами]]

local numChildren = -1
local frames = {}


local function Castbar_OnEvent(self, event, ...)
    local arg1 = ...
    local unit = arg1
    if(arg1 ~= unit and arg1 == "player") then
        return
    end
    local sem = select(7, self:GetParent():GetRegions())

	if sem.GetText then
		local name = string.gsub(select(7, self:GetParent():GetRegions()):GetText(), "%s%(%*%)","")
		if not(name == UnitName(unit) and self:GetParent():GetChildren():GetValue() == UnitHealth(unit)) then
			return
		end
	end
    if(event == "UNIT_SPELLCAST_START") then
        local name, nameSubtext, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(unit)
        if(not name or (not self.showTradeSkills and isTradeSkill)) then
            self:Hide()
            return
        end

        self:SetStatusBarColor(1.0, 0.7, 0.0)
        self.duration = GetTime() - (startTime/1000)
        self.max = (endTime - startTime) / 1000

        self:SetValue(0)
        self:SetMinMaxValues(0, self.max)
        self:SetAlpha(1.0)

        if(self.Icon) then
            --self.Icon:SetTexture(texture)
        end

        self:SetAlpha(1.0)
        self.holdTime = 0
        self.casting = 1
        self.castID = castID
        self.delay = 0
        self.channeling = nil
        self.fadeOut = nil

        if(self.Shield) then
            if(self.showShield and notInterruptible) then
                self.Shield:Show()
                if(self.Border) then
                    self.Border:Hide()
                end
                else
                self.Shield:Hide()
                if(self.Border) then
                    self.Border:Show()
                end
            end
         end

    self:Show()
    elseif(event == "UNIT_SPELLCAST_STOP" or event == "UNIT_SPELLCAST_CHANNEL_STOP") then
        if((self.casting and event == "UNIT_SPELLCAST_STOP" and select(4, ...) == self.castID) or (self.channeling and event == "UNIT_SPELLCAST_CHANNEL_STOP")) then
            local x
            if self.max == nil then
                x = 1.5
                self:SetValue(x)
            else
                self:SetValue(self.max)
            end


            if(event == "UNIT_SPELLCAST_STOP") then
                self.casting = nil
                self:SetStatusBarColor(0.0, 1.0, 0.0)
                else
                    self.channeling = nil
            end

                    self.flash = 1
                    self.fadeOut = 1
                    self.holdTime = 0
        end
            elseif(event == "UNIT_SPELLCAST_FAILED" or event == "UNIT_SPELLCAST_INTERRUPTED") then
                if(self:IsShown() and (self.casting and select(4, ...) == self.castID) and not self.fadeOut) then
                        self:SetValue(self.max)
                        self:SetStatusBarColor(1.0, 0.0, 0.0)

                        self.casting = nil
                        self.channeling = nil
                        self.fadeOut = 1
                        self.holdTime = GetTime() + CASTING_BAR_HOLD_TIME
                end
        elseif(event == "UNIT_SPELLCAST_DELAYED") then
                local castbar = self
                if(castbar:IsShown()) then
                        local name, nameSubtext, text, texture, startTime, endTime, isTradeSkill = UnitCastingInfo(unit)
                        if(not name or (not self.showTradeSkills and isTradeSkill)) then
                                self:Hide()
                                return
                        end

                        local duration = GetTime() - (startTime / 1000)
                        if(duration < 0) then duration = 0 end
                        castbar.delay = castbar.delay + castbar.duration - duration
                        castbar.duration = duration

                        castbar:SetValue(duration)

                        if(not castbar.casting) then
                                castbar:SetStatusBarColor(1.0, 0.7, 0.0)

                                castbar.casting = 1
                                castbar.channeling = nil
                                castbar.fadeOut = 0
                        end
                end
        elseif(event == "UNIT_SPELLCAST_CHANNEL_START") then
                local name, nameSubtext, text, texture, startTime, endTime, isTradeSkill, notInterruptible = UnitChannelInfo(unit)
                if(not name or (not self.showTradeSkills and isTradeSkill)) then
                        self:Hide()
                        return
                end

                self:SetStatusBarColor(0.0, 1.0, 0.0)
                self.duration = ((endTime / 1000) - GetTime())
                self.max = (endTime - startTime) / 1000
                self.delay = 0
                self:SetMinMaxValues(0, self.max)
                self:SetValue(self.duration)

                if(self.Icon) then
                        self.Icon:SetTexture(texture)
                end

                self:SetAlpha(1.0)
                self.holdTime = 0
                self.casting = nil
                self.channeling = 1
                self.fadeOut = nil

                if(self.Shield) then
                        if(self.showShield and notInterruptible) then
                                self.Shield:Show()
                                if(self.Border) then
                                        self.Border:Hide()
                                end
                        else
                                self.Shield:Hide()
                                if(self.Border) then
                                        self.Border:Show()
                                end
                        end
                end

                self:Show()
        elseif(event == "UNIT_SPELLCAST_CHANNEL_UPDATE") then
                local castbar = self
                if(castbar:IsShown()) then
                        local name, nameSubtext, text, texture, startTime, endTime, isTradeSkill = UnitChannelInfo(unit)
                        if(not name or (not self.showTradeSkills and isTradeSkill)) then
                                self:Hide()
                                return
                        end

                        local duration = ((endTime / 1000) - GetTime())
                        castbar.delay = castbar.delay + castbar.duration - duration
                        castbar.duration = duration
                        castbar.max = (endTime - startTime) / 1000

                        castbar:SetMinMaxValues(0, castbar.max)
                        castbar:SetValue(duration)
                end
        elseif(event == "UNIT_SPELLCAST_INTERRUPTIBLE") then
                if(self.Shield) then
                        self.Shield:Hide()
                        if(self.Border) then
                                self.Border:Show()
                        end
                end
        elseif(event == "UNIT_SPELLCAST_NOT_INTERRUPTIBLE") then
                if(self.Shield) then
                        self.Shield:Show()
                        if(self.Border) then
                                self.Border:Hide()
                        end
                end
        end
end

local function Castbar_OnUpdate(self, elapsed)
    if(self.casting) then
        local duration = self.duration + elapsed
        if(duration >= self.max) then
            self:SetValue(self.max)
            self:SetStatusBarColor(0.0, 1.0, 0.0)
            self.holdTime = 0
            self.fadeOut = 0
            self.casting = nil
            return
        end

        self.duration = duration
        self:SetValue(duration)
    elseif(self.channeling) then
            local duration = self.duration - elapsed
        if(duration <= 0) then
            self:SetStatusBarColor(0.0, 1.0, 0.0)
            self.fadeOut = 0
            self.channeling = nil
            self.holdTime = 0
            return
        end
            self.duration = duration
            self:SetValue(duration)
        elseif(GetTime() < self.holdTime) then
            return
        elseif(self.fadeOut) then
            local alpha = self:GetAlpha() - CASTING_BAR_ALPHA_STEP
        if(alpha > 0.05) then
            self:SetAlpha(alpha)
        else
            self.fadeOut = nil
            self:Hide()
        end
    end
end

local function UpdateCastTime(self, curValue)
    local minValue, maxValue = self:GetMinMaxValues()
    if self.channeling then
        local casttime = string.format("%.1f", curValue)
        local castcur = string.format("\n%.1f", maxValue)
        self.time:SetText(casttime..castcur)
    else
        local casttime = string.format("%.1f", (maxValue-curValue))
        local castcur = string.format("\n%.1f", maxValue)
        self.time:SetText(casttime..castcur)
    end
end



local function Healthbar_OnUpdate(self)

    local r, g, b = self:GetStatusBarColor()
    if g + b == 0 then
        self.r, self.g, self.b = np_cfg.hostileunit.r, np_cfg.hostileunit.g, np_cfg.hostileunit.b
        self:SetStatusBarColor(np_cfg.hostileunit.r, np_cfg.hostileunit.g, np_cfg.hostileunit.b)
    elseif r + b == 0 then
        self.r, self.g, self.b = np_cfg.friendlyunit.r, np_cfg.friendlyunit.g, np_cfg.friendlyunit.b
        self:SetStatusBarColor(np_cfg.friendlyunit.r, np_cfg.friendlyunit.g, np_cfg.friendlyunit.b)
    elseif r + g == 0 then
        self.r, self.g, self.b = np_cfg.friendlyplayer.r, np_cfg.friendlyplayer.g, np_cfg.friendlyplayer.b
        self:SetStatusBarColor(np_cfg.friendlyplayer.r, np_cfg.friendlyplayer.g, np_cfg.friendlyplayer.b)
    elseif 2 - (r + g) < 0.05 and b == 0 then
        self.r, self.g, self.b = np_cfg.neutralunit.r, np_cfg.neutralunit.g, np_cfg.neutralunit.b
        self:SetStatusBarColor(np_cfg.neutralunit.r, np_cfg.neutralunit.g, np_cfg.neutralunit.b)
    else
        self.r, self.g, self.b = r, g, b
    end

    frame = self:GetParent()
    if frame.oldglow~=nil and not frame.oldglow:IsShown() then
        self.hpBorder:SetBackdropBorderColor(0, 0, 0)
    else
		if frame.oldglow ~= nil then
			local r, g, b = frame.oldglow:GetVertexColor()
			if g + b == 0 then
				self.hpBorder:SetBackdropBorderColor(1, 0, 0)
			else
				self.hpBorder:SetBackdropBorderColor(1, 1, 0)
			end
		end
    end
        self:SetStatusBarColor(self.r, self.g, self.b)

    self:ClearAllPoints()
    self:SetPoint("CENTER", self:GetParent(), 0, 10)
    self:SetHeight(np_cfg.HPheight)
    self:SetWidth(np_cfg.HPwidth)

    self.hpBackground:SetVertexColor(self.r * 0.25, self.g * 0.25, self.b * 0.25)
	if frame.oldname:GetName() ~= nil then
		local nameString = frame.oldname:GetText()
		if string.len(nameString) < np_cfg.HPwidth/5 then
			frame.name:SetText(nameString)
		else
			frame.name:SetFormattedText(nameString:sub(0, np_cfg.HPwidth/5).."...")
		end
	end

    frame.level:ClearAllPoints()
    frame.level:SetPoint(np_cfg.LvLpoint, frame.healthBar, np_cfg.LvLrelativePoint, np_cfg.LvLx, np_cfg.LvLy)
--     if frame.boss:IsShown() then
--         frame.level:SetText("БОС")
--         frame.level:SetTextColor(0.8, 0.05, 0)
--         frame.level:Show()
--     end
    frame.highlight:SetAllPoints(self)
end

local function onHide(self)
    --self.highlight:Hide()
--     for i = 1, numChildren do
-- 		if unT[i] ~= nil then
-- 			unIcon(i,111,111,1,1,"bb","hide",frame,"BOTTOMLEFT","BOTTOMRIGHT")
-- 		end
--     end
end

local function SkinObjects(frame)

    frame.healthBar, frame.castBar = frame:GetChildren()
    local healthBar, castBar = frame.healthBar, frame.castBar
    local glowRegion, overlayRegion, castbarOverlay, shieldedRegion, spellIconRegion, highlightRegion, nameTextRegion, levelTextRegion, bossIconRegion, raidIconRegion, stateIconRegion = frame:GetRegions()
--     if frame:GetName() then
-- 		ChatFrame3:AddMessage(nameTextRegion:GetText(), 1.0, 1.0, 1.0, 53, 5)
-- 	end
    frame.oldname = nameTextRegion
    nameTextRegion:Hide()
    nameTextRegion.Show = function() end

    frame.name = frame:CreateFontString()
    frame.name:SetPoint(np_cfg.Npoint, healthBar, np_cfg.NrelativePoint, np_cfg.Nx, np_cfg.Ny)
    frame.name:SetFont(media.font, np_cfg.NameFontSize, "OUTLINE")
    frame.name:SetTextColor(0.84, 0.75, 0.65)
    frame.name:SetShadowOffset(1, -1)

    frame.level = levelTextRegion
	--levelTextRegion:SetFont(media.font, np_cfg.LvLFontSize, "OUTLINE")
	--levelTextRegion:SetShadowOffset(1, -1)
    frame.boss = bossIconRegion

    healthBar:SetStatusBarTexture(media.normTex)

    healthBar.hpBackground = healthBar:CreateTexture(nil, "BORDER")
    healthBar.hpBackground:SetAllPoints(healthBar)
    healthBar.hpBackground:SetTexture(media.back)
    healthBar.hpBackground:SetVertexColor(0.15, 0.15, 0.15)

    healthBar.hpBorder = CreateFrame("Frame", nil, healthBar)
    healthBar.hpBorder:SetFrameLevel(healthBar:GetFrameLevel() -1 > 0 and healthBar:GetFrameLevel() -1 or 0)
    healthBar.hpBorder:SetPoint("TOPLEFT", healthBar, "TOPLEFT", -np_cfg.border, np_cfg.border)
    healthBar.hpBorder:SetPoint("BOTTOMRIGHT", healthBar, "BOTTOMRIGHT", np_cfg.border, -np_cfg.border)
    healthBar.hpBorder:SetBackdrop(backdrop)
    healthBar.hpBorder:SetBackdropColor(0, 0, 0)
    healthBar.hpBorder:SetBackdropBorderColor(0, 0, 0)
    healthBar:SetScript('OnUpdate', Healthbar_OnUpdate)

-- 	if highlightRegion ~= nil then
-- 		highlightRegion:SetTexture(media.normTex)
-- 	end
    highlightRegion:SetVertexColor(0.25, 0.25, 0.25)
    frame.highlight = highlightRegion

    local castbar = CreateFrame("StatusBar", nil, frame)
    castbar:SetHeight(np_cfg.CBheight)
    castbar:SetWidth(np_cfg.HPwidth-(np_cfg.CBheight+8))
    castbar:SetStatusBarTexture(media.normTex)
--     castbar:GetStatusBarTexture():SetHorizTile(false)
--     castbar:GetStatusBarTexture():SetVertTile(false)
    castbar:SetPoint("TOPRIGHT", healthBar, "BOTTOMRIGHT", 0, -8)

    castbar.showTradeSkills = true
    castbar.showShield = true
    castbar.casting = true
    castbar.channeling = true
    castbar.holdTime = 0

    castbar.Border = castbar:CreateTexture(nil, "BACKGROUND")
    castbar.Border:SetSize(castbarOverlay:GetSize())
    castbar.Border:SetAllPoints(castbar)
    castbar.Border:SetTexture(media.back)
    castbar.Border:SetVertexColor(0,0,0, 0.8)

    -- castbar.Shield = castbar:CreateTexture(nil, "ARTWORK")
    -- castbar.Shield:SetSize(shieldedRegion:GetSize())
    -- castbar.Shield:SetPoint(shieldedRegion:GetPoint())
    -- castbar.Shield:SetTexture(shieldedRegion:GetTexture())
    -- castbar.Shield:SetTexCoord(shieldedRegion:GetTexCoord())

    castbar.Icon = castbar:CreateTexture(nil, "ARTWORK")
    castbar.Icon:SetSize(spellIconRegion:GetSize())
    castbar.Icon:SetPoint('RIGHT', castbar, 'LEFT', -2, 0)
    castbar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

    castbar.time = castbar:CreateFontString(nil, "ARTWORK")
    castbar.time:SetPoint("RIGHT", castbar.Icon, "LEFT", -4, 0)
    castbar.time:SetFont(media.font, np_cfg.CBtieFont, "OUTLINE")
    castbar.time:SetTextColor(0.84, 0.75, 0.65)
    castbar.time:SetShadowOffset(1, -1)

     --  print(shielded)

    castbar:Hide()

    castbar:RegisterEvent("UNIT_SPELLCAST_START")
    castbar:RegisterEvent("UNIT_SPELLCAST_FAILED")
    castbar:RegisterEvent("UNIT_SPELLCAST_STOP")
    castbar:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
    castbar:RegisterEvent("UNIT_SPELLCAST_INTERRUPTIBLE")
    castbar:RegisterEvent("UNIT_SPELLCAST_NOT_INTERRUPTIBLE")
    castbar:RegisterEvent("UNIT_SPELLCAST_DELAYED")
    castbar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
    castbar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE")
    castbar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
    castbar:SetScript("OnEvent", Castbar_OnEvent)
    castbar:SetScript("OnUpdate", Castbar_OnUpdate)
    castbar:HookScript("OnValueChanged", UpdateCastTime)

    frame.oldglow = glowRegion
    frame:SetScript('OnHide', onHide)

    frames[frame] = true

    glowRegion:SetTexture(nil)
    overlayRegion:SetTexture(nil)
    shieldedRegion:SetTexture(nil)
    castbarOverlay:SetTexture(nil)
    --stateIconRegion:SetTexture(nil)
    --bossIconRegion:SetTexture(nil)

end

local select = select
local function HookFrames(...)
    for index = 1, select("#", ...) do
        local frame = select(index, ...)
        local region = frame:GetRegions()
        if(not frames[frame] and not frame:GetName() and region and region:GetObjectType() == "Texture" and string.find(region:GetTexture(),"TargetingFrame")) then
        --and region:GetTexture() == "[=[Interface\Tooltips\Nameplate-Border=]"

       --if not frame:GetName() and region:GetTexture() ~= nil and string.find(region:GetTexture(),"Nameplate") then
			testQ['testNP'] = frame

			local razmer
			if (GetScreenWidth() * UIParent:GetEffectiveScale()) < 1300 then
                razmer = 21
            else
                razmer = 35
            end

            frame:SetScript("OnUpdate",function(self)
                if frame:IsShown() and frame:GetAlpha() == 1 then
					local poison
					for i = 1, 16 do
						if UnitDebuff('target',i) ~= nil then
							if string.find(UnitDebuff('target',i), "Смертельный яд") then
								local o,t,tr,f,fi,s=UnitDebuff('target',i)
								poison = f
							end
						end
					end
					if poison ~= nil then
						if tonumber(poison) == 0 then
							if testQ['np_inviz'] == nil then
								unIcon(index+2999,100,6,razmer,7,"rg1p","hide",frame,"BOTTOMLEFT","TOPLEFT")
								unIcon(index+2999,100,6,razmer,7,"rg1p","show",frame,"BOTTOMLEFT","TOPLEFT")
							else
								--unIcon(index+2999,100,6,1,10,"rg1p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
								--unIcon(index+2999,100,6,1,10,"rg1p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							end
							if unText[index+2999] ~= nil then
								unText[index+2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg1p.tga")
							end
						end
						if tonumber(poison) == 1 then
							if testQ['np_inviz'] == nil then
								unIcon(index+2999,100,6,razmer,7,"rg2p","hide",frame,"BOTTOMLEFT","TOPLEFT")
								unIcon(index+2999,100,6,razmer,7,"rg2p","show",frame,"BOTTOMLEFT","TOPLEFT")
							else
								--unIcon(index+2999,100,6,1,10,"rg2p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
								--unIcon(index+2999,100,6,1,10,"rg2p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							end
							if unText[index+2999] ~= nil then
								unText[index+2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg2p.tga")
							end
						end
						if tonumber(poison) == 2 then
							if testQ['np_inviz'] == nil then
								unIcon(index+2999,100,6,razmer,7,"rg3p","hide",frame,"BOTTOMLEFT","TOPLEFT")
								unIcon(index+2999,100,6,razmer,7,"rg3p","show",frame,"BOTTOMLEFT","TOPLEFT")
							else
								--unIcon(index+2999,100,6,1,10,"rg3p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
								--unIcon(index+2999,100,6,1,10,"rg3p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							end
							if unText[index+2999] ~= nil then
								unText[index+2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg3p.tga")
							end
						end
						if tonumber(poison) == 3 then
							if testQ['np_inviz'] == nil then
								unIcon(index+2999,100,6,razmer,7,"rg4p","hide",frame,"BOTTOMLEFT","TOPLEFT")
								unIcon(index+2999,100,6,razmer,7,"rg4p","show",frame,"BOTTOMLEFT","TOPLEFT")
							else
								--unIcon(index+2999,100,6,1,10,"rg4p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
								--unIcon(index+2999,100,6,1,10,"rg4p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							end
							if unText[index+2999] ~= nil then
								unText[index+2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg4p.tga")
							end
						end
						if tonumber(poison) == 4 then
							if testQ['np_inviz'] == nil then
								unIcon(index+2999,100,6,razmer,7,"rg5p","hide",frame,"BOTTOMLEFT","TOPLEFT")
								unIcon(index+2999,100,6,razmer,7,"rg5p","show",frame,"BOTTOMLEFT","TOPLEFT")
							else
								--unIcon(index+2999,100,6,1,10,"rg5p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
								--unIcon(index+2999,100,6,1,10,"rg5p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							end
							if unText[index+2999] ~= nil then
								unText[index+2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg5p.tga")
							end
						end
						if tonumber(poison) == 5 then
							if testQ['np_inviz'] == nil then
								unIcon(index+2999,100,6,razmer,7,"rg6p","hide",frame,"BOTTOMLEFT","TOPLEFT")
								unIcon(index+2999,100,6,razmer,7,"rg6p","show",frame,"BOTTOMLEFT","TOPLEFT")
							else
								--unIcon(index+2999,100,6,1,10,"rg6p","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
								--unIcon(index+2999,100,6,1,10,"rg6p","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							end
							if unText[index+2999] ~= nil then
								unText[index+2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg6p.tga")
							end
						end
					else
						if testQ['np_inviz'] == nil then
							unIcon(index+2999,100,6,razmer,7,"rg1","hide",frame,"BOTTOMLEFT","TOPLEFT")
							unIcon(index+2999,100,6,razmer,7,"rg1","show",frame,"BOTTOMLEFT","TOPLEFT")
						else
							--unIcon(index+2999,100,6,1,10,"rg1","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
							--unIcon(index+2999,100,6,1,10,"rg1","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
						end
						if unText[index+2999] ~= nil then
							unText[index+2999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg1.tga")
						end
					end
                    local cp = GetComboPoints("player","target")
                    if tonumber(cp) == 0 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index+1999,100,6,razmer,1,"rg1","hide",frame,"BOTTOMLEFT","TOPLEFT")
                            unIcon(index+1999,100,6,razmer,1,"rg1","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                            --unIcon(index+1999,100,6,1,4,"rg1","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                            --unIcon(index+1999,100,6,1,4,"rg1","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index+1999] ~= nil then
							unText[index+1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg1.tga")
						end
                    end
                    if tonumber(cp) == 1 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index+1999,100,6,razmer,1,"rg2","hide",frame,"BOTTOMLEFT","TOPLEFT")
                            unIcon(index+1999,100,6,razmer,1,"rg2","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                             --unIcon(index+1999,100,6,1,4,"rg2","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                            --unIcon(index+1999,100,6,1,14,"rg2","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index+1999] ~= nil then
							unText[index+1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg2.tga")
						end
                    end
                    if tonumber(cp) == 2 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index+1999,100,6,razmer,1,"rg3","hide",frame,"BOTTOMLEFT","TOPLEFT")
                            unIcon(index+1999,100,6,razmer,1,"rg3","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                            --unIcon(index+1999,100,6,1,4,"rg3","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                            --unIcon(index+1999,100,6,1,4,"rg3","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index+1999] ~= nil then
							unText[index+1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg3.tga")
						end
                    end
                    if tonumber(cp) == 3 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index+1999,100,6,razmer,1,"rg4","hide",frame,"BOTTOMLEFT","TOPLEFT")
                            unIcon(index+1999,100,6,razmer,1,"rg4","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                            --unIcon(index+1999,100,6,1,4,"rg4","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                            --unIcon(index+1999,100,6,1,4,"rg4","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index+1999] ~= nil then
							unText[index+1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg4.tga")
						end
                    end
                    if tonumber(cp) == 4 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index+1999,100,6,razmer,1,"rg5","hide",frame,"BOTTOMLEFT","TOPLEFT")
                            unIcon(index+1999,100,6,razmer,1,"rg5","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                            --unIcon(index+1999,100,6,1,4,"rg5","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                           -- unIcon(index+1999,100,6,1,4,"rg5","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index+1999] ~= nil then
							unText[index+1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg5.tga")
						end
                    end
                    if tonumber(cp) == 5 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index+1999,100,6,razmer,1,"rg6","hide",frame,"BOTTOMLEFT","TOPLEFT")
                            unIcon(index+1999,100,6,razmer,1,"rg6","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                           -- unIcon(index+1999,100,6,1,4,"rg6","hide",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                            --unIcon(index+1999,100,6,1,4,"rg6","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index+1999] ~= nil then
							unText[index+1999]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rg6.tga")
						end
                    end
                    local m = UnitMana("player")
                    local mm = UnitManaMax("player")
                    local manaRez = m*100/mm

                    if testQ['np_inviz'] == nil then
                        unIcon(index+999,100,5,razmer,-4,"rage0","show",frame,"BOTTOMLEFT","TOPLEFT")
                        --unT[index+999]:SetFrameStrata("FULLSCREEN")
                    else
                        --unIcon(index+12999,100,6,1,-4,"rage0","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        --unT[index+12999]:SetFrameStrata("FULLSCREEN")
                    end
                    local dru
                    for i = 1, 24 do
                        if UnitBuff("player",i) == "Облик кошки" then
                            dru = 1
                        end
                        if UnitBuff("player",i) == "Облик медведя" or UnitBuff("player",i) == "Облик лютого медведя" then
                            dru = 2
                        end
                    end
                    if (UnitClass("player") == "Разбойник" or UnitClass("player") == "Разбойница") or dru == 1 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index,manaRez,5,razmer,-4,"rage5","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else

                            --unIcon(index,manaRez,6,1,-4,"rage5","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index] ~= nil then
                            unText[index]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rage2.tga")
						end
                    end
                    if UnitClass("player") == "Воин" or dru == 2 then
                        if testQ['np_inviz'] == nil then
                            unIcon(index,manaRez,5,razmer,-4,"rage1","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                            --unIcon(index,manaRez,6,1,-4,"rage1","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index] ~= nil then
							unText[index]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rage1.tga")
						end
                    end
                    if UnitClass("player") ~= "Разбойник" and UnitClass("player") ~= "Разбойница" and dru == nil and UnitClass("player") ~= "Воин" then
                        if testQ['np_inviz'] == nil then
                            unIcon(index,manaRez,5,razmer,-4,"rage5","show",frame,"BOTTOMLEFT","TOPLEFT")
                        else
                            --unIcon(index,manaRez,6,1,-4,"rage5","show",sBtn[1],"BOTTOMLEFT","TOPLEFT")
                        end
                        if unText[index] ~= nil then
							unText[index]:SetTexture("Interface\\AddOns\\NSQC\\libs\\rage5.tga")
						end
                    end
                    if unText[index] ~= nil then
						unText[index]:SetWidth(manaRez)
					end
                    if testQ['np_inviz'] == nil then
						for i = 1, 4 do
                            sBtn[i]:ClearAllPoints()
                        end
                        sBtn[1]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",1, 1)
                        sBtn[2]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",24, 1)
                        sBtn[3]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",48, 1)
                        sBtn[4]:SetPoint("BOTTOMLEFT", frame,"TOPRIGHT",72, 1)
                        sBtn[1]:SetWidth(24)
                        sBtn[1]:SetHeight(24)
                        sBtn[2]:SetWidth(24)
                        sBtn[2]:SetHeight(24)
                        sBtn[3]:SetWidth(24)
                        sBtn[3]:SetHeight(24)
                        sBtn[4]:SetWidth(24)
                        sBtn[4]:SetHeight(24)
                    else
                        sBtn[1]:SetWidth(testQ['sBtnRX'])
                        sBtn[1]:SetHeight(testQ['sBtnRX'])
                        sBtn[2]:SetWidth(testQ['sBtnRX'])
                        sBtn[2]:SetHeight(testQ['sBtnRX'])
                        sBtn[3]:SetWidth(testQ['sBtnRX'])
                        sBtn[3]:SetHeight(testQ['sBtnRX'])
                        sBtn[4]:SetWidth(testQ['sBtnRX'])
                        sBtn[4]:SetHeight(testQ['sBtnRX'])
                        for i = 1, 4 do
                            sBtn[i]:ClearAllPoints()
                        end
                        sBtn[1]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn1X'], testQ['sBtn1Y'])
                        sBtn[2]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn2X'], testQ['sBtn2Y'])
                        sBtn[3]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn3X'], testQ['sBtn2Y'])
                        sBtn[4]:SetPoint("CENTER", UIParent,"CENTER",testQ['sBtn4X'], testQ['sBtn2Y'])
                    end
                end
                if not frame:IsShown() or not frame:GetAlpha() == 1 then
					if testQ['np_inviz'] == nil then
						unIcon(index,119,4,razmer,-23,"rage","hide",frame,"BOTTOMLEFT","TOPRIGHT")
						unIcon(index+12999,100,4,razmer,-4,"rage0","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+1999,100,4,razmer,14,"rg6","hide",frame,"BOTTOMLEFT","TOPLEFT")
						unIcon(index+2999,100,4,razmer,14,"rg6","hide",frame,"BOTTOMLEFT","TOPLEFT")
					end
                end
            end)

            --SkinObjects(frame)
            frame:SetScript("OnHide",function(self)

                unIcon(index,119,4,razmer,-23,"rage","hide",frame,"BOTTOMLEFT","TOPRIGHT")
                unIcon(index+999,100,4,razmer,-4,"rage0","hide",frame,"BOTTOMLEFT","TOPLEFT")
                unIcon(index+1999,100,4,razmer,14,"rg6","hide",frame,"BOTTOMLEFT","TOPLEFT")
                unIcon(index+2999,100,4,razmer,14,"rg6","hide",frame,"BOTTOMLEFT","TOPLEFT")
            end)

        end
    end
end

local t = .1
CreateFrame("Frame"):SetScript("OnUpdate", function(self, elapsed)
	if testQ == nil then
		testQ = {}
	end
    if testQ['np'] == 1 then
        if(WorldFrame:GetNumChildren() ~= numChildren) then
            numChildren = WorldFrame:GetNumChildren()
            HookFrames(WorldFrame:GetChildren())
        end
    end
end)
