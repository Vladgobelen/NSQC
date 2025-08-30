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
local function IsInRaid()
    return GetNumRaidMembers() > 0
end
function round(number)
  if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
    number = number - (number % 1)
  else
    number = (number - (number % 1)) + 1
  end
 return number
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
	local YYY=((1-y)*668)
	local XXX=x*1002
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
function testN()
	testNpc(UnitGUID("target"))
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
		for k, v in pairs(mapTables[tabella]) do
			if type(k)=="string" then
				tKont = k
			end
			for k, v in pairs(mapTables[tabella][k]) do
				if type(k)=="string" then
					tLok = k
				end
			end
		end
		if testQ["schet1"] ~= nil then
			for i = testQ["schet1"]-10, testQ["schet1"]+10 do
				if testQ["schet"][i] ~= nil then
					marshrut(i,tablelength(mapTables[tabella][tKont][tLok]))
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
		local zoneName = GetMapInfo()
		if zoneName == "Ragefire" then
			testKont = "99"
			lok = "1"
		end
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
			if testQ["старт"] ~= nil then
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
							if tonumber(tablen) == tonumber(i) then
								SendChatMessage("Маршрут завершен", "OFFICER", nil, 1)
								PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
								if marshruT ~= nil then
								for i=1,9999 do
									if marshruT[i] ~= nil then
										marshruT[i]:Hide()
									end
								end
								end
								marshruT = nil
								testQ["старт"] = nil
								testQ["num"] = nil
								testQ["marshF"] = nil

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
								testQ["start"] = nil

							end
						end
					else
						testQ["schet"][i] = 0
					end
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
	local tKont,tLok
	local zoneName = GetMapInfo()
		if zoneName == "Ragefire" then
			testKont = "99"
			lok = "1"
		end
	if mapTables ~= nil then
		if mapTables[tabella] ~= nil then
			for k, v in pairs(mapTables[tabella]) do
				if type(k)=="string" then
					tKont = k
				end
				for k, v in pairs(mapTables[tabella][k]) do
					if type(k)=="string" then
						tLok = k
					end
				end
			end
			if tostring(lok) == tostring(tLok) then
				if tabella ~= nil then
					if mapTables[tabella] ~= nil then
						if tKont == testKont then
							if mapTables[tabella][testKont][lok] ~= nil then
								if tLok == lok then
									mioCel=sqrt((x-mapTables[tabella][testKont][lok]["1"]["x"])^2+(y-mapTables[tabella][testKont][lok]["1"]["y"])^2)
									return mioCel
								end
							end
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
		marshruT = {}
	end
end

function testFchern(tabella,n1,n2)
	n1 = tostring(n1)
	n2 = tostring(n2)
	local tKont,tLok
	if testQ[tabella] == nil then
		for k, v in pairs(mapTables[tabella]) do
			if type(k)=="string" then
				tKont = k
			end
			for k, v in pairs(mapTables[tabella][tKont]) do
				if type(k)=="string" then
					tLok = k
				end
			end
		end
			if mapTables["lokRasstoyanie"][tostring(tKont)] ~= nil then
				if mapTables["lokRasstoyanie"][tostring(tKont)][tostring(tLok)] ~= nil then
					if testKontLok(tabella) ~= nil then
						if tonumber(testKontLok(tabella)) <= tonumber(mapTables["lokRasstoyanie"][tostring(tKont)][tostring(tLok)])*3 then
							startFchern(tabella,n1,n2)
							testQ["startChern"] = tabella
						end
					end
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
dmG = {}
function dmgText(text,obj,id,raz,cvet)
	if dmG[id] == nil then
		dmG[id] = CreateFrame("SimpleHTML", "dmG", obj)
	else
		dmG[id]:Show()
	end
	dmG[id]:SetFrameStrata("FULLSCREEN_DIALOG")
	dmG[id]:ClearAllPoints()
	dmG[id]:SetBackdropColor(0, 103, 51, 1)
	dmG[id]:SetFont('Fonts\\FRIZQT__.TTF', 13,"OUTLINE", "MONOCHROME");
	if text ~= "" then
		if tonumber(text) <= 9999 then
			dmG[id]:SetSize(48, 48)
		end
		if tonumber(text) > 9999 then
			dmG[id]:SetSize(54, 48)
		end
		if tonumber(text) <= 9999 then
			dmG[id]:SetPoint("CENTER", obj, "CENTER", 5, -10)
		end
		if tonumber(text) > 9999 then
			dmG[id]:SetPoint("CENTER", obj, "CENTER", 1, -10)
		end
	end
	dmG[id]:SetText("<html><body><p style='background-color: #12345a'> |cff" .. cvet .. text .. "</p></body></html>");
end
dmG1 = {}
function dmgText1(text,obj,id,raz,cvet)
	if dmG1[id] == nil then
		dmG1[id] = CreateFrame("SimpleHTML", "dmG", obj)
		dmG1[id]:SetFrameStrata("FULLSCREEN_DIALOG")
		dmG1[id]:ClearAllPoints()
		dmG1[id]:SetBackdropColor(0, 103, 51, 1)
		dmG1[id]:SetFont('Fonts\\FRIZQT__.TTF', 13,"OUTLINE", "MONOCHROME");
	end
		if text ~= "" then
			if tonumber(text) <= 9999 then
				dmG1[id]:SetSize(48, 48)
			end
			if tonumber(text) > 9999 then
				dmG1[id]:SetSize(54, 48)
			end
			if tonumber(text) <= 9999 then
				dmG1[id]:SetPoint("CENTER", obj, "CENTER", 5, -10)
			end
			if tonumber(text) > 9999 then
				dmG1[id]:SetPoint("CENTER", obj, "CENTER", 1, -10)
			end
		end
		dmG1[id]:SetText("<html><body><p style='background-color: #12345a'> |cff" .. cvet .. text .. "</p></body></html>");
end
dmG2 = {}
function dmgText2(text,obj,id,raz,cvet)
	if dmG2[id] == nil then
		dmG2[id] = CreateFrame("SimpleHTML", "dmG", obj)
		dmG2[id]:SetFrameStrata("FULLSCREEN_DIALOG")
		dmG2[id]:ClearAllPoints()
		dmG2[id]:SetBackdropColor(0, 103, 51, 1)
		dmG2[id]:SetFont('Fonts\\FRIZQT__.TTF', 13,"OUTLINE", "MONOCHROME");
	end
	if text ~= nil and text ~= "" then
		if tonumber(text) <= 9999 then
			dmG2[id]:SetSize(48, 48)
		end
		if tonumber(text) > 9999 then
			dmG2[id]:SetSize(54, 48)
		end
		if tonumber(text) <= 9999 then
			dmG2[id]:SetPoint("CENTER", obj, "CENTER", 5, -10)
		end
		if tonumber(text) > 9999 then
			dmG2[id]:SetPoint("CENTER", obj, "CENTER", 1, -10)
		end
	end
	if text ~= nil then
		dmG2[id]:SetText("<html><body><p style='background-color: #12345a'> |cff" .. cvet .. text .. "</p></body></html>");
	end
end
rtnText = {}
function rtnTextF(text,id,show)
	if show == "show" then
		if rtnText[id] == nil then
			rtnText[id]  = CreateFrame("SimpleHTML", "BCSQuickFrame", UIParent)
			rtnText[id]:SetSize(415, 396)
			rtnText[id]:SetFrameStrata("TOOLTIP")
			rtnText[id]:SetPoint("CENTER", UIParent, "CENTER", 5, -55)
			rtnText[id]:SetBackdropColor(0, 0, 0, 0)
			if tonumber(string.utf8len(text)) < 200 then
				rtnText[id]:SetFont('Fonts\\FRIZQT__.TTF', 33)
			elseif tonumber(string.utf8len(text)) > 200 and tonumber(string.utf8len(text)) < 300 then
				rtnText[id]:SetFont('Fonts\\FRIZQT__.TTF', 27)
			elseif tonumber(string.utf8len(text)) >= 400 then
				rtnText[id]:SetFont('Fonts\\FRIZQT__.TTF', 16)
			end

		end
		rtnText[id]:SetText("<html><body><p>|cff000000" .. text .. "</p></body></html>");
		rtnText[id]: Show()
	else
		if rtnText[id] ~= nil then
			rtnText[id]: Hide()
		end
	end
end
function versFail(num)
	if VerF == nil then
		VerF  = CreateFrame("SimpleHTML", "BCSQuickFrame", UIParent)
	end
	VerF:SetSize(1111, 888)
	VerF:SetFrameStrata("HIGH")
	if testQ["VerF"] == nil then
		testQ["VerF"] = 600
	end
	VerF:SetPoint("CENTER", UIParent, "CENTER", testQ["VerF"], -355)
	VerF:SetBackdropColor(0, 103, 51, 1)
	VerF:SetFont('Fonts\\FRIZQT__.TTF', num+10);
	VerF:SetText("<html><body><p>|cffff0000ОБНОВИ АДДОН</p></body></html>");
end

function marshrut(id,num1)
	local j = id-1
	local jj = id+1
	local jjj = id+2
	local jjjj = id-2
	local jjjjj = id+3
	local jjjjjj = id-3
	if testQ["start"] ~= "evO3" then
		if marshruT ~= nil then
			if marshruT[id] == nil then
				marshruT[id]  = CreateFrame("SimpleHTML", "marshrut", UIParent)
				marshruT[id]:SetSize(222, 222)
				marshruT[id]:SetFrameStrata("HIGH")
				marshruT[id]:SetPoint("CENTER", UIParent, "CENTER", 333, 111)
				marshruT[id]:SetBackdropColor(0, 103, 51, 1)
				marshruT[id]:SetFont('Fonts\\FRIZQT__.TTF', 32);
				marshruT[id]:SetText("<html><body><p>|cff90ee90" .. id .. " из " .. tostring(num1) .. "</p></body></html>");
			end
			if marshruT[j] ~= nil then
				marshruT[j]:Hide()
				marshruT[j] = nil
			end
			if marshruT[jj] ~= nil then
				marshruT[jj]:Hide()
				marshruT[jj] = nil
			end
			if marshruT[jjj] ~= nil then
				marshruT[jjj]:Hide()
				marshruT[jjj] = nil
			end
			if marshruT[jjjj] ~= nil then
				marshruT[jjjj]:Hide()
				marshruT[jjjj] = nil
			end
			if marshruT[jjjjj] ~= nil then
				marshruT[jjjjj]:Hide()
				marshruT[jjjjj] = nil
			end
			if marshruT[jjjjjj] ~= nil then
				marshruT[jjjjjj]:Hide()
				marshruT[jjjjjj] = nil
			end
		end
	end
end


function showRB(nome)
	if debuffChkB == nil then
		debuffChkB = {}
	end
	if pokazat==1 and btn[1] ~= nil then
		for ii=1,15 do
			if btn[ii] ~= nil then
				btn[ii]:Hide();
			end
		end
		btn[991]:Show()
		if tonumber(testQ["mioFldLvl"]) ~= 0.5 and tonumber(testQ["mioFldLvl"]) ~= 0.9 and tonumber(testQ["mioFldLvl"]) ~= nil then
			btn[14]:Show()
		end
		myCheckButton1:Show()
		myCheckButton2:Show()
		myCheckButton3:Show()
		myCheckButton4:Show()
		myCheckButton5:Show()
		myCheckButton6:Show()
		myCheckButton7:Show()
		btn[998]:Show()
		btn[997]:Show()

		for i=1,20 do
			local name,__,__,__,__,__,__,__ = UnitDebuff("player",i)
			if name ~= nil then
				debuffChkB[name] = createCheckbutton(UIParent, 150, (-20*i)+230, name)
				debuffChkB[name].tooltip = "Скрывать иконку " .. name
				debuffChkB[name]:SetScript("OnClick",	function()

					if testQ[nome]["настройки"]["debuffChkB"] == nil then
						testQ[nome]["настройки"]["debuffChkB"] = {}
					end

					if testQ[nome]["настройки"]["debuffChkB"][name] == "Disable" or testQ[nome]["настройки"]["debuffChkB"][name] == nil then
						testQ[nome]["настройки"]["debuffChkB"][name] = "Enable"
						debuffChkB[name]:SetChecked(true)
					elseif testQ[nome]["настройки"]["debuffChkB"][name] == "Enable" then
						testQ[nome]["настройки"]["debuffChkB"][name] = "Disable"
						debuffChkB[name]:SetChecked(false)
					end
				end)
			end
		end

		pokazat=0
		pokazatChk=1
	elseif pokazat == 0 then
		btn[991]:Hide()
		if tonumber(testQ["mioFldLvl"]) ~= 0.5 and tonumber(testQ["mioFldLvl"]) ~= 0.9 and tonumber(testQ["mioFldLvl"]) ~= nil then
			for ii=1,15 do
				if btn[ii] ~= nil then
					btn[ii]:Show();
				end
			end
			if btn[ii] ~= nil then
				if testQ[nome]["взятый_квест"] == "9999" then
					btn[1]:Show()
					btn[2]:Hide()
				end
				if testQ[nome]["взятый_квест"] ~= "9999" then
					btn[1]:Hide()
					btn[2]:Show()
				end
			end
		end
		testQ["lvlProv"] = nil
		myCheckButton1:Hide()
		myCheckButton2:Hide()
		myCheckButton3:Hide()
		myCheckButton4:Hide()
		myCheckButton5:Hide()
		myCheckButton6:Hide()
		myCheckButton7:Show()
		for k, v in pairs(debuffChkB) do
			if debuffChkB[k] ~= nil then
				debuffChkB[k]:Hide()
			end
		end
		btn[998]:Hide()
		btn[997]:Hide()
		pokazat=1
		pokazatChk=0
	end
end

function marSh()
	local testKont = GetCurrentMapContinent()
	local lok = GetCurrentMapZone()
	local x,y = GetPlayerMapPosition("player")
	local n
	testKont = tostring(testKont)
	lok = tostring(lok)
	local zoneName = GetMapInfo()
		if zoneName == "Ragefire" then
			testKont = "99"
			lok = "1"
		end
	if marsh == nil then
		marsh = {}
	end
	if marsh[testKont] == nil then
		marsh[testKont] = {}
	end
	if marsh[testKont][lok] == nil then
		marsh[testKont][lok] = {}
	end
	local n = tablelength(marsh[testKont][lok])
	n = tostring(n+1)
	marsh[testKont][lok][n] = {}
	testQ["marshK"] = testKont
	testQ["marshL"] = lok
	testQ["marshN"] = n
	marsh[testKont][lok][n]["x"] =  string.format("%.3f",x)
	marsh[testKont][lok][n]["y"] =  string.format("%.3f",y)
	print (n)
end

function resObj1(id,myNome,nome)
	if krt == nil then
		krt = {}
	end
	if krt["podskazki"] == nil then
		krt["podskazki"] = 1
	end
	if testQ["трудовые_ресурсы"] == nil then
		testQ["трудовые_ресурсы"] = {}
		testQ["трудовые_ресурсы"] = 0
	end
	if myNome == nome then
		if mioFld ~= nil then
			if mioFld[myNome] ~= nil then
				if mioFld[myNome]["целостность"] ~= nil then
					if tonumber(testQ["трудовые_ресурсы"]) <= tonumber(krt["podskazki"]) then
						if 	mioFld[myNome]["объекты"][tostring(id)] ~= "hs" and mioFld[myNome]["объекты"][tostring(id)] ~= "zs" and mioFld[myNome]["объекты"][tostring(id)] ~= "zx" and mioFld[myNome]["объекты"][tostring(id)] ~= "sx" and mioFld[myNome]["объекты"][tostring(id)] ~= "tc" and mioFld[myNome]["объекты"][tostring(id)] ~= "as" and mioFld[myNome]["объекты"][tostring(id)] ~= "bc" and mioFld[myNome]["объекты"][tostring(id)] ~= "bs" and mioFld[myNome]["объекты"][tostring(id)] ~= "bx" and mioFld[myNome]["объекты"][tostring(id)] ~= "zc" and mioFld[myNome]["объекты"][tostring(id)] ~= "zp" and mioFld[myNome]["объекты"][tostring(id)] ~= "tz" and mioFld[myNome]["объекты"][tostring(id)] ~= "tv" and mioFld[myNome]["объекты"][tostring(id)] ~= "mf" and mioFld[myNome]["объекты"][tostring(id)] ~= "m0" and mioFld[myNome]["объекты"][tostring(id)] ~= "lx" and mioFld[myNome]["объекты"][tostring(id)] ~= "lp" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								if mioFld[myNome]["объекты"][tostring(id)] == "f" then
									SendAddonMessage("tree " .. tostring(id), myNome, "guild")
								end
								mioFld[myNome]["целостность"][tostring(id)] = 999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "m0" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 29999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 29999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "hs" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 9999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 9999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "tz" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 29999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 29999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "lx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 19999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 19999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "zc" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 9999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 9999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "as" or mioFld[myNome]["объекты"][tostring(id)] == "bc" or mioFld[myNome]["объекты"][tostring(id)] == "bs" or mioFld[myNome]["объекты"][tostring(id)] == "bx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 14999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 14999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "zs" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 19999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 19999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "tc" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 4999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 4999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "zx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 19999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 19999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "sx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 29999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
								mioFld[myNome]["целостность"][tostring(id)] = 29999
							end
						end
					else
						if 	mioFld[myNome]["объекты"][tostring(id)] ~= "hs" and mioFld[myNome]["объекты"][tostring(id)] ~= "zs" and mioFld[myNome]["объекты"][tostring(id)] ~= "zx" and mioFld[myNome]["объекты"][tostring(id)] ~= "sx" and mioFld[myNome]["объекты"][tostring(id)] ~= "tc" and mioFld[myNome]["объекты"][tostring(id)] ~= "as" and mioFld[myNome]["объекты"][tostring(id)] ~= "bx" and mioFld[myNome]["объекты"][tostring(id)] ~= "bc" and mioFld[myNome]["объекты"][tostring(id)] ~= "bs" and mioFld[myNome]["объекты"][tostring(id)] ~= "zc" and mioFld[myNome]["объекты"][tostring(id)] ~= "zp" and mioFld[myNome]["объекты"][tostring(id)] ~= "tz" and mioFld[myNome]["объекты"][tostring(id)] ~= "tv" and mioFld[myNome]["объекты"][tostring(id)] ~= "mf" and mioFld[myNome]["объекты"][tostring(id)] ~= "m0" and mioFld[myNome]["объекты"][tostring(id)] ~= "lx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								if mioFld[myNome]["объекты"][tostring(id)] == "f" then
									SendAddonMessage("tree " .. tostring(id), myNome, "guild")
								end
								mioFld[myNome]["целостность"][tostring(id)] = 999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "hs" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 9999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 9999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "lx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 19999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 19999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "tz" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 29999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 29999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "m0" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 29999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 29999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "zc" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 9999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 9999
							end
						end
						if mioFld[myNome]["объекты"][tostring(id)] == "as" or mioFld[myNome]["объекты"][tostring(id)] == "bc" or mioFld[myNome]["объекты"][tostring(id)] == "bs" or mioFld[myNome]["объекты"][tostring(id)] == "bx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 14999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 14999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "zs" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 19999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 19999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "tc" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 4999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 4999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "zx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 19999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 19999
							end
						end
						if 	mioFld[myNome]["объекты"][tostring(id)] == "sx" then
							if tonumber(mioFld[myNome]["целостность"][tostring(id)]) < 29999 then
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+5
							else
								mioFld[myNome]["целостность"][tostring(id)] = 29999
							end
						end
					end
					SendAddonMessage("resObj " .. id .. " " .. mioFld[myNome]["целостность"][tostring(id)],nome , "guild")
				end
			end
		end
	else
		if mioFld ~= nil then
			if mioFld[nome] ~= nil then
				if mioFld[nome]["целостность"] ~= nil then
						if tonumber(testQ["трудовые_ресурсы"]) <= tonumber(krt["podskazki"]) then
							if 	mioFld[nome]["объекты"][tostring(id)] ~= "hs" and mioFld[nome]["объекты"][tostring(id)] ~= "zs" and mioFld[nome]["объекты"][tostring(id)] ~= "zx" and mioFld[nome]["объекты"][tostring(id)] ~= "sx" and mioFld[nome]["объекты"][tostring(id)] ~= "tc" and mioFld[nome]["объекты"][tostring(id)] ~= "as" and mioFld[nome]["объекты"][tostring(id)] ~= "bc" and mioFld[nome]["объекты"][tostring(id)] ~= "bs" and mioFld[nome]["объекты"][tostring(id)] ~= "bx" and mioFld[nome]["объекты"][tostring(id)] ~= "zc" and mioFld[nome]["объекты"][tostring(id)] ~= "zp" and mioFld[nome]["объекты"][tostring(id)] ~= "tz" and mioFld[nome]["объекты"][tostring(id)] ~= "tv" and mioFld[nome]["объекты"][tostring(id)] ~= "m0" and mioFld[nome]["объекты"][tostring(id)] ~= "mf" and mioFld[nome]["объекты"][tostring(id)] ~= "lx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "hs" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 9999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 9999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "lx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 19999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 19999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "tz" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 29999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 29999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "m0" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 29999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 29999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "zc" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 9999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 9999
								end
							end
							if mioFld[nome]["объекты"][tostring(id)] == "as" or mioFld[nome]["объекты"][tostring(id)] == "bc" or mioFld[nome]["объекты"][tostring(id)] == "bs" or mioFld[nome]["объекты"][tostring(id)] == "bx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 14999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 14999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "zs" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 19999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 19999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "zx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 19999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 19999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "tc" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 4999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 4999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "sx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 29999 then
									if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 29999
								end
							end
						else
							if 	mioFld[nome]["объекты"][tostring(id)] ~= "hs" and mioFld[nome]["объекты"][tostring(id)] ~= "zs" and mioFld[nome]["объекты"][tostring(id)] ~= "zx" and mioFld[nome]["объекты"][tostring(id)] ~= "sx" and mioFld[nome]["объекты"][tostring(id)] ~= "tc" and mioFld[nome]["объекты"][tostring(id)] ~= "as" and mioFld[nome]["объекты"][tostring(id)] ~= "bc" and mioFld[nome]["объекты"][tostring(id)] ~= "bs" and mioFld[nome]["объекты"][tostring(id)] ~= "bx" and mioFld[nome]["объекты"][tostring(id)] ~= "zc" and mioFld[nome]["объекты"][tostring(id)] ~= "zp" and mioFld[nome]["объекты"][tostring(id)] ~= "tz" and mioFld[nome]["объекты"][tostring(id)] ~= "tv" and mioFld[nome]["объекты"][tostring(id)] ~= "m0" and mioFld[nome]["объекты"][tostring(id)] ~= "mf" and mioFld[nome]["объекты"][tostring(id)] ~= "lx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "hs" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 9999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 9999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "lx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 19999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 19999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "tz" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 29999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 29999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "m0" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 29999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 29999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "tc" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 4999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 4999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "as" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 14999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 14999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "zs" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 19999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 19999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "zx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 19999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 19999
								end
							end
							if 	mioFld[nome]["объекты"][tostring(id)] == "sx" then
								if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 29999 then
									if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
										local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
										if x == 9 then
											mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
										end
									else
										mioFld[nome]["целостность"][tostring(id)] = tonumber(mioFld[nome]["целостность"][tostring(id)])+round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
									end
								else
									mioFld[nome]["целостность"][tostring(id)] = 29999
								end
							end
						end
					SendAddonMessage("resObj " .. id .. " " .. mioFld[nome]["целостность"][tostring(id)],nome , "guild")
				end
			end
		end
	end
end
function gKam(myNome,x)
	local testK = nil
	if tonumber(x) == 500 then
		for i = 1,100 do
			if mioFld1[myNome]["объекты"][tostring(i)] == "sk" then
				if testK == nil then
					testK = 1
				else
					testK = testK + 1
				end
			end
		end
		if testK == nil then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			SendAddonMessage("ns_kP","0", "guild")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg")
		elseif testK == 1 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			SendAddonMessage("ns_kP","1", "guild")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg")
		elseif testK == 2 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			SendAddonMessage("ns_kP","2", "guild")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg")
		elseif testK == 3 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			SendAddonMessage("ns_kP","3", "guild")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg")
		elseif testK == 4 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			SendAddonMessage("ns_kP","4", "guild")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg")
		elseif testK == 5 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			SendAddonMessage("ns_kP","5", "guild")
			PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg")
		end
	end
end

function bdf(myNome)
	if testQ == nil then
		testQ = {}
	end
	if testQ["myNome"] == nil then
		testQ["myNome"] = {}
	end
	if testQ[myNome]["настройки"] == nil then
		testQ[myNome]["настройки"] = {}
	end
	if  testQ[myNome]["настройки"]["debuffChkB"] == nil then
		testQ[myNome]["настройки"]["debuffChkB"] = {}
	end
	if DebuffButton1 ~= nil then
		if tonumber(testQ["buffX"]) ~= nil and tonumber(testQ["buffX"]) ~= 0 then
			local __,__,__,tempPoint = DebuffButton1:GetPoint()
			local __,__,__,tempPointB = btn[991]:GetPoint()
			if tempPoint ~= tempPointB then
				local x,y = DebuffButton1:GetSize()
				local getSize = UIParent:GetSize()/2
				j = 1
				for i=1, DEBUFF_MAX_DISPLAY do
					if AuraButton_Update("DebuffButton", i, "HARMFUL") then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",i)
						local buff = _G["DebuffButton"..i]
						if buff ~= nil and (testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable") then
							buff:ClearAllPoints()
							if tonumber(testQ["buffX"]) < getSize then
								buff:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*j, testQ["buffY"])
								j = j+1
							else
								buff:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*j, testQ["buffY"])
								j = j+1
							end
						else
							if buff ~= nil and buff:IsVisible() then
								buff:Hide()
							end
						end
						--buff:SetAllPoints(btn[991])
					end
				end
			end
			if testQ["buffX"] == 0 then
				testQ["buffX"]=nil
			end
		end
	end
end
function gtest()
	gTest = nil
	gTest = {}
	for i = 1, 50 do
		local t1,t2,g,r,t3,t4,t= GetWhoInfo(i)
		if t2 == "" then
			if r ~= "Дреней" and r ~= "Ночная эльфийка" and r ~= "Человек" and r ~= "Ночной эльф" and r ~= "Гном" and r ~= "Дворф" then
				table.insert(gTest,t1)
			end
		end
	end
end
function ns_q5()
	ns_q5Test = nil
	ns_q5Test = {}
	for i = 1, 50 do
		local t1,t2,g,r,t3,t4,t= GetWhoInfo(i)
		if t2 == "" then
			table.insert(ns_q5Test,t1)
		end
	end
end
function closeFld()
	for i = 1, 100 do
		fBtn[i]:Hide()
	end
	for i = 1, 100 do
		if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
			if resursy[i] ~= nil then
				if i == 5 then
					if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
					end
				else
					resursy[i]:Hide()
				end
			end
		end
	end
	btn[989]:Hide()
	btn[989]:ClearAllPoints()
	btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
end
function hX()
	quesT("hide")
	okNo:configure(1,"hide")
	rtnTextF("fdsa",1,"hide")
	for i=1,100 do
		fBtn[i]:Hide()
		--fBtn[i]:SetHighlightTexture("")
	end
	if resursy[1] ~= nil then
		resursy[1]:Hide()
		resursy[2]:Hide()
		resursy[3]:Hide()
	end
	if okNo ~= nil then
		okNo[1]:Hide()
		okNo[2]:Hide()
	end
	btn[989]:Hide()
	btn[989]:ClearAllPoints()
	btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
end

function showFld(sign,myNome)
	local nome
	local proverkaLvla
	local proverkaLvla1
	local testB
	if mBtn[1] ~= nil then
		if mBtn[1]:IsVisible() then
			testB = 1
		end
	end
	if dBtn[1] ~= nil then
		if dBtn[1]:IsVisible() then
			testB = 1
		end
	end
	if not fBtn[1]:IsVisible() and testB ~= 1 then
		if not GuildFrameLFGButton:GetChecked() or sign == "1" then
			if sign == "0" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
			btn[989]:ClearAllPoints()
			btn[989]:SetPoint("BOTTOMRIGHT", fBtn[10],"TOPRIGHT",1, 1)
			for Zc=1,GetNumGuildMembers(true) do
				local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
				if nome ~= myNome then
					if name == nome then
						proverkaLvla = string.sub(officerNote,1,1)
						proverkaLvla1 = string.sub(officerNote,2,2)
						if officerNote ~= "" and proverkaLvla ~= "1" and proverkaLvla ~= "0" then
							testQ["fldLvl"] = tonumber(proverkaLvla)
							testQ["qNum"] = string.sub(officerNote,8,8)
							testQ["qDay"] = string.sub(officerNote,6,7)
						elseif proverkaLvla == "1" then
							testQ["fldLvl"] = 0.9
							testQ["qNum"] = string.sub(officerNote,8,8)
							testQ["qDay"] = string.sub(officerNote,6,7)
						elseif proverkaLvla == "0" then
							testQ["fldLvl"] = 0.5
							testQ["qNum"] = 0
							testQ["qDay"] = 0
						elseif proverkaLvla == "" then
							testQ["fldLvl"] = 0.5
							testQ["qNum"] = 0
							testQ["qDay"] = 0
						end
						if proverkaLvla1 == nil then
							testQ["fldLvl"] = 0.5
							testQ["qNum"] = 0
							testQ["qDay"] = 0
						end
					end
					if name == myNome then
						proverkaLvla = string.sub(officerNote,1,1)
						if officerNote ~= "" and proverkaLvla ~= "1" and proverkaLvla ~= "0" then
							testQ["mioFldLvl"] = string.sub(officerNote,1,1)
						elseif proverkaLvla == "1" then
							testQ["mioFldLvl"] = 0.9
						elseif proverkaLvla == "0" then
							testQ["mioFldLvl"] = 0.5
						elseif proverkaLvla == "" then
							testQ["mioFldLvl"] = 0.5
						end
					end
				else
					if name == myNome then
						proverkaLvla = string.sub(officerNote,1,1)
						proverkaLvla1 = string.sub(officerNote,2,2)
						if officerNote ~= "" and proverkaLvla ~= "1" and proverkaLvla ~= "0" then
							testQ["mioFldLvl"] = string.sub(officerNote,1,1)
							testQ["fldLvl"] = testQ["mioFldLvl"]
							testQ["qNum"] = string.sub(officerNote,8,8)
							testQ["qDay"] = string.sub(officerNote,6,7)
						elseif proverkaLvla == "1" then
							testQ["mioFldLvl"] = 0.9
							testQ["fldLvl"] = testQ["mioFldLvl"]
							testQ["qNum"] = string.sub(officerNote,8,8)
							testQ["qDay"] = string.sub(officerNote,6,7)
						elseif proverkaLvla == "0" then
							testQ["mioFldLvl"] = 0.5
							testQ["fldLvl"] = testQ["mioFldLvl"]
							testQ["qNum"] = 0
							testQ["qDay"] = 0
						elseif proverkaLvla == "" then
							testQ["mioFldLvl"] = 0.5
							testQ["fldLvl"] = testQ["mioFldLvl"]
							testQ["qNum"] = 0
							testQ["qDay"] = 0
						end
						if proverkaLvla1 == nil then
							testQ["mioFldLvl"] = 0.5
							testQ["fldLvl"] = testQ["mioFldLvl"]
							testQ["qNum"] = 0
							testQ["qDay"] = 0
						end
					end
				end
				if tonumber(testQ["mioFldLvl"]) == 0 then
					testQ["mioFldLvl"] = 0.5
				end
				if tonumber(testQ["fldLvl"]) == 0 then
					testQ["fldLvl"] = 0.5
				end
			end
			testQ["fRand1"] = math.random(1,1000000)
			testQ['sign'] = sign
			SendAddonMessage("shMFld " .. testQ["fRand1"], nome .. " " .. myNome, "guild")
			FriendsFrame:Hide()
		else
			local numPet = tablelength(risPet)
			for i = 1, 100 do
				if risPet[i] ~= nil then
					risPetShow(i,"hide","")
				end
			end
			for i=1,100 do
				fBtn[i]:Hide()
				--fBtn[i]:SetHighlightTexture("")
			end
			btn[989]:ClearAllPoints()
			btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
			if resursy[1] ~= nil then
				resursy[1]:Hide()
				resursy[2]:Hide()
				resursy[3]:Hide()
			end
			for i = 1,100 do
				if dmG[i] ~= nil and dmG[i]:IsVisible()then
					dmG[i]:Hide()
				end
			end
			for i = 1,3 do
				if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
					if resursy[i] ~= nil then
						if i == 5 then
							if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
							end
						else
							resursy[i]:Hide()
						end
					end
				end
			end
			for i=101,103 do
				if dmG[i]~= nil then
					dmG[i]:Hide()
				end
			end
			if tonumber(testQ['sign']) == 0 then
				FriendsFrame:Show()
			end
			testQ['sign'] = nil
			testQ["fRandD1nome"] = nil
		end
	else
		local numPet = tablelength(risPet)
			for i = 1, 100 do
				if risPet[i] ~= nil then
					risPetShow(i,"hide","")
				end
			end
		for i=1,100 do
			fBtn[i]:Hide()
			btn[989]:ClearAllPoints()
			btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
			--fBtn[i]:SetHighlightTexture("")
		end
		if resursy[1] ~= nil then
			resursy[1]:Hide()
			resursy[2]:Hide()
			resursy[3]:Hide()
		end
		for i = 1,100 do
			if dmG[i] ~= nil and dmG[i]:IsVisible()then
				dmG[i]:Hide()
			end
		end
		for i = 1,100 do
			if mgznIcon[1] == nil or not mgznIcon[1]:IsVisible() then
				if resursy[i] ~= nil then
					if i == 5 then
						if mgznIcon[1] ~= nil and mgznIcon[1]:IsVisible() then
						end
					else
						resursy[i]:Hide()
					end
				end
			end
		end
		for i=101,103 do
			if dmG[i] ~= nil then
				dmG[i]:Hide()
			end
		end
		if tonumber(testQ['sign']) == 0 then
			FriendsFrame:Show()
		end
		if tostring(testQ['sign']) == "1" then
			btn[989]:Hide()
		end
		testQ['sign'] = nil
	end
end
function qLvl33c1()
	local idNpc
	local nomeNpc1
	local nomeNpc2
	local nomeNpc3
	local emotQ
	local emotQ1
	local emotQ2
	emotQ = rndTblc(eMotC)["квест"]
	print(emotQ)
	emotQ1 = eMotC[emotQ]["поиск"]
	emotQ2 = eMotC[emotQ]["ответ"]
	idNpc = rndTblc(npcListC1)["айди"]
	nomeNpc1 = npcListC1[idNpc]["имя"]
	idNpc = rndTblc(npcListC1)["айди"]
	nomeNpc2 = npcListC1[idNpc]["имя"]
	while true do
		if nomeNpc1 == nomeNpc2 then
			idNpc = rndTblc(npcListC1)["айди"]
			nomeNpc2 = npcListC1[idNpc]["имя"]
		else
			break
		end
	end
	idNpc = rndTblc(npcListC1)["айди"]
	nomeNpc3 = npcListC1[idNpc]["имя"]
	while true do
		if nomeNpc3 == nomeNpc2 or nomeNpc3 == nomeNpc1 then
			idNpc = rndTblc(npcListC1)["айди"]
			nomeNpc3 = npcListC1[idNpc]["имя"]
		else
			break
		end
	end
	return emotQ,nomeNpc1,nomeNpc2,nomeNpc3,emotQ1,emotQ2
end
function qLvl33c2()
	local idNpc
	local nomeNpc1
	local nomeNpc2
	local nomeNpc3
	local emotQ
	local emotQ1
	local emotQ2
	emotQ = rndTblc(eMotC)["квест"]
	print(emotQ)
	emotQ1 = eMotC[emotQ]["поиск"]
	emotQ2 = eMotC[emotQ]["ответ"]
	idNpc = rndTblc(npcListC2)["айди"]
	nomeNpc1 = npcListC2[idNpc]["имя"]
	idNpc = rndTblc(npcListC2)["айди"]
	nomeNpc2 = npcListC2[idNpc]["имя"]
	while true do
		if nomeNpc1 == nomeNpc2 then
			idNpc = rndTblc(npcListC2)["айди"]
			nomeNpc2 = npcListC2[idNpc]["имя"]
		else
			break
		end
	end
	idNpc = rndTblc(npcListC2)["айди"]
	nomeNpc3 = npcListC2[idNpc]["имя"]
	while true do
		if nomeNpc3 == nomeNpc2 or nomeNpc3 == nomeNpc1 then
			idNpc = rndTblc(npcListC2)["айди"]
			nomeNpc3 = npcListC2[idNpc]["имя"]
		else
			break
		end
	end
	return emotQ,nomeNpc1,nomeNpc2,nomeNpc3,emotQ1,emotQ2
end
function qLvl33c3()
	local idNpc
	local nomeNpc1
	local nomeNpc2
	local nomeNpc3
	local emotQ
	local emotQ1
	local emotQ2
	emotQ = rndTblc(eMotC)["квест"]
	print(emotQ)
	emotQ1 = eMotC[emotQ]["поиск"]
	emotQ2 = eMotC[emotQ]["ответ"]
	idNpc = rndTblc(npcListC3)["айди"]
	nomeNpc1 = npcListC3[idNpc]["имя"]
	idNpc = rndTblc(npcListC3)["айди"]
	nomeNpc2 = npcListC3[idNpc]["имя"]
	while true do
		if nomeNpc1 == nomeNpc2 then
			idNpc = rndTblc(npcListC3)["айди"]
			nomeNpc2 = npcListC3[idNpc]["имя"]
		else
			break
		end
	end
	idNpc = rndTblc(npcListC3)["айди"]
	nomeNpc3 = npcListC3[idNpc]["имя"]
	while true do
		if nomeNpc3 == nomeNpc2 or nomeNpc3 == nomeNpc1 then
			idNpc = rndTblc(npcListC3)["айди"]
			nomeNpc3 = npcListC3[idNpc]["имя"]
		else
			break
		end
	end
	return emotQ,nomeNpc1,nomeNpc2,nomeNpc3,emotQ1,emotQ2
end
function rndTblc(tb)
    local keys = {}
    for k in pairs(tb) do table.insert(keys, k) end
    return tb[keys[math.random(#keys)]]
end
function htimer(myNome)
	local testTO = 0
	for i = 1, 100 do
		if mioFld1[myNome]["объекты"][tostring(i)] == "to" then
			testTO = "to"
		end
	end
	if testQ[myNome]["dTimer"][30] == nil then
		testQ[myNome]["dTimer"][30] = 26000
	end
	if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil then
		testQ[myNome]["dTimer"][tonumber(date("%d"))-1] = 26000
	end
	if tonumber(testQ["mioFldLvl"]) == 0.5 or tonumber(testQ["mioFldLvl"]) == 0.9 then
		if testQ[myNome]["hTimer"] == nil then
			if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil and testQ[myNome]["dTimer"][30] == nil then
				if testTO ~= "to" then
					testQ[myNome]["hTimer"] = 50400
				else
					testQ[myNome]["hTimer"] = 26000
				end
			else
				if tonumber(date("%d")) ~= 1 then
					if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = testQ[myNome]["dTimer"][tonumber(date("%d"))-1]
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",tonumber(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/1.5))
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				else
					if testQ[myNome]["dTimer"][30] ~= nil and testQ[myNome]["dTimer"][30] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = testQ[myNome]["dTimer"][30]
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",tonumber(testQ[myNome]["dTimer"][30])/1.5))
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				end
			end
		end
	elseif tonumber(testQ["mioFldLvl"]) == 2 then
		if testQ[myNome]["hTimer"] == nil then
			if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil and testQ[myNome]["dTimer"][30] == nil then
				if testTO ~= "to" then
					testQ[myNome]["hTimer"] = 25200
				else
					testQ[myNome]["hTimer"] = 16000
				end
			else
				if tonumber(date("%d")) ~= 1 then
					if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/2))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/2)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				else
					if testQ[myNome]["dTimer"][30] ~= nil and testQ[myNome]["dTimer"][30] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/2))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/2)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				end
			end
		end
	elseif tonumber(testQ["mioFldLvl"]) == 3 then
		if testQ[myNome]["hTimer"] == nil then
			if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil and testQ[myNome]["dTimer"][30] == nil then
				if testTO ~= "to" then
					testQ[myNome]["hTimer"] = 14500
				else
					testQ[myNome]["hTimer"] = 10000
				end
			else
				if tonumber(date("%d")) ~= 1 then
					if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/3))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/3)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				else
					if testQ[myNome]["dTimer"][30] ~= nil and testQ[myNome]["dTimer"][30] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/3))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/3)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				end
			end
		end
	elseif tonumber(testQ["mioFldLvl"]) == 4 then
		if testQ[myNome]["hTimer"] == nil then
			if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil and testQ[myNome]["dTimer"][30] == nil then
				if testTO ~= "to" then
					testQ[myNome]["hTimer"] = 11000
				else
					testQ[myNome]["hTimer"] = 8000
				end
			else
				if tonumber(date("%d")) ~= 1 then
					if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/4))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/4)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				else
					if testQ[myNome]["dTimer"][30] ~= nil and testQ[myNome]["dTimer"][30] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/4))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/4)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				end
			end
		end
	elseif tonumber(testQ["mioFldLvl"]) == 5 then
		if testQ[myNome]["hTimer"] == nil then
			if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil and testQ[myNome]["dTimer"][30] == nil then
				if testTO ~= "to" then
					testQ[myNome]["hTimer"] = 10500
				else
					testQ[myNome]["hTimer"] = 7000
				end
			else
				if tonumber(date("%d")) ~= 1 then
					if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/5))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/5)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				else
					if testQ[myNome]["dTimer"][30] ~= nil and testQ[myNome]["dTimer"][30] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/5))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/5)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				end
			end
		end
	elseif tonumber(testQ["mioFldLvl"]) == 6 then
		if testQ[myNome]["hTimer"] == nil then
			if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil and testQ[myNome]["dTimer"][30] == nil then
				if testTO ~= "to" then
					testQ[myNome]["hTimer"] = 10800
				else
					testQ[myNome]["hTimer"] = 7000
				end
			else
				if tonumber(date("%d")) ~= 1 then
					if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/6))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/6)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				else
					if testQ[myNome]["dTimer"][30] ~= nil and testQ[myNome]["dTimer"][30] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/6))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/6)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				end
			end
		end
	elseif tonumber(testQ["mioFldLvl"]) == 7 then
		if testQ[myNome]["hTimer"] == nil then
			if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] == nil and testQ[myNome]["dTimer"][30] == nil then
				if testTO ~= "to" then
					testQ[myNome]["hTimer"] = 10800
				else
					testQ[myNome]["hTimer"] = 7000
				end
			else
				if tonumber(date("%d")) ~= 1 then
					if testQ[myNome]["dTimer"][tonumber(date("%d"))-1] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/7))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/7)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				else
					if testQ[myNome]["dTimer"][30] ~= nil and testQ[myNome]["dTimer"][30] > 10800 then
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/7))
							if testQ[myNome]["hTimer"] < 10800 then
								testQ[myNome]["hTimer"] = 10800
							end
						else
							testQ[myNome]["hTimer"] = tonumber(string.format("%u",(tonumber(string.format("%u",(testQ[myNome]["dTimer"][tonumber(date("%d"))-1])/7)))/1.5))
							if testQ[myNome]["hTimer"] < 7000 then
								testQ[myNome]["hTimer"] = 7000
							end
						end
					else
						if testTO ~= "to" then
							testQ[myNome]["hTimer"] = 10800
						else
							testQ[myNome]["hTimer"] = 7000
						end
					end
				end
			end
		end
	end
	SendAddonMessage("#mioTimer " .. myNome, testQ[myNome]["hTimer"] .. " " .. tonumber(testQ["mioFldLvl"]), "guild")
	SendAddonMessage("#mioTimer " .. myNome, testQ[myNome]["hTimer"] .. " " .. tonumber(testQ["mioFldLvl"]), "guild")
	SendAddonMessage("#mioTimer " .. myNome, testQ[myNome]["hTimer"] .. " " .. tonumber(testQ["mioFldLvl"]), "guild")
end

function ml()
	if BrowseBuyoutButton ~= nil then
		if aucBtn == nil then
			aucBtn = CreateFrame("Button", nil, UIParent, "");
			aucBtn:SetFrameStrata("TOOLTIP")
			aucBtn:SetSize(222, 32)
			aucBtn:SetPoint("CENTER", BrowseBidButton,"CENTER",22, 0)
			aucBtn:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\auk.tga")
			aucBtn:Hide()
		end
		name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, owner, saleStatus, itemId, hasAllInfo = GetAuctionItemInfo("list",tonumber(GetSelectedAuctionItem("list")))
		if name == "Обычное письмо" then
			aucBtn:Show()
			if highBidder == "Хефе" then
				aucBtn:Hide()
			end
		else
			if aucBtn ~= nil then
				aucBtn:Hide()
			end
		end
	end
	if Atr_Buy1_Button ~= nil and Atr_Buy1_Button:IsVisible() then
		if aucBtn == nil then
			aucBtn = CreateFrame("Button", nil, UIParent, "");
			aucBtn:SetFrameStrata("TOOLTIP")
			aucBtn:SetSize(222, 32)
			aucBtn:SetPoint("CENTER", BrowseBidButton,"CENTER",22, 0)
			aucBtn:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\auk.tga")
			aucBtn:Hide()
		end
		if Atr_Search_Box:IsVisible() and Atr_Search_Box:GetText() == "Обычное письмо" then
			aucBtn:Show()
			aucBtn:SetSize(422, 32)
		else
			if aucBtn ~= nil then
				aucBtn:Hide()
			end
		end
	end
end
function diffT(t,t1)
	for i = 1, 100 do
		if t[i] ~= t1[i] then
			return false
		end
	end
	return true
end
function antc(kol)
	shablon="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !?,.-0123456789'()"
	myB=string.find(shablon,tostring(kol):sub(1,1),1,true)
	if tonumber(#tostring(kol)) >= 2 then
		for i = 2, #tostring(kol) do
			myB = myB .. string.find(shablon,tostring(kol):sub(i,i),1,true)
		end
	end
	return myB
end
function ochered(spell,pos,debuf,buf,prok,srav,seiv,runyk,runyl,runyn)
	if spell ~= "Мор" then
		local classUnit = UnitClass("player")
		local kya = 0
		local x,dtime,ltime,xxccvv
		for i = 1, 24 do
			if debuf == 1 then
				x,__,__,__,__,dtime,ltime,xxccvv = UnitDebuff("target",i)
				if xxccvv == "player" then
					if x == "Озноб" then
						if ltime ~= nil and tonumber(ltime) - tonumber(GetTime()) <= 5 then
							testQ['o'] = 1
						else
							testQ['o'] = nil
						end
					end
					if x == "Кровавая чума" then
						if ltime ~= nil and tonumber(ltime) - tonumber(GetTime()) <= 5 then
							testQ['c'] = 1
						else
							testQ['c'] = nil
						end
					end
				end
			end
			if buf == 1 then
				x = UnitBuff("player",i)
			end
			if x ~= nil then
				if x == spell then
					kya = 1
				end
			end
		end
		local classUnit = UnitClass("player")
		if classUnit == "Рыцарь смерти" then
			if testQ['o'] == 1 and testQ['c'] == 1 then
				local m
				for k, v in pairs(testQ["skills"]) do
					if testQ["skills"][k] ~= nil then
						if testQ["skills"][k] == "Мор" then
							m = 1
						end
					end
				end
				if m ~= 1 then
					table.insert(testQ["skills"],pos, "Мор")
				end
			end
		end
		for k, v in pairs(testQ["skills"]) do
			if testQ["skills"][k] == spell then
				kya = 1
			end
		end
		local numr = 0
		if runyk ~= nil then
			numr = numr + 1
		end
		if runyl ~= nil then
			numr = numr + 1
		end
		if runyn ~= nil then
			numr = numr + 1
		end
		--if classUnit == "Рыцарь смерти" then
			--local rune = nil
			--for i = 1, 6 do
				--if GetRuneCooldown(i) == 0 and (GetRuneType(i) == tonumber(runy) or GetRuneType(i) == 4) then
					--if rune == nil then
						--rune = 1
					--else
						--rune = rune + 1
					--end
					--if rune == tonumber(numr) then
						--break
					--end
				--end
			--end
			--if rune == numr then
				--kya = 0
			--else
				--kya = 1
			--end
		--end
		local __,__,__,mana = GetSpellInfo(spell)
		if mana == nil then
			mana = 0
		end
		if classUnit == "Друид" then
			mana = 30
		end
		if srav == "m" then
			if UnitPower("player") < mana and IsUsableSpell(spell) and GetSpellCooldown(spell) == 0 then
				if kya ~= 1 then
					if pos == 0 then
						table.insert(testQ["skills"],pos, spell)
					end
					if pos == 1 then
						table.insert(testQ["skills"], spell)
					end
				end
			else
				for k, v in pairs(testQ["skills"]) do
					if testQ["skills"][k] ~= nil then
						if testQ["skills"][k] == spell then
							testQ["skills"][k] = nil
						end
					end
				end
			end
		end
		local __,__,__,mana = GetSpellInfo(spell)
		if mana == nil then
			mana = 0
		end
		if srav == "b" then
			if UnitPower("player") >= mana and IsUsableSpell(spell) and GetSpellCooldown(spell) == 0 then
				if kya ~= 1 then
					if pos == 0 then
						table.insert(testQ["skills"],1, spell)
					end
					if pos == 1 then
						table.insert(testQ["skills"], spell)
					end
				else
					--local classUnit = UnitClass("player")
					--if classUnit == "Рыцарь смерти" then
						--for k, v in pairs(testQ["skills"]) do
							--if testQ["skills"][k] ~= nil then
								--if testQ["skills"][k] == spell then
									--testQ["skills"][k] = nil
								--end
							--end
						--end
					--end
				end
			else
				for k, v in pairs(testQ["skills"]) do
					if testQ["skills"][k] ~= nil then
						if testQ["skills"][k] == spell then
							testQ["skills"][k] = nil
						end
					end
				end
			end
		end
		if prok ~= nil and IsUsableSpell(spell) and GetSpellCooldown(spell) == 0 and seiv == nil then
			if classUnit == "Паладин" then
				if spell == "Праведное неистовство" then
					if kya ~= 1 then
						PlaySoundFile(prok)
					end
				end
			else
				if spell ~= "Власть льда" then
					PlaySoundFile(prok)
				end
			end
			if classUnit == "Рыцарь смерти" then
				if spell == "Власть льда" then
					if kya ~= 1 then
						--PlaySoundFile(prok)
					end
				end
			else
				if spell ~= "Праведное неистовство" then
					PlaySoundFile(prok)
				end
			end
		end
		if spell == "Мясорубка" then
			if tonumber(GetComboPoints("player", target)) == 1 and kya ~= 1 then
				--PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
			end
		end
		if seiv == 1 then
			if UnitHealth("player") <= (tonumber(UnitHealthMax("player"))/2) and GetSpellCooldown(spell) == 0 then
				table.insert(testQ["skills"],pos, spell)
				if prok ~= nil then
					--PlaySoundFile(prok)
				end
			else
				for k, v in pairs(testQ["skills"]) do
					if testQ["skills"][k] ~= nil then
						if testQ["skills"][k] == spell then
							testQ["skills"][k] = nil
						end
					end
				end
			end
		end
	end
end
function partyFrameHide()
	for i = 1, 25 do
		local prtyF = _G["PartyMemberFrame"..i]
		if prtyF ~= nil and prtyF:IsVisible() then
			prtyF:Hide()
		end
	end
end
function bs(msg)
	local bs
	local classUnit = UnitClass("player")
	local sil = UnitStat("player", 1)
	local lov = UnitStat("player", 2)
	local vyn = UnitStat("player", 3)
	local int = UnitStat("player", 4)
	local duh = UnitStat("player", 5)
	local cast = GetSpellBonusHealing()
	local hit = GetCombatRating(6)
	local crit = GetCombatRating(9)
	local mast = GetCombatRating(24)
	local def = GetCombatRating(2)
	local ukl = GetCombatRating(3)
	local par = GetCombatRating(4)
	local block = GetCombatRating(5)
	local mana = GetManaRegen()
	local rpb = GetCombatRating(25)
	local x,y = UnitAttackPower("player")
	local sco = GetCombatRating(18)
	local attak = x+y
	local str
	local khit = 0
	if classUnit == "Жрец" or classUnit == "Жрица" then
		local __,__,__,__,tma = GetTalentInfo(3, 27)
		if tma >= 1 then
			bs = int+(duh*0.5)+(cast*2)+hit+(crit*2)+(mana*0.5)+sco
			khit = hit .. "/" .. "289/446"
		else
			bs = int+(duh*1.5)+(cast*2)+crit+(mana*1.5)+sco
			khit = hit .. "/" .. "0"
		end
	end
	if classUnit == "Паладин" then
		local __,__,__,__,xpal = GetTalentInfo(1, 26)
		local __,__,__,__,ppal = GetTalentInfo(2, 26)
		local __,__,__,__,rpal = GetTalentInfo(3, 26)
		if xpal >= 1 then
			bs = (int*2)+duh+(cast*1.5)+crit+mana+(sco*1.5)
			khit = hit .. "/" .. "0"
		end
		if ppal >= 1 then
			bs = sil+lov+(vyn*2)+hit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)
			khit = hit .. "/" .. "263" .. " маст./кап: " .. mast .. "/185"
		end
		if rpal >= 1 then
			bs = (sil*2)+lov+hit+crit+attak+sco+mast
			khit = hit .. "/" .. "263" .. " маст./кап: " .. mast .. "/148"
		end
	end
	if classUnit == "Воин" then
		local __,__,__,__,pwar = GetTalentInfo(3, 7)
		if pwar >= 1 then
			bs = sil+lov+(vyn*2)+hit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)
			khit = hit .. "/" .. "263" .. " маст./кап: " .. mast .. "/164"
		else
			bs = (sil*2)+lov+hit+(crit*1.5)+mast+(rpb*2)+attak+sco
			khit = hit .. "/" .. "263"  .. " маст./кап: " .. mast .. "/232" .. " рпб/кап: " .. rpb .. "/1400"
		end
	end
	if classUnit == "Друид" then
		local __,__,__,__,rdru = GetTalentInfo(3, 27)
		local __,__,__,__,pdru = GetTalentInfo(2, 5)
		local __,__,__,__,sova = GetTalentInfo(1, 13)
		local __,__,__,__,kot = GetTalentInfo(2, 9)
		if rdru >= 1 or msg == "хил" then
			bs = int+(duh*1.5)+(cast*2)+(sco*1.5)+crit+(mana*1.5)
			khit = hit .. "/" .. "0"
		end
		if pdru >= 1 or msg == "медведь" then
			bs = sil+(lov*2)+(vyn*2)+hit+crit+(sco*1.5)+mast+(def*1.5)+(ukl*2)+rpb
			khit = hit .. "/" .. "263"  .. " маст./кап: " .. mast .. "/132/282" .. " рпб/кап: " .. rpb .. "/??"
		end
		if sova >= 1 or msg == "сова" then
			bs = int+(duh*0.5)+(cast*2)+hit+(crit*2)+(mana*0.5)+sco
			khit = hit .. "/" .. "263"
		end
		if kot >= 1 or msg == "кот" then
			bs = sil+(lov*2)+hit+(crit*1.5)+mast+(rpb*2)+attak+sco
			khit = hit .. "/" .. "263"  .. " маст./кап: " .. mast .. "/132" .. " рпб/кап: " .. rpb .. "/1400"
		end
	end
	if classUnit == "Разбойник" or classUnit == "Разбойница" then
		bs = sil+(lov*2)+hit+crit+(rpb*2)+mast+attak+sco
		khit = hit .. "/" .. "263" .. "/" .. "722" .. " маст./кап: " .. mast .. "/132" .. " рпб/кап: " .. rpb .. "/1400"
	end
	if classUnit == "Чернокнижник" or classUnit == "Чернокнижница" then
		bs = int+(duh*1.5)+(cast*2)+hit+(crit*1.5)+(mana*0.5)+(sco*1.5)
		khit = hit .. "/" .. "289/446 " .. "Хаст: " .. sco .. " 1100/1400"
	end
	if classUnit == "Шаман" or classUnit == "Шаманка" then
		local __,__,__,__,elem = GetTalentInfo(1, 3)
		local __,__,__,__,enh = GetTalentInfo(2, 9)
		local __,__,__,__,rsham = GetTalentInfo(3, 1)
		if elem >= 3 and enh >= 1 then
			__,__,__,__,elem = GetTalentInfo(1, 7)
			__,__,__,__,enh = GetTalentInfo(2, 11)
		end
		if elem >= 1 then
			bs = int+(cast*2)+crit+hit+(sco*1.5)
			khit = hit .. "/" .. "368"
		end
		if enh >= 1 then
			bs = sil+(lov*2)+hit+(crit*1.5)+rpb+attak+(sco*1.5)+mast+(cast*0.5)
			khit = hit .. "/" .. "232" .. "/" .. "368"  .. " маст./кап: " .. mast .. "/140"
		end
		if rsham >= 1 then
			bs = int+duh+(cast*2)+crit+(mana*2)+(sco*2)
			khit = hit .. "/" .. "0" .. " c./кап: "	.. sco .. "/1269/2100"
		end
	end
	if classUnit == "Охотник" or classUnit == "Охотница" then
		bs = (lov*2)+hit+crit+(rpb*2)+attak+sco
		khit = hit .. "/" .. "263" .. " рпб/кап: " .. rpb .. "/1400"
	end
	if classUnit == "Рыцарь смерти" then
		local __,__,__,__,pwar = GetTalentInfo(1, 7)
		local __,__,__,__,pwar1 = GetTalentInfo(2, 3)
		local __,__,__,__,pwar2 = GetTalentInfo(3, 3)
		if pwar >= 1 or pwar1 >= 1 or pwar2 >= 1 then
			bs = sil+lov+(vyn*2)+hit+mast+(def*1.5)+(ukl*1.5)
			khit = hit .. "/" .. "263"  .. " маст./кап: " .. mast .. "/170/409"
		else
			bs = (sil*2)+lov+hit+crit+mast+rpb+attak
			khit = hit .. "/" .. "263"  .. " маст./кап: " .. mast .. "/170" .. " рпб/кап: " .. rpb .. "/1400"
		end
	end
	if classUnit == "Маг" then
		bs = int+duh+(cast*2)+hit+(crit*1.5)+(sco*1.5)
		khit = hit .. "/" .. "376 хаст/кап: " .. sco .. "/1130 Крит/кап: " .. crit .. "/1150?(45%)"
	end
	if bs ~= nil then
		return string.format("%d",bs) .. " хит/кап: " .. khit
	else
		SendChatMessage("Почему то пустое значение. Я: " .. classUnit, "OFFICER", nil, 1)
	end
end


GameTooltip:HookScript("OnShow", function(self)
	local classUnit = UnitClass("player")
	local bs = 0
	local bstemp
	local sil = 0
	local lov = 0
	local vyn = 0
	local int = 0
	local duh = 0
	local cast = 0
	local hit = 0
	local crit = 0
	local mast = 0
	local def = 0
	local ukl = 0
	local par = 0
	local block = 0
	local mana = 0
	local rpb = 0
	local attak = 0
	local sco = 0
	local cast1 = 0
	local hit1 = 0
	local crit1 = 0
	local mast1 = 0
	local def1 = 0
	local ukl1 = 0
	local par1 = 0
	local block1 = 0
	local mana1 = 0
	local rpb1 = 0
	local attak1 = 0
	local sco1 = 0
	local ii
	--print("|cff00ff00------")
	local myNome = GetUnitName("player")
	if testQ then
		if testQ[myNome] then
			if testQ[myNome]['edaQuest'] ~= nil and testQ[myNome]['edaQuest'] ~= 2 then
				local tooltipText = _G["GameTooltipTextLeft1"]:GetText()
				
				-- Инициализация данных для отслеживания предметов
				if testQ['edaNum'] == nil then
					testQ['edaNome'] = tooltipText
					testQ['edaNum'] = proverkaNaKolvoPredmetov(tooltipText)
					
					if testQ['edaNomeRez'] == nil then
						testQ['edaNomeRez'] = {}
					end
				else
					-- Если предмет изменился, сбросить отслеживание
					if testQ['edaNome'] ~= tooltipText then
						testQ['edaNome'] = nil
						testQ['edaNum'] = nil
					else
						-- Проверка результатов использования предмета
						if testQ['edaNomeRez'] ~= nil then
							local currentCount = proverkaNaKolvoPredmetov(tooltipText)
							
							-- Если количество предметов уменьшилось (предмет был использован)
							if testQ['edaNum'] > currentCount then
								-- Если этот предмет еще не проверялся
								if testQ['edaNomeRez'][tooltipText] == nil then
									local randomChance = math.random(1, 10)  -- 10% шанс вкусности
									
									if randomChance ~= 1 then
										-- 90% chance: предмет невкусный
										print("Фу, невкусно!")
										testQ['edaNomeRez'][tooltipText] = tooltipText
									else
										-- 10% chance: предмет потенциально подходит
										local perfectChance = math.random(1, 10)  -- Улучшено: было 1/20, стало 1/10
										
										if perfectChance == 10 then  -- 10% шанс идеального корма
											-- Найден идеальный корм
											testQ[myNome]['edaQuest'] = 2
											SendChatMessage("Найден идеальный корм для пета!", "OFFICER", nil, 1)
											SendChatMessage("Найден идеальный корм для пета!!", "OFFICER", nil, 1)
											SendChatMessage("Найден идеальный корм для пета!!!", "OFFICER", nil, 1)
										else
											-- Вкусно, но не идеально
											print("Вроде вкусно, но это не точно..")
											testQ['edaNomeRez'] = {}  -- Сброс списка проверенных предметов
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	for i=1, self:NumLines() do
		if _G["GameTooltipTextLeft"..i]:GetText() ~= nil then
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,1) == "+" or string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,1) == "|"  then
				bstemp = mysplit(_G["GameTooltipTextLeft"..i]:GetText())
				if bstemp[3] ~= nil and string.utf8sub(bstemp[3],1,3) == "вын" then
					if vyn == 0 then
						vyn = tonumber(string.utf8sub(bstemp[1],2))
					end
					if vyn == nil then
						vyn = tonumber(string.utf8sub(bstemp[1],11))
						ii = i
					end
					if vyn ~= 0 and ii ~= i then
						if tonumber(bstemp[1]:sub(2)) ~= nil then

						else
							vyn = vyn + tonumber(bstemp[1]:sub(11))
						end
					end

				end
				if bstemp[3] ~= nil and string.utf8sub(bstemp[3],1,3) == "лов" then
					if lov == 0 then
						lov = tonumber(string.utf8sub(bstemp[1],2))
					end
					if lov == nil then
						lov = tonumber(string.utf8sub(bstemp[1],11))
						ii = i
					end
					if lov ~= 0 and ii ~= i then
						if tonumber(bstemp[1]:sub(2)) ~= nil then

						else
							lov = lov + tonumber(bstemp[1]:sub(11))
						end
					end
				end
				if bstemp[3] ~= nil and string.utf8sub(bstemp[3],1,3) == "сил" then
					if bstemp[4] == nil then
						if sil == 0 then
							sil = tonumber(string.utf8sub(bstemp[1],2))
						end
						if sil == nil then
							sil = tonumber(string.utf8sub(bstemp[1],11))
							ii = i
						end
						if sil ~= 0 and ii ~= i then
							if tonumber(bstemp[1]:sub(2)) ~= nil then

							else
								sil = sil + tonumber(bstemp[1]:sub(11))
							end
						end
					end
				end
				if bstemp[3] ~= nil and string.utf8sub(bstemp[3],1,3) == "инт" then
					if int == 0 then
						int = tonumber(string.utf8sub(bstemp[1],2))
					end
					if int == nil then
						int = tonumber(string.utf8sub(bstemp[1],11))
						ii = i
					end
					if int ~= 0 and ii ~= i then
						if tonumber(bstemp[1]:sub(2)) ~= nil then

						else
							int = int + tonumber(bstemp[1]:sub(11))
						end
					end
				end
				if bstemp[3] ~= nil and string.utf8sub(bstemp[3],1,3) == "дух" then
					if duh == 0 then
						duh = tonumber(string.utf8sub(bstemp[1],2))
					end
					if duh == nil then
						duh = tonumber(string.utf8sub(bstemp[1],11))
						ii = i
					end
					if duh ~= 0 and ii ~= i then
						if tonumber(bstemp[1]:sub(2)) ~= nil then

						else
							duh = duh + tonumber(bstemp[1]:sub(11))
						end
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "ата" then
					attak = tonumber(bstemp[1]:sub(2))
					if attak == nil then
						attak = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "кри" then
					crit = tonumber(bstemp[1]:sub(2))
					if crit == nil then
						crit = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "мас" then
					mast = tonumber(bstemp[1]:sub(2))
					if mast == nil then
						mast = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "зак" then
					cast = tonumber(bstemp[1]:sub(2))
					if cast == nil then
						cast = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "мет" then
					hit = tonumber(bstemp[1]:sub(2))
					if hit == nil then
						hit = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "ско" then
					hit = tonumber(bstemp[1]:sub(2))
					if hit == nil then
						hit = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "защ" then
					def = tonumber(bstemp[1]:sub(2))
					if def == nil then
						def = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "укл" then
					ukl = tonumber(bstemp[1]:sub(2))
					if ukl == nil then
						ukl = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "пар" then
					par = tonumber(bstemp[1]:sub(2))
					if par == nil then
						par = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "бло" then
					block = tonumber(bstemp[1]:sub(2))
					if block == nil then
						block = tonumber(bstemp[1]:sub(11))
					end
				end
				if bstemp[4] ~= nil and string.utf8sub(bstemp[4],1,3) == "про" then
					rpb = tonumber(bstemp[1]:sub(2))
					if rpb == nil then
						rpb = tonumber(bstemp[1]:sub(11))
					end
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"атаки") then
					attak1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"критического") then
					crit1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"мастерства") then
					mast1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"заклинаний") then
					cast1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"меткости") then
					hit1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"скорости") then
					sco1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"защиты") then
					def1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"уклонения") then
					ukl1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"парирования") then
					par1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"блокирования") then
					block1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"Восполнение") then
					mana1 = mysplit(_G["GameTooltipTextLeft"..i]:GetText())
					mana1 = tonumber(mana1[5])
				end
			end
			if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
				if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"пробивания") then
					rpb1 = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
				end
			end
		end
		--print(_G["GameTooltipTextLeft"..i]:GetText())
	end
	if attak == nil then
		attak = 0
	end
	if sil == nil then
		sil = 0
	end
	if lov == nil then
		lov = 0
	end
	if vyn == nil then
		vyn = 0
	end
	if int == nil then
		int = 0
	end
	if duh == nil then
		duh = 0
	end
	if cast == nil then
		cast = 0
	end
	if hit == nil then
		hit = 0
	end
	if crit == nil then
		crit = 0
	end
	if mast == nil then
		mast = 0
	end
	if def == nil then
		def = 0
	end
	if ukl == nil then
		ukl = 0
	end
	if par == nil then
		par = 0
	end
	if block == nil then
		block = 0
	end
	if mana == nil then
		mana = 0
	end
	if rpb == nil then
		rpb = 0
	end
	if attak1 == nil then
		attak1 = 0
	end
	if cast1 == nil then
		cast1 = 0
	end
	if hit1 == nil then
		hit1 = 0
	end
	if crit1 == nil then
		crit1 = 0
	end
	if mast1 == nil then
		mast1 = 0
	end
	if def1 == nil then
		def1 = 0
	end
	if ukl1 == nil then
		ukl1 = 0
	end
	if par1 == nil then
		par1 = 0
	end
	if block1 == nil then
		block1 = 0
	end
	if mana1 == nil then
		mana1 = 0
	end
	if rpb1 == nil then
		rpb1 = 0
	end
	if sco1 == nil then
		sco1 = 0
	end
	if sco == nil then
		sco = 0
	end
	if classUnit == "Жрец" or classUnit == "Жрица" then
		local __,__,__,__,tma = GetTalentInfo(3, 27)
		if tma >= 1 then
			bs = int+(duh*0.5)+(cast*2)+(cast1*2)+hit+hit1+(crit*2)+(crit1*2)+(mana*0.5)+(mana1*0.5)+sco+sco1
		else
			bs = int+(duh*1.5)+(cast*2)+crit+(mana*1.5)+sco+(cast1*2)+crit1+(mana1*1.5)+sco1
		end
	end
	if classUnit == "Паладин" then
		local __,__,__,__,xpal = GetTalentInfo(1, 26)
		local __,__,__,__,ppal = GetTalentInfo(2, 26)
		local __,__,__,__,rpal = GetTalentInfo(3, 26)
		if xpal >= 1 then
			bs = (int*2)+duh+(cast*1.5)+crit+mana+(sco*1.5)+(cast1*1.5)+crit1+mana1+(sco1*1.5)
		end
		if ppal >= 1 then
			bs = sil+lov+(vyn*2)+hit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)+hit1+mast1+(def1*1.5)+(ukl1*1.5)+(par1*1.5)+(block1*1.5)
		end
		if rpal >= 1 then
			bs = (sil*2)+lov+hit+crit+attak+sco+mast+hit1+crit1+attak1+sco1+mast1
		end
	end
	if classUnit == "Воин" then
		local __,__,__,__,pwar = GetTalentInfo(3, 7)
		if pwar >= 1 then
			bs = sil+lov+(vyn*2)+hit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)+hit1+mast1+(def1*1.5)+(ukl1*1.5)+(par1*1.5)+(block1*1.5)
		else
			bs = (sil*2)+lov+hit+(crit*1.5)+mast+(rpb*2)+attak+sco+hit1+(crit1*1.5)+mast1+(rpb1*2)+attak1+sco1
		end
	end
	if classUnit == "Друид" then
		local __,__,__,__,rdru = GetTalentInfo(3, 27)
		local __,__,__,__,pdru = GetTalentInfo(2, 5)
		local __,__,__,__,sova = GetTalentInfo(1, 13)
		local __,__,__,__,kot = GetTalentInfo(2, 9)
		if rdru >= 1 then
			bs = int+(duh*1.5)+(cast*2)+(sco*1.5)+crit+(mana*1.5)+(cast1*2)+(sco1*1.5)+crit1+(mana1*1.5)
		end
		if pdru >= 1 then
			bs = sil+(lov*2)+(vyn*2)+hit+crit+(sco*1.5)+mast+(def*1.5)+(ukl*2)+rpb+hit1+crit1+(sco1*1.5)+mast1+(def1*1.5)+(ukl1*2)+rpb1
		end
		if sova >= 1 then
			bs = int+(duh*0.5)+(cast*2)+hit+(crit*2)+(mana*0.5)+sco+(cast1*2)+hit1+(crit1*2)+(mana1*0.5)+sco1
		end
		if kot >= 1 then
			bs = sil+(lov*2)+hit+(crit*1.5)+mast+(rpb*2)+attak+sco+hit1+(crit1*1.5)+mast1+(rpb1*2)+attak1+sco1
		end
	end
	if classUnit == "Разбойник" or classUnit == "Разбойница" then
		bs = sil+(lov*2)+hit+crit+(rpb*2)+mast+attak+sco+hit1+crit1+(rpb1*2)+mast1+attak1+sco1
	end
	if classUnit == "Чернокнижник" or classUnit == "Чернокнижница" then
		bs = int+(duh*1.5)+(cast*2)+hit+(crit*1.5)+(mana*0.5)+(sco*1.5)+(cast1*2)+hit1+(crit1*1.5)+(mana1*0.5)+(sco1*1.5)
	end
	if classUnit == "Шаман" then
		local __,__,__,__,elem = GetTalentInfo(1, 3)
		local __,__,__,__,enh = GetTalentInfo(2, 9)
		local __,__,__,__,rsham = GetTalentInfo(3, 1)
		if elem >= 3 and enh >= 1 then
			__,__,__,__,elem = GetTalentInfo(1, 7)
			__,__,__,__,enh = GetTalentInfo(2, 11)
		end
		if elem >= 1 then
			bs = int+(cast*2)+crit+hit+(sco*1.5)+(cast1*2)+crit1+hit1+(sco1*1.5)
		end
		if enh >= 1 then
			bs = sil+(lov*2)+hit+(crit*1.5)+rpb+attak+(sco*1.5)+mast+cast+hit1+(crit1*1.5)+rpb1+attak1+(sco1*1.5)+mast1+cast1
		end
		if rsham >= 1 then
			bs = int+duh+(cast*2)+crit+(mana*2)+(sco*2)+(cast1*2)+crit1+(mana1*2)+(sco1*2)
		end
	end
	if classUnit == "Охотник" or classUnit == "Охотница" then
		bs = (lov*2)+hit+crit+(rpb*2)+attak+sco+hit1+crit1+(rpb1*2)+attak1+sco1
	end
	if classUnit == "Рыцарь смерти" then
		local __,__,__,__,pwar = GetTalentInfo(1, 7)
		local __,__,__,__,pwar1 = GetTalentInfo(2, 3)
		local __,__,__,__,pwar2 = GetTalentInfo(3, 3)
		if pwar >= 1 or pwar1 >= 1 or pwar2 >= 1 then
			bs = sil+lov+(vyn*2)+hit+mast+(def*1.5)+(ukl*1.5)+hit1+mast1+(def1*1.5)+(ukl1*1.5)
		else
			bs = (sil*2)+lov+hit+crit+mast+rpb+attak+hit1+crit1+mast1+rpb1+attak1
		end
	end
	if classUnit == "Маг" then
		bs = int+duh+(cast*2)+hit+(crit*1.5)+(sco*1.5)+(cast1*2)+hit1+(crit1*1.5)+(sco1*1.5)
	end
	if tonumber(bs) ~= 0 then
		GameTooltip:AddLine("|cff00BFFFбс: |cffFF8C00" .. bs)
		GameTooltip:Show()
	else

	end
end)
-- function numeCod(str)
-- 	local m = nil
-- 	if string.utf8sub(str,1,1) == "-" then
-- 		str = string.utf8sub(str,2,string.utf8len(str))
-- 		m = 1
-- 	end
-- 	local rez
-- 	local r
-- 	local hexstr = "0123456789ABCDEFG#$%()*+-./:;<=>?@HIJKLMNOPQRSTUVWXYZ^_`abcdefghijklmnopqrstuvwxyz!{|}[]'"
-- 	local len = string.utf8len(str)
-- 	local lenH = string.utf8len(hexstr)
-- 	for j = 1, len do
-- 		for i = 1, lenH do
-- 			local r1 = string.utf8sub(hexstr,i,i)
-- 			if r1 == string.utf8sub(str,j,j) then
-- 				if j == 1 and j ~= len then
-- 					r = i * 92
-- 				elseif j ~= 1 and j ~= len then
-- 					r = (tonumber(r) + i) * 89
-- 				elseif j == 1 and j == len then
-- 					r = i
-- 				elseif j ~= 1 and j == len then
-- 					r = tonumber(r) + i
-- 				end
-- 				break
-- 			end
-- 		end
-- 	end
-- 	if m ~= nil then
-- 		r = r*-1
-- 	end
-- 	return r
-- end
function ns_obj(str)
	local r
	if str == "aa" then
		r = "ka"
	end
	if str == "aA" then
		r = "t"
	end
	if str == "ab" then
		r = "f"
	end
	if str == "aB" then
		r = "ob"
	end
	if str == "ac" then
		r = "mz"
	end
	if str == "aC" then
		r = "h"
	end
	return r
end
-- Функция для декодирования строки в число
local _convertTable = {
    [0] = "0", [1] = "1", [2] = "2", [3] = "3", [4] = "4",
    [5] = "5", [6] = "6", [7] = "7", [8] = "8", [9] = "9",
    [10] = "A", [11] = "B", [12] = "C", [13] = "D", [14] = "E",
    [15] = "F", [16] = "G", [17] = "#", [18] = "$", [19] = "%",
    [20] = "(", [21] = ")", [22] = "*", [23] = "+", [24] = "-",
    [25] = ".", [26] = "/", [27] = ":", [28] = ";", [29] = "<",
    [30] = "=", [31] = ">", [32] = "?", [33] = "@", [34] = "H",
    [35] = "I", [36] = "J", [37] = "K", [38] = "L", [39] = "M",
    [40] = "N", [41] = "O", [42] = "P", [43] = "Q", [44] = "R",
    [45] = "S", [46] = "T", [47] = "U", [48] = "V", [49] = "W",
    [50] = "X", [51] = "Y", [52] = "Z", [53] = "^", [54] = "_",
    [55] = "`", [56] = "a", [57] = "b", [58] = "c", [59] = "d",
    [60] = "e", [61] = "f", [62] = "g", [63] = "h", [64] = "i",
    [65] = "j", [66] = "k", [67] = "l", [68] = "m", [69] = "n",
    [70] = "o", [71] = "p", [72] = "q", [73] = "r", [74] = "s",
    [75] = "t", [76] = "u", [77] = "v", [78] = "w", [79] = "x",
    [80] = "y", [81] = "z", [82] = "!", [83] = "{", [84] = "|",
    [85] = "}", [86] = "[", [87] = "]", [88] = "'", [89] = ",",
}

-- Создание обратной таблицы
local _reverseConvertTable = {}
for k, v in pairs(_convertTable) do
    _reverseConvertTable[v] = k
end

function numeCod(encoded)
    --local isNegative = encoded:sub(1, 1) == "-"
    -- if isNegative then
    --     encoded = encoded:sub(2)  -- Убираем знак минуса
    -- end

    local number = 0
    for i = 1, #encoded do
        local char = encoded:sub(i, i)
        local value = _reverseConvertTable[char] or 0
        number = number * 90 + value
    end

    --return isNegative and -number or number
    return number
end

function rand_alfabet()
	testQ['ns_alfabetQ'] = {}
	testQ['ns_alfabetQ1'] = {}
	local KV = {
        [1] = "А",
        [2] = "Б",
        [3] = "В",
        [4] = "Г",
        [5] = "Д",
        [6] = "Ж",
        [7] = "З",
        [8] = "И",
        [9] = "К",
        [10] = "Л",
        [11] = "М",
        [12] = "Н",
        [13] = "О",
        [14] = "П",
        [15] = "Р",
        [16] = "С",
        [17] = "Т",
        [18] = "У",
        [19] = "Ф",
        [20] = "Х",
        [21] = "Ц",
        [22] = "Ч",
        [23] = "Ш",
        [24] = "Я",
        [25] = "Е",
        [26] = "Й",
        [27] = "Э",
        [28] = "Щ",
        [29] = "Ю",
        [30] = "Ы",
    }
    for i = 1, 5 do
		local x = math.random(1,30)
		table.insert(testQ['ns_alfabetQ'],KV[x])
		table.insert(testQ['ns_alfabetQ1'],KV[x])
	end
end
function np_change_0()
		ns_cfg = {

		--//Полосы здоровья и касты]]--
		HPheight = 14 ,--высота
		HPwidth = 99 ,--ширина


		CBheight = 5 , --Высота каст бара
		CBtieFont = 10 , --Размер шрифта каст бар
		border = 4 , --размер бортика

		--//рейдовая иконка]]--
		rheight = 15 ,-- размер (например 15 означает , что размер иконки будет высотой 15 и шириной 15 пикселей)
		Rpoint          = "RIGHT" , --чем цепляем
		RrelativePoint = "LEFT" , --куда цепляем
		Rx             = 0 , --координата Х (по ширине)
		Ry             = -4 , --координата У (по высоте)

		--//Уровень]]--
		LvLFontSize = 13 , --размер букв
		LvLpoint          = "RIGHT" , --чем цепляем
		LvLrelativePoint = "LEFT"  ,--куда цепляем
		LvLx             = -2 , --координата Х (по ширине)
		LvLy             = 0 , --координата У (по высоте)

		--//Имя]]--
		NameFontSize = 11 , --размер букв имени
		Npoint          = "BOTTOM" , --чем цепляем
		NrelativePoint = "TOP"  ,--куда цепляем
		Nx             = 0 , --координата Х (по ширине)
		Ny             = 4 , --координата У (по высоте))

		--//Цвета]]
		hostileunit    = {r=0.77, g=0.11, b=0.11},  --цвет враждебного инита
		friendlyunit   = {r=0.6, g=0.88, b=0.99},  --цвет дружественного юнита
		friendlyplayer = {r=0.11, g=0.88, b=0.11},  --цвет дружественного игрока
		neutralunit    = {r=0.99, g=0.99, b=0.0},  --цвет нейтрального юнита
	}
end
function np_change_nil()
	ns_cfg = {

		--//Полосы здоровья и касты]]--
		HPheight = 4 ,--высота
		HPwidth = 99 ,--ширина


		CBheight = 5 , --Высота каст бара
		CBtieFont = 10 , --Размер шрифта каст бар
		border = 2 , --размер бортика

		--//рейдовая иконка]]--
		rheight = 15 ,-- размер (например 15 означает , что размер иконки будет высотой 15 и шириной 15 пикселей)
		Rpoint          = "RIGHT" , --чем цепляем
		RrelativePoint = "LEFT" , --куда цепляем
		Rx             = 0 , --координата Х (по ширине)
		Ry             = -4 , --координата У (по высоте)

		--//Уровень]]--
		LvLFontSize = 13 , --размер букв
		LvLpoint          = "RIGHT" , --чем цепляем
		LvLrelativePoint = "LEFT"  ,--куда цепляем
		LvLx             = -2 , --координата Х (по ширине)
		LvLy             = 0 , --координата У (по высоте)

		--//Имя]]--
		NameFontSize = 11 , --размер букв имени
		Npoint          = "BOTTOM" , --чем цепляем
		NrelativePoint = "TOP"  ,--куда цепляем
		Nx             = 0 , --координата Х (по ширине)
		Ny             = 4 , --координата У (по высоте))

		--//Цвета]]
		hostileunit    = {r=0.77, g=0.11, b=0.11},  --цвет враждебного инита
		friendlyunit   = {r=0.6, g=0.88, b=0.99},  --цвет дружественного юнита
		friendlyplayer = {r=0.11, g=0.88, b=0.11},  --цвет дружественного игрока
		neutralunit    = {r=0.99, g=0.99, b=0.0},  --цвет нейтрального юнита
	}
end
function ns_xy(x,y,x1,y1)
	local mioCel = sqrt((x-x1)^2+(y-y1)^2)
	return mioCel
end
function numZome()
	if GetZoneText() == "Луносвет" then
		kont = "2"
		lok = "14"
	end
	if GetZoneText() == "Зангартопь" then
		kont = "3"
		lok = "2"
	end
	if GetZoneText() == "Танарис" then
		kont = "1"
		lok = "18"
	end
	if GetZoneText() == "Оргриммар" then
		kont = "1"
		lok = "10"
	end
	if GetZoneText() == "Штормград" then
		kont = "2"
		lok = "28"
	end
	if GetZoneText() == "Дуротар" then
		kont = "1"
		lok = "4"
	end
	if GetZoneText() == "Степи" then
		kont = "1"
		lok = "17"
	end
	return kont,lok
end
function ns_locaziya()
	local x = math.random(1,7)
	local rez
	if x == 1 then
		rez = "Луносвет"
	end
	if x == 2 then
		rez = "Дуротар"
	end
	if x == 3 then
		rez = "Оргриммар"
	end
	if x == 4 then
		rez = "Зангартопь"
	end
	if x == 5 then
		rez = "Степи"
	end
	if x == 6 then
		rez = "Танарис"
	end
	if x == 7 then
		rez = "Штормград"
	end
	return rez
end
function ns_q4xy()
	local myNome = GetUnitName("player")
	kont,lok = numZome()
	if kont ~= nil then
		if testQ[myNome]["взятый_квест_xy"] == nil then
			testQ[myNome]["взятый_квест_xy"] = {}
			local x = math.random(1,99)
			local y = math.random(1,99)
			testQ[myNome]["взятый_квест_xy"]['time'] = 600
			testQ[myNome]["взятый_квест_xy"]['x'] = tonumber("0."..x)
			testQ[myNome]["взятый_квест_xy"]['y'] = tonumber("0."..y)
			testQ[myNome]["взятый_квест_xy"]['lok'] = ns_locaziya()
			testQ[myNome]["взятый_квест_xy"]['timer'] = 5
		else
			if GetZoneText() == testQ[myNome]["взятый_квест_xy"]['lok'] then
				if testQ[myNome]["взятый_квест_xy"]['time'] >= 1 then
					local x,y = GetPlayerMapPosition("player")
					testQ[myNome]["взятый_квест_xy"]['timer'] = (ns_xy(x,y,testQ[myNome]["взятый_квест_xy"]['x'],testQ[myNome]["взятый_квест_xy"]['y'])/tonumber(mapTables["lokRasstoyanie"][kont][lok]))/10
					testQ[myNome]["взятый_квест_xy"]['time'] = testQ[myNome]["взятый_квест_xy"]['time'] - 1
					print("Осталось " .. testQ[myNome]["взятый_квест_xy"]['time'] .. " секунд")
					if (ns_xy(x,y,testQ[myNome]["взятый_квест_xy"]['x'],testQ[myNome]["взятый_квест_xy"]['y']) / tonumber(mapTables["lokRasstoyanie"][kont][lok]))/10 < 0.5 then
						testQ[myNome]["взятый_квест_xy_end"] = 1
						SendChatMessage("Она тут! Нюхом чую!", "OFFICER", nil, 1)
					end
				else
					testQ[myNome]["взятый_квест_xy"]['lok'] = ns_locaziya()
					SendChatMessage("Увы, мою принцессу уже увезли в " .. testQ[myNome]["взятый_квест_xy"]['lok'], "OFFICER", nil, 1)
					local x = math.random(1,99)
					local y = math.random(1,99)
					testQ[myNome]["взятый_квест_xy"]['x'] = tonumber("0."..x)
					testQ[myNome]["взятый_квест_xy"]['y'] = tonumber("0."..y)
					testQ[myNome]["взятый_квест_xy"]['time'] = 600
				end
			end
		end
	else
		if testQ[myNome]["взятый_квест_xy"] == nil then
			testQ[myNome]["взятый_квест_xy"] = {}
			local x = math.random(1,99)
			local y = math.random(1,99)
			testQ[myNome]["взятый_квест_xy"]['time'] = 300
			testQ[myNome]["взятый_квест_xy"]['x'] = tonumber("0."..x)
			testQ[myNome]["взятый_квест_xy"]['y'] = tonumber("0."..y)
			testQ[myNome]["взятый_квест_xy"]['lok'] = ns_locaziya()
			testQ[myNome]["взятый_квест_xy"]['timer'] = 5
		end
	end
end

function allcash(xC,yC,cod)
	local x,y = GetPlayerMapPosition("player")
	local mioCel=sqrt((x-xC)^2+(y-yC)^2)
	local ac = (0.82 - mioCel)/0.82
	if cod == 1 then
		MoveViewRightStart(0)
		if testQ['acbuhlo'] == nil then
			MoveViewLeftStart(ac)
		else
			MoveViewLeftStart(ac/2)
		end
	else
		MoveViewLeftStart(0)
		if testQ['acbuhlo'] == nil then
			MoveViewRightStart(ac)
		else
			MoveViewRightStart(ac/2)
		end
	end
	local rnd = math.random(1,2)
	if rnd == 1 then
		if testQ['acbuhlo'] == 1 then
			print(ac)
		end
	end
end

function osleplenie(sila)
	MoveViewLeftStart(0)
	MoveViewRightStart(0)
	local x = math.random(1,2)
	if x == 1 then
		MoveViewLeftStart(sila)
	else
		MoveViewRightStart(sila)
	end
end
function Shuffle(t)
	local s = {}
	for i = 1, #t do s[i] = t[i] end
	for i = #t, 2, -1 do
		local j = math.random(i)
		s[i], s[j] = s[j], s[i]
	end
	return s
end

function ns_iya(num)
	for i = 1, 100 do
		if iYaBtn[i] ~= nil then
			iYaBtn[i]:Hide()
			iYaBtn[i]:Enable()
			iYaBtn[i]:SetAlpha(1)
		end
		if iYaBtnP[i] ~= nil then
			iYaBtnP[i]:Hide()
		end
	end
	if tblIya[num]['sh'] == 1 then
		testQ['iya_temp']=time()
		for i = 1, 11 do
			if iYaBtn[i] ~= nil then
				iYaBtn[i]:SetAlpha(1)
			end
		end
		for i = 1, 100 do
			if iYaBtnP[i] ~= nil then
				iYaBtnP[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnPic[i] ~= nil then
				iYaBtnPic[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnText[i] ~= nil then
				iYaBtnText[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnVsp[i] ~= nil then
				iYaBtnVsp[i]:Hide()
			end
		end
		iYaBtn:configure(1,0,300,515,32,"",tblIya[num]['t1'],num,tblIya[num]['s1'],99)
		iYaBtn:configure(2,-131,125,256,256,tblIya[num]['p1'],tblIya[num]['t2'],num,tblIya[num]['s2'],99)
		iYaBtn:configure(3,127,125,256,256,tblIya[num]['p2'],tblIya[num]['t3'],num,tblIya[num]['s3'],99)
		iYaBtn:configure(4,-131,-165,256,256,tblIya[num]['p3'],tblIya[num]['t4'],num,tblIya[num]['s4'],tblIya[num]['tq'])
		iYaBtn:configure(5,127,-165,256,256,tblIya[num]['p4'],tblIya[num]['t5'],num,tblIya[num]['s5'],tblIya[num]['tq'])
		iYaBtn:configure(6,-128,268,256,32,"",tblIya[num]['t6'],num,tblIya[num]['s6'],99)
		iYaBtn:configure(7,128,268,256,32,"",tblIya[num]['t7'],num,tblIya[num]['s7'],99)
		iYaBtn:configure(8,-128,-22,256,32,"",tblIya[num]['t8'],num,tblIya[num]['s8'],99)
		iYaBtn:configure(9,128,-22,256,32,"",tblIya[num]['t9'],num,tblIya[num]['s9'],99)
		iYaBtn:configure(10,268,300,32,32,"","x",num,"",99)
		iYaBtn:configure(11,-322,300,128,64,"",num .. "/" ..50-testQ['iya_ser'],"","",99)
		--iYaBtn[11]:Disable()
		iYaBtn[1]:SetAlpha(0.5)
		iYaBtn[6]:SetAlpha(0.5)
		iYaBtn[7]:SetAlpha(0.5)
		iYaBtn[2]:SetAlpha(0.5)
		iYaBtn[3]:SetAlpha(0.5)
	end
	if tblIya[num]['sh'] == 2 then
		testQ['iya_temp']=time()
		for i = 1, 11 do
			if iYaBtn[i] ~= nil then
				iYaBtn[i]:SetAlpha(1)
			end
		end
		for i = 1, 100 do
			if iYaBtnP[i] ~= nil then
				iYaBtnP[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnPic[i] ~= nil then
				iYaBtnPic[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnText[i] ~= nil then
				iYaBtnText[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnVsp[i] ~= nil then
				iYaBtnVsp[i]:Hide()
			end
		end
		local number = {"2","3","4","5"}
		local numbers = Shuffle(number)
		iYaBtn:configure(1,0,300,515,32,tblIya[num]['p10'],tblIya[num]['t1'],num,tblIya[num]['s1'],99)
		iYaBtn:configure(2,-131,125,256,256,tblIya[num]['p'..numbers[1]],tblIya[num]['t'..numbers[1]],num,tblIya[num]['s'..numbers[1]],tblIya[num]['tq'])
		iYaBtn:configure(3,127,125,256,256,tblIya[num]['p'..numbers[2]],tblIya[num]['t'..numbers[2]],num,tblIya[num]['s'..numbers[2]],tblIya[num]['tq'])
		iYaBtn:configure(4,-131,-165,256,256,tblIya[num]['p'..numbers[3]],tblIya[num]['t'..numbers[3]],num,tblIya[num]['s'..numbers[3]],tblIya[num]['tq'])
		iYaBtn:configure(5,127,-165,256,256,tblIya[num]['p'..numbers[4]],tblIya[num]['t'..numbers[4]],num,tblIya[num]['s'..numbers[4]],tblIya[num]['tq'])
		iYaBtn:configure(6,-128,268,256,32,tblIya[num]['p6'],tblIya[num]['t6'],num,tblIya[num]['s6'],99)
		iYaBtn:configure(7,128,268,256,32,tblIya[num]['p7'],tblIya[num]['t7'],num,tblIya[num]['s7'],99)
		iYaBtn:configure(8,-128,-22,256,32,tblIya[num]['p8'],tblIya[num]['t8'],num,tblIya[num]['s8'],99)
		iYaBtn:configure(9,128,-22,256,32,tblIya[num]['p9'],tblIya[num]['t9'],num,tblIya[num]['s9'],99)
		iYaBtn:configure(10,268,300,32,32,"","x",num,"",99)
		iYaBtn:configure(11,-322,300,128,64,"",num .. "/" ..50-testQ['iya_ser'],"","",99)
		--iYaBtn[11]:Disable()
		iYaBtn[1]:SetAlpha(0.5)
	end
	if tblIya[num]['sh'] == 3 then
		testQ['iya_temp']=time()
		for i = 1, 11 do
			if iYaBtn[i] ~= nil then
				iYaBtn[i]:SetAlpha(1)
			end
		end
		for i = 1, 100 do
			if iYaBtnP[i] ~= nil then
				iYaBtnP[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnPic[i] ~= nil then
				iYaBtnPic[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnText[i] ~= nil then
				iYaBtnText[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnVsp[i] ~= nil then
				iYaBtnVsp[i]:Hide()
			end
		end
		local number = {"2","3","4"}
		local numbers = Shuffle(number)
		iYaBtn:configure(1,0,300,515,32,"",tblIya[num]['t1'],num,tblIya[num]['s1'],99)
		iYaBtn:configure(2,0,125,256,256,tblIya[num]['p'..numbers[1]],tblIya[num]['t'..numbers[1]],num,tblIya[num]['s'..numbers[1]],tblIya[num]['tq'])
		iYaBtn:configure(3,-256,125,256,256,tblIya[num]['p'..numbers[2]],tblIya[num]['t'..numbers[2]],num,tblIya[num]['s'..numbers[2]],tblIya[num]['tq'])
		iYaBtn:configure(4,256,125,256,256,tblIya[num]['p'..numbers[3]],tblIya[num]['t'..numbers[3]],num,tblIya[num]['s'..numbers[3]],tblIya[num]['tq'])
		iYaBtn:configure(10,268,300,32,32,"","x",num,"",99)
		iYaBtn:configure(11,-322,300,128,64,"",num .. "/" ..50-testQ['iya_ser'],"","",99)
		--iYaBtn[11]:Disable()
		iYaBtn[1]:SetAlpha(0.5)
	end
	if tblIya[num]['sh'] == 4 then
		local number = {"2","3","4","5"}
		local numbers = Shuffle(number)
		for i = 1, 11 do
			if iYaBtn[i] ~= nil then
				iYaBtn[i]:SetAlpha(1)
			end
		end
		for i = 1, 100 do
			if iYaBtnP[i] ~= nil then
				iYaBtnP[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnPic[i] ~= nil then
				iYaBtnPic[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnText[i] ~= nil then
				iYaBtnText[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnVsp[i] ~= nil then
				iYaBtnVsp[i]:Hide()
			end
		end
		iYaBtn:configure(2,-131,125,256,256,tblIya[num]['p'..numbers[1]],tblIya[num]['t'..numbers[1]],num,tblIya[num]['s'..numbers[1]],tblIya[num]['tq'])
		iYaBtn:configure(3,127,125,256,256,tblIya[num]['p'..numbers[2]],tblIya[num]['t'..numbers[2]],num,tblIya[num]['s'..numbers[2]],tblIya[num]['tq'])
		iYaBtn:configure(4,-131,-165,256,256,tblIya[num]['p'..numbers[3]],tblIya[num]['t'..numbers[3]],num,tblIya[num]['s'..numbers[3]],tblIya[num]['tq'])
		iYaBtn:configure(5,127,-165,256,256,tblIya[num]['p'..numbers[4]],tblIya[num]['t'..numbers[4]],num,tblIya[num]['s'..numbers[4]],tblIya[num]['tq'])
		iYaBtn:configure(6,-128,268,256,32,"",tblIya[num]['tt'..numbers[1]],num,tblIya[num]['s6'],99)
		iYaBtn:configure(7,128,268,256,32,"",tblIya[num]['tt'..numbers[2]],num,tblIya[num]['s7'],99)
		iYaBtn:configure(8,-128,-22,256,32,"",tblIya[num]['tt'..numbers[3]],num,tblIya[num]['s8'],99)
		iYaBtn:configure(9,128,-22,256,32,"",tblIya[num]['tt'..numbers[4]],num,tblIya[num]['s9'],99)
		iYaBtn:configure(10,268,300,32,32,"","x",num,"",99)
		iYaBtn:configure(11,-322,300,128,64,"",num .. "/" ..50-testQ['iya_ser'],"","",99)
		--iYaBtn[11]:Disable()
		local numberP = {"1","2","3","4"}
		local numbersP = Shuffle(numberP)
		iYaBtnP:configure(1,tblIya[num]['x1'],tblIya[num]['y1'],tblIya[num]['rx1'],tblIya[num]['ry1'],"",tblIya[num]['tp'..numbersP[1]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtnP:configure(2,tblIya[num]['x2'],tblIya[num]['y2'],tblIya[num]['rx2'],tblIya[num]['ry2'],"",tblIya[num]['tp'..numbersP[2]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtnP:configure(3,tblIya[num]['x3'],tblIya[num]['y3'],tblIya[num]['rx3'],tblIya[num]['ry3'],"",tblIya[num]['tp'..numbersP[3]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtnP:configure(4,tblIya[num]['x4'],tblIya[num]['y4'],tblIya[num]['rx4'],tblIya[num]['ry4'],"",tblIya[num]['tp'..numbersP[4]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtn[2]:Disable()
		iYaBtn[3]:Disable()
		iYaBtn[4]:Disable()
		iYaBtn[5]:Disable()
		iYaBtn[6]:Disable()
		iYaBtn[7]:Disable()
		iYaBtn[8]:Disable()
		iYaBtn[9]:Disable()
	end
	if tblIya[num]['sh'] == 5 then
		testQ['iya_temp']=time()
		local number = {"1","2","3","4","5","6"}
		local numbers = Shuffle(number)
		iYaBtn:configure(1,0,300,515,32,tblIya[num]['p11'],tblIya[num]['t11'],num,tblIya[num]['s1'],99)
		iYaBtnPic:configure(1,-259,125,256,256,tblIya[num]['p'..numbers[1]],tblIya[num]['t'..numbers[1]],num,tblIya[num]['ts'..numbers[1]],tblIya[num]['tq'])
		iYaBtnPic:configure(2,257,125,256,256,tblIya[num]['p'..numbers[2]],tblIya[num]['t'..numbers[2]],num,tblIya[num]['ts'..numbers[2]],tblIya[num]['tq'])
		iYaBtnPic:configure(3,-259,-165,256,256,tblIya[num]['p'..numbers[3]],tblIya[num]['t'..numbers[3]],num,tblIya[num]['ts'..numbers[3]],tblIya[num]['tq'])
		iYaBtnPic:configure(4,257,-165,256,256,tblIya[num]['p'..numbers[4]],tblIya[num]['t'..numbers[4]],num,tblIya[num]['ts'..numbers[4]],tblIya[num]['tq'])
		iYaBtnPic:configure(5,0,125,256,256,tblIya[num]['p'..numbers[5]],tblIya[num]['t'..numbers[5]],num,tblIya[num]['ts'..numbers[5]],tblIya[num]['tq'])
		iYaBtnPic:configure(6,0,-165,256,256,tblIya[num]['p'..numbers[6]],tblIya[num]['t'..numbers[6]],num,tblIya[num]['ts'..numbers[6]],tblIya[num]['tq'])

		iYaBtnText:configure(1,-259,268,256,32,"",tblIya[num]['tt1'],num,tblIya[num]['tts1'],99)
		iYaBtnText:configure(2,255,268,256,32,"",tblIya[num]['tt2'],num,tblIya[num]['tts2'],99)
		iYaBtnText:configure(3,-259,-22,256,32,"",tblIya[num]['tt3'],num,tblIya[num]['tts3'],99)
		iYaBtnText:configure(4,255,-22,256,32,"",tblIya[num]['tt4'],num,tblIya[num]['tts4'],99)
		iYaBtnText:configure(5,0,268,256,32,"",tblIya[num]['tt5'],num,tblIya[num]['tts5'],99)
		iYaBtnText:configure(6,0,-22,256,32,"",tblIya[num]['tt6'],num,tblIya[num]['tts6'],99)
		iYaBtn:configure(10,268,300,32,32,"","x",num,"",99)
		iYaBtn:configure(11,-322,316,128,64,"",num .. "/" ..50-testQ['iya_ser'],"","",99)
		--iYaBtn[11]:Disable()
		iYaBtn[1]:SetAlpha(0.5)
	end
	if tblIya[num]['sh'] == 6 then
		local number = {"2","3","4","5"}
		local numbers = Shuffle(number)
		for i = 1, 11 do
			if iYaBtn[i] ~= nil then
				iYaBtn[i]:SetAlpha(1)
			end
		end
		for i = 1, 100 do
			if iYaBtnP[i] ~= nil then
				iYaBtnP[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnPic[i] ~= nil then
				iYaBtnPic[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnText[i] ~= nil then
				iYaBtnText[i]:Hide()
			end
		end
		for i = 1, 100 do
			if iYaBtnVsp[i] ~= nil then
				iYaBtnVsp[i]:Hide()
			end
		end
		iYaBtn:configure(2,-131,125,256,256,tblIya[num]['p'..numbers[1]],tblIya[num]['t'..numbers[1]],num,tblIya[num]['s'..numbers[1]],tblIya[num]['tq'])
		iYaBtn:configure(3,127,125,256,256,tblIya[num]['p'..numbers[2]],tblIya[num]['t'..numbers[2]],num,tblIya[num]['s'..numbers[2]],tblIya[num]['tq'])
		iYaBtn:configure(4,-131,-165,256,256,tblIya[num]['p'..numbers[3]],tblIya[num]['t'..numbers[3]],num,tblIya[num]['s'..numbers[3]],tblIya[num]['tq'])
		iYaBtn:configure(5,127,-165,256,256,tblIya[num]['p'..numbers[4]],tblIya[num]['t'..numbers[4]],num,tblIya[num]['s'..numbers[4]],tblIya[num]['tq'])
		iYaBtn:configure(6,-128,268,256,32,"",tblIya[num]['tt'..numbers[1]],num,tblIya[num]['s6'],99)
		iYaBtn:configure(7,128,268,256,32,"",tblIya[num]['tt'..numbers[2]],num,tblIya[num]['s7'],99)
		iYaBtn:configure(8,-128,-22,256,32,"",tblIya[num]['tt'..numbers[3]],num,tblIya[num]['s8'],99)
		iYaBtn:configure(9,128,-22,256,32,"",tblIya[num]['tt'..numbers[4]],num,tblIya[num]['s9'],99)
		iYaBtn:configure(10,268,300,32,32,"","x",num,"",99)
		iYaBtn:configure(11,-322,300,128,64,"",num .. "/" ..50-testQ['iya_ser'],"","",99)
		--iYaBtn[11]:Disable()
		local numberP = {"1","2","3","4"}
		local numbersP = Shuffle(numberP)
		iYaBtnP:configure(1,-11,148,80,32,"",tblIya[num]['tp'..numbersP[1]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtnP:configure(2,-11,116,80,32,"",tblIya[num]['tp'..numbersP[2]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtnP:configure(3,-11,84,80,32,"",tblIya[num]['tp'..numbersP[3]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtnP:configure(4,-11,52,80,32,"",tblIya[num]['tp'..numbersP[4]],num,tblIya[num]['s10'],tblIya[num]['tq'])
		iYaBtn[2]:Disable()
		iYaBtn[3]:Disable()
		iYaBtn[4]:Disable()
		iYaBtn[5]:Disable()
		iYaBtn[6]:Disable()
		iYaBtn[7]:Disable()
		iYaBtn[8]:Disable()
		iYaBtn[9]:Disable()
	end
end

function sCh()
	SendChatMessage('Что вы видите тут: "Ññ"?', "GUILD", nil, 1)
end

function pokazTextur(id,textur,profil,sign)
    if sign == "show" then
        prok_set1 = {
            ["Rx"] = 128,
            ["Ry"] = 256,
            ["x"] = -200,
            ["y"] = 0,
        }
        prok_set2 = {
            ["Rx"] = 128,
            ["Ry"] = 256,
            ["x"] = 200,
            ["y"] = 0,
        }
        prok_set3 = {
            ["Rx"] = 256,
            ["Ry"] = 128,
            ["x"] = 0,
            ["y"] = 200,
        }
        prok_set4 = {
            ["Rx"] = 0,
            ["Ry"] = 0,
            ["x"] = 0,
            ["y"] = 0,
        }
        local x = GetScreenWidth()
        local y = GetScreenHeight()
        if profil == 4 then
        unIcon(tonumber(id),x,y,0+prok_set4["x"],0+prok_set4["y"],textur,"show",UIParent,"CENTER","CENTER")
        end
        if profil == 1 then
        unIcon(tonumber(id),prok_set1["Rx"],prok_set1["Ry"],0+prok_set1["x"],0+prok_set1["y"],textur,"show",UIParent,"CENTER","CENTER")
        end
        if profil == 2 then
        unIcon(tonumber(id),prok_set2["Rx"],prok_set2["Ry"],0+prok_set2["x"],0+prok_set2["y"],textur,"show",UIParent,"CENTER","CENTER")
        end
        if profil == 3 then
        unIcon(tonumber(id),prok_set3["Rx"],prok_set3["Ry"],0+prok_set3["x"],0+prok_set3["y"],textur,"show",UIParent,"CENTER","CENTER")
        end
    else
        unIcon(tonumber(tonumber(id),x,y,0,00,0,"hide",UIParent,"CENTER","CENTER"))
    end
end

function cepochkiQuestov(tabella,shablon,kont,lok,x,y,myNome)
	if tabella == "fenix" then
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "еда" then
			if testQ[myNome]['edaQuest'] == nil then
				testQ[myNome]['edaQuest'] = 1
			end
			local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
				if mapTables["lokRasstoyanie"][kont] ~= nil then
					if mapTables["lokRasstoyanie"][kont][lok] ~= nil then
						if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
							showFenix("show")
							rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
						else
							if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
								puteshestvieGrafikaHide()
								PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
							end
						end
					end
				end
		end
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "эмоция" then
				if testQ[myNome]['квест_на_эмоции_взят'] == nil then
					obnulenieEmocij(myNome)
					testQ[myNome]['квест_на_эмоции_взят'] = 1
				end
				if testQ[myNome]['квест_на_эмоции_взят'] ~= nil then

					if proverkaEmocij(myNome) == nil then
						puteshestvieGrafikaHide()
						SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
						sohranenieProgressa("обычка")
						testQ[myNome]['puteshestvie'] = t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда']
					else
						local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
						if mapTables["lokRasstoyanie"][kont] ~= nil then
							if mapTables["lokRasstoyanie"][kont][lok] ~= nil then
								if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
									showFenix("show")
									rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
								else
									if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
										puteshestvieGrafikaHide()
										PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
									end
								end
							end
						end
					end
				end
		end
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "клик" then
			if ns_FLAGnaClick ~= nil then
				if testQ['fx'] == nil then
					testQ['fx'], testQ['fy'] = GetPlayerMapPosition("player")
				end
				local mioCel = sqrt((x - testQ['fx'])^2+(y-testQ['fy'])^2)
				if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
					showFenix("show")
					rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
				else
					if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
						puteshestvieGrafikaHide()
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
						SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
						sohranenieProgressa("обычка")
						testQ[myNome]['puteshestvie'] = t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда']
						testQ['fy'] = nil
						testQ['fx'] = nil
						ns_FLAGnaClick = nil
					end
				end
			end
		end
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "добыча предметов" then
			if tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['kont']) == tonumber(kont) and tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['lok']) == tonumber(lok) then
				local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
				if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
					showFenix("show")
					local numS
					rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
					for i = 1, t_cQ[tabella][testQ[myNome]['puteshestvie']]['предметКоличество'] do
							if proverkaNaPredmety(t_cQ[tabella][testQ[myNome]['puteshestvie']]['предмет'..i]) then
								if proverkaNaKolvoPredmetov(t_cQ[tabella][testQ[myNome]['puteshestvie']]['предмет'..i]) >= t_cQ[tabella][testQ[myNome]['puteshestvie']]['всегоПредметов'..i] then
									numS = 1
								else
									numS = nil
									break
								end
							else
								numS = nil
								break
							end
					end
					if numS ~= nil then
						puteshestvieGrafikaHide()
						SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
						sohranenieProgressa("обычка")
						testQ[myNome]['puteshestvie'] = t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда']
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					end
				else
					if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
						puteshestvieGrafikaHide()
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					end
				end
			end
		end
	end
	if tabella ~= "fenix" then
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "поди туда" then
			if tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['kont']) == tonumber(kont) and tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['lok']) == tonumber(lok) then
				local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
				if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
					quesT("show")
					rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
				else
					if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
						puteshestvieGrafikaHide()
						SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
						sohranenieProgressa("обычка")
						testQ[myNome]['puteshestvie'] = t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда']
					end
				end
			else
				if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
					puteshestvieGrafikaHide()
					SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
					PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					sohranenieProgressa("обычка")
					testQ[myNome]['puteshestvie'] = t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда']
				end
			end
		end
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "взлом сейфа" then
			if tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['kont']) == tonumber(kont) and tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['lok']) == tonumber(lok) then
				local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
				if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
					quesT("show")
					rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
				else
					if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
						SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
						puteshestvieGrafikaHide()
						sohranenieProgressa("обычка")
						testQ[myNome]['puteshestvie'] = t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда']
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					end
				end
			end
		end
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "добыча предметов" then
			if tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['kont']) == tonumber(kont) and tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['lok']) == tonumber(lok) then
				local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
				if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
					quesT("show")
					rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
					if proverkaNaPredmety(t_cQ[tabella][testQ[myNome]['puteshestvie']]['предмет1']) and proverkaNaPredmety(t_cQ[tabella][testQ[myNome]['puteshestvie']]['предмет2']) and proverkaNaPredmety(t_cQ[tabella][testQ[myNome]['puteshestvie']]['предмет3']) then
						puteshestvieGrafikaHide()
						SendChatMessage("Этап " ..  testQ[myNome]['puteshestvie'] .. " завершен. Переход на этап " .. t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда'], "OFFICER", nil, 1)
						sohranenieProgressa("обычка")
						testQ[myNome]['puteshestvie'] = t_cQ[tabella][testQ[myNome]['puteshestvie']]['куда']
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					end
				else
					if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
						puteshestvieGrafikaHide()
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					end
				end
			end
		end
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "вопрос" then
			if tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['kont']) == tonumber(kont) and tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['lok']) == tonumber(lok) then
				local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
				if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
					quesT("show")
					rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
				else
					if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
						puteshestvieGrafikaHide()
						PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
					end
				end
			else
				if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
					puteshestvieGrafikaHide()
					PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
				end
			end
		end
		if t_cQ[tabella][testQ[myNome]['puteshestvie']]['sh'] == "победа" then
			if tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['kont']) == tonumber(kont) and tonumber(t_cQ[tabella][testQ[myNome]['puteshestvie']]['lok']) == tonumber(lok) then
				local mioCel = sqrt((x - t_cQ[tabella][testQ[myNome]['puteshestvie']]['x'])^2+(y-t_cQ[tabella][testQ[myNome]['puteshestvie']]['y'])^2)
				if mioCel < mapTables["lokRasstoyanie"][kont][lok]*t_cQ[tabella][testQ[myNome]['puteshestvie']]['dalnost'] then
					quesT("show")
					rtnTextF(t_cQ[tabella][testQ[myNome]['puteshestvie']]['text'],1,"show")
				else
					if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
					puteshestvieGrafikaHide()
					SendChatMessage("Победа!!! Вождь, я несу тебе все содержимое сейфов!!!", "OFFICER", nil, 1)
					PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
					puteshestvieHide()
					end
				end
			else
				if rtnText[1] ~= nil and rtnText[1]:IsVisible() then
					puteshestvieGrafikaHide()
					SendChatMessage("Победа!!! Вождь, я несу тебе все содержимое сейфов!!!", "OFFICER", nil, 1)
					PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg")
					puteshestvieHide()
				end
			end
		end
	end
end

function puteshestvieHide()
	local myNome = GetUnitName("player")
	testQ[myNome]['puteshestvie'] = nil
	testQ[myNome][testQ[myNome]['puteshestvieTabella']] = nil
	quesT("hide")
	rtnTextF("",1,"hide")
	if btn[980] ~= nil then
		btn[980]:Hide()
		btn[979]:Hide()
		btn[978]:Hide()
	end
	puteshestvieGrafikaHide()
end

function puteshestvieGrafikaHide()
	if fenix[1] ~= nil then
		showFenix("hide")
	end
	if iconQ[1] ~= nil then
		quesT("hide")
	end
	rtnTextF("",1,"hide")
end

function ns_addXY()
	local x,y = GetPlayerMapPosition("player")
	local kont = tostring(GetCurrentMapContinent())
	local lok = tostring(GetCurrentMapZone())
	print('\[\'x\'\] = ' .. x .. ",")
	print('\[\'y\'\] = ' .. y .. ",")
	print('\[\'kont\'\] = ' .. kont .. ",")
	print('\[\'lok\'\] = ' .. lok .. ",")
	--SendChatMessage('\[\'x\'\] = ' .. x .. ",", "OFFICER", nil, 1)
	--SendChatMessage('\[\'y\'\] = ' .. y .. ",", "OFFICER", nil, 1)
	--SendChatMessage('\[\'kont\'\] = ' .. kont .. ",", "OFFICER", nil, 1)
	--SendChatMessage('\[\'lok\'\] = ' .. lok .. ",", "OFFICER", nil, 1)
end

function proverkaNaPredmety(search)
  for bag = 0,4 do
    for slot = 1,GetContainerNumSlots(bag) do
      local item = GetContainerItemLink(bag,slot)
      if item and item:find(search) then
        return true
      end
    end
  end
end
function proverkaNaKolvoPredmetov(search)
  local x = 0
  for bag = 0,4 do
    for slot = 1,GetContainerNumSlots(bag) do
    	local item = GetContainerItemLink(bag,slot)
    	if item and item:find(search) then
	      local __,num = GetContainerItemInfo(bag,slot)
	      x = x + num
	    end
    end
  end
  return x
end

function sohranenieProgressa(sign)
	local myNome = GetUnitName("player")
	if sign == "обычка" then
		if testQ[myNome][testQ[myNome]] == nil then
			testQ[myNome][testQ[myNome]['puteshestvieTabella']] = 0
		end
		if tonumber(testQ[myNome][testQ[myNome]['puteshestvieTabella']]) < tonumber(t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда']) then
			testQ[myNome][testQ[myNome]['puteshestvieTabella']] = t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда']
		end
	end
	if sign == "взлом" then
		if testQ[myNome][testQ[myNome]] == nil then
			testQ[myNome][testQ[myNome]['puteshestvieTabella']] = 0
		end
		if tonumber(testQ[myNome][testQ[myNome]['puteshestvieTabella']]) < tonumber(t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда при взломе']) then
			testQ[myNome][testQ[myNome]['puteshestvieTabella']] = t_cQ[testQ[myNome]['puteshestvieTabella']][testQ[myNome]['puteshestvie']]['куда при взломе']
		end
	end
end

function sohranenieTablicRamerovLokaciy()
	SendAddonMessage("rasstoyanie 1 17", "0.000499", "guild")
	SendAddonMessage("rasstoyanie 1 10", "0.003676", "guild")
	SendAddonMessage("rasstoyanie 1 4", "0.00067", "guild")
	SendAddonMessage("rasstoyanie 2 28", "0.0021", "guild")
	SendAddonMessage("rasstoyanie 99 1", "0.003", "guild")
	SendAddonMessage("rasstoyanie 1 18", "0.00087", "guild")
	SendAddonMessage("rasstoyanie 3 2", "0.007", "guild")
	SendAddonMessage("rasstoyanie 2 14", "0.002", "guild")
	SendAddonMessage("rasstoyanie 1 15", "0.000499", "guild")
	SendAddonMessage("rasstoyanie 2 25", "0.000499", "guild")
end

function proverkaEmocij(myNome)
	local x
	if testQ[myNome]['HumanMan'] == nil then
		x = 1
	end
	if testQ[myNome]['HumanWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['DworfMan'] == nil then
		x = 1
	end
	if testQ[myNome]['DworfWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['NEMan'] == nil then
		x = 1
	end
	if testQ[myNome]['NEWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['GnomMan'] == nil then
		x = 1
	end
	if testQ[myNome]['GnomWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['DrenayMan'] == nil then
		x = 1
	end
	if testQ[myNome]['DrenayWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['OrkMan'] == nil then
		x = 1
	end
	if testQ[myNome]['OrkWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['UndeadMan'] == nil then
		x = 1
	end
	if testQ[myNome]['UndeaWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['TaurenMan'] == nil then
		x = 1
	end
	if testQ[myNome]['TaurenWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['TrollMan'] == nil then
		x = 1
	end
	if testQ[myNome]['TrollWoman'] == nil then
		x = 1
	end
	if testQ[myNome]['ElfMan'] == nil then
		x = 1
	end
	if testQ[myNome]['ElfWoman'] == nil then
		x = 1
	end
	return x
end

function testShip(myNome)
	local x
	if testQ[myNome]['HumanMan'] == nil then
		x = "Человек"
	end
	if testQ[myNome]['HumanWoman'] == nil then
		x = "Человека"
	end
	if testQ[myNome]['DworfMan'] == nil then
		x = "Дворф"
	end
	if testQ[myNome]['DworfWoman'] == nil then
		x = "Дворфка"
	end
	if testQ[myNome]['NEMan'] == nil then
		x = "Ночноэльф"
	end
	if testQ[myNome]['NEWoman'] == nil then
		x = "Ночноэльфка"
	end
	if testQ[myNome]['GnomMan'] == nil then
		x = "Гном"
	end
	if testQ[myNome]['GnomWoman'] == nil then
		x = "Гнома"
	end
	if testQ[myNome]['DrenayMan'] == nil then
		x = "Дреней"
	end
	if testQ[myNome]['DrenayWoman'] == nil then
		x = "Дренейка"
	end
	if testQ[myNome]['OrkMan'] == nil then
		x = "Орк"
	end
	if testQ[myNome]['OrkWoman'] == nil then
		x = "Орчка"
	end
	if testQ[myNome]['UndeadMan'] == nil then
		x = "Андед"
	end
	if testQ[myNome]['UndeaWoman'] == nil then
		x = "Еще 30 минут женщина"
	end
	if testQ[myNome]['TaurenMan'] == nil then
		x = "Таурен"
	end
	if testQ[myNome]['TaurenWoman'] == nil then
		x = "Телочка"
	end
	if testQ[myNome]['TrollMan'] == nil then
		x = "Тролль"
	end
	if testQ[myNome]['TrollWoman'] == nil then
		x = "Троллька"
	end
	if testQ[myNome]['ElfMan'] == nil then
		x = "Эльф"
	end
	if testQ[myNome]['ElfWoman'] == nil then
		x = "Эльфа"
	end
	return x
end

function obnulenieEmocij(myNome)
	testQ[myNome]['HumanMan'] = nil
	testQ[myNome]['HumanWoman'] = nil
	testQ[myNome]['DworfMan'] = nil
	testQ[myNome]['DworfWoman'] = nil
	testQ[myNome]['NEMan'] = nil
	testQ[myNome]['NEWoman'] = nil
	testQ[myNome]['GnomMan'] = nil
	testQ[myNome]['GnomWoman'] = nil
	testQ[myNome]['DrenayMan'] = nil
	testQ[myNome]['DrenayWoman'] = nil
	testQ[myNome]['OrkMan'] = nil
	testQ[myNome]['OrkWoman'] = nil
	testQ[myNome]['UndeadMan'] = nil
	testQ[myNome]['UndeaWoman'] = nil
	testQ[myNome]['TaurenMan'] = nil
	testQ[myNome]['TaurenWoman'] = nil
	testQ[myNome]['TrollMan'] = nil
	testQ[myNome]['TrollWoman'] = nil
	testQ[myNome]['ElfMan'] = nil
	testQ[myNome]['ElfWoman'] = nil
end
function obnulenieEmocij1(myNome)
	testQ[myNome]['HumanMan'] = 1
	testQ[myNome]['HumanWoman'] = 1
	testQ[myNome]['DworfMan'] = 1
	testQ[myNome]['DworfWoman'] = 1
	testQ[myNome]['NEMan'] = 1
	testQ[myNome]['NEWoman'] = 1
	testQ[myNome]['GnomMan'] = 1
	testQ[myNome]['GnomWoman'] = 1
	testQ[myNome]['DrenayMan'] = 1
	testQ[myNome]['DrenayWoman'] = 1
	testQ[myNome]['OrkMan'] = 1
	testQ[myNome]['OrkWoman'] = 1
	testQ[myNome]['UndeadMan'] = 1
	testQ[myNome]['UndeaWoman'] = 1
	testQ[myNome]['TaurenMan'] = 1
	testQ[myNome]['TaurenWoman'] = 1
	testQ[myNome]['TrollMan'] = 1
	testQ[myNome]['TrollWoman'] = 1
	testQ[myNome]['ElfMan'] = 1
	testQ[myNome]['ElfWoman'] = 1
end

function nsGP()
	local t_sp = {}
	local num = GetNumRaidMembers()
	for i = 1, num do
		local test
		for Zc=1,GetNumGuildMembers(true) do
	    local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
	    	if name == UnitName("raid"..i) then
	    		t_sp[i]={}
	    		local znach = mysplit(officerNote)
	    		t_sp[i]['nome'] = name
	    		t_sp[i]['public'] = publicNote
	    		t_sp[i]['rank'] = rankName
	    		if znach[3] ~= nil then
	    			t_sp[i]['znach'] = tonumber(znach[3])
	    		else
	    			t_sp[i]['znach'] = tonumber("0000")
	    		end
	    		test = 1	    		
	    	end
	    end
	    if test == nil then
	    	t_sp[i] = {}
	    	if UnitName("raid"..i) ~= nil then
		    	t_sp[i]['nome'] = UnitName("raid"..i)
		    	t_sp[i]['znach'] = tonumber("0000")
		    	t_sp[i]['public'] = "НЕ В ГИЛЬДИИ"
		    else
		    	t_sp[i]['nome'] = "пусто"
		    	t_sp[i]['znach'] = tonumber("0000")
		    end
	    end
	end
	table.sort(t_sp, function(a,b) return a.znach < b.znach end)
	local rez = {}
	local j = tostring(1)
	for i, widget in ipairs(t_sp) do
		rez[j] = {}
		rez[j]['nome'] = widget['nome'] 
		rez[j]['znach'] = widget['znach']
		rez[j]['public'] = widget['public']
		rez[j]['rank'] = widget['rank']
		j = tostring(tonumber(j)+1)
	end
	return rez
end

function gpEnTg()
	FriendsFrame:Show()
	GuildFrame:Show()
	testQ['gpEnTg'] = {}
	for Zc=1,GetNumGuildMembers(true) do
	    local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
	    local gp = mysplit(officerNote)
	    if gp[3] ~= nil then
		    --if tonumber(gp[3]) > 0 then
		    	testQ['gpEnTg'][name] = tonumber(gp[3])
		    --end
		  end
	end
	FriendsFrame:Hide()
	GuildFrame:Hide()
end

function addMioFld(nome,tabella,id,rez)
	if mioFld1 ~= nil then
		if mioFld1[nome] ~= nil then
			if mioFld1[nome][tabella] ~= nil then
				mioFld1[nome][tabella][tostring(id)] = tostring(rez)
			end
		end
	end
end

function readMioFld(nome,tabella,id)
	if mioFld1 ~= nil then
		if mioFld1[nome] ~= nil then
			if mioFld1[nome][tabella] ~= nil then
				return mioFld1[nome][tabella][tostring(id)]
			end
		end
	end
end

nBtn = {}

function nBtn:new(id,f,object,posex,posey,textx,texty,textpos,textsize,sizex,sizey,message,point1,point2,textpoint1,textpoint2,strata,textColor,nome,htexture,texture)

    local obj= {}
    local rtnText
    local frameTime
    local timeElapsed
    local saveNome = nome
    obj.message = message

    function obj:configure()
    	if texture == nil then
	    	self[id] = self[id] or CreateFrame("Button", nil, object, "UIPanelButtonTemplate");
	    else
	    	self[id] = self[id] or CreateFrame("Button", nil, object, "");
	    	self[id]:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\" .. texture .. ".tga")
	    	if htexture ~= 0 then
	    		self[id]:SetHighlightTexture("Interface\\AddOns\\NSQC\\libs\\" .. texture .. ".tga")
	    	end
	    	rtnText = {}
	    	obj:SetText(message)
	    end
	    self[id]:SetPoint(point1, object,point2,posex, posey)
	    self[id]:SetSize(sizex, sizey)
			self[id]:SetText(message)
			self[id]:SetFrameStrata(strata)
			if f ~= nil then
				f(obj)
			end
		end

    function obj:reMove(x,y)
    	self[id]:SetPoint(point1, object,point2,x, y) 
    end

    function obj:reSize(sizex,sizey)
    	self[id]:SetSize(sizex, sizey)
    end

    function obj:getID()
    	print(id)
    end

    function obj:Hide()
    	self[id]:Hide()
    end

    function obj:Show()
    	self[id]:Show()
    end

    function obj:textSize(size)
    	rtnText[id]:SetFont('Fonts\\FRIZQT__.TTF', size,"OUTLINE", "MONOCHROME");
    end

    function obj:textMove(x,y)
    	rtnText[id]:SetPoint("BOTTOMLEFT", obj[id], "BOTTOMLEFT", x, y)
    end

    function obj:SetText(message)
	    if texture ~= nil then
					rtnText[id] = rtnText[id] or obj[id]:CreateFontString(nil, "OVERLAY")
          rtnText[id]:SetSize(sizex, sizey)
          --rtnText[id]:SetFrameStrata(strata)
          rtnText[id]:SetPoint("TOPLEFT")
          rtnText[id]:SetFont('Fonts\\FRIZQT__.TTF', textsize, "OUTLINE", "MONOCHROME")
          rtnText[id]:SetText("|cff" .. textColor .. message .. "|r")
          rtnText[id]:Show()
			else
				obj[id]:SetText(message)
			end
		end
		function obj:getSaveNome()
			return saveNome
		end
		function obj:setOnUpdate(f,text)
			f(self[id],text)
    end
		function obj:setOnEnter(f)
			f(self[id],message)
    end
    function obj:setOnClick(f)
			f(self[id],message)
    end
    function obj:setClick(fl,fr,objekt)
    	self[id]:RegisterForClicks("RightButtonDown","LeftButtonDown")
    	self[id]:SetScript("OnClick",function(self, button,object)
    		if fl ~= nil then
	    		if arg1 == "LeftButton" then
						fl(self, button,saveNome,objekt)
					end
				end
				if fr ~= nil then
					if arg1 == "RightButton" then
						fr(self, button,saveNome,objekt)
					end
				end
			end)
    end
    function obj:gesture(TopLeft,TopRight)
    	frameTime = CreateFrame("FRAME")
			timeElapsed = 0
			frameTime:SetScript("OnUpdate", function(self, elapsed)
				timeElapsed = timeElapsed + elapsed
				if timeElapsed > 0.1 then
					local x,y = WorldFrame:GetSize()
					local x1,y1 = GetCursorPosition()
					if x1 <= 20 and y1 >= y - 20 then
						TopLeft(obj[id])
					end
					if x1 >= x - 20 and y1 >= y - 20 then
						TopRight(obj[id])
					end
				end
			end)
    end
    function obj:killall()
	    frameTime:SetScript("OnUpdate", nil)
	    obj[id]:SetScript("OnClick", nil)
    end

    setmetatable(obj, self)
    self.__index = self; return obj
end
function gpBtn1_enter(arg1,arg2)
	arg1:SetScript("OnEnter",function(self, button,arg1)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:AddLine("|cFF6495EDЛКМ: начислить " .. " |cffFF8C00" .. arg2 .. " |cff99ff99ГП")
		GameTooltip:AddLine("|cFF6495EDПКМ: снять " .. " |cffFF8C00" .. arg2 .. " |cff99ff99ГП")
		GameTooltip:Show()
		gpBtn1:Show()
		gpBtn2:Show()
		gpBtn3:Show()
		gpBtn4:Show()
		gpBtn5:Show()
		gpBtn6:Show()
		btn[973]:SetPoint("LEFT", MinimapZoomOut,"RIGHT",0, -20)
		ShowCheckboxWindow()
 	end)
 	arg1:SetScript("OnLeave",function(self, button,arg1)
 		
		GameTooltip:Hide()
 	end)
end
function gpBtn1_click(obj,text)
	obj:RegisterForClicks("RightButtonDown","LeftButtonDown")
	obj:SetScript("OnClick",function(self, button)
		if testQ['gpRez'] == nil or #testQ['gpRez'] == 0 then
			if arg1 == "LeftButton" then
				SendChatMessage("ГП " .. text, "GUILD", nil, 1)
			else
				SendChatMessage("ГП -" .. text, "GUILD", nil, 1)
			end
			gpBtn1:Hide()
			gpBtn2:Hide()
			gpBtn3:Hide()
			gpBtn4:Hide()
			gpBtn5:Hide()
			gpBtn6:Hide()
			btn[973]:SetPoint("LEFT", MinimapZoomOut,"RIGHT",25, -20)
			HideCheckboxWindow()
			gplabels = {}
			testQ['gpRez'] = nil
		else
			if arg1 == "LeftButton" then
				sendGPnik(text)
				HideCheckboxWindow()
				gplabels = {}
				testQ['gpRez'] = nil
				gpBtn1:Hide()
				gpBtn2:Hide()
				gpBtn3:Hide()
				gpBtn4:Hide()
				gpBtn5:Hide()
				gpBtn6:Hide()
				btn[973]:SetPoint("LEFT", MinimapZoomOut,"RIGHT",25, -20)
			else
				sendGPnik(-text)
				HideCheckboxWindow()
				gplabels = {}
				testQ['gpRez'] = nil
				gpBtn1:Hide()
				gpBtn2:Hide()
				gpBtn3:Hide()
				gpBtn4:Hide()
				gpBtn5:Hide()
				gpBtn6:Hide()
				btn[973]:SetPoint("LEFT", MinimapZoomOut,"RIGHT",25, -20)
			end
		end
 	end)
 end
function change_spek(arg1,arg2,arg3,arg4)
	SendChatMessage("!заметка " .. arg4.message, "GUILD", nil, 1)
	spek1:Hide()
	spek2:Hide()
	spek3:Hide()
end
function duelOnUpdate(arg1,arg2)
	arg1:SetScript("OnEnter",function(self, button)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:AddLine("|cFF6495EDПринять дуэль от игрока: |cff99ff99" .. arg2)
		GameTooltip:Show()
	end)
	arg1:SetScript("OnLeave",function(self, button)
		GameTooltip:Hide()
	end)
end
function btnHide(frame)
	frame:Hide()
end
function btnShow(frame)
	frame:Show()
end
function gpBtnClick(frame)
	if IsRaidLeader() then 
		if testQ["raidAUKPobeda"] ~= nil then
			SendChatMessage(testQ["raidAUKPobeda"] .. " побеждает, поставив " .. testQ["raidAUKPobeda_gp"] .. " ГП", "RAID", nil, 1)
		end
		SendAddonMessage("nsAUKend " , "10", "RAID")
	end
end
function ns_duelTrue(arg1,arg2,arg3)
	SendAddonMessage("ns_duel_otvet",arg3, "guild")
	duelBtn[arg3..'1']:Hide()
	duelBtn[arg3..'2']:Hide()
end
function ns_duelFalse(arg1,arg2,arg3)
	SendChatMessage("Так я ж трус и подлец. Отказываюсь.", "GUILD", nil, 1)
	duelBtn[arg3..'1']:Hide()
	duelBtn[arg3..'2']:Hide()
	SendAddonMessage("ns_duel_otkaz",arg3, "guild")
end
function nsAUK(sender, msg, predmet)
    if testQ["raidAUK"] ~= nil then
        msg = tonumber(msg)
        if msg ~= nil then
            local num = tablelength(testQ["raidAUK"])
            local rezultat
            local public
            local numRez = tablelength(testQ['rez'])
            local textBtn = ""
            local netu = nil

            -- Поиск результата и публичного статуса отправителя
            for i = 1, numRez do
                if testQ['rez'][tostring(i)]['nome'] == sender then
                    public = testQ['rez'][tostring(i)]['public']
                    rezultat = tonumber(testQ['rez'][tostring(i)]['znach'])
                    break -- Мы нашли нужные данные, можно выйти из цикла
                end
            end

            -- Обработка ставок
            if num >= 1 then
                for i = 1, num do
                    if testQ["raidAUK"][i]["nome"] == sender then
                        if tonumber(msg) <= rezultat then
                            testQ["raidAUK"][i]["auk"] = msg
                        end
                        netu = 1
                        break -- Мы обновили ставку, можно выйти из цикла
                    end
                end

                -- Если не нашли отправителя в аукционе, добавляем нового
                if netu == nil then
                    testQ["raidAUK"][num + 1] = {
                        nome = sender,
                        auk = 0,
                        public = public,
                        rezultat = rezultat
                    }
                    if testQ["raidAUK"][num + 1]["auk"] + tonumber(msg) <= rezultat then
                        testQ["raidAUK"][num + 1]["auk"] = testQ["raidAUK"][num + 1]["auk"] + tonumber(msg)
                    end
                end
            else
                -- Если нет ставок, добавляем первую
                testQ["raidAUK"][1] = {
                    nome = sender,
                    auk = 0,
                    public = public,
                    rezultat = rezultat
                }
                if testQ["raidAUK"][1]["auk"] + tonumber(msg) <= rezultat then
                    testQ["raidAUK"][1]["auk"] = testQ["raidAUK"][1]["auk"] + tonumber(msg)
                end
            end

            -- Сортировка ставок
            table.sort(testQ["raidAUK"], function(a, b) return a.auk < b.auk end)

            -- Формирование результата и обновление интерфейса
            local rez = {}
            local rezultatText = ""
            for i, widget in ipairs(testQ["raidAUK"]) do
                rez[i] = {
                    nome = widget['nome'],
                    znach = widget['auk'],
                    public = widget['public'],
                    rezultat = widget['rezultat']
                }
                rezultatText = rezultatText .. "|cFF6495ED" .. widget['nome'] .. " |cffFF8C00(" .. widget['public'] .. "|cff808080||" .. "|cffff0000" .. widget['rezultat'] .. "|cffFF8C00): |cff99ff99" .. widget['auk'] .. '\n'
                if i == #testQ["raidAUK"] and IsRaidLeader() then
                    SendChatMessage(widget['nome'] .. ": " .. widget['auk'] .. ", кто больше?", "RAID", nil, 1)
                    testQ["raidAUKPobeda"] = widget['nome']
                    testQ["raidAUKPobeda_gp"] = widget['auk']
                end
            end

            print(predmet)
            TextWindow(predmet .. "\n\n" .. rezultatText)
        end
    end
end

function lastWords(msg)
	local first = mysplit(msg)
	first = first[1]
	local num = string.utf8len(first)
	local num1 = string.utf8len(msg)
	local last = string.utf8sub(msg,num+1,num1)
	return last
end
function sendGPnik(num)
	local str = ''
	for i = 1, #testQ['gpRez'] do
		str = str .. testQ['gpRez'][i] .. " "
	end
	SendAddonMessage("nsGP" .. " " .. num, str, "guild")
end
function sendGP(num)
	local myNome = GetUnitName("player")
	msg = {}
	msg[2] = num
	for Zc=1,GetNumGuildMembers(true) do
    local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote, isOnline, status, class, achievementPoints, achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(Zc)
    if name == myNome then
    	if rankName == "Лейтенант" or rankName == "Капитан" then
    		if GetNumRaidMembers() <= 10 then
				local rez = ""
				rez = UnitName("raid1") .. " "
			 	for i = 2, GetNumRaidMembers() do
					rez = rez .. UnitName("raid"..i) .. " "
			 	end
			 	SendAddonMessage("nsGP" .. " " .. msg[2],rez, "guild")
			elseif GetNumRaidMembers() > 10 and GetNumRaidMembers() <= 20 then
				local rez = ""
				rez = UnitName("raid1") .. " "
			 	for i = 2, 10 do
					rez = rez .. UnitName("raid"..i) .. " "
			 	end
			 	SendAddonMessage("nsGP" .. " " .. msg[2],rez, "guild")
			 	local rez = ""
				rez = UnitName("raid11") .. " "
			 	for i = 12, GetNumRaidMembers() do
					rez = rez .. UnitName("raid"..i) .. " "
			 	end
			 	SendAddonMessage("nsGP" .. " " .. msg[2],rez, "guild")
			elseif GetNumRaidMembers() > 20 then
				local rez = ""
				rez = UnitName("raid1") .. " "
			 	for i = 2, 10 do
					rez = rez .. UnitName("raid"..i) .. " "
			 	end
			 	SendAddonMessage("nsGP" .. " " .. msg[2],rez, "guild")
			 	local rez = ""
				rez = UnitName("raid11") .. " "
			 	for i = 12, 20 do
					rez = rez .. UnitName("raid"..i) .. " "
			 	end
			 	SendAddonMessage("nsGP" .. " " .. msg[2],rez, "guild")
			 	local rez = ""
				rez = UnitName("raid21") .. " "
			 	for i = 22, GetNumRaidMembers() do
					rez = rez .. UnitName("raid"..i) .. " "
			 	end
			 	SendAddonMessage("nsGP" .. " " .. msg[2],rez, "guild")
			end
		end
	end
 end
end

function createParent()
    parentFrame = CreateFrame("Frame", nil, UIParent)
    parentFrame:SetSize(200, 200)  -- Начальный размер фрейма (будет изменен)
    parentFrame:SetPoint("CENTER")  -- Позиция фрейма
    parentFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    parentFrame:SetBackdropColor(0, 0, 0, 1)  -- Цвет фона

    -- Делаем фрейм перемещаемым левой кнопкой мыши
    parentFrame:SetMovable(true)
    parentFrame:EnableMouse(true)
    parentFrame:RegisterForDrag("LeftButton")

    -- Обработчики для перемещения фрейма
    parentFrame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    parentFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        ClampFrameToScreen(self)  -- Ограничиваем фрейм границами экрана
        SaveFramePosition(self)   -- Сохраняем координаты фрейма
    end)

    -- Восстанавливаем позицию фрейма, если координаты сохранены
    if testQ['pgChbX'] and testQ['pgChbY'] then
        parentFrame:ClearAllPoints()
        parentFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", testQ['pgChbX'], testQ['pgChbY'])
    end

    HideCheckboxWindow()
end
-- Функция для ограничения фрейма в пределах экрана
function ClampFrameToScreen(frame)
    local screenWidth = UIParent:GetWidth()
    local screenHeight = UIParent:GetHeight()
    local frameWidth = frame:GetWidth()
    local frameHeight = frame:GetHeight()

    local x, y = frame:GetCenter()  -- Получаем центр фрейма
    x = x or 0
    y = y or 0

    -- Ограничиваем позицию фрейма
    x = math.max(frameWidth / 2, math.min(screenWidth - frameWidth / 2, x))
    y = math.max(frameHeight / 2, math.min(screenHeight - frameHeight / 2, y))

    -- Устанавливаем новую позицию фрейма
    frame:ClearAllPoints()
    frame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y)
end

function SaveFramePosition(frame)
    local x, y = frame:GetCenter()
    testQ['pgChbX'] = x  -- Сохраняем координату X
    testQ['pgChbY'] = y  -- Сохраняем координату Y
end

-- Функция для создания чекбоксов
function CreateCheckboxes(parentFrame, gplabels)
    local checkboxes = {}  -- Таблица для хранения чекбоксов
    local offsetY = -10  -- Начальное смещение по Y
    local maxWidth = 0  -- Максимальная ширина текста чекбокса

    -- Перебираем все метки и создаем чекбоксы
    for i, label in ipairs(gplabels) do
        -- Создаем чекбокс
        local checkbox = CreateFrame("CheckButton", nil, parentFrame, "UICheckButtonTemplate")
        checkbox:SetSize(24, 24)  -- Размер чекбокса
        checkbox:SetPoint("TOPLEFT", 10, offsetY)  -- Позиция чекбокса

        -- Добавляем текст рядом с чекбоксом
        local checkboxText = checkbox:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        checkboxText:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
        checkboxText:SetText(label)

        -- Сохраняем текст в чекбоксе для дальнейшего использования
        checkbox.label = label

        -- Обработчик события OnClick
        checkbox:SetScript("OnClick", function(self)
            if testQ['gpRez'] == nil then
            	testQ['gpRez'] = {}
            end
            local nik = mysplit(self.label)
            if self:GetChecked() then
            		table.insert(testQ['gpRez'], nik[1])
            else
                for i = 1, #testQ['gpRez'] do
                	if testQ['gpRez'][i] == nik[1] then
                		table.remove(testQ['gpRez'], i)
                	end
                end
            end
        end)

        -- Сохраняем чекбокс в таблицу
        checkboxes[i] = checkbox

        -- Обновляем максимальную ширину текста
        local textWidth = checkboxText:GetStringWidth()
        if textWidth > maxWidth then
            maxWidth = textWidth
        end

        -- Увеличиваем смещение для следующего чекбокса
        offsetY = offsetY - 30
    end

    -- Динамически изменяем размер фрейма
    local frameWidth = maxWidth + 50  -- Ширина фрейма (ширина текста + отступы)
    local frameHeight = #gplabels * 30 + 20  -- Высота фрейма (количество чекбоксов * высота каждого + отступы)
    parentFrame:SetSize(frameWidth, frameHeight)

    return checkboxes
end

-- Функция для скрытия окна с чекбоксами
function HideCheckboxWindow()
    if parentFrame then
        parentFrame:Hide()  -- Скрываем фрейм
    end
end

function ShowCheckboxWindow()
    if parentFrame then
        parentFrame:Show()  -- Скрываем фрейм
    end
end

-- Функция для уничтожения окна с чекбоксами
function DestroyCheckboxWindow()
    if parentFrame then
        parentFrame:Hide()          -- Скрываем фрейм
        parentFrame:ClearAllPoints() -- Убираем все точки привязки
        parentFrame:SetParent(nil)  -- Убираем родительский фрейм
        parentFrame = nil           -- Удаляем ссылку
    end
end



-- Пример использования
gplabels = {
}


-- Глобальная переменная для хранения фрейма
textWindow = nil

-- Функция для ограничения фрейма в пределах экрана
local function ClampFrameToScreen(frame)
    local screenWidth = UIParent:GetWidth()
    local screenHeight = UIParent:GetHeight()
    local frameWidth = frame:GetWidth()
    local frameHeight = frame:GetHeight()

    local x, y = frame:GetCenter()  -- Получаем центр фрейма
    x = x or 0
    y = y or 0

    -- Ограничиваем позицию фрейма
    x = math.max(frameWidth / 2, math.min(screenWidth - frameWidth / 2, x))
    y = math.max(frameHeight / 2, math.min(screenHeight - frameHeight / 2, y))

    -- Устанавливаем новую позицию фрейма
    frame:ClearAllPoints()
    frame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y)
end


-- Функция для создания или обновления окна с текстом
function TextWindow(text)
    -- Если фрейм уже существует, обновляем текст
    if textWindow then
        textWindow.textLabel:SetText(text)  -- Обновляем текст
        -- Пересчитываем размер фрейма
        local textWidth = textWindow.textLabel:GetStringWidth()
        local textHeight = textWindow.textLabel:GetStringHeight()
        local padding = 20  -- Отступы вокруг текста
        textWindow:SetSize(textWidth + padding, textHeight + padding)
        ClampFrameToScreen(textWindow)  -- Ограничиваем фрейм в пределах экрана
        textWindow:Show()  -- Показываем фрейм (если он был скрыт)
        return
    end

    -- Создаем новый фрейм для текста
    textWindow = CreateFrame("Frame", nil, UIParent)
    textWindow:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    textWindow:SetBackdropColor(0, 0, 0, 1)  -- Цвет фона

    -- Делаем фрейм перемещаемым левой кнопкой мыши
    textWindow:SetMovable(true)
    textWindow:EnableMouse(true)
    textWindow:RegisterForDrag("LeftButton")
    textWindow:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    textWindow:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        ClampFrameToScreen(self)  -- Ограничиваем фрейм в пределах экрана
        -- Сохраняем координаты
        testQ['textWinX'], testQ['textWinY'] = self:GetCenter()
    end)

    -- Добавляем текст в фрейм
    textWindow.textLabel = textWindow:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    textWindow.textLabel:SetPoint("CENTER", textWindow, "CENTER", 0, 0)
    textWindow.textLabel:SetText(text)  -- Устанавливаем текст

    -- Измеряем ширину текста
    local textWidth = textWindow.textLabel:GetStringWidth()
    local textHeight = textWindow.textLabel:GetStringHeight()

    -- Устанавливаем размер фрейма на основе текста
    local padding = 20  -- Отступы вокруг текста
    textWindow:SetSize(textWidth + padding, textHeight + padding)

    -- Устанавливаем позицию фрейма
    if testQ['textWinX'] and testQ['textWinY'] then
        -- Если координаты сохранены, восстанавливаем позицию
        textWindow:SetPoint("CENTER", UIParent, "BOTTOMLEFT", testQ['textWinX'], testQ['textWinY'])
    else
        -- Иначе устанавливаем позицию по умолчанию
        textWindow:SetPoint("RIGHT", btn[973], "LEFT", 0, 0)
    end
end

-- Функция для скрытия окна
function HideTextWindow()
    if textWindow then
        textWindow:Hide()  -- Скрываем фрейм
    end
end

-- Функция для показа окна
function ShowTextWindow()
    if textWindow then
        textWindow:Show()  -- Показываем фрейм
    end
end

-- Функция для уничтожения окна
function DestroyTextWindow()
    if textWindow then
        textWindow:Hide()          -- Скрываем фрейм
        textWindow:ClearAllPoints() -- Убираем все точки привязки
        textWindow:SetParent(nil)  -- Убираем родительский фрейм
        textWindow = nil           -- Удаляем ссылку
    end
end







-- Функция для извлечения имени файла из пути (сделана глобальной)
function GetFileName(path)
    return path:match("[^\\/]+$") or path
end

function CreateListUI()
    if TestListFrame then
        TestListFrame:Show()
        TestListFrame.UpdateList()
        return
    end

    local frame = CreateFrame("Frame", "TestListFrame", UIParent)
    frame:SetSize(400, 500)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })

    local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", -5, -5)
    closeButton:SetScript("OnClick", function() frame:Hide() end)

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", 0, -20)
    title:SetText("Управление списком")

    local editBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    editBox:SetSize(200, 30)
    editBox:SetPoint("TOP", 0, -60)
    editBox:SetAutoFocus(false)

    local addButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    addButton:SetSize(100, 30)
    addButton:SetPoint("TOPLEFT", editBox, "BOTTOMLEFT", 0, -20)
    addButton:SetText("Добавить")
    
    local delButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    delButton:SetSize(100, 30)
    delButton:SetPoint("TOPRIGHT", editBox, "BOTTOMRIGHT", 0, -20)
    delButton:SetText("Удалить")

    local scrollFrame = CreateFrame("ScrollFrame", "TestScrollFrame", frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetSize(360, 300)
    scrollFrame:SetPoint("TOP", addButton, "BOTTOM", 0, -30)
    
    local scrollBar = _G["TestScrollFrameScrollBar"]
    scrollBar:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 32, -16)
    
    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(335, 0)
    scrollFrame:SetScrollChild(content)
    
    testQ = testQ or {}
    testQ.fls = testQ.fls or {}
    
    local toRemove = {}
    for key, value in pairs(testQ.fls) do
        if type(key) ~= "string" or type(value) ~= "string" then
            table.insert(toRemove, key)
        end
    end
    
    for _, key in ipairs(toRemove) do
        testQ.fls[key] = nil
    end
    
    content.entries = {}

    function frame:UpdateList()
        local totalHeight = 0
        
        for _, entry in ipairs(content.entries) do
            entry:Hide()
        end
        
        content.entries = content.entries or {}
        
        local names = {}
        for name in pairs(testQ.fls) do
            table.insert(names, name)
        end
        table.sort(names, function(a, b) return a < b end)
        
        for i, name in ipairs(names) do
            local sound = testQ.fls[name]
            local entry = content.entries[i]
            
            if not entry then
                entry = CreateFrame("Frame", nil, content)
                entry:SetSize(335, 20)
                
                entry.text = entry:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                entry.text:SetPoint("LEFT", 5, 0)
                entry.text:SetWidth(200)
                
                entry.dropdown = CreateFrame("Frame", "TestDropDown"..i, entry, "UIDropDownMenuTemplate")
                entry.dropdown:SetPoint("RIGHT", entry, "RIGHT", -10, 0)
                entry.dropdown:SetWidth(120)
                
                local button = _G["TestDropDown"..i.."Button"]
                button:SetScript("OnClick", function(self)
                    ToggleDropDownMenu(1, nil, entry.dropdown, self, 0, 0)
                end)
                
                local dropDownText = _G["TestDropDown"..i.."Text"]
                if dropDownText then
                    dropDownText:SetWidth(150)
                end
                
                UIDropDownMenu_Initialize(entry.dropdown, function(self, level)
                    if not level then return end
                    
                    if level == 1 then
                        for _, category in ipairs(ns_alert_sounds) do
                            local info = UIDropDownMenu_CreateInfo()
                            info.text = category.label
                            info.value = category
                            info.hasArrow = true
                            info.notCheckable = true
                            UIDropDownMenu_AddButton(info, level)
                        end
                    elseif level == 2 then
                        local category = UIDROPDOWNMENU_MENU_VALUE
                        if category and category.sounds then
                            for _, soundPath in ipairs(category.sounds) do
                                local info = UIDropDownMenu_CreateInfo()
                                info.text = GetFileName(soundPath)
                                info.value = soundPath
                                info.func = function()
                                    -- Исправленный блок: используем entry.name
                                    testQ.fls[entry.name] = soundPath
                                    UIDropDownMenu_SetText(entry.dropdown, GetFileName(soundPath))
                                    PlaySoundFile(soundPath, "Master")
                                    CloseDropDownMenus()
                                end
                                info.checked = (testQ.fls[entry.name] == soundPath)
                                UIDropDownMenu_AddButton(info, level)
                            end
                        end
                    end
                end)
                
                content.entries[i] = entry
            end
            
            entry.name = name  -- Ключевое исправление: сохраняем имя в объекте
            entry.text:SetText(name)
            
            if sound then
                UIDropDownMenu_SetText(entry.dropdown, GetFileName(sound))
            else
                UIDropDownMenu_SetText(entry.dropdown, "Не выбрано")
            end
            
            entry:SetPoint("TOPLEFT", 5, -totalHeight)
            entry:Show()
            
            totalHeight = totalHeight + 20
        end
        
        for i = #names + 1, #content.entries do
            content.entries[i]:Hide()
        end
        
        content:SetHeight(math.max(totalHeight, 1))
        scrollFrame:UpdateScrollChildRect()
        scrollBar:SetValue(0)
    end

    addButton:SetScript("OnClick", function()
        local text = editBox:GetText()
        if text ~= "" and not testQ.fls[text] then
            testQ.fls[text] = "Interface\\AddOns\\NSQC\\libs\\fls.mp3"
            frame:UpdateList()
            editBox:SetText("")
            editBox:ClearFocus()
        end
    end)

    delButton:SetScript("OnClick", function()
        local text = editBox:GetText()
        if text ~= "" and testQ.fls[text] then
            testQ.fls[text] = nil
            frame:UpdateList()
            editBox:SetText("")
            editBox:ClearFocus()
        end
    end)

    frame:UpdateList()
end






function SendGuildOfficerMessageWithBonus(message)
    local msg = mysplit(message)
    local myName = UnitName("player") -- Получаем имя текущего игрока
    
    -- Проверяем, что сообщение имеет минимум 3 слова
    if #msg < 3 then
        return -- Выходим, если слов недостаточно
    end
    
    local bonusMessage = msg[2] -- Второе слово (бонус)
    -- Собираем оставшуюся часть сообщения начиная с 3-го слова
    local mainMessage = table.concat(msg, " ", 3)
    for i = 1, GetNumGuildMembers(true) do
        local name, rankName = GetGuildRosterInfo(i)
        if name == myName then
            if rankName == "Лейтенант" or rankName == "Капитан" then
                -- Отправляем сообщение в офицерский чат
                SendChatMessage(mainMessage .. " плюс " .. bonusMessage, "OFFICER", nil, 1)
                -- Отправляем аддон-сообщение
                SendAddonMessage("nsGP" .. " " .. bonusMessage, mainMessage, "guild")
            end
            SendAddonMessage("nsGPlogR", bonusMessage.. " " ..mainMessage, "guild")
            break -- Прерываем цикл после нахождения своего игрока
        end
    end
end

GpDb_old = {}
GpDb_old.__index = GpDb_old

function GpDb_old:new(input_table)
    local new_object = {
        gp_data = {},
        sort_column = "nick",
        sort_ascending = true,
        visible_rows = 20,
        selected_indices = {},
        last_selected_index = nil,
        logData = {},
        filterText = "",
        updateTimer = nil  -- Добавляем поле для управления таймером
    }
    setmetatable(new_object, self)
    
    new_object:_CreateWindow()
    new_object:_CreateRaidSelectionWindow()
    new_object:_CreateLogWindow()
    
    return new_object
end

function GpDb_old:_CreateLogWindow()
    -- Основное окно логов
    self.logWindow = CreateFrame("Frame", "GpDb_oldLogWindow", self.window)
    self.logWindow:SetFrameStrata("DIALOG")
    self.logWindow:SetSize(600, self.window:GetHeight())
    self.logWindow:SetPoint("TOPLEFT", self.window, "TOPRIGHT", 5, 0)
    self.logWindow:SetMovable(false)
    self.logWindow:Hide()

    -- Фон окна
    self.logWindow.background = self.logWindow:CreateTexture(nil, "BACKGROUND")
    self.logWindow.background:SetTexture("Interface\\Buttons\\WHITE8X8")
    self.logWindow.background:SetVertexColor(0.1, 0.1, 0.1)
    self.logWindow.background:SetAlpha(0.9)
    self.logWindow.background:SetAllPoints(true)

    -- Граница окна
    self.logWindow.borderFrame = CreateFrame("Frame", nil, self.logWindow)
    self.logWindow.borderFrame:SetPoint("TOPLEFT", -3, 3)
    self.logWindow.borderFrame:SetPoint("BOTTOMRIGHT", 3, -3)
    self.logWindow.borderFrame:SetBackdrop({
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    })

    -- Кнопка закрытия
    self.logWindow.closeButton = CreateFrame("Button", nil, self.logWindow, "UIPanelCloseButton")
    self.logWindow.closeButton:SetPoint("TOPRIGHT", -5, -5)
    self.logWindow.closeButton:SetScript("OnClick", function() 
        self.logWindow:Hide() 
    end)

    -- Фильтры
    self.logWindow.filters = CreateFrame("Frame", nil, self.logWindow)
    self.logWindow.filters:SetPoint("TOPLEFT", 10, -5)
    self.logWindow.filters:SetPoint("RIGHT", -10, 0)
    self.logWindow.filters:SetHeight(30)

    -- Поле "Количество"
    self.logWindow.countFilter = CreateFrame("EditBox", nil, self.logWindow.filters, "InputBoxTemplate")
    self.logWindow.countFilter:SetSize(60, 20)
    self.logWindow.countFilter:SetPoint("LEFT", self.logWindow.filters, "LEFT")
    self.logWindow.countFilter:SetAutoFocus(false)
    self.logWindow.countFilter:SetText("Кол-во")
    self.logWindow.countFilter:SetScript("OnEscapePressed", function() self.logWindow.countFilter:ClearFocus() end)
    self.logWindow.countFilter:SetScript("OnEnterPressed", function() 
        self.logWindow.countFilter:ClearFocus() 
        self:UpdateLogDisplay()
    end)

    -- Поле "Время"
    self.logWindow.timeFilter = CreateFrame("EditBox", nil, self.logWindow.filters, "InputBoxTemplate")
    self.logWindow.timeFilter:SetSize(70, 20)
    self.logWindow.timeFilter:SetPoint("LEFT", self.logWindow.countFilter, "RIGHT", 5, 0)
    self.logWindow.timeFilter:SetAutoFocus(false)
    self.logWindow.timeFilter:SetText("Время")
    self.logWindow.timeFilter:SetScript("OnEscapePressed", function() self.logWindow.timeFilter:ClearFocus() end)
    self.logWindow.timeFilter:SetScript("OnEnterPressed", function() 
        self.logWindow.timeFilter:ClearFocus() 
        self:UpdateLogDisplay()
    end)

    -- Поле "РЛ"
    self.logWindow.rlFilter = CreateFrame("EditBox", nil, self.logWindow.filters, "InputBoxTemplate")
    self.logWindow.rlFilter:SetSize(70, 20)
    self.logWindow.rlFilter:SetPoint("LEFT", self.logWindow.timeFilter, "RIGHT", 5, 0)
    self.logWindow.rlFilter:SetAutoFocus(false)
    self.logWindow.rlFilter:SetText("РЛ")
    self.logWindow.rlFilter:SetScript("OnEscapePressed", function() self.logWindow.rlFilter:ClearFocus() end)
    self.logWindow.rlFilter:SetScript("OnEnterPressed", function() 
        self.logWindow.rlFilter:ClearFocus() 
        self:UpdateLogDisplay()
    end)

    -- Поле "Рейд"
    self.logWindow.raidFilter = CreateFrame("EditBox", nil, self.logWindow.filters, "InputBoxTemplate")
    self.logWindow.raidFilter:SetSize(100, 20)
    self.logWindow.raidFilter:SetPoint("LEFT", self.logWindow.rlFilter, "RIGHT", 5, 0)
    self.logWindow.raidFilter:SetAutoFocus(false)
    self.logWindow.raidFilter:SetText("Рейд")
    self.logWindow.raidFilter:SetScript("OnEscapePressed", function() self.logWindow.raidFilter:ClearFocus() end)
    self.logWindow.raidFilter:SetScript("OnEnterPressed", function() 
        self.logWindow.raidFilter:ClearFocus() 
        self:UpdateLogDisplay()
    end)

    -- Поле "Ник"
    self.logWindow.nameFilter = CreateFrame("EditBox", nil, self.logWindow.filters, "InputBoxTemplate")
    self.logWindow.nameFilter:SetSize(100, 20)
    self.logWindow.nameFilter:SetPoint("LEFT", self.logWindow.raidFilter, "RIGHT", 5, 0)
    self.logWindow.nameFilter:SetAutoFocus(false)
    self.logWindow.nameFilter:SetText("Ник")
    self.logWindow.nameFilter:SetScript("OnEscapePressed", function() self.logWindow.nameFilter:ClearFocus() end)
    self.logWindow.nameFilter:SetScript("OnEnterPressed", function() 
        self.logWindow.nameFilter:ClearFocus() 
        self:UpdateLogDisplay()
    end)

    -- Кнопка "Показать"
    self.logWindow.showButton = CreateFrame("Button", nil, self.logWindow.filters, "UIPanelButtonTemplate")
    self.logWindow.showButton:SetSize(80, 22)
    self.logWindow.showButton:SetPoint("LEFT", self.logWindow.nameFilter, "RIGHT", 5, 0)
    self.logWindow.showButton:SetText("Показать")
    self.logWindow.showButton:SetScript("OnClick", function()
        
        local function processFilterText(text)
            -- Проверяем, содержит ли текст пробелы (несколько слов)
            if text:find("%s") then
                -- Заменяем все последовательности пробелов на один символ '_'
                text = text:gsub("%s+", "_")
            end
            return text
        end

        local count = processFilterText(self.logWindow.countFilter:GetText())
        local time = processFilterText(self.logWindow.timeFilter:GetText())
        local rl = processFilterText(self.logWindow.rlFilter:GetText())
        local raid = processFilterText(self.logWindow.raidFilter:GetText())
        local name = processFilterText(self.logWindow.nameFilter:GetText())

        gpDb_old:ClearLog()
        
        SendAddonMessage("NSShowMeLogs", count.. " " ..time.. " " ..rl.. " " ..raid.. " " ..name, "guild")
    end)

    -- Область с прокруткой для логов
    self.logWindow.scrollFrame = CreateFrame("ScrollFrame", "GpDb_oldLogScrollFrame", self.logWindow, "UIPanelScrollFrameTemplate")
    self.logWindow.scrollFrame:SetPoint("TOPLEFT", 0, -35)
    self.logWindow.scrollFrame:SetPoint("BOTTOMRIGHT", 0, 10)

    self.logWindow.scrollChild = CreateFrame("Frame")
    self.logWindow.scrollChild:SetSize(580, 1000)
    self.logWindow.scrollFrame:SetScrollChild(self.logWindow.scrollChild)

    -- Создаем строки для отображения логов
    self.logRows = {}
    for i = 1, 50 do
        local row = CreateFrame("Frame", "GpDb_oldLogRow"..i, self.logWindow.scrollChild)
        row:SetSize(580, 40) -- Увеличиваем высоту для переноса строк
        row:SetPoint("TOPLEFT", 0, -((i-1)*40))

        row.text = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        row.text:SetAllPoints(true)
        row.text:SetJustifyH("LEFT")
        row.text:SetJustifyV("TOP")
        row.text:SetWordWrap(true) -- Включаем перенос слов
        row.text:SetText("")

        self.logRows[i] = row
    end
end

function GpDb_old:ClearLog()
    -- Очищаем данные лога
    self.logData = {}
    
    -- Очищаем фильтры
    self.logWindow.countFilter:SetText("Кол-во")
    self.logWindow.timeFilter:SetText("Время")
    self.logWindow.rlFilter:SetText("РЛ")
    self.logWindow.raidFilter:SetText("Рейд")
    self.logWindow.nameFilter:SetText("Ник")
    
    -- Обновляем отображение
    self:UpdateLogDisplay()
    
    print("|cFFFF0000ГП:|r Лог успешно очищен")
end

function GpDb_old:_CreateWindow()
    -- Создаем основной фрейм окна
    self.window = CreateFrame("Frame", "GpTrackerWindow", UIParent)
    self.window:SetFrameStrata("DIALOG")
    self.window:SetSize(400, 600) -- Увеличена высота для размещения фильтра
    self.window:SetPoint("LEFT", 5, 100)
    self.window:SetMovable(true)
    self.window:EnableMouse(true)
    self.window:RegisterForDrag("LeftButton")
    self.window:SetScript("OnDragStart", self.window.StartMoving)
    self.window:SetScript("OnDragStop", self.window.StopMovingOrSizing)
    self.window:Hide()

    -- 1. Непрозрачный чёрный фон
    self.window.background = self.window:CreateTexture(nil, "BACKGROUND")
    self.window.background:SetTexture("Interface\\Buttons\\WHITE8X8")
    self.window.background:SetVertexColor(0, 0, 0)
    self.window.background:SetAlpha(1)
    self.window.background:SetAllPoints(true)

    -- 2. Граница окна
    self.window.borderFrame = CreateFrame("Frame", nil, self.window)
    self.window.borderFrame:SetPoint("TOPLEFT", -3, 3)
    self.window.borderFrame:SetPoint("BOTTOMRIGHT", 3, -3)
    self.window.borderFrame:SetBackdrop({
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    })

    -- 3. Заголовок окна
    self.window.title = self.window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.window.title:SetPoint("TOP", 0, -15)
    self.window.title:SetText("")

    -- 4. Кнопка закрытия
    self.window.closeButton = CreateFrame("Button", nil, self.window, "UIPanelCloseButton")
    self.window.closeButton:SetPoint("TOPRIGHT", -5, -5)
    self.window.closeButton:SetScript("OnClick", function() self.window:Hide() end)

    -- 4.1 Кнопка логов (справа от кнопки закрытия)
    self.window.logButton = CreateFrame("Button", nil, self.window, "UIPanelButtonTemplate")
    self.window.logButton:SetSize(24, 24)
    self.window.logButton:SetPoint("RIGHT", self.window.closeButton, "LEFT", -5, 0)
    self.window.logButton:SetText("L")
    self.window.logButton:SetScript("OnClick", function() 
        self:ToggleLogWindow() 
    end)

    -- 5. Чекбокс "Только рейд"
    self.window.raidOnlyCheckbox = CreateFrame("CheckButton", nil, self.window, "UICheckButtonTemplate")
    self.window.raidOnlyCheckbox:SetPoint("TOPLEFT", 10, -15)
    self.window.raidOnlyCheckbox:SetSize(24, 24)
    self.window.raidOnlyCheckbox.text = self.window.raidOnlyCheckbox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.window.raidOnlyCheckbox.text:SetPoint("LEFT", self.window.raidOnlyCheckbox, "RIGHT", 5, 0)
    self.window.raidOnlyCheckbox.text:SetText("Только рейд")
    self.window.raidOnlyCheckbox:SetScript("OnClick", function()
        self:_UpdateFromGuild()
        self:UpdateWindow()
    end)

    -- 5.1 Поле фильтрации по нику
    self.window.filterLabel = self.window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.window.filterLabel:SetPoint("TOPLEFT", self.window.raidOnlyCheckbox, "BOTTOMLEFT", 0, -10)
    self.window.filterLabel:SetText("Фильтр:")

    self.window.filterEditBox = CreateFrame("EditBox", nil, self.window, "InputBoxTemplate")
    self.window.filterEditBox:SetPoint("TOPLEFT", self.window.filterLabel, "BOTTOMLEFT", 0, -5)
    self.window.filterEditBox:SetPoint("RIGHT", self.window.closeButton, "LEFT", -40, 0)
    self.window.filterEditBox:SetHeight(20)
    self.window.filterEditBox:SetAutoFocus(false)
    self.window.filterEditBox:SetText("")
    self.window.filterEditBox:SetScript("OnTextChanged", function(editBox)
        self.filterText = editBox:GetText():lower()
        self:_UpdateFromGuild()
    end)
    self.window.filterEditBox:SetScript("OnEscapePressed", function() 
        self.window.filterEditBox:SetText("")
        self.window.filterEditBox:ClearFocus() 
    end)
    self.window.filterEditBox:SetScript("OnEnterPressed", function() 
        self.window.filterEditBox:ClearFocus() 
    end)

    -- 5.2 Кнопка очистки фильтра
    self.window.filterClearButton = CreateFrame("Button", nil, self.window, "UIPanelButtonTemplate")
    self.window.filterClearButton:SetSize(80, 22)
    self.window.filterClearButton:SetPoint("TOPRIGHT", self.window.filterEditBox, "BOTTOMRIGHT", 60, 20)
    self.window.filterClearButton:SetText("Очистить")
    self.window.filterClearButton:SetScript("OnClick", function()
        self.window.filterEditBox:SetText("")
        self.filterText = ""
        self:_UpdateFromGuild()
    end)

    -- 6. Область с прокруткой
    self.window.scrollFrame = CreateFrame("ScrollFrame", "ScrollFrame", self.window, "UIPanelScrollFrameTemplate")
    self.window.scrollFrame:SetPoint("TOPLEFT", 0, -85)  -- Больший отступ сверху
    self.window.scrollFrame:SetPoint("BOTTOMRIGHT", 0, 60)  -- Больший отступ снизу

    self.window.scrollChild = CreateFrame("Frame")
    self.window.scrollChild:SetSize(380, 500)
    self.window.scrollFrame:SetScrollChild(self.window.scrollChild)

    -- 7. Ползунок прокрутки
    self.window.scrollBar = _G[self.window.scrollFrame:GetName().."ScrollBar"]
    self.window.scrollBar:SetPoint("TOPLEFT", self.window.scrollFrame, "TOPRIGHT", -20, -16)
    self.window.scrollBar:SetPoint("BOTTOMLEFT", self.window.scrollFrame, "BOTTOMRIGHT", -20, 16)

    -- 8. Строка с количеством отображаемых игроков
    self.window.countText = self.window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.window.countText:SetPoint("BOTTOMLEFT", 10, 40)
    self.window.countText:SetPoint("BOTTOMRIGHT", -10, 40)
    self.window.countText:SetJustifyH("LEFT")
    self.window.countText:SetText("")

    -- 9. Строка с общим количеством игроков с ГП
    self.window.totalText = self.window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.window.totalText:SetPoint("BOTTOMLEFT", 10, 20)
    self.window.totalText:SetPoint("BOTTOMRIGHT", -10, 20)
    self.window.totalText:SetJustifyH("LEFT")
    self.window.totalText:SetText("")

    -- 10. Настройка таблицы
    self:_SetupTable()
end

function GpDb_old:_SetupTable()
    -- Исправляем заголовки для правильной сортировки
    local headers = {
        {text = "Ник", column = "nick"},
        {text = "ГП", column = "gp"}
    }
    
    for i, header in ipairs(headers) do
        local btn = CreateFrame("Button", nil, self.window.scrollChild)
        btn:SetSize(i == 1 and 290 or 50, 20)
        btn:SetPoint("TOPLEFT", (i-1)*290 + (i == 2 and 10 or 0), -5) -- Добавляем отступ сверху
        btn:SetNormalFontObject("GameFontNormal")
        btn:SetHighlightFontObject("GameFontHighlight")
        local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetAllPoints(true)
        text:SetText(header.text)
        btn:SetScript("OnClick", function()
            self:SortData(header.column)
            self:UpdateWindow()
        end)
    end

    -- Создаем строки таблицы с системой выделения
    self.rows = {}
    for i = 1, 999 do
        local row = CreateFrame("Button", "GpDb_oldRow"..i, self.window.scrollChild)
        row:SetSize(350, 20)
        row:SetPoint("TOPLEFT", 0, -25 - (i-1)*25)
        
        -- Настройки для кликов
        row:EnableMouse(true)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        
        -- Текстура для выделения
        row:SetHighlightTexture("Interface\\Buttons\\WHITE8X8")
        row:GetHighlightTexture():SetVertexColor(0.4, 0.4, 0.8, 0.4)
        
        -- Текстура для выбранного состояния
        row.selection = row:CreateTexture(nil, "BACKGROUND")
        row.selection:SetAllPoints(true)
        row.selection:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.selection:SetVertexColor(0.3, 0.3, 0.7, 0.7)
        row.selection:Hide()
        
        -- Поля текста
        row.nick = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row.nick:SetPoint("LEFT", 10, 0)
        row.nick:SetWidth(290)
        row.nick:SetJustifyH("LEFT")

        row.gp = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row.gp:SetPoint("RIGHT", 5, 0)
        row.gp:SetWidth(50)
        row.gp:SetJustifyH("RIGHT")

        -- Переменная для отслеживания времени последнего клика
        row.lastClickTime = 0
        
        -- Обработчик кликов
        row:SetScript("OnClick", function(_, button, down)
            local offset = FauxScrollFrame_GetOffset(self.window.scrollFrame)
            local dataIndex = i + offset
            
            -- Проверяем валидность данных
            if not self.gp_data or not self.gp_data[dataIndex] then return end
            
            -- Получаем текущее время
            local currentTime = GetTime()
            
            -- Проверяем двойной клик (только ЛКМ и только если в рейде)
            if button == "LeftButton" and IsInRaid() and (currentTime - row.lastClickTime) < 0.5 then
                -- Двойной клик - выделяем все элементы
                self:ClearSelection()
                for idx = 1, #self.gp_data do
                    self.selected_indices[idx] = true
                end
                self.last_selected_index = dataIndex
                
                -- Обновляем интерфейс
                self:_UpdateSelectionCount()
                self:RefreshRowHighlights()
                self:UpdateRaidWindowVisibility()
                
                -- Обновляем список выбранных игроков
                if self.raidWindow and self.raidWindow:IsShown() then
                    self:_UpdateSelectedPlayersText()
                end
                
                -- Сбрасываем время клика
                row.lastClickTime = 0
                return
            end
            
            -- Запоминаем время клика для проверки двойного клика
            row.lastClickTime = currentTime
            
            if button == "LeftButton" then
                local wasSelected = self.selected_indices[dataIndex]
                
                -- SHIFT+ЛКМ - выделение диапазона
                if IsShiftKeyDown() then
                    if not self.last_selected_index then
                        self:ClearSelection()
                        self.selected_indices[dataIndex] = true
                        self.last_selected_index = dataIndex
                    else
                        local startIdx = math.min(self.last_selected_index, dataIndex)
                        local endIdx = math.max(self.last_selected_index, dataIndex)
                        
                        if not IsControlKeyDown() then
                            self:ClearSelection()
                        end
                        
                        for idx = startIdx, endIdx do
                            if self.gp_data[idx] then
                                self.selected_indices[idx] = true
                            end
                        end
                    end
                    
                -- CTRL+ЛКМ - добавление/удаление из выделения
                elseif IsControlKeyDown() then
                    -- Изменяем состояние выделения
                    self.selected_indices[dataIndex] = not wasSelected
                    
                    -- Очищаем несуществующие выделения
                    for idx in pairs(self.selected_indices) do
                        if not self.gp_data[idx] then
                            self.selected_indices[idx] = nil
                        end
                    end
                    
                    -- Обновляем last_selected_index
                    if self.selected_indices[dataIndex] then
                        self.last_selected_index = dataIndex
                    else
                        self.last_selected_index = nil
                        for idx in pairs(self.selected_indices) do
                            if self.selected_indices[idx] then
                                self.last_selected_index = idx
                                break
                            end
                        end
                    end
                    
                -- Обычный клик
                else
                    if wasSelected then
                        self:ClearSelection()
                    else
                        self:ClearSelection()
                        self.selected_indices[dataIndex] = true
                        self.last_selected_index = dataIndex
                    end
                end
                
                -- Принудительное обновление интерфейса
                self:_UpdateSelectionCount()
                self:RefreshRowHighlights()
                self:UpdateRaidWindowVisibility()
                
                -- Обновляем список выбранных игроков
                if self.raidWindow and self.raidWindow:IsShown() then
                    self:_UpdateSelectedPlayersText()
                end
            end
        end)

        self.rows[i] = row
    end

    -- Модифицируем обработчик скрытия окна
    self.window:SetScript("OnHide", function()
        -- Сбрасываем выделение
        self:ClearSelection()
        -- Скрываем окно рейда, если оно было открыто
        if self.raidWindow and self.raidWindow:IsShown() then
            self.raidWindow:Hide()
        end
        -- Скрываем окно логов, если оно было открыто
        if self.logWindow and self.logWindow:IsShown() then
            self.logWindow:Hide()
        end
    end)
end

function GpDb_old:ToggleLogWindow()
    if not self.logWindow then
        self:_CreateLogWindow()
    end

    if self.logWindow:IsShown() then
        self.logWindow:Hide()
    else
        self.logWindow:Show()
        self:UpdateLogDisplay()
        
        -- Если открыто окно рейда - корректируем размер
        if self.raidWindow and self.raidWindow:IsShown() then
            self.logWindow:SetHeight(self.window:GetHeight() / 2)
        else
            self.logWindow:SetHeight(self.window:GetHeight())
        end
    end
end

function GpDb_old:UpdateLogDisplay()
    if not self.logWindow or not self.logWindow:IsShown() then return end
    
    -- Вычисляем общую высоту
    local totalHeight = 0
    local rowHeights = {}
    
    -- Сначала вычисляем высоту всех строк
    for i, entry in ipairs(self.logData) do
        local tempText = self.logWindow.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        tempText:SetWidth(580)
        tempText:SetText(entry.text)
        tempText:SetWordWrap(true)
        local textHeight = tempText:GetStringHeight() + 5
        rowHeights[i] = textHeight
        totalHeight = totalHeight + textHeight
        tempText:Hide()
    end

    -- Позиционируем строки (старые сверху, новые снизу)
    local currentY = 0
    for i = 1, #self.logRows do
        local dataIndex = i -- Отображаем записи по порядку (1=самая старая)
        if dataIndex <= #self.logData then
            local entry = self.logData[dataIndex]
            local textHeight = rowHeights[dataIndex]
            
            self.logRows[i]:SetHeight(textHeight)
            self.logRows[i]:SetPoint("TOPLEFT", 0, -currentY)
            self.logRows[i].text:SetText(entry.text)
            self.logRows[i]:Show()
            
            currentY = currentY + textHeight
        else
            self.logRows[i]:Hide()
        end
    end

    -- Обновляем высоту контента
    self.logWindow.scrollChild:SetHeight(totalHeight)
    self.logWindow.scrollFrame:UpdateScrollChildRect()
end

function GpDb_old:_UpdateSelectionCount()
    local count = 0
    -- Считаем ТОЛЬКО действительно выделенные и существующие элементы
    for idx, selected in pairs(self.selected_indices) do
        if selected and self.gp_data[idx] then
            count = count + 1
        else
            self.selected_indices[idx] = nil -- Очищаем невалидные
        end
    end
    
    -- Обновляем текст
    self.window.countText:SetText(string.format("Выделено: %d", count))
    
    -- Если нет выделений - сбрасываем last_selected_index
    if count == 0 then
        self.last_selected_index = nil
    end
    
    return count
end

function GpDb_old:IsValidIndex(index)
    return index and type(index) == "number" and self.gp_data and self.gp_data[index]
end

function GpDb_old:RefreshRowHighlights()
    local offset = FauxScrollFrame_GetOffset(self.window.scrollFrame)
    
    for i, row in ipairs(self.rows) do
        local dataIndex = i + offset
        if dataIndex <= #self.gp_data then
            if self.selected_indices[dataIndex] then
                row.selection:Show()
                row:GetHighlightTexture():SetAlpha(0.2) -- Снижаем прозрачность ховера при выделении
            else
                row.selection:Hide()
                row:GetHighlightTexture():SetAlpha(0.4) -- Возвращаем стандартную прозрачность
            end
        end
    end
    
    -- Обновляем счетчик выделенных
    local selectedCount = 0
    for _ in pairs(self.selected_indices) do selectedCount = selectedCount + 1 end
    self.window.countText:SetText(string.format("Выделено: %d", selectedCount))
end

function GpDb_old:ClearSelection()
    self.selected_indices = {}
    self.last_selected_index = nil
    self:_UpdateSelectionCount()
    self:RefreshRowHighlights()
    self:UpdateRaidWindowVisibility()
end

function GpDb_old:GetSelectedEntries()
    local selected = {}
    for index, _ in pairs(self.selected_indices) do
        if index <= #self.gp_data then
            table.insert(selected, self.gp_data[index])
        end
    end
    return selected
end

function GpDb_old:AddLogEntry(timeStr, gpValue, rl, raid, targets)
    -- Проверяем наличие окна логов
    if not self.logWindow then
        self:_CreateLogWindow()
    end

    -- Функция для получения цвета класса игрока
    local function GetClassColor(name)
        if not name or type(name) ~= "string" or name == "" then 
            return "|cFFFFFFFF" 
        end
        
        for i = 1, GetNumGuildMembers() do
            local guildName, _, _, _, _, _, _, _, _, _, classFileName = GetGuildRosterInfo(i)
            if guildName and guildName == name then
                local color = RAID_CLASS_COLORS[classFileName]
                if color then
                    return string.format("|cFF%02x%02x%02x", color.r*255, color.g*255, color.b*255)
                end
                break
            end
        end
        
        return "|cFFFFFFFF"
    end
    
    -- Получаем числовое значение ГП
    local gpNumValue = tonumber(gpValue) or 0
    
    -- Форматируем компоненты
    local formattedTime = "|cFFA0A0A0" .. (timeStr or "??:??") .. "|r"
    local formattedRl = GetClassColor(rl) .. (rl or "Неизвестно") .. "|r"
    local gpColor = gpNumValue >= 0 and "|cFF00FF00" or "|cFFFF0000"
    local formattedGp = gpColor .. tostring(gpNumValue) .. "|r"
    local formattedRaid = "|cFFFFFF00" .. (raid or "Неизвестно") .. "|r"
    
    -- Функция для поиска имени игрока по коду
    local function GetPlayerNameByCode(code)
        if not code or type(code) ~= "string" then return code end
        
        for i = 1, GetNumGuildMembers() do
            local name, _, _, _, _, _, _, officerNote = GetGuildRosterInfo(i)
            if name and officerNote then
                local words = {}
                for word in officerNote:gmatch("%S+") do
                    table.insert(words, word)
                end
                if #words >= 2 and words[2] == code then
                    return name
                end
            end
        end
        return code -- Возвращаем код, если не нашли игрока
    end
    
    -- Форматируем цели (заменяем коды на имена)
    local formattedTargets = {}
    if type(targets) == "string" then
        for code in targets:gmatch("%S+") do
            local playerName = GetPlayerNameByCode(code)
            table.insert(formattedTargets, GetClassColor(playerName) .. playerName .. "|r")
        end
    end
    local formattedTargetsText = table.concat(formattedTargets, " ")

    -- Собираем строку лога (время | РЛ | ГП | подземелье | игроки)
    local logText = string.format("%s | %s | %s | %s | %s", 
        formattedTime, 
        formattedRl,
        formattedGp,
        formattedRaid, 
        formattedTargetsText)
    
    -- Добавляем новую запись
    table.insert(self.logData, {
        text = logText,
        raw = {
            time = timeStr,
            rl = rl,
            gp = gpNumValue,
            raid = raid,
            targets = targets
        }
    })
    
    -- Ограничиваем количество записей
    if #self.logData > 200 then
        table.remove(self.logData, 1)
    end
    
    -- Обновляем отображение
    if self.logWindow and self.logWindow:IsShown() then
        self:UpdateLogDisplay()
        self.logWindow.scrollFrame:SetVerticalScroll(self.logWindow.scrollFrame:GetVerticalScrollRange())
    end
end

function GpDb_old:UpdateRaidWindowVisibility()
    if not self.raidWindow then return end
    
    -- Проверяем звание игрока
    local hasOfficerRank = self:_CheckOfficerRank()
    if not hasOfficerRank then
        if self.raidWindow:IsShown() then
            self.raidWindow:Hide()
            -- Восстанавливаем полный размер окна логов
            if self.logWindow and self.logWindow:IsShown() then
                self.logWindow:SetHeight(self.window:GetHeight())
            end
        end
        return
    end
    
    local hasSelection = next(self.selected_indices) ~= nil
    
    if not hasSelection then
        if self.raidWindow:IsShown() then
            self.raidWindow:Hide()
            -- Восстанавливаем полный размер окна логов
            if self.logWindow and self.logWindow:IsShown() then
                self.logWindow:SetHeight(self.window:GetHeight())
            end
        end
        return
    end
    
    local inRaid = IsInRaid()
    local raidOnlyChecked = self.window.raidOnlyCheckbox:GetChecked()
    local shouldShow = not inRaid or raidOnlyChecked
    
    if shouldShow and inRaid then
        local raidMembers = {}
        for i = 1, GetNumGroupMembers() do
            local name = GetRaidRosterInfo(i)
            if name then
                raidMembers[name] = true
            end
        end
        
        for index in pairs(self.selected_indices) do
            local entry = self.gp_data[index]
            if entry and not raidMembers[entry.original_nick] then
                shouldShow = false
                print("|cFFFF0000ГП:|r Некоторые выделенные игроки не в рейде")
                break
            end
        end
    end
    
    if shouldShow then
        if not self.raidWindow:IsShown() then
            self.raidWindow:Show()
            self:RestoreRaidWindowState() -- Восстанавливаем состояния при показе
            self:_UpdateSelectedPlayersText() -- Обновляем список игроков
            
            -- Корректируем размер окна логов
            if self.logWindow and self.logWindow:IsShown() then
                self.logWindow:SetHeight(self.window:GetHeight() / 2)
            end
        end
    else
        if self.raidWindow:IsShown() then
            self.raidWindow:Hide()
        end
        
        -- Корректируем размер окна логов
        if self.logWindow and self.logWindow:IsShown() then
            self.logWindow:SetHeight(self.window:GetHeight())
        end
    end
end

function GpDb_old:UpdateWindow()
    if not self.window or not self.rows then return end

    local offset = FauxScrollFrame_GetOffset(self.window.scrollFrame)
    
    -- Уменьшаем количество отображаемых строк
    local visibleRows = math.floor((self.window.scrollFrame:GetHeight() - 30) / 25)
    self.visible_rows = visibleRows
    
    for i = 1, self.visible_rows do
        local row = self.rows[i]
        local dataIndex = i + offset
        
        if dataIndex <= #self.gp_data then
            local entry = self.gp_data[dataIndex]
            
            -- Обновляем текст
            row.nick:SetText(entry.nick)
            row.gp:SetText(tostring(entry.gp))
            
            -- Цвета текста
            if entry.classColor then
                row.nick:SetTextColor(entry.classColor.r, entry.classColor.g, entry.classColor.b)
            else
                row.nick:SetTextColor(1, 1, 1)
            end
            
            row:Show()
        else
            row:Hide()
        end
    end

    -- Обновляем выделения
    self:RefreshRowHighlights()
    
    -- Обновление скролла
    FauxScrollFrame_Update(self.window.scrollFrame, #self.gp_data, self.visible_rows, 25)
    self:UpdateRaidWindowVisibility()
end

function GpDb_old:GetNumSelected()
    local count = 0
    for idx in pairs(self.selected_indices) do
        if self.gp_data[idx] then  -- Проверяем что элемент существует
            count = count + 1
        else
            self.selected_indices[idx] = nil  -- Очищаем несуществующие
        end
    end
    print(string.format("GetNumSelected: найдено %d элементов", count))
    return count
end

function GpDb_old:Show()
    self.window:Show()
    
    -- Автоматически устанавливаем галочку "Только рейд" если мы в рейде
    self.window.raidOnlyCheckbox:SetChecked(IsInRaid())
    
    self:_UpdateFromGuild()
    self:UpdateWindow()
end

function GpDb_old:Hide()
    self.window:Hide()
end

function GpDb_old:_UpdateFromGuild()
    -- Всегда начинаем с чистого списка
    self.gp_data = {}
    local totalWithGP = 0
    local totalMembers = GetNumGuildMembers()
    
    -- Синхронизируем галочку с текущим состоянием рейда
    local inRaid = IsInRaid()
    self.window.raidOnlyCheckbox:SetChecked(inRaid)
    local raidOnlyMode = inRaid and self.window.raidOnlyCheckbox:GetChecked()

    if not IsInGuild() then
        print("|cFFFF0000ГП:|r Вы не состоите в гильдии")
        self:UpdateWindow()
        return
    end

    -- Обновляем данные гильдии
    GuildRoster()

    -- Сохраняем self в локальную переменную для замыкания
    local db = self

    -- Для 3.3.5 используем простой таймер без возможности отмены
    local timerFrame = CreateFrame("Frame")
    timerFrame:SetScript("OnUpdate", function(selfFrame, elapsed)
        selfFrame.elapsed = (selfFrame.elapsed or 0) + elapsed
        if selfFrame.elapsed >= 0.01 then
            selfFrame:SetScript("OnUpdate", nil)
            
            -- Собираем полный список членов гильдии для быстрой проверки
            local guildRosterInfo = {}
            for j = 1, GetNumGuildMembers() do
                local name, _, _, _, _, _, publicNote, officerNote, _, _, classFileName = GetGuildRosterInfo(j)
                if name then
                    -- Удаляем серверную часть имени для уникальности
                    local plainName = name:match("^(.-)-") or name
                    
                    -- Парсим офицерскую заметку для получения ID
                    local playerID = nil
                    if officerNote then
                        local words = {}
                        for word in officerNote:gmatch("%S+") do
                            table.insert(words, word)
                        end
                        if #words >= 2 then
                            playerID = words[2] -- Берем ID из второго слова
                        end
                    end
                    
                    guildRosterInfo[plainName] = {
                        publicNote = publicNote,
                        officerNote = officerNote,
                        classFileName = classFileName,
                        playerID = playerID
                    }
                end
            end

            -- Режим "Только рейд" и мы в рейде
            if raidOnlyMode then
                local numRaidMembers = GetNumGroupMembers()
                local raidCheckPassed = true
                local invalidPlayers = {}

                -- Проверяем всех игроков рейда на принадлежность к гильдии
                for i = 1, numRaidMembers do
                    local raidName, _, _, _, _, classFileName = GetRaidRosterInfo(i)
                    if raidName then
                        -- Удаляем серверную часть имени для сравнения
                        local plainName = raidName:match("^(.-)-") or raidName
                        if not guildRosterInfo[plainName] then
                            raidCheckPassed = false
                            table.insert(invalidPlayers, raidName)
                        end
                    end
                end
                
                -- Если есть чужие игроки - сообщаем и выходим
                if not raidCheckPassed then
                    print("|cFFFF0000ГП:|r В рейде есть не члены гильдии: "..table.concat(invalidPlayers, ", "))
                    db.window.countText:SetText("Отображается игроков: 0 (в рейде есть не члены гильдии)")
                    db.window.totalText:SetText(string.format("Всего игроков с ГП: %d (из %d в гильдии)", totalWithGP, totalMembers))
                    db:UpdateWindow()
                    return
                end

                -- Заполняем данные ВСЕХ игроков рейда
                for i = 1, numRaidMembers do
                    local raidName, _, _, _, _, classFileName = GetRaidRosterInfo(i)
                    if raidName then
                        local plainName = raidName:match("^(.-)-") or raidName
                        local guildInfo = guildRosterInfo[plainName]
                        if guildInfo then
                            local gp = 0
                            local publicNote = guildInfo.publicNote or ""
                            
                            -- Парсим ГП из officerNote
                            if guildInfo.officerNote then
                                local words = {}
                                for word in guildInfo.officerNote:gmatch("%S+") do
                                    table.insert(words, word)
                                end
                                if #words >= 3 then
                                    gp = tonumber(words[3]) or 0
                                end
                            end

                            if gp > 0 then
                                totalWithGP = totalWithGP + 1
                            end

                            local displayName = raidName
                            if publicNote and publicNote ~= "" then
                                displayName = raidName .. " |cFFFFFF00(" .. publicNote .. ")|r"
                            end

                            table.insert(db.gp_data, {
                                nick = displayName,
                                original_nick = plainName,
                                gp = gp,
                                classColor = RAID_CLASS_COLORS[classFileName] or {r=1, g=1, b=1},
                                classFileName = classFileName,
                                playerID = guildInfo.playerID
                            })
                        end
                    end
                end
            else
                -- Обычный режим - показываем только игроков с ГП
                for i = 1, GetNumGuildMembers() do
                    local name, _, _, _, _, _, publicNote, officerNote, _, _, classFileName = GetGuildRosterInfo(i)
                    
                    if name and officerNote and officerNote ~= "" then
                        -- Удаляем серверную часть имени
                        local plainName = name:match("^(.-)-") or name
                        
                        local words = {}
                        for word in officerNote:gmatch("%S+") do
                            table.insert(words, word)
                        end
                        
                        if #words >= 3 then
                            local gp = tonumber(words[3]) or 0
                            local playerID = words[2]
                            
                            if gp ~= 0 then
                                totalWithGP = totalWithGP + 1
                                local displayName = name
                                if publicNote and publicNote ~= "" then
                                    displayName = name .. " |cFFFFFF00(" .. publicNote .. ")|r"
                                end
                                
                                table.insert(db.gp_data, {
                                    nick = displayName,
                                    original_nick = plainName,
                                    gp = gp,
                                    classColor = RAID_CLASS_COLORS[classFileName] or {r=1, g=1, b=1},
                                    classFileName = classFileName,
                                    playerID = playerID
                                })
                            end
                        end
                    end
                end
            end
            
            -- Применяем фильтр
            if db.filterText and db.filterText ~= "" then
                local filteredData = {}
                for _, entry in ipairs(db.gp_data) do
                    local nickMatch = string.find(entry.original_nick:lower(), db.filterText, 1, true)
                    local displayMatch = string.find(entry.nick:lower(), db.filterText, 1, true)
                    
                    if nickMatch or displayMatch then
                        table.insert(filteredData, entry)
                    end
                end
                db.gp_data = filteredData
            end

            -- Обновляем UI
            db.window.countText:SetText(string.format("Отображается игроков: %d", #db.gp_data))
            db.window.totalText:SetText(string.format("Всего игроков с ГП: %d (из %d в гильдии)", totalWithGP, GetNumGuildMembers()))
            
            db:ClearSelection()
            db:SortData()
            db:UpdateWindow()
        end
    end)
end

function GpDb_old:Show()
    self.window:Show()
    
    -- Автоматически включаем режим "Только рейд" если мы в рейде
    if IsInRaid() then
        self.window.raidOnlyCheckbox:SetChecked(true)
    else
        self.window.raidOnlyCheckbox:SetChecked(false)
    end
    
    -- Принудительно обновляем данные гильдии перед показом
    GuildRoster()
    C_Timer(0.01, function()
        self:_UpdateFromGuild()
        self:UpdateWindow()
    end)
end

function GpDb_old:AddGpEntry(nick, gp, playerID)
    table.insert(self.gp_data, {
        nick = nick,
        original_nick = nick,
        gp = tonumber(gp) or 0,
        playerID = playerID -- Добавляем ID игрока
    })
    self:SortData()
    self:UpdateWindow()
end

function GpDb_old:UpdateGpEntry(nick, new_gp)
    for _, entry in ipairs(self.gp_data) do
        if entry.original_nick == nick then
            entry.gp = tonumber(new_gp) or 0
            break
        end
    end
    self:SortData()
    self:UpdateWindow()
end

function GpDb_old:RemoveGpEntry(nick)
    for i, entry in ipairs(self.gp_data) do
        if entry.original_nick == nick then
            table.remove(self.gp_data, i)
            break
        end
    end
    self:UpdateWindow()
end

function GpDb_old:FindGpEntry(nick)
    for _, entry in ipairs(self.gp_data) do
        if entry.original_nick == nick then
            return entry.gp
        end
    end
    return nil
end

function GpDb_old:ClearAll()
    self.gp_data = {}
    self:UpdateWindow()
end

function GpDb_old:SortData(column)
    if column then
        if self.sort_column == column then
            self.sort_ascending = not self.sort_ascending
        else
            self.sort_column = column
            self.sort_ascending = true
        end
    end

    table.sort(self.gp_data, function(a, b)
        local valA, valB
        
        if self.sort_column == "nick" then
            -- Используем оригинальное имя для сортировки
            valA = string.lower(a.original_nick or "")
            valB = string.lower(b.original_nick or "")
        else
            valA = a.gp or 0
            valB = b.gp or 0
        end

        if self.sort_ascending then
            return valA < valB
        else
            return valA > valB
        end
    end)
    self:ClearSelection()
    self:UpdateWindow()
end

function GpDb_old:UpdateWindow()
    if not self.window or not self.rows then return end
    
    for i, row in ipairs(self.rows) do
        local entry = self.gp_data[i]
        if entry then
            row.nick:SetText(entry.nick)
            if entry.classColor then
                -- Применяем цвет класса только к имени (до скобок)
                local plainName = entry.nick:match("^[^|]+") or entry.nick
                row.nick:SetText(plainName)
                row.nick:SetTextColor(entry.classColor.r, entry.classColor.g, entry.classColor.b)
                
                -- Добавляем публичную заметку с желтым цветом
                local notePart = entry.nick:match("|c.+$")
                if notePart then
                    local fullText = row.nick:GetText() .. " " .. notePart
                    row.nick:SetText(fullText)
                end
            else
                row.nick:SetTextColor(1, 1, 1)
            end
            
            row.gp:SetText(tostring(entry.gp))
            row.gp:SetTextColor(1, 1, 1)
            
            row:Show()
        else
            row:Hide()
        end
    end
    
    self.window.scrollChild:SetHeight(#self.gp_data * 25)
    self.window.scrollFrame:UpdateScrollChildRect()
end

function GpDb_old:SaveToNsDb()
    for _, entry in ipairs(self.gp_data) do
        self.ns_db:addStaticStr("GP_DATA", entry.original_nick, nil, tostring(entry.gp))
    end
end

function GpDb_old:LoadFromNsDb()
    self.gp_data = {}
    local data = self.ns_db.input_table["GP_DATA"]
    if data then
        for nick, gp in pairs(data) do
            table.insert(self.gp_data, {
                nick = nick,
                original_nick = nick,
                gp = tonumber(gp) or 0
            })
        end
    end
    self:SortData()
    self:UpdateWindow()
end

function GpDb_old:_CreateRaidSelectionWindow()
    -- Создаем основное окно
    self.raidWindow = CreateFrame("Frame", "GpDb_oldRaidWindow", self.window)
    self.raidWindow:SetFrameStrata("DIALOG")
    self.raidWindow:SetSize(250, self.window:GetHeight() * 0.5)
    self.raidWindow:SetPoint("BOTTOMLEFT", self.window, "BOTTOMRIGHT", 5, 0)
    self.raidWindow:SetMovable(false)
    
    -- Фон окна
    self.raidWindow.background = self.raidWindow:CreateTexture(nil, "BACKGROUND")
    self.raidWindow.background:SetTexture("Interface\\Buttons\\WHITE8X8")
    self.raidWindow.background:SetVertexColor(0, 0, 0)
    self.raidWindow.background:SetAlpha(1)
    self.raidWindow.background:SetAllPoints(true)

    -- Граница окна
    self.raidWindow.borderFrame = CreateFrame("Frame", nil, self.raidWindow)
    self.raidWindow.borderFrame:SetPoint("TOPLEFT", -3, 3)
    self.raidWindow.borderFrame:SetPoint("BOTTOMRIGHT", 3, -3)
    self.raidWindow.borderFrame:SetBackdrop({
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    })

    -- Кнопка закрытия
    self.raidWindow.closeButton = CreateFrame("Button", nil, self.raidWindow, "UIPanelCloseButton")
    self.raidWindow.closeButton:SetPoint("TOPRIGHT", -5, -5)
    self.raidWindow.closeButton:SetScript("OnClick", function() 
        self.raidWindow:Hide() 
    end)

    -- Выпадающий список рейдов
    self.raidWindow.dropdown = CreateFrame("Frame", "GpDb_oldRaidDropdown", self.raidWindow, "UIDropDownMenuTemplate")
    self.raidWindow.dropdown:SetPoint("TOPLEFT", 10, -10)
    self.raidWindow.dropdown:SetPoint("RIGHT", self.raidWindow.closeButton, "LEFT", -10, 0)
    self.raidWindow.dropdown:SetHeight(32)
    
    -- Функция обновления текста в выпадающем списке
    local function UpdateDropdownText()
        if self.raidWindow.selectedRaidId then
            for i = 1, GetNumSavedInstances() do
                local name, id = GetSavedInstanceInfo(i)
                if id == self.raidWindow.selectedRaidId then
                    UIDropDownMenu_SetText(self.raidWindow.dropdown, string.format("%d: %s", id, name))
                    return
                end
            end
        else
            UIDropDownMenu_SetText(self.raidWindow.dropdown, "Выберите рейд")
        end
    end

    -- Функция инициализации выпадающего списка
    local function InitializeDropdown(frame, level, menuList)
        local info = UIDropDownMenu_CreateInfo()
        
        -- Получаем список сохраненных рейдов
        for i = 1, GetNumSavedInstances() do
            local name, id, _, _, _, _, _, _, players = GetSavedInstanceInfo(i)
            if name and id then
                info.text = string.format("%d: %s (%d)", id, name, players)
                info.arg1 = {id = id, name = name, players = players}
                info.func = function(_, arg1)
                    self.raidWindow.selectedRaidId = arg1.id
                    self.raidWindow.selectedRaidName = arg1.name
                    self.raidWindow.selectedRaidPlayers = arg1.players
                    
                    if self.saveSelectionEnabled then
                        self.lastSelectionType = "raid"
                        self.lastRaidId = arg1.id
                        self.lastRaidName = arg1.name
                        self.lastRaidPlayers = arg1.players
                    end
                    
                    UpdateDropdownText()
                    self.raidWindow.editBox:SetText("")
                end
                info.checked = (self.raidWindow.selectedRaidId == id)
                UIDropDownMenu_AddButton(info)
            end
        end
        
        -- Кнопка очистки выбора
        info.text = "Очистить выбор"
        info.func = function()
            self.raidWindow.selectedRaidId = nil
            self.raidWindow.selectedRaidName = nil
            
            if self.saveSelectionEnabled then
                self.lastSelectionType = nil
                self.lastRaidId = nil
                self.lastRaidName = nil
                self.lastRaidPlayers = 0
            end
            
            UpdateDropdownText()
        end
        info.notCheckable = true
        UIDropDownMenu_AddButton(info)
    end

    -- Настраиваем выпадающий список
    UIDropDownMenu_Initialize(self.raidWindow.dropdown, InitializeDropdown)
    UIDropDownMenu_SetWidth(self.raidWindow.dropdown, 200)
    UIDropDownMenu_SetButtonWidth(self.raidWindow.dropdown, 224)
    UIDropDownMenu_JustifyText(self.raidWindow.dropdown, "LEFT")
    UpdateDropdownText()

    -- Текст "Другое"
    self.raidWindow.otherText = self.raidWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.raidWindow.otherText:SetPoint("TOPLEFT", self.raidWindow.dropdown, "BOTTOMLEFT", 0, -10)
    self.raidWindow.otherText:SetText("Другое:")
    
    -- Поле ввода "Другое"
    self.raidWindow.editBox = CreateFrame("EditBox", nil, self.raidWindow, "InputBoxTemplate")
    self.raidWindow.editBox:SetPoint("TOPLEFT", self.raidWindow.otherText, "BOTTOMLEFT", 0, -5)
    self.raidWindow.editBox:SetPoint("RIGHT", -10, 0)
    self.raidWindow.editBox:SetHeight(20)
    self.raidWindow.editBox:SetAutoFocus(false)
    self.raidWindow.editBox:SetScript("OnTextChanged", function(editBox)
        if editBox:GetText() ~= "" then
            if self.saveSelectionEnabled then
                self.lastSelectionType = "other"
                self.lastOtherText = editBox:GetText()
            end
            self.raidWindow.selectedRaidId = nil
            self.raidWindow.selectedRaidName = nil
            UpdateDropdownText()
        end
    end)

    -- Галочка "Сохранить выбор"
    self.raidWindow.saveCheckbox = CreateFrame("CheckButton", nil, self.raidWindow, "UICheckButtonTemplate")
    self.raidWindow.saveCheckbox:SetPoint("TOPLEFT", self.raidWindow.editBox, "BOTTOMLEFT", 0, -10)
    self.raidWindow.saveCheckbox:SetSize(24, 24)
    self.raidWindow.saveCheckbox.text = self.raidWindow.saveCheckbox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.raidWindow.saveCheckbox.text:SetPoint("LEFT", self.raidWindow.saveCheckbox, "RIGHT", 5, 0)
    self.raidWindow.saveCheckbox.text:SetText("Сохранить выбор")
    self.raidWindow.saveCheckbox:SetChecked(true)
    self.saveSelectionEnabled = true
    self.raidWindow.saveCheckbox:SetScript("OnClick", function()
        self.saveSelectionEnabled = self.raidWindow.saveCheckbox:GetChecked()
    end)

    -- Текст с выбранными игроками
    self.raidWindow.selectedPlayersText = self.raidWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    self.raidWindow.selectedPlayersText:SetPoint("TOPLEFT", self.raidWindow.saveCheckbox, "BOTTOMLEFT", 0, -5)
    self.raidWindow.selectedPlayersText:SetPoint("RIGHT", -10, 0)
    self.raidWindow.selectedPlayersText:SetHeight(70)
    self.raidWindow.selectedPlayersText:SetJustifyH("LEFT")
    self.raidWindow.selectedPlayersText:SetJustifyV("TOP")
    self.raidWindow.selectedPlayersText:SetWordWrap(true)

    -- Кнопки быстрого ввода ГП
    local quickGPValues = {5, 10, 20, 25, 50, 100}
    local lastQuickButton
    
    for i, value in ipairs(quickGPValues) do
        local btn = CreateFrame("Button", nil, self.raidWindow, "UIPanelButtonTemplate")
        btn:SetSize(27, 20)
        btn:SetText(tostring(value))
        
        if i == 1 then
            btn:SetPoint("BOTTOMLEFT", self.raidWindow.selectedPlayersText, "BOTTOMLEFT", 0, -20)
        else
            btn:SetPoint("LEFT", lastQuickButton, "RIGHT", 5, 0)
        end
        
        btn:SetScript("OnClick", function()
            local currentValue = tonumber(self.raidWindow.gpEditBox:GetText()) or 0
            self.raidWindow.gpEditBox:SetText(tostring(value))
            self.raidWindow.gpEditBox:HighlightText()
        end)
        
        lastQuickButton = btn
    end
    
    -- Кнопка минуса
    local minusBtn = CreateFrame("Button", nil, self.raidWindow, "UIPanelButtonTemplate")
    minusBtn:SetSize(40, 22)
    minusBtn:SetText("-/+")
    minusBtn:SetPoint("LEFT", lastQuickButton, "RIGHT", 5, 0)
    minusBtn:SetScript("OnClick", function()
        local currentValue = tonumber(self.raidWindow.gpEditBox:GetText()) or 0
        self.raidWindow.gpEditBox:SetText(tostring(-currentValue))
        self.raidWindow.gpEditBox:HighlightText()
    end)

    -- Поле ввода ГП
    self.raidWindow.gpEditBox = CreateFrame("EditBox", nil, self.raidWindow, "InputBoxTemplate")
    self.raidWindow.gpEditBox:SetPoint("BOTTOMLEFT", 10, 5)
    self.raidWindow.gpEditBox:SetSize(100, 20)
    self.raidWindow.gpEditBox:SetAutoFocus(false)
    self.raidWindow.gpEditBox:SetScript("OnEscapePressed", function() self.raidWindow.gpEditBox:ClearFocus() end)
    self.raidWindow.gpEditBox:SetScript("OnEnterPressed", function() self.raidWindow.gpEditBox:ClearFocus() end)

    -- Кнопка "Начислить"
    self.raidWindow.awardButton = CreateFrame("Button", nil, self.raidWindow, "UIPanelButtonTemplate")
    self.raidWindow.awardButton:SetPoint("BOTTOMRIGHT", -10, 5)
    self.raidWindow.awardButton:SetSize(100, 22)
    self.raidWindow.awardButton:SetText("Начислить")
    self.raidWindow.awardButton:SetScript("OnClick", function()
        -- Проверка прав офицера
        if not self:_CheckOfficerRank() then
            print("|cFFFF0000ГП:|r Только офицеры могут начислять ГП")
            self.raidWindow:Hide()
            return
        end
        
        -- Проверка выделенных игроков
        if next(self.selected_indices) == nil then
            print("|cFFFF0000ГП:|r Нет выделенных игроков")
            self.raidWindow:Hide()
            return
        end
        
        -- Получаем значения
        local gpValue = tonumber(self.raidWindow.gpEditBox:GetText())
        if not gpValue then
            print("|cFFFF0000ГП:|r Укажите значение ГП")
            return
        end
        
        -- Проверяем наличие причины
        if not self.raidWindow.selectedRaidId and not (self.lastOtherText or ""):match("%S") then
            print("|cFFFF0000ГП:|r Нужно выбрать рейд или указать причину")
            return
        end
        
        -- Если сохранение отключено - сбрасываем сохраненные значения
        if not self.saveSelectionEnabled then
            self.lastSelectionType = nil
            self.lastRaidId = nil
            self.lastRaidName = nil
            self.lastRaidPlayers = 0
            self.lastOtherText = nil
            self.lastGPValue = 0
        else
            -- Сохраняем значение ГП
            self.lastGPValue = gpValue
        end
        
        -- Формируем сообщение для отправки
        local logStr
        if self.raidWindow.selectedRaidId then
            local cleanRaidName = (self.raidWindow.selectedRaidName or ""):gsub("%s+", "_")
            logStr = string.format("%04d_%s_%d %d", 
                self.raidWindow.selectedRaidId, 
                cleanRaidName, 
                self.raidWindow.selectedRaidPlayers or 0,
                gpValue)
        else
            local cleanOtherText = (self.lastOtherText or ""):gsub("%s+", "_")
            logStr = string.format("%s %d", cleanOtherText, gpValue)
        end

        -- Добавляем игроков в сообщение (используем сохраненный playerID)
        for index in pairs(self.selected_indices) do
            if self.gp_data[index] then
                local nick = self.gp_data[index].original_nick
                local playerID = self.gp_data[index].playerID or "UNKNOWN" -- Используем сохраненный ID
                SendAddonMessage("nsGP" .. " " .. gpValue, nick, "guild")
                logStr = logStr .. " " .. playerID
                
                -- Добавляем запись в лог
                self:AddLogEntry(gpValue, date("%H:%M"), UnitName("player"), 
                    self.raidWindow.selectedRaidName or self.raidWindow.editBox:GetText(), nick)
            end
        end

        -- Отправляем логи
        SendAddonMessage("nsGPlog", logStr, "guild")
        
        -- Обновляем значения ГП у выделенных игроков
        for _, entry in ipairs(self:GetSelectedEntries()) do
            entry.gp = (entry.gp or 0) + gpValue
        end
        self:UpdateWindow()
        self.raidWindow:Hide()
    end)

    -- Добавляем обработчик скрытия окна для корректировки размера логов
    self.raidWindow:SetScript("OnHide", function()
        -- Восстанавливаем полный размер окна логов при скрытии окна рейда
        if self.logWindow and self.logWindow:IsShown() then
            self.logWindow:SetHeight(self.window:GetHeight())
        end
    end)

    -- Инициализация при первом открытии
    self.raidWindow:Hide()
end

function GpDb_old:_UpdateSelectedPlayersText()
    if not self.raidWindow then return end
    
    local selected = self:GetSelectedEntries()
    local names = {}
    
    for _, entry in ipairs(selected) do
        table.insert(names, entry.original_nick)
    end
    
    local text = table.concat(names, ", ")
    
    -- Создаем или обновляем текстовый элемент
    if not self.raidWindow.selectedPlayersText then
        self.raidWindow.selectedPlayersText = self.raidWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        self.raidWindow.selectedPlayersText:SetPoint("TOPLEFT", self.raidWindow.saveCheckbox, "BOTTOMLEFT", 0, -5)
        self.raidWindow.selectedPlayersText:SetPoint("RIGHT", -10, 0)
        self.raidWindow.selectedPlayersText:SetHeight(80)
        self.raidWindow.selectedPlayersText:SetJustifyH("LEFT")
        self.raidWindow.selectedPlayersText:SetJustifyV("TOP")
        self.raidWindow.selectedPlayersText:SetWordWrap(true)
        
        -- Создаем фрейм-контейнер для обработки событий мыши
        self.raidWindow.selectedPlayersTextContainer = CreateFrame("Frame", nil, self.raidWindow)
        self.raidWindow.selectedPlayersTextContainer:SetAllPoints(self.raidWindow.selectedPlayersText)
        self.raidWindow.selectedPlayersTextContainer:SetScript("OnEnter", function()
            if self.raidWindow.selectedPlayersText.tooltip then
                GameTooltip:SetOwner(self.raidWindow.selectedPlayersTextContainer, "ANCHOR_RIGHT")
                GameTooltip:SetText("Выбранные игроки:")
                GameTooltip:AddLine(self.raidWindow.selectedPlayersText.tooltip, 1, 1, 1, true)
                GameTooltip:Show()
            end
        end)
        self.raidWindow.selectedPlayersTextContainer:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end
    
    -- Устанавливаем текст с обрезкой если нужно
    if #text > 60 then
        local shortText = string.sub(text, 1, 600) .. "..."
        self.raidWindow.selectedPlayersText:SetText(shortText)
        self.raidWindow.selectedPlayersText.tooltip = text
    else
        self.raidWindow.selectedPlayersText:SetText(text)
        self.raidWindow.selectedPlayersText.tooltip = nil
    end
end

function GpDb_old:RestoreRaidWindowState()
    if not self.raidWindow then return end
    
    -- Восстанавливаем значения из сохраненных состояний
    if self.lastSelectionType == "raid" and self.lastRaidId then
        UIDropDownMenu_SetText(self.raidWindow.dropdown, string.format("%d: %s", self.lastRaidId, self.lastRaidName))
        self.raidWindow.editBox:SetText("")
        self.raidWindow.selectedRaidId = self.lastRaidId
        self.raidWindow.selectedRaidName = self.lastRaidName
        self.raidWindow.selectedRaidPlayers = self.lastRaidPlayers
    elseif self.lastSelectionType == "other" and self.lastOtherText then
        UIDropDownMenu_SetText(self.raidWindow.dropdown, "Выберите рейд")
        self.raidWindow.editBox:SetText(self.lastOtherText)
        self.raidWindow.selectedRaidId = nil
        self.raidWindow.selectedRaidName = nil
    else
        UIDropDownMenu_SetText(self.raidWindow.dropdown, "Выберите рейд")
        self.raidWindow.editBox:SetText("")
        self.raidWindow.selectedRaidId = nil
        self.raidWindow.selectedRaidName = nil
    end
    
    -- Всегда отображаем lastGPValue, даже если 0
    if not self.lastGPValue then
        self.lastGPValue = 0
    end
    self.raidWindow.gpEditBox:SetText(tostring(self.lastGPValue))
    self.raidWindow.saveCheckbox:SetChecked(self.saveSelectionEnabled)
    
    -- Обновляем список выбранных игроков
    self:_UpdateSelectedPlayersText()
end

function GpDb_old:_CheckOfficerRank()
    if not IsInGuild() then return false end
    
    local playerName = UnitName("player")
    for i = 1, GetNumGuildMembers() do
        local name, _, rankIndex = GetGuildRosterInfo(i)
        if name and name == playerName then
            -- Получаем информацию о звании
            local rankName = GuildControlGetRankName(rankIndex + 1) -- rankIndex начинается с 0
            -- Проверяем, является ли звание офицерским (Капитан или Лейтенант)
            if rankName == "Капитан" or rankName == "Лейтенант" then
                return true
            end
            break
        end
    end
    return false
end

-- Добавляем метод для показа/скрытия окна
function GpDb_old:ToggleRaidWindow()
    -- Проверяем звание игрока
    if not self:_CheckOfficerRank() then
        print("|cFFFF0000ГП:|r Только офицеры могут начислять ГП")
        if self.raidWindow and self.raidWindow:IsShown() then
            self.raidWindow:Hide()
        end
        return
    end
    
    if not self.raidWindow then
        self:_CreateRaidSelectionWindow()
    end
    
    local inRaid = IsInRaid()
    local raidOnlyChecked = self.window.raidOnlyCheckbox:GetChecked()
    local hasSelection = next(self.selected_indices) ~= nil
    
    if not hasSelection and not self.raidWindow:IsShown() then
        self.raidWindow:Show()
        UIDropDownMenu_Initialize(self.raidWindow.dropdown, nil)
        return
    end
    
    if hasSelection then
        if inRaid and not raidOnlyChecked then
            print("|cFFFF0000ГП:|r Для начисления ГП в рейде включите 'Только рейд'")
            self.raidWindow:Hide()
            return
        end
        
        if self.raidWindow:IsShown() then
            self.raidWindow:Hide()
        else
            self.raidWindow:Show()
            UIDropDownMenu_Initialize(self.raidWindow.dropdown, nil)
        end
    end
end

-- Создаем таблицу C_Timer только если её нет (для совместимости с будущими версиями)
if type(C_Timer) ~= "table" then
    C_Timer = {}
end

-- Реализация C_Timer.After
function C_Timer.After(duration, callback)
    local timerFrame = CreateFrame("Frame")
    timerFrame.elapsed = 0
    timerFrame:SetScript("OnUpdate", function(self, elapsed)
        self.elapsed = self.elapsed + elapsed
        if self.elapsed >= duration then
            callback()
            self:SetScript("OnUpdate", nil)
        end
    end)
    return timerFrame
end

-- Реализация C_Timer.NewTicker
function C_Timer.NewTicker(duration, callback, iterations)
    local ticker = {
        _remaining = iterations or math.huge,
        Cancel = function(self) self._remaining = 0 end
    }
    
    local function tick()
        if ticker._remaining <= 0 then return end
        callback()
        ticker._remaining = ticker._remaining - 1
        if ticker._remaining > 0 then
            C_Timer.After(duration, tick)
        end
    end
    
    C_Timer.After(duration, tick)
    return ticker
end

-- Реализация старого интерфейса C_Timer(duration, callback, isLooping)
setmetatable(C_Timer, {
    __call = function(_, duration, callback, isLooping)
        if isLooping then
            return C_Timer.NewTicker(duration, callback, nil)
        else
            return C_Timer.After(duration, callback)
        end
    end
})

function GetNumGroupMembers()
    if GetNumRaidMembers() > 0 then
        return GetNumRaidMembers()
    else
        return GetNumPartyMembers() + 1  -- +1 для учёта самого игрока
    end
end



-- Глобальная таблица для хранения данных
local soundMenus = {}

-- Функция безопасного добавления пунктов меню
local function SafeAddButton(info, level)
    if type(info) == "table" and type(level) == "number" then
        UIDropDownMenu_AddButton(info, level)
    end
end

-- Функция для извлечения имени файла из пути
local function GetFileName(path)
    return path:match("[^\\/]+$") or path
end

-- Создание пользовательского меню для игрока
local function CreatePlayerSoundMenu(playerName)
    local menu = CreateFrame("Frame", "PlayerSoundMenu_" .. playerName, nil, "UIDropDownMenuTemplate")

    menu.initialize = function(self, level)
        if not level then
            return
        end

        -- Уровень 1: Основное меню
        if level == 1 then
            -- Добавление в список
            SafeAddButton({
                text = "Добавить в список",
                notCheckable = 1,
                func = function()
                    testQ = testQ or {}
                    testQ.fls = testQ.fls or {}
                    if not testQ.fls[playerName] then
                        testQ.fls[playerName] = "Interface\\AddOns\\NSQC\\libs\\fls.mp3"
                        print("Добавлен:", playerName, "Звук:", testQ.fls[playerName])
                    end
                    CloseDropDownMenus() -- Закрываем меню после выбора
                end
            }, 1)

            -- Разделитель
            SafeAddButton({
                text = "",
                disabled = 1,
                notCheckable = 1
            }, 1)

            -- Категории звуков
            if ns_alert_sounds and type(ns_alert_sounds) == "table" then
                for _, category in ipairs(ns_alert_sounds) do
                    if category.label and category.sounds and type(category.sounds) == "table" then
                        SafeAddButton({
                            text = category.label,
                            notCheckable = 1,
                            hasArrow = 1,
                            value = category.label .. "_" .. playerName
                        }, 1)
                    end
                end
            end

        -- Уровень 2: Подменю звуков
        elseif level == 2 then
            local menuValue = UIDROPDOWNMENU_MENU_VALUE
            if menuValue and ns_alert_sounds and type(ns_alert_sounds) == "table" then
                local categoryName = menuValue:match("^(.+)_" .. playerName .. "$")

                if categoryName then
                    for _, category in ipairs(ns_alert_sounds) do
                        if category.label == categoryName and category.sounds and type(category.sounds) == "table" then
                            for _, soundPath in ipairs(category.sounds) do
                                SafeAddButton({
                                    text = GetFileName(soundPath),
                                    notCheckable = 1,
                                    func = function()
                                        testQ.fls[playerName] = soundPath
                                        PlaySoundFile(soundPath, "Master")
                                        print("Добавлен:", playerName, "Звук:", soundPath)
                                        CloseDropDownMenus() -- Закрываем меню после выбора
                                    end
                                }, 2)
                            end
                            break
                        end
                    end
                end
            end
        end
    end

    return menu
end

-- Хук для контекстного меню
-- Функция для получения и вывода информации об игроке
local function ShowPlayerInfo(playerName)
    local officerNote = ""
    local publicNote = ""
    local found = false

    -- Ищем игрока в гильдии по имени
    for i = 1, GetNumGuildMembers() do
        local name, _, _, _, _, _, pubNote, offNote = GetGuildRosterInfo(i)
        if name and strsplit("-", name) == playerName then
            publicNote = pubNote or ""
            officerNote = offNote or ""
            found = true
            break
        end
    end

    if found then
        SendChatMessage("Информация об игроке: " .. playerName, "OFFICER")
        SendChatMessage("  Офицерская заметка: " .. (officerNote ~= "" and officerNote or "(нет)"), "OFFICER")
        SendChatMessage("  Публичная заметка: " .. (publicNote ~= "" and publicNote or "(нет)"), "OFFICER")
        SendChatMessage("\"репутация " .. playerName .. " 0", "GUILD")
    else
        SendChatMessage("Игрок " .. playerName .. " не найден в гильдии.", "OFFICER")
    end
end
local function HookContextMenu()
    -- Основной хук для FriendsFrame
    hooksecurefunc("FriendsFrame_ShowDropdown", function(name)
        if name and name ~= UNKNOWNOBJECT then
            -- Добавляем статичный пункт "Настроить звук"
            SafeAddButton({
                text = "Настроить звук для " .. name,
                notCheckable = 1,
                func = function()
                    -- Создаем пользовательское меню
                    soundMenus[name] = soundMenus[name] or CreatePlayerSoundMenu(name)
                    -- Открываем пользовательское меню
                    ToggleDropDownMenu(1, nil, soundMenus[name], "cursor", 0, 0)
                end
            }, 1)
            -- Добавляем пункт "Посмотреть информацию"
            SafeAddButton({
                text = "Посмотреть информацию",
                notCheckable = 1,
                func = function()
                    ShowPlayerInfo(name)
                end
            }, 1)
        end
    end)

    -- Хук для чат-меню
    hooksecurefunc("UnitPopup_OnClick", function()
        local menu = UIDROPDOWNMENU_OPEN_MENU
        if menu and (menu.which == "CHAT_ROSTER" or menu.which == "FRIEND") then
            local name = menu.name
            if name and name ~= UNKNOWNOBJECT then
                -- Добавляем статичный пункт "Настроить звук"
                SafeAddButton({
                    text = "Настроить звук для " .. name,
                    notCheckable = 1,
                    func = function()
                        -- Создаем пользовательское меню
                        soundMenus[name] = soundMenus[name] or CreatePlayerSoundMenu(name)
                        -- Открываем пользовательское меню
                        ToggleDropDownMenu(1, nil, soundMenus[name], "cursor", 0, 0)
                    end
                }, 1)
                -- Добавляем пункт "Посмотреть информацию"
                SafeAddButton({
                    text = "Посмотреть информацию",
                    notCheckable = 1,
                    func = function()
                        ShowPlayerInfo(name)
                    end
                }, 1)
            end
        end
    end)
end

-- Инициализация после загрузки
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function()
    HookContextMenu()

    -- Гарантируем инициализацию testQ
    _G.testQ = _G.testQ or {}
    _G.testQ.fls = _G.testQ.fls or {}
end)

NSQCMenu_old = {}
NSQCMenu_old.__index = NSQCMenu_old

-- Конструктор класса
function NSQCMenu_old:new(addonName, options)
    local instance = setmetatable({}, self)
    instance.addonName = addonName
    instance.subMenus = {}
    instance.elements = {}
    -- Создаем основной фрейм
    instance.mainFrame = CreateFrame("Frame", addonName.."MainFrame", InterfaceOptionsFramePanelContainer)
    instance.mainFrame.name = addonName
    instance.mainFrame:Hide()
    -- Инициализация позиции элементов
    instance.currentY = -50 -- Начальная позиция Y после заголовка
    -- Заголовок аддона
    local title = instance.mainFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(addonName)
    InterfaceOptions_AddCategory(instance.mainFrame)
    return instance
end

-- Метод для добавления информационной секции
function NSQCMenu_old:addInfoSection(titleText, contentText)
    local parentFrame = self.mainFrame
    local sectionY = self.currentY
    -- Добавляем подзаголовок
    local subtitle = parentFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    subtitle:SetPoint("TOPLEFT", 20, sectionY - 10)
    subtitle:SetText(titleText)
    subtitle:SetTextColor(1, 0.82, 0) -- Золотой цвет
    -- Добавляем текст
    local content = parentFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
    content:SetPoint("TOPLEFT", 30, sectionY - 30)
    content:SetWidth(550) -- Фиксированная ширина
    content:SetJustifyH("LEFT")
    content:SetJustifyV("TOP")
    content:SetText(self:wrapText(contentText, 540, "GameFontWhite")) -- Перенос текста
    -- Обновляем позицию для следующих элементов
    local textHeight = content:GetStringHeight()
    self.currentY = sectionY - 40 - textHeight
    table.insert(self.elements, {subtitle, content})
end

-- Метод для переноса текста
function NSQCMenu_old:wrapText(text, maxWidth, font)
    local wrappedText = ""
    local line = ""
    for word in text:gmatch("%S+") do
        local temp = line .. " " .. word
        local tempWidth = self:getStringWidth(self.mainFrame, temp, font)
        if tempWidth > maxWidth then
            wrappedText = wrappedText .. line .. "\n"
            line = word
        else
            line = temp
        end
    end
    return wrappedText .. line
end

-- Вспомогательный метод для получения ширины текста
function NSQCMenu_old:getStringWidth(frame, text, font)
    if not frame then
        print("Error: Frame is nil in getStringWidth")
        return 0
    end
    local temp = frame:CreateFontString(nil, "ARTWORK", font)
    temp:SetText(text)
    local width = temp:GetStringWidth()
    temp:Hide()
    return width
end

-- Метод для создания подменю
function NSQCMenu_old:addSubMenu(menuName, parentMenu)
    -- Определяем родительское меню (по умолчанию - self)
    parentMenu = parentMenu or self
    
    -- Создаем уникальное имя для фрейма
    local frameName = self.addonName..menuName.."SubFrame"
    
    -- Создаем основной фрейм подменю
    local subFrame = CreateFrame("Frame", frameName, InterfaceOptionsFramePanelContainer)
    subFrame.name = menuName
    subFrame.parent = parentMenu.addonName or parentMenu.name
    subFrame:Hide()
    
    -- Создаем ScrollFrame
    local scrollFrame = CreateFrame("ScrollFrame", frameName.."ScrollFrame", subFrame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 16, -50)
    scrollFrame:SetPoint("BOTTOMRIGHT", -32, 16)
    
    -- Создаем контент для скролла
    local scrollContent = CreateFrame("Frame", frameName.."ScrollContent", scrollFrame)
    scrollContent:SetWidth(scrollFrame:GetWidth() - 20)
    scrollContent:SetHeight(1) -- Начальная высота
    scrollFrame:SetScrollChild(scrollContent)
    
    -- Настраиваем скроллбар
    local scrollBar = _G[frameName.."ScrollFrameScrollBar"]
    scrollBar:ClearAllPoints()
    scrollBar:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 12, -16)
    scrollBar:SetPoint("BOTTOMLEFT", scrollFrame, "BOTTOMRIGHT", 12, 16)
    
    -- Заголовок подменю
    local title = subFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(menuName)
    
    -- Регистрируем подменю в интерфейсе WoW
    InterfaceOptions_AddCategory(subFrame)
    
    -- Создаем объект подменю
    local subMenu = {
        frame = subFrame,
        scrollFrame = scrollFrame,
        scrollContent = scrollContent,
        elements = {},
        lastY = 0,
        totalHeight = 0,
        maxHeight = scrollFrame:GetHeight(),
        parent = parentMenu,
        name = menuName
    }
    
    -- Добавляем подменю в список
    table.insert(self.subMenus, subMenu)
    
    return subMenu
end

function NSQCMenu_old:showSubMenu(subMenu)
    if subMenu.parent then
        subMenu.parent.frame:Hide()
    end
    subMenu.frame:Show()
end
-- Методы для добавления элементов в подменю
function NSQCMenu_old:addSlider(parentMenu, options)
    local slider = CreateFrame("Slider", parentMenu.frame:GetName()..options.name, parentMenu.scrollContent, "OptionsSliderTemplate")
    slider:SetPoint("TOPLEFT", 16, -parentMenu.lastY)
    slider:SetWidth(590)
    slider:SetHeight(20)
    slider:SetMinMaxValues(options.min, options.max)
    slider:SetValueStep(options.step or 1)
    slider:SetValue(options.default)
    -- Добавляем текст тултипа
    slider.tooltipText = options.tooltip
    -- Текст слайдера
    _G[slider:GetName().."Text"]:SetText(options.label)
    _G[slider:GetName().."Low"]:SetText(options.min)
    _G[slider:GetName().."High"]:SetText(options.max)
    -- Обработчики тултипа
    slider:SetScript("OnEnter", function(self)
        if self.tooltipText then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(self.tooltipText, 1, 1, 1, true)
            GameTooltip:AddLine("Текущее значение: |cffffffff"..self:GetValue().."|r", 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    slider:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    slider:SetScript("OnValueChanged", function(self, value)
        if options.onChange then options.onChange(value) end
        -- Обновляем тултип если открыт
        if GameTooltip:IsOwned(self) then
            GameTooltip:ClearLines()
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(self.tooltipText, 1, 1, 1, true)
            GameTooltip:AddLine("Текущее значение: |cffffffff"..value.."|r", 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    -- Обновляем высоту контента
    parentMenu.lastY = parentMenu.lastY + 40
    parentMenu.totalHeight = parentMenu.totalHeight + 40
    parentMenu.scrollContent:SetHeight(parentMenu.totalHeight)
    table.insert(parentMenu.elements, slider)
    self:updateScrollRange(parentMenu)
    return slider
end

function NSQCMenu_old:addCheckbox(parentMenu, options)
    local checkbox = CreateFrame("CheckButton", parentMenu.frame:GetName()..options.name, parentMenu.scrollContent, "ChatConfigCheckButtonTemplate")
    checkbox:SetPoint("TOPLEFT", 16, -parentMenu.lastY)
    checkbox:SetChecked(options.default or false)
    -- Добавляем текст тултипа
    checkbox.tooltipText = options.tooltip
    -- Текст чекбокса
    local label = parentMenu.scrollContent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
    label:SetText(options.label)
    -- Обработчики тултипа
    checkbox:SetScript("OnEnter", function(self)
        if self.tooltipText then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(self.tooltipText, 1, 1, 1, true)
            local state = self:GetChecked() and "|cff00ff00Включено|r" or "|cffff0000Выключено|r"
            GameTooltip:AddLine("Текущее значение: "..state, 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    checkbox:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    checkbox:SetScript("OnClick", function(self)
        if options.onClick then options.onClick(self:GetChecked()) end
        -- Обновляем тултип если открыт
        if GameTooltip:IsOwned(self) then
            GameTooltip:ClearLines()
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(self.tooltipText, 1, 1, 1, true)
            local state = self:GetChecked() and "|cff00ff00Включено|r" or "|cffff0000Выключено|r"
            GameTooltip:AddLine("Текущее значение: "..state, 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    -- Обновляем высоту контента
    parentMenu.lastY = parentMenu.lastY + 30
    parentMenu.totalHeight = parentMenu.totalHeight + 30
    parentMenu.scrollContent:SetHeight(parentMenu.totalHeight)
    table.insert(parentMenu.elements, checkbox)
    self:updateScrollRange(parentMenu)
    return checkbox
end

function NSQCMenu_old:updateScrollRange(parentMenu)
    local scrollFrame = parentMenu.scrollFrame
    local scrollBar = _G[scrollFrame:GetName().."ScrollBar"]
    if not scrollBar then
        error("Scrollbar not found for scrollFrame: " .. scrollFrame:GetName())
    end
    local maxRange = parentMenu.totalHeight - parentMenu.maxHeight
    if maxRange < 0 then maxRange = 0 end
    scrollBar:SetMinMaxValues(0, maxRange)
    scrollBar:SetValue(0)
    scrollFrame:UpdateScrollChildRect()
end

-- Метод для добавления кнопки
function NSQCMenu_old:addButton(parentMenu, options)
    -- Создаем кнопку
    local button = CreateFrame("Button", parentMenu.frame:GetName()..options.name, parentMenu.scrollContent, "UIPanelButtonTemplate")
    button:SetPoint("TOPLEFT", 16, -parentMenu.lastY)
    button:SetSize(options.width or 120, options.height or 24) -- Размеры кнопки (по умолчанию 120x24)
    button:SetText(options.label or "Кнопка") -- Текст на кнопке

    -- Обработчик нажатия
    button:SetScript("OnClick", function(self)
        if options.onClick then
            options.onClick() -- Вызываем пользовательскую функцию
        end
    end)

    -- Добавляем тултип, если указан
    if options.tooltip then
        button.tooltipText = options.tooltip
        button:SetScript("OnEnter", function(self)
            if self.tooltipText then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:AddLine(self.tooltipText, 1, 1, 1, true)
                GameTooltip:Show()
            end
        end)
        button:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)
    end

    -- Обновляем высоту контента
    parentMenu.lastY = parentMenu.lastY + (options.height or 24) + 10 -- Добавляем отступ
    parentMenu.totalHeight = parentMenu.totalHeight + (options.height or 24) + 10
    parentMenu.scrollContent:SetHeight(parentMenu.totalHeight)

    -- Добавляем кнопку в список элементов
    table.insert(parentMenu.elements, button)

    -- Обновляем диапазон прокрутки
    self:updateScrollRange(parentMenu)

    return button
end

function C_Timer(duration, callback, isLooping)
    -- Создаем фрейм для таймера
    local timerFrame = CreateFrame("Frame")
    
    -- Устанавливаем продолжительность таймера
    timerFrame.duration = duration
    timerFrame.elapsed = 0
    timerFrame.isLooping = isLooping or false  -- По умолчанию таймер не циклический
    
    -- Обработчик OnUpdate для отслеживания времени
    timerFrame:SetScript("OnUpdate", function(self, elapsed)
        self.elapsed = self.elapsed + elapsed
        
        -- Проверяем, прошло ли нужное время
        if self.elapsed >= self.duration then
            -- Выполняем переданную функцию (callback)
            if type(callback) == "function" then
                callback()
            end
            
            -- Если таймер циклический, сбрасываем время
            if self.isLooping then
                self.elapsed = 0
            else
                -- Уничтожаем фрейм после выполнения, если таймер не циклический
                self:SetScript("OnUpdate", nil)
                self = nil
            end
        end
    end)
end

C_Timer(10, function()
    if not menu then
    	NS3Menu_old()
    	if testQ['скрыть боссов'] then
    		HideBossFrames()
    	end
    end
end)

function NS3Menu_old()
    local menu = NSQCMenu_old:new("NSQC")

    local generalSub = menu:addSubMenu("Настройки")

    menu:addCheckbox(generalSub, {
        name = "Скрыть фреймы боссов под миникартой в ппг и рейдах",
        label = "Скрыть фреймы боссов под миникартой в ппг и рейдах",
        default = testQ['скрыть боссов'] or false,
        tooltip = "Скрыть фреймы боссов под миникартой в ппг и рейдах",
        onClick = function(checked)
        	if testQ then
        		if checked then
            		testQ['скрыть боссов'] = 1
            		HideBossFrames()
            	else
            		testQ['скрыть боссов'] = nil
            	end
            end
        end
    })

    menu:addCheckbox(generalSub, {
        name = "Включить автосмену поиска на миникарте для ханта",
        label = "Включить автосмену поиска на миникарте для ханта",
        default = testQ["метка охотника"] or false,
        tooltip = "Включить автосмену поиска на миникарте для ханта",
        onClick = function(checked)
        	if testQ then
        		if checked then
            		testQ["метка охотника"] = 1
            		HideBossFrames()
            	else
            		testQ["метка охотника"] = nil
            	end
            end
        end
    })

end

function HideBossFrames()
    for i = 1, 4 do
        local bossFrame = _G["Boss"..i.."TargetFrame"]
        if bossFrame then
            bossFrame:UnregisterAllEvents()  -- Отключаем все события
            bossFrame:Hide()                 -- Скрываем фрейм
            bossFrame.Show = function() end  -- Блокируем возможность появления
        end
    end
end

function move(saveTable)
    local frame = GetMouseFocus()
    if not frame or not frame.GetName then return end
    
    local frameName = frame:GetName()
    saveTable = saveTable or {}

    if not frame.moveToggle then
        -- Включение перемещения
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            local point, _, relPoint, x, y = self:GetPoint()
            saveTable[frameName] = {point, relPoint, x, y}
            print(string.format("Позиция сохранена: %s (%.1f, %.1f)", frameName, x, y))
        end)
        
        frame.moveToggle = true
    else
        -- Выключение перемещения
        frame:SetMovable(false)
        frame:EnableMouse(false)
        frame:SetScript("OnDragStart", nil)
        frame:SetScript("OnDragStop", nil)
        frame.moveToggle = nil
    end
    
    return saveTable
end

function RestoreFramePositions(saveTable)
    if not saveTable then return end
    
    for frameName, posData in pairs(saveTable) do
        local frame = _G[frameName]
        if frame and frame.ClearAllPoints then
            frame:ClearAllPoints()
            frame:SetPoint(posData[1], UIParent, posData[2], posData[3], posData[4])
        end
    end
end

function remove()
    move(testQ['frames'])
end

function resetF()
    testQ['frames'] = nil
end