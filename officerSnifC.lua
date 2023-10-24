local GC_Sniffer = CreateFrame("Frame")
GC_Sniffer:RegisterEvent("CHAT_MSG_OFFICER")
GC_Sniffer:SetScript("OnEvent", function (self, event, message, sender)
local myNome = GetUnitName("player")
testLvlUp=mysplit(message)

if  testLvlUp[1] == "Поздравляем" and testLvlUp[3] == "c" and testLvlUp[2] == myNome then
	PlaySoundFile("Interface\\AddOns\\NSQC\\lvlUp.ogg")
	testQ["vyborNagrady"] = 1
end

if string.find (message, "#zzl") and string.find (message, myNome) and testGM ~= nil then
	local versA = mysplit(message)
	if testQ[myNome]["zzl"] == nil then
		testQ[myNome]["zzl"] = 1

		testQ[myNome]["btn3"] = 0
		testQ[myNome]["btn4"] = 0
	end
end

end
)
