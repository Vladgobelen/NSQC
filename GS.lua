function alfabet (bookv)
shablon="абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	myB=string.find(shablon,bookv)
	return myB
end

function kirTest(b,n1)
	local test1=b:sub(n1,n1)
	local testN=b:byte(1)
	testN=tonumber(testN)
	if testN == 208 then
		r=b:sub(n1*2-1,n1*2)
	else
		r=test1
	end
	return r
end

function hashStr (nome)
	local strHash={}
	local testN=nome:byte(1)
	local i
	if testN == 208 then
		local raz=msg:len()
		for i=1,raz/2 do
			local strstr=kirTest(msg,i)
			local pok=alfabet(strstr)
			strHash[i]=pok
		end
	else
		local raz=msg:len()
		for i=1,raz do
			local strstr=kirTest(msg,i)
			local pok=alfabet(strstr)
			strHash[i]=pok
		end
	end
	local rezult=strHash[1]
	for i=1, #strHash do
	rezult=rezult+strHash[i]
	end
	r=rezult % 1000
	return r
end


msg="Двацветок"
test=hashStr(msg)
print (test)
