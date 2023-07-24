function mysplit (inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

function all_trim(s)
	return s:match( "^%s*(.-)%s*$" )
end

function kirTest(b,n1)
test1=b:sub(n1,n1)
testN=b:byte(7)
testN=tonumber(testN)
if testN == 208 then
	r=b:sub(n1*2-1,n1*2)
else
	r=test1
end
return r
end

function alfabet (bookv)
shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	myB=string.find(shablon,bookv)
	return myB
end

function hashStr (nome)
	local i = time()
	i = i % 10000
	i=tostring(i)
	i=string.utf8sub(i,2,3)
	i=string.format("%03d", i)
	nomeLen=string.utf8len(nome)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(nome, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	iN=tostring(i)
	r1=string.utf8sub(iN, 1, 1)
	r2=string.utf8sub(hNome, 1, 1)
	r3=string.utf8sub(iN, 2, 2)
	r4=string.utf8sub(hNome, 2, 2)
	r5=string.utf8sub(iN, 3, 3)
	r6=string.utf8sub(hNome, 3, 3)
	r=r1 .. r2 .. r3 .. r4 .. r5 .. r6
	return r
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function getPOS(x,y)
	local XXX
	local YYY
	if WorldMapFrameSizeUpButton:IsVisible()==nil then
			YYY=((1-y)*668)
			XXX=x*1002
	end
	if WorldMapFrameSizeDownButton:IsVisible()==nil then

			YYY=((1-y)*382)
			XXX=(x*574)
	end
	return XXX,YYY
end

function hshStrNuovo(hshRar,mioNome)
	nomeLen=string.utf8len(mioNome)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(mioNome, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	local hshRarMsh1=string.sub(hshRar,2,2)
	local hshRarMsh2=string.sub(hshRar,4,4)
	local hshRarMsh3=string.sub(hshRar,6,6)
	local hshNuovo1 = math.random(0, 9)
    local hshNuovo2 = math.random(0, 9)
	local hshNuovo3 = math.random(0, 9)
	local hshRarMshRezult=hshRarMsh1 .. hshRarMsh2 .. hshRarMsh3
	local hshMioNome=hashStr(mioNome)
	local hshMioNome1=string.utf8sub(nome11,2,2)
	local hshMioNome2=string.utf8sub(nome11,4,4)
	local hshMioNome3=string.utf8sub(nome11,6,6)
	local hshMioNomeRezult=hshMioNome1 .. hshMioNome2 .. hshMioNome3
	local hshNuovoRezult=hshNuovo1 .. hshMioNome2 .. hshNuovo2 .. hshMioNome1 .. hshNuovo3 .. hshMioNome3
	return hshRarMshRezult, hshMioNomeRezult, hshNuovoRezult
end

function hshStrNuovo(hshRar,mioNome)
	local nomeLen
	local tmNome
	local nome11
	local hNome
	local hshMioNome1
	local hshMioNome2
	local hshMioNome3
	local qioC
	local hshRar1
	local hshRar2
	local hshRar3
	local hshRarMshRezult
	local hshMioNomeRezult
	nomeLen=string.utf8len(mioNome)
	local nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(mioNome, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	hshMioNome1=string.sub(hNome,1,1)
	hshMioNome2=string.sub(hNome,2,2)
	hshMioNome3=string.sub(hNome,3,3)
	qioC=string.sub(hshRar,2,2)
	qioC=tonumber(qioC)
	if qioC==0 then
		hshRar1=string.sub(hshRar, 3,3)
		hshRar2=string.sub(hshRar, 4,4)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qioC==1 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 3,3)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qioC==2 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qioC==3 then
		hshRar1=string.sub(hshRar, 3,3)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 4,4)
	elseif qioC==4 then
		hshRar1=string.sub(hshRar, 1,1)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 4,4)
	elseif qioC==5 then
		hshRar1=string.sub(hshRar, 1,1)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qioC==6 then
		hshRar1=string.sub(hshRar, 6,6)
		hshRar2=string.sub(hshRar, 1,1)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qioC==7 then
		hshRar1=string.sub(hshRar, 6,6)
		hshRar2=string.sub(hshRar, 3,3)
		hshRar3=string.sub(hshRar, 1,1)
	elseif qioC==8 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 5,5)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qioC==9 then
		hshRar1=string.sub(hshRar, 5,5)
		hshRar2=string.sub(hshRar, 1,1)
		hshRar3=string.sub(hshRar, 3,3)
	end
	hshRarMshRezult=hshRar1 .. hshRar2 .. hshRar3
	hshMioNomeRezult=hshMioNome1 .. hshMioNome2 .. hshMioNome3
	return hshRarMshRezult, hshMioNomeRezult
end


function hshSenderNomeC(senderNomeC)
	local nomeLen
	local nome1
	local nome11
	local hNomeC
	local hsSenderNomeC1
	local hsSenderNomeC2
	local hsSenderNomeC3
	local hshSenderRC1
	local hshSenderRC2
	local hshSenderRC3
	local hsSenderNomeCRezult
	nomeLen=string.utf8len(senderNomeC)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(senderNomeC, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNomeC=string.format("%03d",nome11)
	hsSenderNomeC1=string.sub(hNomeC,1,1)
	hsSenderNomeC2=string.sub(hNomeC,2,2)
	hsSenderNomeC3=string.sub(hNomeC,3,3)
	hshSenderRC1 = math.random(0, 9)
	hshSenderRC2 = math.random(0, 9)
	hshSenderRC3 = math.random(0, 9)

	if hshSenderRC2==0 then
	hsSenderNomeCRezult=hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC1 .. hsSenderNomeC2 .. hshSenderRC3 .. hsSenderNomeC3
	elseif hshSenderRC2==1 then
		hsSenderNomeCRezult=hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC2 .. hsSenderNomeC1 .. hshSenderRC3 .. hsSenderNomeC3
	elseif hshSenderRC2==2 then
		hsSenderNomeCRezult=hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC3 .. hsSenderNomeC1 .. hshSenderRC3 .. hsSenderNomeC2
	elseif hshSenderRC2==3 then
		hsSenderNomeCRezult=hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC1 .. hsSenderNomeC3 .. hshSenderRC3 .. hsSenderNomeC2
	elseif hshSenderRC2==4 then
		hsSenderNomeCRezult=hsSenderNomeC1 .. hshSenderRC2 .. hshSenderRC1 .. hsSenderNomeC3 .. hshSenderRC3 .. hsSenderNomeC2
	elseif hshSenderRC2==5 then
		hsSenderNomeCRezult=hsSenderNomeC1 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hshSenderRC3 .. hsSenderNomeC2
	elseif hshSenderRC2==6 then
		hsSenderNomeCRezult=hsSenderNomeC2 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hshSenderRC3 .. hsSenderNomeC1
	elseif hshSenderRC2==7 then
		hsSenderNomeCRezult=hsSenderNomeC3 .. hshSenderRC2 .. hsSenderNomeC2 .. hshSenderRC3 .. hshSenderRC1 .. hsSenderNomeC1
	elseif hshSenderRC2==8 then
		hsSenderNomeCRezult=hshSenderRC1 .. hshSenderRC2 .. hshSenderRC3 .. hsSenderNomeC1 .. hsSenderNomeC2 .. hsSenderNomeC3
	elseif hshSenderRC2==8 then
		hsSenderNomeCRezult=hsSenderNomeC1 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hsSenderNomeC2 .. hshSenderRC3
	elseif hshSenderRC2==9 then
		hsSenderNomeCRezult=hsSenderNomeC2 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hsSenderNomeC1 .. hshSenderRC3
	end
	if testQ ~= nil then
		if testQ[senderNomeC] ~= nil then
			if testQ[senderNomeC]["rarHSH1"]==nil then
				testQ[senderNomeC]["rarHSH1"]={}
			end
			if testQ[senderNomeC]["rarHSH"]==nil then
				testQ[senderNomeC]["rarHSH"]={}
			end


			testDate=date("%d")
			testDate=tonumber(testDate)
			if (testDate % 2 == 0) then
				tableHSH="rarHSH"
				testQ[senderNomeC]["rarHSH1"]=nil
			else
				tableHSH="rarHSH1"
				testQ[senderNomeC]["rarHSH"]=nil
			end


			if hsSenderNomeCRezult==testQ[senderNomeC][tableHSH] then
				hsSenderNomeCRezult=hshSenderNomeC(senderNomeC)
			end


			table.insert(testQ[senderNomeC][tableHSH], hsSenderNomeCRezult)
			return hsSenderNomeCRezult
		end
	end
end

function gmTest (gmTestNome)
	local gmTestRez
	for i=1,#gmList do
		if gmTestNome==gmList[i] then
			gmTestRez = "гм"
			break
		end
		i=i+1
	end
	return gmTestRez
end

function proverkaVypolneniyaKvestySachivkoj(mNome,qlvl)
	local vypolnenaLiAch=testQ[mNome]["взятый_квест"]
	if qlvl == 2 then
		qlvl = "квест_лвл2"
	elseif qlvl == 3 then
		qlvl = "квест_лвл3"
	end
	local chisloPunktop=testQ[mNome][qlvl][vypolnenaLiAch]
	chisloPunktop=tonumber(chisloPunktop)
	local count = GetAchievementNumCriteria (vypolnenaLiAch)
	j=0
	k=0
	for i=1, count do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(vypolnenaLiAch, i);
		prov=completed
		if prov == true then
			j=j+1
		else
			k=k+1
		end
		i=i+1
		end
		local pokazatRezult=chisloPunktop-j
		if pokazatRezult < 0 then
			pokazatRezult = 0
		end
		SendChatMessage("Осталось выполнить " .. pokazatRezult .. " пунктов ачивки " .. vypolnenaLiAch .. " " .. GetAchievementLink(vypolnenaLiAch) .. " из " .. chisloPunktop, "GUILD", nil, 1)
end


function npcXY(k,l,x,y,u)
	local testNpcScanDal = nil
	local npcSK = k
	local npcSL = l
	npcSK=tostring(npcSK)
	npcSL=tostring(npcSL)
	if npcScan[npcSK] == nil then
		npcScan[npcSK] = {}
	end
	if npcScan[npcSK][npcSL] == nil then
		npcScan[npcSK][npcSL] = {}
	end
	local unitNome = u
	if unitNome ~= nil then
		local npcPX = x
		local npcPY = y
		npcPX=tostring(npcPX)
		npcPY=tostring(npcPY)
		if npcScan[npcSK][npcSL][unitNome] == nil then
				npcCount=1
				npcCount=tostring(npcCount)
				npcScan[npcSK][npcSL][unitNome] = {}
				npcScan[npcSK][npcSL][unitNome][npcCount] = {}
				npcScan[npcSK][npcSL][unitNome][npcCount]["x"] = npcPX
				npcScan[npcSK][npcSL][unitNome][npcCount]["y"] = npcPY

		else
			local nomeRar={}
			local npcTestToch={}
			npcCount = (tablelength(npcScan[npcSK][npcSL][unitNome])) + 1
			npcCount=tostring(npcCount)
			npcPX=tostring(npcPX)
			npcPY=tostring(npcPY)
			npcScan[npcSK][npcSL][unitNome][npcCount] = {}
			npcScan[npcSK][npcSL][unitNome][npcCount]["x"] = npcPX
			npcScan[npcSK][npcSL][unitNome][npcCount]["y"] = npcPY
			end
		else
			print ("Выбери цель")
		end

end
function testNpc ( NpcID )
	CreateFrame( "GameTooltip", "MyScanningTooltip", nil, "GameTooltipTemplate" );
	MyScanningTooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
	MyScanningTooltip:AddFontStrings(
    MyScanningTooltip:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" ),
    MyScanningTooltip:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );
    MyScanningTooltip:SetHyperlink("unit:" .. NpcID)
    --GameTooltip:Show()
    EnumerateTooltipLines(MyScanningTooltip)
end


local function EnumerateTooltipLines_helper(...)
    for i = 1, select("#", ...) do
        local region = select(i, ...)
        if region and region:GetObjectType() == "FontString" then
            local text = region:GetText() -- string or nil
            if text ~= nil then
                if string.find (text, "Уровень") then
					testLvlNpc=mysplit(text)
				end
				if string.find (text, "уровня") then
					testLvlNpc=mysplit(text)
					if string.find(testLvlNpc[2], "%?%?") then
						SendAddonMessage("NSGadd", "#npcOff", "guild")
					end

					if string.find(testLvlNpc[1], "Труп") then
						SendAddonMessage("NSGadd", "#npcDie", "guild")
					end
				end
            end
        end
    end
end

function EnumerateTooltipLines(tooltip) -- good for script handlers that pass the tooltip as the first argument.
    EnumerateTooltipLines_helper(tooltip:GetRegions())
end

function pLid ()
	if UnitIsPartyLeader("party1") then
		pL = 1
	elseif UnitIsPartyLeader("party2") then
		pL = 2
	elseif UnitIsPartyLeader("party3") then
		pL = 3
	elseif UnitIsPartyLeader("party4") then
		pL = 4
	else
		pL = 0
	end
	return pL
end
function pM(nik)
		if nik == UnitName("party1") then
			r = 1
		elseif nik == UnitName("party2") then
			r = 1
		elseif nik == UnitName("party3") then
			r = 1
		elseif nik == UnitName("party4") then
			r = 1
		else
			r = 0
		end
		return r
	end

function tblAllFail(mm,nik)
	if mmList[mm] ~= nil then
		for i=1, mmList[mm]["количество_боссов"] do
			if nik == mmList[mm][i] then
				r = i
				break
			else
				r = 0
			end
		end
	end
	return r
end

function testMarsh(tabella,diam)
	trovMarsh(tabella,diam)
		local rez = 0
		if testQ["schet1"] ~= nil then
			for i = testQ["schet1"]-10, testQ["schet1"]+10 do
				if testQ["schet"][i] ~= nil then
					rez = rez + testQ["schet"][i]
					if rez > 0 then
						break
					end
				end
			end
		end
	return rez
end

function trovMarsh(tabella,diam)
	if testKontLok(tabella) ~= nil then
		local x,y = GetPlayerMapPosition("player")
		local testKont = GetCurrentMapContinent()
		testKont = tostring(testKont)
		local lok = GetCurrentMapZone()
		lok = tostring(lok)
		local tablen = tablelength(mapTables[tabella][testKont][lok])
		testQ["schet"] = {}
		testQ["numPunti"] = {}
		if testQ["num"] == nil then
			if testKontLok(tabella) < diam then
				testQ["num"] = 1
				testQ["schet1"] = 1
			end
		end
		for i = testQ["num"]-10, testQ["num"]+10 do
			testQ["schet1"] = i
			j = tostring(i)
			if mapTables[tabella][testKont][lok][j] ~= nil then
				mioCel=sqrt((x-mapTables[tabella][testKont][lok][j]["x"])^2+(y-mapTables[tabella][testKont][lok][j]["y"])^2)
				if mioCel < diam then
					testQ["schet"][i] = 1
					j = testQ["num"]
					j = tostring(j)
					mioCel1=sqrt((x-mapTables[tabella][testKont][lok][j]["x"])^2+(y-mapTables[tabella][testKont][lok][j]["y"])^2)
					if mioCel1 > mioCel then
						testQ["num"] = i
						testQ["marshF"][i] = i
						if testQ["marshF"][i] == math.modf(tablen/4) then
							SendChatMessage("Я прошел четверть маршрута", "OFFICER", nil, 1)
							PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
						end
						if testQ["marshF"][i] == math.modf(tablen/2) then
							SendChatMessage("Я прошел половину маршрута", "OFFICER", nil, 1)
							PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
						end
						if testQ["marshF"][i] == math.modf(tablen/4*3) then
							SendChatMessage("Я прошел три четверти маршрута", "OFFICER", nil, 1)
							PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
						end
						if tablen - 1 - #testQ["marshF"] < 1 then
							SendChatMessage("Маршрут завершен", "OFFICER", nil, 1)
							PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
							testQ["старт"] = nil
							testQ["num"] = nil
							testQ["marshF"] = nil

							if testQ[tabella] == "старт" then
								if tabella == "evO0102" then
									testQ["evO0102"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0203" then
									testQ["evO0203"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0304" then
									testQ["evO0304"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0405" then
									testQ["evO0405"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0506" then
									testQ["evO0506"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0607" then
									testQ["evO0607"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0708" then
									testQ["evO0708"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0809" then
									testQ["evO0809"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO0910" then
									testQ["evO0910"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO1011" then
									testQ["evO1011"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO11" then
									testQ["evO11"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO12" then
									testQ["evO12"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO13" then
									testQ["evO13"] = true
									testQ["startChern"] = nil
								end
								if tabella == "evO14" then
									testQ["evO14"] = true
									testQ["startChern"] = nil
								end


							end
						end
					end
				else
					testQ["schet"][i] = 0
				end
			end
		end
	end
end

function testKontLok(tabella)
	local testKont = GetCurrentMapContinent()
	testKont = tostring(testKont)
	local lok = GetCurrentMapZone()
	lok = tostring(lok)
	local mioCel
	local x,y = GetPlayerMapPosition("player")
	if x ~= 0 then
		if tabella ~= nil then
			if mapTables[tabella][testKont] ~= nil then
				if mapTables[tabella][testKont]["testKont"] ~= nil and mapTables[tabella][testKont]["testKont"] == testKont then
					if mapTables[tabella][testKont][lok] ~= nil then
						if mapTables[tabella][testKont][lok]["testLok"] == lok then
							mioCel=sqrt((x-mapTables[tabella][testKont][lok]["1"]["x"])^2+(y-mapTables[tabella][testKont][lok]["1"]["y"])^2)
							return mioCel
						end
					end
				end
			end
		end
	end
end

function startFchern(tabella,n1,n2)
	if krt[n1] == true and krt[n2] == true then
		testQ["start"] = tabella
		testQ["старт"] = 0
		testQ[tabella] = "старт"
	end
end

function testFchern(tabella,n1,n2)
	if testQ[tabella] == nil then
		if testKontLok(tabella) ~= nil then
			if testKontLok(tabella) < 0.020 then
				startFchern(tabella,n1,n2)
				testQ["startChern"] = tabella
			end
		end
	end
end


--[[function testQuest(tabella,diam)
	local testKont = GetCurrentMapContinent()
	local lok = GetCurrentMapZone()
	local x,y = GetPlayerMapPosition("player")
	testKont = tostring(testKont)
	lok = tostring(lok)
	if tabella ~= nil then
		if tabella[testKont] ~= nil then
			if tabella[testKont][lok] ~= nil then
				if testKont == tabella[testKont]["testKont"] then
					if tabella[testKont][lok]["testLok"] == lok then
						local mioCel=sqrt((x-tabella[testKont][lok]["1"]["x"])^2+(y-tabella[testKont][lok]["1"]["y"])^2)
						if mioCel < diam then
							testQ["старт"] = 1
							SendChatMessage("Старт маршрута", "guild", nil, 1)
						end
					end
				end
			end
		end
	end
end--]]

--[[function marafon(tabella,diam)
	local testKont = GetCurrentMapContinent()
	local lok = GetCurrentMapZone()
	local x,y = GetPlayerMapPosition("player")
	testKont = tostring(testKont)
	lok = tostring(lok)
	if testQ["старт"] == nil then
		local mioCel=sqrt((x-tabella["1"][testKont][lok]["x"])^2+(y-tabella["1"][testKont][lok]["x"]["y"])^2)
		if mioCel < diam then
			testQ["старт"] = 1
			testQ["marsh"] = 1
		end
	end
	if testQ["старт"] == 1 then

	end















end--]]
