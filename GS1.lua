function alfabet (bookv)
shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	myB=string.find(shablon,bookv)
	return myB
end

function hashStr (nome)
	local i = os.time()
	i = i % 1000
	nomeLen=string.len(nome)
	print (nomeLen)
	nome1={}
	for startLen=1,nomeLen do
	nome1[startLen]=string.sub(nome, startLen, startLen)
	print (nome1[startLen])
	tmNome=nome1[startLen]
	nome1[startLen]=alfabet(tmNome)
	end
	for startLen=1,nomeLen do
		nome11=nome11+nome1[startLen]
		print (nome11)
	end
	nome11=nome11 % 1000
	hNome=string.format("%03d",nome11)
	r1=string.sub(i, 1, 1)
	r2=string.sub(hNome, 1, 1)
	r3=string.sub(i, 2, 2)
	r4=string.sub(hNome, 2, 2)
	r5=string.sub(i, 3, 3)
	r6=string.sub(hNome, 3, 3)
	r=r1 .. r2 .. r3 .. r4 .. r5 .. r6
	return r
end
msg="Dvazvetok"
msg1=hashStr(msg)
print (msg1)
