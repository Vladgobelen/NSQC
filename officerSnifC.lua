local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
testLvlUp=mysplit(message)

if  testLvlUp[1] == "Поздравляем" and testLvlUp[3] == "c" and testLvlUp[2] == myNome then
	PlaySoundFile("Interface\\AddOns\\NSQC\\lvlUp.ogg")
end

end
)
