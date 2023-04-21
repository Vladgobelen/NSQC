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
	local current = GetCurrentResolution()
	if current then
		width, height = string.match(select(current, GetScreenResolutions()), "(%d+)x(%d+)")
	end
	width=tonumber(width)
	height=tonumber(height)
	local XXX
	local YYY
	local par1=10
	local par2=1004
	local par3=7
	local par4=768
	local par5=70
	local par6=667
	local par7=5
	local par8=386
	local par9=575
	local par10=0
	local par11=0

	testResolution=width/height
	testResolution=string.sub(testResolution,1,3)
	testResolution=tonumber(testResolution)
	if testResolution==1.7 then
		par10=par10+170
	elseif testResolution==1.6 then
		par10=par10+103
	elseif testResolution==2.4 then
		par10=par10+410
	elseif testResolution==1.5 and width==1440 then
		par10=par10+65
	elseif testResolution==1.2 then
		par11=par11+25
	elseif testResolution==1.5 and width~=1440 then
		par10=par10+85
	end
	if WorldMapFrameSizeUpButton:IsVisible()==nil then
		XXX=(par1+(par2*x)-par3)+par10
		YYY=(((par4 - (par5 + (par6 * y)))-par7))+par11
	else
		YYY=((1-y)*par8)+10
		XXX=(x*par9)+15
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
	local hshMioNome1=string.sub(hNome,1,1)
	local hshMioNome2=string.sub(hNome,2,2)
	local hshMioNome3=string.sub(hNome,3,3)
	qio=string.sub(hshRar,2,2)
	if qio==0 then
		hshRar1=string.sub(hshRar, 3,3)
		hshRar2=string.sub(hshRar, 4,4)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qio==1 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 3,3)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qio==2 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qio==3 then
		hshRar1=string.sub(hshRar, 3,3)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 4,4)
	elseif qio==4 then
		hshRar1=string.sub(hshRar, 1,1)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 4,4)
	elseif qio==5 then
		hshRar1=string.sub(hshRar, 1,1)
		hshRar2=string.sub(hshRar, 6,6)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qio==6 then
		hshRar1=string.sub(hshRar, 6,6)
		hshRar2=string.sub(hshRar, 1,1)
		hshRar3=string.sub(hshRar, 3,3)
	elseif qio==7 then
		hshRar1=string.sub(hshRar, 6,6)
		hshRar2=string.sub(hshRar, 3,3)
		hshRar3=string.sub(hshRar, 1,1)
	elseif qio==8 then
		hshRar1=string.sub(hshRar, 4,4)
		hshRar2=string.sub(hshRar, 5,5)
		hshRar3=string.sub(hshRar, 6,6)
	elseif qio==9 then
		hshRar1=string.sub(hshRar, 5,5)
		hshRar2=string.sub(hshRar, 1,1)
		hshRar3=string.sub(hshRar, 3,3)
	end
	local hshRarMshRezult=hshRar1 .. hshRar2 .. hshRar3
	local hshMioNomeRezult=hshMioNome1 .. hshMioNome2 .. hshMioNome3
	return hshRarMshRezult, hshMioNomeRezult
end

function hshSenderNome(senderNome)
	nomeLen=string.utf8len(senderNome)
	nome1={}
	for startLen=1,nomeLen do
		nome1[startLen]=string.utf8sub(senderNome, startLen, startLen)
		tmNome=nome1[startLen]
		nome1[startLen]=alfabet(tmNome)
	end
	nome11=0
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	local hshSenderR1 = math.random(0, 9)
	local hshSenderR2 = math.random(0, 9)
	local hshSenderR3 = math.random(0, 9)
	local hsSenderNome1=string.utf8sub(hNome,1,1)
	local hsSenderNome2=string.utf8sub(hNome,2,2)
	local hsSenderNome3=string.utf8sub(hNome,3,3)
	local hsSenderNomeRezult
	if hshSenderR2==0 then
	hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome1 .. hsSenderNome2 .. hshSenderR3 .. hsSenderNome3
	elseif hshSenderR2==1 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome2 .. hsSenderNome1 .. hshSenderR3 .. hsSenderNome3
	elseif hshSenderR2==2 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome3 .. hsSenderNome1 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==3 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hsSenderNome1 .. hsSenderNome3 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==4 then
		hsSenderNomeRezult=hsSenderNome1 .. hshSenderR2 .. hshSenderR1 .. hsSenderNome3 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==5 then
		hsSenderNomeRezult=hsSenderNome1 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hshSenderR3 .. hsSenderNome2
	elseif hshSenderR2==6 then
		hsSenderNomeRezult=hsSenderNome2 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hshSenderR3 .. hsSenderNome1
	elseif hshSenderR2==7 then
		hsSenderNomeRezult=hsSenderNome3 .. hshSenderR2 .. hsSenderNome2 .. hshSenderR3 .. hshSenderR1 .. hsSenderNome1
	elseif hshSenderR2==8 then
		hsSenderNomeRezult=hshSenderR1 .. hshSenderR2 .. hshSenderR3 .. hsSenderNome1 .. hsSenderNome2 .. hsSenderNome3
	elseif hshSenderR2==8 then
		hsSenderNomeRezult=hsSenderNome1 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hsSenderNome2 .. hshSenderR3
	elseif hshSenderR2==9 then
		hsSenderNomeRezult=hsSenderNome2 .. hshSenderR2 .. hsSenderNome3 .. hshSenderR1 .. hsSenderNome1 .. hshSenderR3
	end
	return hsSenderNomeRezult
end
