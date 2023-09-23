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
rtnText = {}
function rtnTextF(text,id,show)
	if show == "show" then
		if rtnText[id] == nil then
			rtnText[id]  = CreateFrame("SimpleHTML", "BCSQuickFrame", UIParent)
			rtnText[id]:SetSize(222, 222)
			rtnText[id]:SetFrameStrata("HIGH")
			rtnText[id]:SetPoint("CENTER", UIParent, "CENTER", 55, 55)
			rtnText[id]:SetBackdropColor(0, 103, 51, 1)
			rtnText[id]:SetFont('Fonts\\FRIZQT__.TTF', 32);
			rtnText[id]:SetText("<html><body><p>|cff90ee90" .. text .. "</p></body></html>");
		else
			if not rtnText[id]:IsVisible() then
				rtnText[id]: Show()
			end
		end
	else
		if rtnText[id] ~= nil then
			rtnText[id]: Hide()
		end
	end
end
function versFail(num)
	VerF  = CreateFrame("SimpleHTML", "BCSQuickFrame", UIParent)
	VerF:SetSize(1111, 888)
	VerF:SetFrameStrata("HIGH")
	if testQ["VerF"] == nil then
		testQ["VerF"] = 600
	end
	VerF:SetPoint("CENTER", UIParent, "CENTER", testQ["VerF"], -355)
	VerF:SetBackdropColor(0, 103, 51, 1)
	VerF:SetFont('Fonts\\FRIZQT__.TTF', num);
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
		myCheckButton6:Show()
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
		myCheckButton6:Hide()
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

function debuffMove(myNome)
	if testQ["buffX"] ~= nil and testQ["buffX"] ~= 0 then
		if DebuffButton1 ~= nil then
			local __,__,__,tempPoint = DebuffButton1:GetPoint()
			local __,__,__,tempPointB = btn[991]:GetPoint()
			if tempPoint ~= tempPointB then
				if tostring(tempPoint):sub(1,4) ~= "9999" then
					hooksecurefunc("DebuffButton_UpdateAnchors", function()
					local i = 0
					local getSize
					getSize = UIParent:GetSize()/2
					local name,__,__,__,__,__,__,__ = UnitDebuff("player",1)
					if testQ[myNome]["настройки"]["debuffChkB"] == nil then
						testQ[myNome]["настройки"]["debuffChkB"] = {}
					end
					if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
						DebuffButton1:ClearAllPoints()
						local x,y = DebuffButton1:GetSize()
						if testQ["buffX"] < getSize then
							DebuffButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
						else
							DebuffButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
						end
						i=i+1
					else
						DebuffButton1:ClearAllPoints()
						DebuffButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
					end
					if DebuffButton2 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",2)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton2:ClearAllPoints()
							local x,y = DebuffButton2:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton2:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton2:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton2:ClearAllPoints()
							DebuffButton2:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton3 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",3)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton3:ClearAllPoints()
							local x,y = DebuffButton3:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton3:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton3:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton3:ClearAllPoints()
							DebuffButton3:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton4 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",4)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton4:ClearAllPoints()
							local x,y = DebuffButton4:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton4:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton4:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton4:ClearAllPoints()
							DebuffButton4:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton5 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",5)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton5:ClearAllPoints()
							local x,y = DebuffButton5:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton5:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton5:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton5:ClearAllPoints()
							DebuffButton5:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton6 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",6)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton6:ClearAllPoints()
							local x,y = DebuffButton6:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton6:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton6:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton6:ClearAllPoints()
							DebuffButton6:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton7 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",7)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton7:ClearAllPoints()
							local x,y = DebuffButton7:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton7:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton7:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton7:ClearAllPoints()
							DebuffButton7:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton8 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",8)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton8:ClearAllPoints()
							local x,y = DebuffButton8:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton8:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton8:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton8:ClearAllPoints()
							DebuffButton8:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton9 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",9)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton9:ClearAllPoints()
							local x,y = DebuffButton9:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton9:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton9:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton9:ClearAllPoints()
							DebuffButton9:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton10 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",10)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton10:ClearAllPoints()
							local x,y = DebuffButton10:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton10:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton10:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton10:ClearAllPoints()
							DebuffButton10:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton11 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",11)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton11:ClearAllPoints()
							local x,y = DebuffButton11:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton11:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton11:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton11:ClearAllPoints()
							DebuffButton11:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton12 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",12)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton12:ClearAllPoints()
							local x,y = DebuffButton12:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton12:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton12:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton12:ClearAllPoints()
							DebuffButton12:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton13 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",13)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton13:ClearAllPoints()
							local x,y = DebuffButton13:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton13:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton13:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton13:ClearAllPoints()
							DebuffButton13:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton14 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",14)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton14:ClearAllPoints()
							local x,y = DebuffButton14:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton14:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton14:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton14:ClearAllPoints()
							DebuffButton14:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton15 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",15)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton15:ClearAllPoints()
							local x,y = DebuffButton15:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton15:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton15:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton15:ClearAllPoints()
							DebuffButton15:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton16 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",16)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton16:ClearAllPoints()
							local x,y = DebuffButton16:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton16:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton16:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton16:ClearAllPoints()
							DebuffButton16:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton17 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",17)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton17:ClearAllPoints()
							local x,y = DebuffButton17:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton17:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton17:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton17:ClearAllPoints()
							DebuffButton17:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton18 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",18)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton18:ClearAllPoints()
							local x,y = DebuffButton18:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton18:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton18:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton18:ClearAllPoints()
							DebuffButton18:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton19 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",19)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton19:ClearAllPoints()
							local x,y = DebuffButton19:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton19:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton19:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton19:ClearAllPoints()
							DebuffButton19:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
					if DebuffButton20 ~= nil then
						local name,__,__,__,__,__,__,__ = UnitDebuff("player",20)
						if testQ[myNome]["настройки"]["debuffChkB"][name] == nil or testQ[myNome]["настройки"]["debuffChkB"][name] == "Disable" then
							DebuffButton20:ClearAllPoints()
							local x,y = DebuffButton20:GetSize()
							if testQ["buffX"] < getSize then
								DebuffButton20:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])+x*i, testQ["buffY"])
							else
								DebuffButton20:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tonumber(testQ["buffX"])-x*i, testQ["buffY"])
							end
							i=i+1
						else
							DebuffButton20:ClearAllPoints()
							DebuffButton20:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 9999, testQ["buffY"])
						end
					end
				end)
			end
		end
	end
		if testQ["buffX"] == 0 then
			testQ["buffX"]=nil
		end
	end

end
function debuffHide(sign)
	if sign == "Hide" then
		if DebuffButton1:IsVisible() then
			if DebuffButton1 ~= nil then
				DebuffButton1:Hide()
			end
			if DebuffButton2 ~= nil then
				DebuffButton2:Hide()
			end
			if DebuffButton3 ~= nil then
				DebuffButton3:Hide()
			end
			if DebuffButton4 ~= nil then
				DebuffButton4:Hide()
			end
			if DebuffButton5 ~= nil then
				DebuffButton5:Hide()
			end
			if DebuffButton6 ~= nil then
				DebuffButton6:Hide()
			end
			if DebuffButton7 ~= nil then
				DebuffButton7:Hide()
			end
			if DebuffButton8 ~= nil then
				DebuffButton8:Hide()
			end
			if DebuffButton9 ~= nil then
				DebuffButton9:Hide()
			end
			if DebuffButton10 ~= nil then
				DebuffButton10:Hide()
			end
			if DebuffButton11 ~= nil then
				DebuffButton11:Hide()
			end
			if DebuffButton12 ~= nil then
				DebuffButton12:Hide()
			end
			if DebuffButton13 ~= nil then
				DebuffButton13:Hide()
			end
			if DebuffButton14 ~= nil then
				DebuffButton14:Hide()
			end
			if DebuffButton15 ~= nil then
				DebuffButton15:Hide()
			end
			if DebuffButton16 ~= nil then
				DebuffButton16:Hide()
			end
			if DebuffButton17 ~= nil then
				DebuffButton17:Hide()
			end
			if DebuffButton18 ~= nil then
				DebuffButton18:Hide()
			end
			if DebuffButton19 ~= nil then
				DebuffButton19:Hide()
			end
			if DebuffButton20 ~= nil then
				DebuffButton20:Hide()
			end
		end
	else
		if DebuffButton1 ~= nil and DebuffButton1:IsVisible() then
		else
			if DebuffButton1 ~= nil then
				DebuffButton1:Show()
			end
			if DebuffButton2 ~= nil then
				DebuffButton2:Show()
			end
			if DebuffButton3 ~= nil then
				DebuffButton3:Show()
			end
			if DebuffButton4 ~= nil then
				DebuffButton4:Show()
			end
			if DebuffButton5 ~= nil then
				DebuffButton5:Show()
			end
			if DebuffButton6 ~= nil then
				DebuffButton6:Show()
			end
			if DebuffButton7 ~= nil then
				DebuffButton7:Show()
			end
			if DebuffButton8 ~= nil then
				DebuffButton8:Show()
			end
			if DebuffButton9 ~= nil then
				DebuffButton9:Show()
			end
			if DebuffButton10 ~= nil then
				DebuffButton10:Show()
			end
			if DebuffButton11 ~= nil then
				DebuffButton11:Show()
			end
			if DebuffButton12 ~= nil then
				DebuffButton12:Show()
			end
			if DebuffButton13 ~= nil then
				DebuffButton13:Show()
			end
			if DebuffButton14 ~= nil then
				DebuffButton14:Show()
			end
			if DebuffButton15 ~= nil then
				DebuffButton15:Show()
			end
			if DebuffButton16 ~= nil then
				DebuffButton16:Show()
			end
			if DebuffButton17 ~= nil then
				DebuffButton17:Show()
			end
			if DebuffButton18 ~= nil then
				DebuffButton18:Show()
			end
			if DebuffButton19 ~= nil then
				DebuffButton19:Show()
			end
			if DebuffButton20 ~= nil then
				DebuffButton20:Show()
			end
		end
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
		if tonumber(testQ["трудовые_ресурсы"]) <= tonumber(krt["podskazki"]) then
			if nome == myNome then
				mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-50
			else
				mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-5
			end
			--fBtn[id]:SetText(mioFld[nome]["целостность"][tostring(id)])
			testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+1
		else
			if nome == myNome then
				mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-5
			else
				mioFld[nome]["целостность"][tostring(id)]=mioFld[nome]["целостность"][tostring(id)]-1
			end
			testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"]+1
			--fBtn[id]:SetText(mioFld[nome]["целостность"][tostring(id)])
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
		SendAddonMessage("podSkazka " .. id .. " " .. nome, mioFld[nome]["подсказка"][tostring(id)], "guild")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "t" then
		SendAddonMessage("travA " .. id, nome, "guild")
		if testQ ~= nil then
			if testQ["brevna"] ~= nil and testQ["brevna"] < 100 then
				testQ["brevna"] = testQ["brevna"]+1
			end
		end
		PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\" .. mioFld[nome]["объекты"][tostring(id)] .."x.ogg")
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "f" then
		SendAddonMessage("zemlYa " .. id, nome, "guild")
		if testQ["stog"] ~= nil and testQ["stog"] < 100 then
			testQ["stog"] = testQ["stog"]+1
		end
	end
	if tonumber(mioFld[nome]["целостность"][tostring(id)]) < 1 and mioFld[nome]["объекты"][tostring(id)] == "uz" then
		SendAddonMessage("uZ " .. id, nome, "guild")
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
