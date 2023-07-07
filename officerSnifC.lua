local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
testLvlUp=mysplit(message)

if  testLvlUp[1] == "Поздравляем" and testLvlUp[3] == "c" and testLvlUp[2] == myNome then
	PlaySoundFile("Interface\\AddOns\\NSQC\\lvlUp.ogg")
end

if string.find (message, "#zzl") and testGM ~= nil then
	local versA = mysplit(message)
	testQ[myNome]["zzl"] = versA[11]
	if testQ[myNome]["zzlf"] ~= nil then
		testQ[myNome]["zzlf"] = testQ[myNome]["zzlf"] - 20
	else
		testQ[myNome]["zzlf"] = 0
	end
	testQ[myNome]["btn3"] = 0
	testQ[myNome]["btn4"] = 0
end
end
)
