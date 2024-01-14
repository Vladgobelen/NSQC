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
			rtnText[id]:SetSize(460, 396)
			rtnText[id]:SetFrameStrata("TOOLTIP")
			rtnText[id]:SetPoint("CENTER", UIParent, "CENTER", 15, -55)
			rtnText[id]:SetBackdropColor(0, 0, 0, 0)
			rtnText[id]:SetFont('Fonts\\FRIZQT__.TTF', 33);

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

function showOpt()
	for k, v in pairs(InterfaceOptionsCombatTextPanelHealing) do
		print(k,v)
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
function treeX(nome,myNome,id)
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) >=1 then
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
		if mioFld[nome]["объекты"][tostring(id)] ~= "f" then
			if tonumber(testQ["трудовые_ресурсы"]) <= tonumber(krt["podskazki"]) then
				if nome == myNome then
					mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-50
				else
					if (5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
						local x = math.random((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
						if x == 9 then
							mioFld[nome]["целостность"][tostring(id)]=tonumber(mioFld[nome]["целостность"][tostring(id)])-round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
						end
					else
						mioFld[nome]["целостность"][tostring(id)]=tonumber(mioFld[nome]["целостность"][tostring(id)])-round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
					end
				end
				--fBtn[id]:SetText(mioFld[nome]["целостность"][tostring(id)])
				testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
			else
				if nome == myNome then
					mioFld[nome]["целостность"][tostring(id)]=tonumber(mioFld[nome]["целостность"][tostring(id)])-round((5*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
				else
					if (1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]) < 1 then
						local x = math.random((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"])*10,9)
						if x == 9 then
							mioFld[nome]["целостность"][tostring(id)]=tonumber(mioFld[nome]["целостность"][tostring(id)])-round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
						end
					else
						mioFld[nome]["целостность"][tostring(id)]=tonumber(mioFld[nome]["целостность"][tostring(id)])-round((1*tonumber(testQ["mioFldLvl"]))/tonumber(testQ["fldLvl"]))
					end
				end
				--fBtn[id]:SetText(mioFld[nome]["целостность"][tostring(id)])
			end
		end
		if testQ ~= nil then
			if testQ[myNome] ~= nil then
				if testQ[myNome]["характеристики"] ~= nil then
					if testQ[myNome]["характеристики"]["скрытность"] ~= nil then
						SendAddonMessage("obgIz " .. id .. " " .. mioFld[nome]["целостность"][tostring(id)] .. " " .. testQ[myNome]["характеристики"]["скрытность"], nome, "guild")
					else
						SendAddonMessage("obgIz " .. id .. " " .. mioFld[nome]["целостность"][tostring(id)], nome, "guild")
					end
				else
					SendAddonMessage("obgIz " .. id .. " " .. mioFld[nome]["целостность"][tostring(id)], nome, "guild")
				end
			end
		end
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "t" then
		SendAddonMessage("travA " .. id, nome, "guild")
		if testQ ~= nil then
			local testB = nil
			for i = 1,100 do
				if mioFld[nome]["объекты"][tostring(i)] == "sb" then
					if testB == nil then
						testB = 1
					else
						testB = testB + 1
					end
				end
			end
			if testQ["brevna"] ~= nil and testQ["brevna"] < 10 and testB == nil then
				testQ["brevna"] = testQ["brevna"]+1
				testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
				dmgText(testQ["brevna"],resursy[1],101,22,"FF8C00")
			end
			if testQ["brevna"] ~= nil and testQ["brevna"] < 100 and testB == 1 then
				testQ["brevna"] = testQ["brevna"]+1
				testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
				dmgText(testQ["brevna"],resursy[1],101,22,"FF8C00")
			end
			if testQ["brevna"] ~= nil and testQ["brevna"] < 200 and testB == 2 then
				testQ["brevna"] = testQ["brevna"]+1
				testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
				dmgText(testQ["brevna"],resursy[1],101,22,"FF8C00")
			end
			if testQ["brevna"] ~= nil and testQ["brevna"] < 300 and testB == 3 then
				testQ["brevna"] = testQ["brevna"]+1
				testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
				dmgText(testQ["brevna"],resursy[1],101,22,"FF8C00")
			end
			if testQ["brevna"] ~= nil and testQ["brevna"] < 400 and testB == 4 then
				testQ["brevna"] = testQ["brevna"]+1
				testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
				dmgText(testQ["brevna"],resursy[1],101,22,"FF8C00")
			end
			if testQ["brevna"] ~= nil and testQ["brevna"] < 500 and testB == 5 then
				testQ["brevna"] = testQ["brevna"]+1
				testQ["nikQB"] = antc(tonumber(testQ["brevna"]))
				dmgText(testQ["brevna"],resursy[1],101,22,"FF8C00")
			end
		end
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .."x.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 999 and mioFld[nome]["объекты"][tostring(id)] == "f" then
		SendAddonMessage("zemlYa " .. id, nome, "guild")
		if testQ["stog"] ~= nil and testQ["stog"] < 99999 then
			local x
			if tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 100 then
				x = math.random(1,100)
				if x == 100 then
					testQ["stog"] = testQ["stog"]+1
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					dmgText(testQ["stog"],resursy[2],102,22,"FF8C00")
				end
			end
			if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 100 and tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 200 then
				x = math.random(1,20)
				if x == 20 then
					testQ["stog"] = testQ["stog"]+1
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					dmgText(testQ["stog"],resursy[2],102,22,"FF8C00")
				end
			end
			if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 200 and tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 500 then
				x = math.random(1,10)
				if x == 10 then
					testQ["stog"] = testQ["stog"]+1
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					dmgText(testQ["stog"],resursy[2],102,22,"FF8C00")
				end
			end
			if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 500 and tonumber(mioFld[nome]["целостность"][tostring(id)]) <= 900 then
				x = math.random(1,2)
				if x == 2 then
					testQ["stog"] = testQ["stog"]+1
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					dmgText(testQ["stog"],resursy[2],102,22,"FF8C00")
				end
			end
			if tonumber(mioFld[nome]["целостность"][tostring(id)]) > 900 then
				x = math.random(1,10)
				if x ~= 1 then
					testQ["stog"] = testQ["stog"]+1
					testQ["nikQF"] = antc(tonumber(testQ["stog"]))
					dmgText(testQ["stog"],resursy[2],102,22,"FF8C00")
				end
			end
		end
	end

	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "uz" then
		SendAddonMessage("uZ " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] ..".ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "zc" then
		SendAddonMessage("bX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] ..".ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "ms" then
		SendAddonMessage("mS " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] ..".ogg")
	end

	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "mx" then
		SendAddonMessage("mXx " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] ..".ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "hs" then
		SendAddonMessage("uZ " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] ..".ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "zs" then
		SendAddonMessage("zSx " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "zx" then
		SendAddonMessage("zXx " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "skc" then
		SendAddonMessage("skcX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "sb" then
		SendAddonMessage("sbX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "sx" then
		SendAddonMessage("sXX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "tc" then
		SendAddonMessage("tcX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "tz" then
		SendAddonMessage("tVx " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "m0" then
		SendAddonMessage("mFX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and (mioFld[nome]["объекты"][tostring(id)] == "as" or mioFld[nome]["объекты"][tostring(id)] == "bx" or mioFld[nome]["объекты"][tostring(id)] == "bc" or mioFld[nome]["объекты"][tostring(id)] == "bs") then
		SendAddonMessage("bX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "ox" then
		SendAddonMessage("oX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "ob" then
		SendAddonMessage("oXX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "kx" then
		SendAddonMessage("kXX " .. id, nome, "guild")
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\mx.ogg")
	end
end
function resObj(id,myNome,nome)
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
							print('тут')
								mioFld[myNome]["целостность"][tostring(id)] = mioFld[myNome]["целостность"][tostring(id)]+50
								testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+0.02
							else
							print('тут3')
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
			if mioFld[myNome]["объекты"][tostring(i)] == "sk" then
				if testK == nil then
					testK = 1
				else
					testK = testK + 1
				end
			end
		end
		if testQ["kamen"] ~= nil and testQ["kamen"] < 10 and testK == nil then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			dmgText(testQ["kamen"],resursy[3],103,22,"FF8C00")
		elseif testQ["kamen"] ~= nil and testQ["kamen"] < 100 and testK == 1 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			dmgText(testQ["kamen"],resursy[3],103,22,"FF8C00")
		elseif testQ["kamen"] ~= nil and testQ["kamen"] < 200 and testK == 2 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			dmgText(testQ["kamen"],resursy[3],103,22,"FF8C00")
		elseif testQ["kamen"] ~= nil and testQ["kamen"] < 300 and testK == 3 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			dmgText(testQ["kamen"],resursy[3],103,22,"FF8C00")
		elseif testQ["kamen"] ~= nil and testQ["kamen"] < 400 and testK == 4 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			dmgText(testQ["kamen"],resursy[3],103,22,"FF8C00")
		elseif testQ["kamen"] ~= nil and testQ["kamen"] < 500 and testK == 5 then
			testQ["kamen"] = testQ["kamen"]+1
			testQ["nikQK"] = antc(testQ["kamen"])
			dmgText(testQ["kamen"],resursy[3],103,22,"FF8C00")
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
	if not fBtn[1]:IsVisible() then
		if not GuildFrameLFGButton:GetChecked() or sign == "1" then
			if sign == "0" then
				nome = GuildFrame["selectedName"]
			else
				nome = myNome
			end
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
		else
			for i=1,100 do
				fBtn[i]:Hide()
				--fBtn[i]:SetHighlightTexture("")
				btn[989]:ClearAllPoints()
				btn[989]:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame,"TOPLEFT",96, -3)
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
		if mioFld[myNome]["объекты"][tostring(i)] == "to" then
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
end
function ml1(ml1)
	for k, v in pairs(AuctionFrame) do
  print(k,v, v[1], v[2], v[3])
end
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
	local classUnit = UnitClass("player")
	local kya = 0
	local x
	for i = 1, 24 do
		if debuf == 1 then
			x = UnitDebuff("target",i)
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
			PlaySoundFile(prok)
		end
	end
	if spell == "Мясорубка" then
		if tonumber(GetComboPoints("player", target)) == 5 and kya ~= 1 then
			PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg")
		end
	end
	if seiv == 1 then
		if UnitHealth("player") <= (tonumber(UnitHealthMax("player"))/2) and GetSpellCooldown(spell) == 0 then
			table.insert(testQ["skills"],pos, spell)
			PlaySoundFile(prok)
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
function partyFrameHide()
	for i = 1, 25 do
		local prtyF = _G["PartyMemberFrame"..i]
		if prtyF ~= nil and prtyF:IsVisible() then
			prtyF:Hide()
		end
	end
end
function bs()
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
	local attak = x+y
	local str
	if classUnit == "Жрец" or classUnit == "Жрица" then
		local __,__,__,__,tma = GetTalentInfo(3, 27)
		if tma >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+def
		else
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+def
		end
	end
	if classUnit == "Паладин" then
		local __,__,__,__,xpal = GetTalentInfo(1, 26)
		local __,__,__,__,ppal = GetTalentInfo(2, 26)
		local __,__,__,__,rpal = GetTalentInfo(3, 26)
		if xpal >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+(def*0.5)
		end
		if ppal >= 1 then
			bs = (sil*1.5)+lov+(vyn*2)+hit+crit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)+rpb+attak
		end
		if rpal >= 1 then
			bs = (sil*2)+lov+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
		end
	end
	if classUnit == "Воин" then
		local __,__,__,__,pwar = GetTalentInfo(3, 7)
		if pwar >= 1 then
			bs = sil+lov+(vyn*2)+hit+crit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)+rpb+attak
		else
			bs = (sil*2)+lov+vyn+hit+crit+mast+(def*0.5)+(rpb*2)+attak
		end
	end
	if classUnit == "Друид" then
		local __,__,__,__,rdru = GetTalentInfo(3, 27)
		local __,__,__,__,pdru = GetTalentInfo(2, 5)
		local __,__,__,__,sova = GetTalentInfo(1, 13)
		local __,__,__,__,kot = GetTalentInfo(2, 9)
		if rdru >= 1 then
			bs = vyn+(int*2)+(duh*1.5)+(cast*2)+crit+mana+(def*0.5)
		end
		if pdru >= 1 then
			bs = sil+(lov*2)+(vyn*2)+hit+crit+mast+(def*1.5)+(ukl*1.5)+rpb+attak
		end
		if sova >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+(def*0.5)
		end
		if kot >= 1 then
			bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
		end
	end
	if classUnit == "Разбойник" or classUnit == "Разбойница" then
		bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
	end
	if classUnit == "Чернокнижник" or classUnit == "Чернокнижница" then
		bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+def
	end
	if classUnit == "Шаман" then
		local __,__,__,__,elem = GetTalentInfo(1, 3)
		local __,__,__,__,enh = GetTalentInfo(2, 9)
		local __,__,__,__,rsham = GetTalentInfo(3, 1)
		if elem >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+(def*0.5)
		end
		if enh >= 1 then
			bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
		end
		if rsham >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+(def*0.5)
		end
	end
	if classUnit == "Охотник" or classUnit == "Охотница" then
		bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
	end
	if classUnit == "Рыцарь смерти" then
		local __,__,__,__,pwar = GetTalentInfo(1, 7)
		local __,__,__,__,pwar1 = GetTalentInfo(2, 3)
		local __,__,__,__,pwar2 = GetTalentInfo(3, 3)
		if pwar >= 1 or pwar1 >= 1 or pwar2 >= 1 then
			bs = (sil*1.5)+lov+(vyn*2)+hit+crit+(mast*1.5)+(def*1.5)+(ukl*1.5)+(par*1.5)+rpb+attak
		else
			bs = (sil*2)+lov+vyn+hit+crit+mast+(def*0.5)+(rpb*2)+attak
		end
	end
	if classUnit == "Маг" then
		bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+def
	end

	return string.format("%d",bs)
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
	--print("|cff00ff00------")
	for i=1, self:NumLines() do
		if _G["GameTooltipTextLeft"..i]:GetText():sub(1,1) == "+" then
			bstemp = mysplit(_G["GameTooltipTextLeft"..i]:GetText())
			if string.utf8sub(bstemp[3],1,3) == "вын" then
				vyn = tonumber(bstemp[1]:sub(2))
			end
			if string.utf8sub(bstemp[3],1,3) == "лов" then
				lov = tonumber(bstemp[1]:sub(2))
			end
			if string.utf8sub(bstemp[3],1,3) == "сил" then
				sil = tonumber(bstemp[1]:sub(2))
			end
			if string.utf8sub(bstemp[3],1,3) == "инт" then
				int = tonumber(bstemp[1]:sub(2))
			end
			if string.utf8sub(bstemp[3],1,3) == "дух" then
				duh = tonumber(bstemp[1]:sub(2))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"атаки") then
				attak = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"критического") then
				crit = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"мастерства") then
				mast = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"заклинаний") then
				cast = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"меткости") then
				hit = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"защиты") then
				def = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"уклонения") then
				ukl = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"парирования") then
				par = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"блокирования") then
				block = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"Восполнение") then
				mana = mysplit(_G["GameTooltipTextLeft"..i]:GetText())
				mana = tonumber(mana[5])
			end
		end
		if string.utf8sub(_G["GameTooltipTextLeft"..i]:GetText(),1,4) == "Если" then
			if string.find(_G["GameTooltipTextLeft"..i]:GetText(),"пробивания") then
				rpb = tonumber(string.match(_G["GameTooltipTextLeft"..i]:GetText(), '%S+$'))
			end
		end
		--print(_G["GameTooltipTextLeft"..i]:GetText())
	end
	if attak == nil then
		attak = 0
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
	if classUnit == "Жрец" or classUnit == "Жрица" then
		local __,__,__,__,tma = GetTalentInfo(3, 27)
		if tma >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+def
		else
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+def
		end
	end
	if classUnit == "Паладин" then
		local __,__,__,__,xpal = GetTalentInfo(1, 26)
		local __,__,__,__,ppal = GetTalentInfo(2, 26)
		local __,__,__,__,rpal = GetTalentInfo(3, 26)
		if xpal >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+(def*0.5)
		end
		if ppal >= 1 then
			bs = (sil*1.5)+lov+(vyn*2)+hit+crit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)+rpb+attak
		end
		if rpal >= 1 then
			bs = (sil*2)+lov+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
		end
	end
	if classUnit == "Воин" then
		local __,__,__,__,pwar = GetTalentInfo(3, 7)
		if pwar >= 1 then
			bs = sil+lov+(vyn*2)+hit+crit+mast+(def*1.5)+(ukl*1.5)+(par*1.5)+(block*1.5)+rpb+attak
		else
			bs = (sil*2)+lov+vyn+hit+crit+mast+(def*0.5)+(rpb*2)+attak
		end
	end
	if classUnit == "Друид" then
		local __,__,__,__,rdru = GetTalentInfo(3, 27)
		local __,__,__,__,pdru = GetTalentInfo(2, 5)
		local __,__,__,__,sova = GetTalentInfo(1, 13)
		local __,__,__,__,kot = GetTalentInfo(2, 9)
		if rdru >= 1 then
			bs = vyn+(int*2)+(duh*1.5)+(cast*2)+crit+mana+(def*0.5)
		end
		if pdru >= 1 then
			bs = sil+(lov*2)+(vyn*2)+hit+crit+mast+(def*1.5)+(ukl*1.5)+rpb+attak
		end
		if sova >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+(def*0.5)
		end
		if kot >= 1 then
			bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
		end
	end
	if classUnit == "Разбойник" or classUnit == "Разбойница" then
		bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
	end
	if classUnit == "Чернокнижник" or classUnit == "Чернокнижница" then
		bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+def
	end
	if classUnit == "Шаман" then
		local __,__,__,__,elem = GetTalentInfo(1, 3)
		local __,__,__,__,enh = GetTalentInfo(2, 9)
		local __,__,__,__,rsham = GetTalentInfo(3, 1)
		if elem >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+(def*0.5)
		end
		if enh >= 1 then
			bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
		end
		if rsham >= 1 then
			bs = vyn+(int*2)+duh+(cast*2)+crit+mana+(def*0.5)
		end
	end
	if classUnit == "Охотник" or classUnit == "Охотница" then
		bs = sil+(lov*2)+vyn+hit+crit+(rpb*2)+(def*0.5)+attak
	end
	if classUnit == "Рыцарь смерти" then
		local __,__,__,__,pwar = GetTalentInfo(1, 7)
		local __,__,__,__,pwar1 = GetTalentInfo(2, 3)
		local __,__,__,__,pwar2 = GetTalentInfo(3, 3)
		if pwar >= 1 or pwar1 >= 1 or pwar2 >= 1 then
			bs = (sil*1.5)+lov+(vyn*2)+hit+crit+(mast*1.5)+(def*1.5)+(ukl*1.5)+(par*1.5)+rpb+attak
		else
			bs = (sil*2)+lov+vyn+hit+crit+mast+(def*0.5)+(rpb*2)+attak
		end
	end
	if classUnit == "Маг" then
		bs = vyn+(int*2)+duh+(cast*2)+hit+crit+mana+def
	end
	GameTooltip:AddLine("|cff00BFFFбс: |cffFF8C00" .. bs)
	GameTooltip:Show()
end)
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
