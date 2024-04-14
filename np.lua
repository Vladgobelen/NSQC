local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_ADDON")
GC_Sniffer:SetScript("OnEvent", function (prefix, text, kod, message, chanel, sender, hernya, name, instanceID)
if testQ['npArg'] == nil then
    np_change_nil()
end
if testQ['npArg'] == 0 then
    np_change_0()
end

--//Так же для удобства редактирования выношу сюда же и текстурки со шрифтами]]
local media = {
    ["font"] = [=[Fonts\FRIZQT__.TTF]=],
    ["normTex"] = [[Interface\Buttons\WHITE8x8]],
    ["glowTex"] = [[Interface\Buttons\WHITE8x8]],
    ["back"] = [[Interface\Buttons\WHITE8x8]],
}

local backdrop = {
    edgeFile = media.glowTex, edgeSize = ns_cfg.border,
    insets = {left = ns_cfg.border, right = ns_cfg.border, top = ns_cfg.border, bottom = ns_cfg.border}
}




local numChildren = -1
local frames = {}


local function Castbar_OnEvent(self, event, ...)
    local arg1 = ...
    local unit = arg1
    if(arg1 ~= unit and arg1 == "player") then
        return
    end

    local name = string.gsub(select(7, self:GetParent():GetRegions()):GetText(), "%s%(%*%)","")
    if not(name == UnitName(unit) and self:GetParent():GetChildren():GetValue() == UnitHealth(unit)) then
        return
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
            self.Icon:SetTexture(texture)
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
        self.r, self.g, self.b = ns_cfg.hostileunit.r, ns_cfg.hostileunit.g, ns_cfg.hostileunit.b
        self:SetStatusBarColor(ns_cfg.hostileunit.r, ns_cfg.hostileunit.g, ns_cfg.hostileunit.b)
    elseif r + b == 0 then
        self.r, self.g, self.b = ns_cfg.friendlyunit.r, ns_cfg.friendlyunit.g, ns_cfg.friendlyunit.b
        self:SetStatusBarColor(ns_cfg.friendlyunit.r, ns_cfg.friendlyunit.g, ns_cfg.friendlyunit.b)
    elseif r + g == 0 then
        self.r, self.g, self.b = ns_cfg.friendlyplayer.r, ns_cfg.friendlyplayer.g, ns_cfg.friendlyplayer.b
        self:SetStatusBarColor(ns_cfg.friendlyplayer.r, ns_cfg.friendlyplayer.g, ns_cfg.friendlyplayer.b)
    elseif 2 - (r + g) < 0.05 and b == 0 then
        self.r, self.g, self.b = ns_cfg.neutralunit.r, ns_cfg.neutralunit.g, ns_cfg.neutralunit.b
        self:SetStatusBarColor(ns_cfg.neutralunit.r, ns_cfg.neutralunit.g, ns_cfg.neutralunit.b)
    else
        self.r, self.g, self.b = r, g, b
    end

    frame = self:GetParent()
    if not frame.oldglow:IsShown() then
        self.hpBorder:SetBackdropBorderColor(0, 0, 0)
    else
        local r, g, b = frame.oldglow:GetVertexColor()
        if g + b == 0 then
            self.hpBorder:SetBackdropBorderColor(1, 0, 0)
        else
            self.hpBorder:SetBackdropBorderColor(1, 1, 0)
        end
    end
        self:SetStatusBarColor(self.r, self.g, self.b)

    self:ClearAllPoints()
    self:SetPoint("CENTER", self:GetParent(), 0, 10)
    self:SetHeight(ns_cfg.HPheight)
    self:SetWidth(ns_cfg.HPwidth)

    self.hpBackground:SetVertexColor(self.r * 0.25, self.g * 0.25, self.b * 0.25)

    local nameString = frame.oldname:GetText()
    if string.len(nameString) < ns_cfg.HPwidth/5 then
        frame.name:SetText(nameString)
    else
        frame.name:SetFormattedText(nameString:sub(0, ns_cfg.HPwidth/5).."...")
    end

    frame.level:ClearAllPoints()
    frame.level:SetPoint(ns_cfg.LvLpoint, frame.healthBar, ns_cfg.LvLrelativePoint, ns_cfg.LvLx, ns_cfg.LvLy)
    if frame.boss:IsShown() then
        frame.level:SetText("БОС")
        frame.level:SetTextColor(0.8, 0.05, 0)
        frame.level:Show()
    end
    frame.highlight:SetAllPoints(self)
end

local function onHide(self)
    self.highlight:Hide()
    print(self:GetID())
end

local function SkinObjects(frame,i)

    frame.healthBar, frame.castBar = frame:GetChildren()
    local healthBar, castBar = frame.healthBar, frame.castBar
    local glowRegion, overlayRegion, castbarOverlay, shieldedRegion, spellIconRegion, highlightRegion, nameTextRegion, levelTextRegion, bossIconRegion, raidIconRegion, stateIconRegion = frame:GetRegions()

    frame.oldname = nameTextRegion
    nameTextRegion:Hide()
    nameTextRegion.Show = function() end

    frame.name = frame:CreateFontString()
    frame.name:SetPoint(ns_cfg.Npoint, healthBar, ns_cfg.NrelativePoint, ns_cfg.Nx, ns_cfg.Ny)
    frame.name:SetFont(media.font, ns_cfg.NameFontSize, "OUTLINE")
    frame.name:SetTextColor(0.84, 0.75, 0.65)
    frame.name:SetShadowOffset(1, -1)

    frame.level = levelTextRegion
    levelTextRegion:SetFont(media.font, ns_cfg.LvLFontSize, "OUTLINE")
    levelTextRegion:SetShadowOffset(1, -1)
    frame.boss = bossIconRegion

    healthBar:SetStatusBarTexture(media.normTex)

    healthBar.hpBackground = healthBar:CreateTexture(nil, "BORDER")
    healthBar.hpBackground:SetAllPoints(healthBar)
    healthBar.hpBackground:SetTexture(media.back)
    healthBar.hpBackground:SetVertexColor(0.15, 0.15, 0.15)

    healthBar.hpBorder = CreateFrame("Frame", nil, healthBar)
    healthBar.hpBorder:SetFrameLevel(healthBar:GetFrameLevel() -1 > 0 and healthBar:GetFrameLevel() -1 or 0)
    healthBar.hpBorder:SetPoint("TOPLEFT", healthBar, "TOPLEFT", -ns_cfg.border, ns_cfg.border)
    healthBar.hpBorder:SetPoint("BOTTOMRIGHT", healthBar, "BOTTOMRIGHT", ns_cfg.border, -ns_cfg.border)
    healthBar.hpBorder:SetBackdrop(backdrop)
    healthBar.hpBorder:SetBackdropColor(0, 0, 0)
    healthBar.hpBorder:SetBackdropBorderColor(0, 0, 0)

    healthBar:SetScript('OnUpdate', Healthbar_OnUpdate)

    highlightRegion:SetTexture(media.normTex)
    highlightRegion:SetVertexColor(0.25, 0.25, 0.25)
    frame.highlight = highlightRegion

    local castbar = CreateFrame("StatusBar", nil, frame)
    castbar:SetHeight(ns_cfg.CBheight)
    castbar:SetWidth(ns_cfg.HPwidth-(ns_cfg.CBheight+8))
    castbar:SetStatusBarTexture(media.normTex)
    castbar:GetStatusBarTexture():SetHorizTile(false)
    castbar:GetStatusBarTexture():SetVertTile(false)
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
    castbar.time:SetFont(media.font, ns_cfg.CBtieFont, "OUTLINE")
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
    stateIconRegion:SetTexture(nil)
    bossIconRegion:SetTexture(nil)

end

local select = select
local function HookFrames(...)
    local np_num = 0
    for index = 1, select("#", ...) do
        local frame = select(index, ...)
        local region = frame:GetRegions()
        if(not frames[frame] and not frame:GetName() and region and region:GetObjectType() == "Texture" and region:GetTexture() == [=[Interface\TargetingFrame\UI-TargetingFrame-Flash]=]) then
            testQ['temp'] = print(frame)
            if testQ == nil then
                testQ = {}
            end
            if testQ['np_b'] == nil then
                testQ['np_b'] = {}
            end
            frame:SetScript("OnUpdate", function()
                --for i = 1, numChildren do
                    if not frame:IsVisible() then
                        print('nilll')
                    end
                    frame:ClearAllPoints()
                    if index >= 1 and index <= 5 then
                        frame:SetPoint("TOPLEFT", PlayerFrame,"TOPLEFT", 25, -55-(index*25))
                    end
                    if index >= 6 and index <= 10 then
                        frame:SetPoint("TOPLEFT", PlayerFrame,"TOPLEFT", 125, (-55-(index*25))+100)
                    end
                    if index >= 11 and index <= 15 then
                        frame:SetPoint("TOPLEFT", PlayerFrame,"TOPLEFT", 225, (-55-(index*25))+200)
                    end
                --end

            end)

            --btn:configure(987,0,0,32,32,"","");
            SkinObjects(frame,index)
        end
    end
end

local t = .1
CreateFrame("Frame"):SetScript("OnUpdate", function(self, elapsed)
    if testQ['np'] == 1 then
        if(WorldFrame:GetNumChildren() ~= numChildren) then
            numChildren = WorldFrame:GetNumChildren()
            HookFrames(WorldFrame:GetChildren())
        end
    end
end)
end)
