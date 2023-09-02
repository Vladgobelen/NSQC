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
function nsplit(str)
	lines = {}
	for s in str:gmatch("[^\r\n]+") do
		table.insert(lines, s)
	end
	return lines
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
shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !?,.-0123456789'()"
	myB=string.find(shablon,bookv,1,true)
	return myB
end
function alfabetC (bookv,c)
	shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !?,.-0123456789'()"
	local myB
	if c == 0 then
		myB=string.find(shablon,bookv,1,true)
	end
	if c == 1 then
		if bookv < 133 then
			myB = string.utf8sub(shablon,bookv/2+0.5,bookv/2+0.5)
		else
			myB = string.sub(shablon,bookv,bookv)
		end
	end
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
	if qlvl == "2" then
		qlvl = "квест_лвл2"
	elseif qlvl == "3" then
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
	local r
	CreateFrame( "GameTooltip", "MyScanningTooltip", nil, "GameTooltipTemplate" );
	MyScanningTooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
	MyScanningTooltip:AddFontStrings(
    MyScanningTooltip:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" ),
    MyScanningTooltip:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );
    MyScanningTooltip:SetHyperlink("unit:" .. NpcID)
    --GameTooltip:Show()

    r=EnumerateTooltipLines(MyScanningTooltip)
    return r
end


local function EnumerateTooltipLines_helper(...)
	local rrr
    for i = 1, select("#", ...) do
        local region = select(i, ...)
        if region and region:GetObjectType() == "FontString" then
            local text = region:GetText() -- string or nil
            if text ~= nil then
            print (text)
                if string.find (text, "Уровень") then
					testLvlNpc=mysplit(text)
				end
				if string.find (text, "уровня") then
					testLvlNpc=mysplit(text)
					if string.find(testLvlNpc[3], "%?%?") then
						--SendAddonMessage("NSGadd", "#npcOff", "guild")
					else
						rrr="1"
					end
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
    return rrr
end

function EnumerateTooltipLines(tooltip) -- good for script handlers that pass the tooltip as the first argument.
	local r
    r=EnumerateTooltipLines_helper(tooltip:GetRegions())
    return r
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
	n1 = tostring(n1)
	n2 = tostring(n2)
	if krt[n1] == true and krt[n2] == true then
		testQ["start"] = tabella
		testQ["старт"] = 0
		testQ[tabella] = "старт"
	end
end

function testFchern(tabella,n1,n2)
	n1 = tostring(n1)
	n2 = tostring(n2)
	if testQ[tabella] == nil then
		if testKontLok(tabella) ~= nil then
			if testKontLok(tabella) < 0.020 then
				startFchern(tabella,n1,n2)
				testQ["startChern"] = tabella
			end
		end
	end
end

function printPar(tabella)
	local spisok = {}
	local spisokRez
	for k, v in pairs(tabella) do
		if k ~= nil then
			table.insert(spisok,k)
		end
	end
	spisokRez = table.concat(spisok, " ")
	return spisokRez
end

function otladka(num,mess1,mess2,mess3,mess4,mess5,mess6)
	local x
	numF=tonumber(num)
	if numF == 1 then
		if mess1 == "testQ" then
			x = testQ
		end
	end
	if numF == 2 then
		if mess1 == "testQ" then
			x = testQ[mess2]
		end
	end
	if numF == 3 then
		if mess1 == "testQ" then
			x = testQ[mess2][mess3]
		end
	end
	if numF == 4 then
		if mess1 == "testQ" then
			x = testQ[mess2][mess3][mess4]
		end
	end
	if numF == 5 then
		if mess1 == "testQ" then
			x = testQ[mess2][mess3][mess4][mess5]
		end
	end
	if numF == 6 then
		if mess1 == "testQ" then
			x = testQ[mess2][mess3][mess4][mess5][mess6]
		end
	end
	x=type(x)
	y=x
	return x,y
end
function tabellaFind(table, item)
       local index = 1;
       while table[index] do
       print (item)
       print(table[index])
               if ( item == table[index] ) then
                       return 1;
               end
               index = index + 1;
       end
       return nil;
end
function krtChernGetXY(nomer)
	nomer = tostring(nomer)
	for k, v in pairs(krt["chernila"][nomer]) do
		kont = k
	end
	for k, v in pairs(krt["chernila"][nomer][kont]) do
		lok = k
	end
	for k, v in pairs(krt["chernila"][nomer][kont][lok]) do
		if k == "x" then
			x = v
		end
		if k == "y" then
			y = v
		end
		if k == "msg" then
			m = v
		end
	end
	return kont, lok, x, y, m
end
function mapQuest(nomer)
	nomer = tostring(nomer)
	for k, v in pairs(testQ["mapQuest"][nomer]) do
		kont = k
	end
	for k, v in pairs(testQ["mapQuest"][nomer][kont]) do
		lok = k
	end
	for k, v in pairs(testQ["mapQuest"][nomer][kont][lok]) do
		if k == "x" then
			x = v
		end
		if k == "y" then
			y = v
		end
		if k == "msg" then
			m = v
		end
		if k == "cel" then
			c = v
		end
	end
	return kont, lok, x, y, m, c
end
function mapQuestP(nomer)
	nomer = tostring(nomer)
	testQ["mapQuest"]["podskazkiRez"] = {}
	for k, v in pairs(testQ["mapQuest"][nomer]) do
		kont = k
	end
	for k, v in pairs(testQ["mapQuest"][nomer][kont]) do
		lok = k
	end
	for k, v in pairs(testQ["mapQuest"][nomer][kont][lok]) do
		if k == "podskazki" then
			for k, v in pairs(testQ["mapQuest"][nomer][kont][lok]["podskazki"]) do
				testQ["mapQuest"]["podskazkiRez"][k] = v
			end
		end
	end
end
function chern1P(nomer)
	nomer = tostring(nomer)
	krt["chernila"]["podskazkiRez"] = {}
	for k, v in pairs(krt["chernila"][nomer]) do
		kont = k
	end
	for k, v in pairs(krt["chernila"][nomer][kont]) do
		lok = k
	end
	for k, v in pairs(krt["chernila"][nomer][kont][lok]) do
		if k == "podskazki" then
			for k, v in pairs(krt["chernila"][nomer][kont][lok]["podskazki"]) do
				krt["chernila"]["podskazkiRez"][k] = v
			end
		end
	end
end
function tabellaEnStr(nq,n)
	local lenVlozh, rez, l, k, x, x1
	nq=tostring(nq)
	n=tostring(n)
	if testQ["chD"] == nil then
		testQ["chD"] = {}
	end
	if testQ["chD"][tostring(nq)] == nil then
		l = "0"
		for z, v in pairs(krt["chernila"][nq]) do
			x=z
		end
		for z, v in pairs(krt["chernila"][nq][x]) do
			x1=z
		end
		lenVlozh = tablelength(krt["chernila"][nq][x][x1]["podskazki"])
		for i=1,lenVlozh do
			k=tostring(i)
			if rez == nil then
				rez = k .. " " .. txtXor(krt["chernila"][nq][x][x1]["podskazki"][k]) .. "\n"
			else
				rez = rez .. k .. " " .. txtXor(krt["chernila"][nq][x][x1]["podskazki"][k]) .. "\n"
			end
			l = tonumber(l)
			l = l+1
			l = tostring(l)
			if l==n then
				break
			end
		end
	else
		for z, v in pairs(krt["chernila"][nq]) do
			x=z
		end
		for z, v in pairs(krt["chernila"][nq][x]) do
			x1=z
		end
		rez = nq .." выполнено\n"
		l = tablelength(krt["chernila"][nq][x][x1]["podskazki"])
	end
	return rez,l
end

function txtXor(str)
	local g = str:utf8sub(1,3)
	local num
	local strRez
	if g ~= "###" then
		num = string.utf8len(str)
		strRez = "###"
		for i=1,num do
			strRez = strRez .. string.format("%03d",alfabet(string.utf8sub(str,i,i)))
		end
	end
	if g == "###" then
		strRez = alfabetC(tonumber(string.sub(str,4,6)),1)
		for i=7,#str,3 do
			strRez = strRez .. alfabetC(tonumber(string.sub(str,i,i+2)),1)
		end
	end
	return strRez
end
bcsQuickFrame = {}
function createQuickHtmlFrame(text,num,id)
	local tm = GetTime()
	bcsQuickFrame[id]  = CreateFrame("SimpleHTML", "BCSQuickFrame", UIParent)
	bcsQuickFrame[id]:SetSize(222, 222)
	bcsQuickFrame[id]:SetFrameStrata("HIGH")
	bcsQuickFrame[id]:SetPoint("CENTER", UIParent, "CENTER", 33, num)
	bcsQuickFrame[id]:SetBackdropColor(0, 103, 51, 1)
	bcsQuickFrame[id]:SetFont('Fonts\\FRIZQT__.TTF', 32);
	bcsQuickFrame[id]:SetText("<html><body><p>|cff90ee90" .. text .. "</p></body></html>");
end
function versFail()
	VerF  = CreateFrame("SimpleHTML", "BCSQuickFrame", UIParent)
	VerF:SetSize(777, 222)
	VerF:SetFrameStrata("HIGH")
	VerF:SetPoint("CENTER", UIParent, "CENTER", 333, 0)
	VerF:SetBackdropColor(0, 103, 51, 1)
	VerF:SetFont('Fonts\\FRIZQT__.TTF', 222);
	VerF:SetText("<html><body><p>|cffff0000ОБНОВИ АДДОН</p></body></html>");
end

function showOpt()
	for k, v in pairs(InterfaceOptionsCombatTextPanelHealing) do
		print(k,v)
	end
end

function showRB(nome)
	if pokazat==1 then
		for ii=1,15 do
			btn[ii]:Hide();
		end
		btn[991]:Show()
		btn[14]:Show()
		myCheckButton1:Show()
		myCheckButton2:Show()
		myCheckButton3:Show()
		myCheckButton4:Show()
		myCheckButton5:Show()
		btn[998]:Show()
		btn[997]:Show()
		pokazat=0
		pokazatChk=1
	elseif pokazat==0 then
		for ii=1,15 do
			btn[ii]:Show();
		end
		btn[991]:Hide()
		if testQ[nome]["взятый_квест"] == "9999" then
			btn[1]:Show()
			btn[2]:Hide()
		end
		if testQ[nome]["взятый_квест"] ~= "9999" then
			btn[1]:Hide()
			btn[2]:Show()
		end
		myCheckButton1:Hide()
		myCheckButton2:Hide()
		myCheckButton3:Hide()
		myCheckButton4:Hide()
		myCheckButton5:Hide()
		btn[998]:Hide()
		btn[997]:Hide()
		pokazat=1
		pokazatChk=0
	end
end

function debuffMove(myNome)
	if testQ[myNome]["настройки"]["debuff"] == "Disable" or testQ[myNome]["настройки"]["debuff"] == nil then
	if testQ["buffX"] ~= nil and testQ["buffX"] ~= 0 then
		if DebuffButton1 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton1:ClearAllPoints()
			DebuffButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"]), testQ["buffY"])

			if DebuffButton2 ~= nil then
				DebuffButton2:ClearAllPoints()
				local x,y = DebuffButton2:GetSize()
				DebuffButton2:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x, testQ["buffY"])
			end
			if DebuffButton3 ~= nil then
				DebuffButton3:ClearAllPoints()
				local x,y = DebuffButton3:GetSize()
				DebuffButton3:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*2), testQ["buffY"])
			end
			if DebuffButton4 ~= nil then
				DebuffButton4:ClearAllPoints()
				local x,y = DebuffButton4:GetSize()
				DebuffButton4:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*3), testQ["buffY"])
			end
			if DebuffButton5 ~= nil then
				DebuffButton5:ClearAllPoints()
				local x,y = DebuffButton5:GetSize()
				DebuffButton5:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*4), testQ["buffY"])
			end
			if DebuffButton6 ~= nil then
				DebuffButton6:ClearAllPoints()
				local x,y = DebuffButton6:GetSize()
				DebuffButton6:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*5), testQ["buffY"])
			end
			if DebuffButton7 ~= nil then
				DebuffButton7:ClearAllPoints()
				local x,y = DebuffButton7:GetSize()
				DebuffButton7:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*6), testQ["buffY"])
			end
			if DebuffButton8 ~= nil then
				DebuffButton8:ClearAllPoints()
				local x,y = DebuffButton8:GetSize()
				DebuffButton8:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*7), testQ["buffY"])
			end
			if DebuffButton9 ~= nil then
				DebuffButton9:ClearAllPoints()
				local x,y = DebuffButton9:GetSize()
				DebuffButton9:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*8), testQ["buffY"])
			end
			if DebuffButton10 ~= nil then
				DebuffButton10:ClearAllPoints()
				local x,y = DebuffButton10:GetSize()
				DebuffButton10:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*9), testQ["buffY"])
			end
			if DebuffButton11 ~= nil then
				DebuffButton11:ClearAllPoints()
				local x,y = DebuffButton11:GetSize()
				DebuffButton11:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*10), testQ["buffY"])
			end
			if DebuffButton12 ~= nil then
				DebuffButton12:ClearAllPoints()
				local x,y = DebuffButton12:GetSize()
				DebuffButton12:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*11), testQ["buffY"])
			end
			if DebuffButton13 ~= nil then
				DebuffButton13:ClearAllPoints()
				local x,y = DebuffButton13:GetSize()
				DebuffButton13:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*12), testQ["buffY"])
			end
			if DebuffButton14 ~= nil then
				DebuffButton14:ClearAllPoints()
				local x,y = DebuffButton14:GetSize()
				DebuffButton14:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*13), testQ["buffY"])
			end
			if DebuffButton15 ~= nil then
				DebuffButton15:ClearAllPoints()
				local x,y = DebuffButton15:GetSize()
				DebuffButton15:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*14), testQ["buffY"])
			end
			if DebuffButton16 ~= nil then
				DebuffButton16:ClearAllPoints()
				local x,y = DebuffButton16:GetSize()
				DebuffButton16:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*15), testQ["buffY"])
			end
			if DebuffButton17 ~= nil then
				DebuffButton17:ClearAllPoints()
				local x,y = DebuffButton17:GetSize()
				DebuffButton17:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*16), testQ["buffY"])
			end
			if DebuffButton18 ~= nil then
				DebuffButton18:ClearAllPoints()
				local x,y = DebuffButton18:GetSize()
				DebuffButton18:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*17), testQ["buffY"])
			end
			if DebuffButton19 ~= nil then
				DebuffButton19:ClearAllPoints()
				local x,y = DebuffButton19:GetSize()
				DebuffButton19:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*18), testQ["buffY"])
			end
			if DebuffButton20 ~= nil then
				DebuffButton20:ClearAllPoints()
				local x,y = DebuffButton20:GetSize()
				DebuffButton20:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+(x*19), testQ["buffY"])
			end

		end)
		end

	end
	if testQ["buffX"] == 0 then
		testQ["buffX"]=nil
	end
end
if testQ[myNome]["настройки"]["debuff"] == "Enable" then
	if DebuffButton1 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton1:ClearAllPoints()
			DebuffButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton2 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton2:ClearAllPoints()
			local x,y = DebuffButton2:GetSize()
			DebuffButton2:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton3 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton3:ClearAllPoints()
			local x,y = DebuffButton3:GetSize()
			DebuffButton3:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton4 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton4:ClearAllPoints()
			local x,y = DebuffButton4:GetSize()
			DebuffButton4:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton5 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton5:ClearAllPoints()
			local x,y = DebuffButton5:GetSize()
			DebuffButton5:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton6 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton6:ClearAllPoints()
			local x,y = DebuffButton6:GetSize()
			DebuffButton6:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton7 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton7:ClearAllPoints()
			local x,y = DebuffButton7:GetSize()
			DebuffButton7:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton8 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton8:ClearAllPoints()
			local x,y = DebuffButton8:GetSize()
			DebuffButton8:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton9 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton9:ClearAllPoints()
			local x,y = DebuffButton9:GetSize()
			DebuffButton9:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton10 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton10:ClearAllPoints()
			local x,y = DebuffButton10:GetSize()
			DebuffButton10:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton11 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton11:ClearAllPoints()
			local x,y = DebuffButton11:GetSize()
			DebuffButton11:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton12 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton12:ClearAllPoints()
			local x,y = DebuffButton12:GetSize()
			DebuffButton12:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton13 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton13:ClearAllPoints()
			local x,y = DebuffButton13:GetSize()
			DebuffButton13:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton14 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton14:ClearAllPoints()
			local x,y = DebuffButton14:GetSize()
			DebuffButton14:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton15 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton15:ClearAllPoints()
			local x,y = DebuffButton15:GetSize()
			DebuffButton15:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton16 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton16:ClearAllPoints()
			local x,y = DebuffButton16:GetSize()
			DebuffButton16:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton17 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton17:ClearAllPoints()
			local x,y = DebuffButton17:GetSize()
			DebuffButton17:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton18 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton18:ClearAllPoints()
			local x,y = DebuffButton18:GetSize()
			DebuffButton18:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton19 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton19:ClearAllPoints()
			local x,y = DebuffButton19:GetSize()
			DebuffButton19:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
		end
		if DebuffButton20 ~= nil then
			hooksecurefunc("DebuffButton_UpdateAnchors", function()
			DebuffButton20:ClearAllPoints()
			local x,y = DebuffButton20:GetSize()
			DebuffButton20:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999,9999)
			end)
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
