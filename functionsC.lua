bit32 = {};
local v0 = 32;
local v1 = 2 ^ v0;
bit32.bnot = function(v24)
	v24 = v24 % v1;
	return (v1 - 1) - v24;
end;
bit32.band = function(v25, v26)
	if (v26 == 255) then
		return v25 % 256;
	end
	if (v26 == 65535) then
		return v25 % 65536;
	end
	if (v26 == 4294967295) then
		return v25 % 4294967296;
	end
	v25, v26 = v25 % v1, v26 % v1;
	local v27 = 0;
	local v28 = 1;
	for v390 = 1, v0 do
		local v391, v392 = v25 % 2, v26 % 2;
		v25, v26 = math.floor(v25 / 2), math.floor(v26 / 2);
		if ((v391 + v392) == 2) then
			v27 = v27 + v28;
		end
		v28 = 2 * v28;
	end
	return v27;
end;
bit32.bor = function(v29, v30)
	if (v30 == 255) then
		return (v29 - (v29 % 256)) + 255;
	end
	if (v30 == 65535) then
		return (v29 - (v29 % 65536)) + 65535;
	end
	if (v30 == 4294967295) then
		return 4294967295;
	end
	v29, v30 = v29 % v1, v30 % v1;
	local v31 = 0;
	local v32 = 1;
	for v393 = 1, v0 do
		local v394, v395 = v29 % 2, v30 % 2;
		v29, v30 = math.floor(v29 / 2), math.floor(v30 / 2);
		if ((v394 + v395) >= 1) then
			v31 = v31 + v32;
		end
		v32 = 2 * v32;
	end
	return v31;
end;
bit32.bxor = function(v33, v34)
	v33, v34 = v33 % v1, v34 % v1;
	local v35 = 0;
	local v36 = 1;
	for v396 = 1, v0 do
		local v397, v398 = v33 % 2, v34 % 2;
		v33, v34 = math.floor(v33 / 2), math.floor(v34 / 2);
		if ((v397 + v398) == 1) then
			v35 = v35 + v36;
		end
		v36 = 2 * v36;
	end
	return v35;
end;
bit32.lshift = function(v37, v38)
	if (math.abs(v38) >= v0) then
		return 0;
	end
	v37 = v37 % v1;
	if (v38 < 0) then
		return math.floor(v37 * (2 ^ v38));
	else
		return (v37 * (2 ^ v38)) % v1;
	end
end;
bit32.rshift = function(v39, v40)
	if (math.abs(v40) >= v0) then
		return 0;
	end
	v39 = v39 % v1;
	if (v40 > 0) then
		return math.floor(v39 * (2 ^ -v40));
	else
		return (v39 * (2 ^ -v40)) % v1;
	end
end;
bit32.arshift = function(v41, v42)
	if (math.abs(v42) >= v0) then
		return 0;
	end
	v41 = v41 % v1;
	if (v42 > 0) then
		local v447 = 0;
		if (v41 >= (v1 / 2)) then
			v447 = v1 - (2 ^ (v0 - v42));
		end
		return math.floor(v41 * (2 ^ -v42)) + v447;
	else
		return (v41 * (2 ^ -v42)) % v1;
	end
end;
local v9 = {};
v9["obf_stringchar%0"] = string.char;
v9["obf_stringbyte%0"] = string.byte;
v9["obf_stringsub%0"] = string.sub;
v9["obf_bitlib%0"] = bit32 or bit;
v9["obf_XOR%0"] = v9["obf_bitlib%0"].bxor;
v9["obf_tableconcat%0"] = table.concat;
v9["obf_tableinsert%0"] = table.insert;
local function v22(v43, v44)
	v9["result%0"] = {};
	for v399 = 1, #v43 do
		v9["obf_tableinsert%0"](v9["result%0"], v9["obf_stringchar%0"](v9["obf_XOR%0"](v9["obf_stringbyte%0"](v9["obf_stringsub%0"](v43, v399, v399 + 1)), v9["obf_stringbyte%0"](v9["obf_stringsub%0"](v44, 1 + (v399 % #v44), 1 + (v399 % #v44) + 1))) % 256));
	end
	return v9["obf_tableconcat%0"](v9["result%0"]);
end
function mysplit(v46, v47)
	v9["FlatIdent_39B0%0"] = 0;
	v9["t%0"] = nil;
	while true do
		if (v9["FlatIdent_39B0%0"] == 0) then
			if ((v47 == nil) or (4593 <= 2672)) then
				v47 = v22("\148\208", "\126\177\163\187\69\134\219\167");
			end
			v9["t%0"] = {};
			v9["FlatIdent_39B0%0"] = 1;
		end
		if (v9["FlatIdent_39B0%0"] == 1) then
			for v748 in string.gmatch(v46, v22("\107\246\20", "\156\67\173\74\165") .. v47 .. v22("\9\252\0", "\38\84\215\41\118\220\70")) do
				table.insert(v9["t%0"], v748);
			end
			return v9["t%0"];
		end
	end
end
function round(v50)
	v9["FlatIdent_61585%0"] = 0;
	while true do
		if (0 == v9["FlatIdent_61585%0"]) then
			if (((v50 - (v50 % 0.1)) - (v50 - (v50 % 1))) < 0.5) then
				v50 = v50 - (v50 % 1);
			else
				v50 = (v50 - (v50 % 1)) + 1;
			end
			return v50;
		end
	end
end
function nsplit(v52)
	lines = {};
	for v400 in v52:gmatch("[^\r\n]+") do
		table.insert(lines, v400);
	end
	return lines;
end
function all_trim(v53)
	return v53:match(v22("\110\83\49\88\182\30\91\107\87\237\26\82", "\158\48\118\66\114"));
end
function kirTest(v54, v55)
	test1 = v54:sub(v55, v55);
	testN = v54:byte(7);
	testN = tonumber(testN);
	if ((testN == 208) or (1168 > 3156)) then
		r = v54:sub((v55 * 2) - 1, v55 * 2);
	else
		r = test1;
	end
	return r;
end
function alfabet(v56)
	v9["FlatIdent_A36C%0"] = 0;
	while true do
		if (v9["FlatIdent_A36C%0"] == 0) then
			shablon = "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !?,.-0123456789'()";
			myB = string.find(shablon, v56, 1, true);
			v9["FlatIdent_A36C%0"] = 1;
		end
		if (v9["FlatIdent_A36C%0"] == 1) then
			return myB;
		end
	end
end
function alfabetC(v58, v59)
	v9["FlatIdent_7FAC9%0"] = 0;
	v9["myB%1"] = nil;
	while true do
		if (v9["FlatIdent_7FAC9%0"] == 1) then
			if ((v59 == 0) or (572 > 4486)) then
				v9["myB%1"] = string.find(shablon, v58, 1, true);
			end
			if (v59 == 1) then
				if (v58 < 133) then
					v9["myB%1"] = string.utf8sub(shablon, (v58 / 2) + 0.5, (v58 / 2) + 0.5);
				else
					v9["myB%1"] = string.sub(shablon, v58, v58);
				end
			end
			v9["FlatIdent_7FAC9%0"] = 2;
		end
		if (0 == v9["FlatIdent_7FAC9%0"]) then
			shablon = "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !?,.-0123456789'()";
			v9["myB%1"] = nil;
			v9["FlatIdent_7FAC9%0"] = 1;
		end
		if (v9["FlatIdent_7FAC9%0"] == 2) then
			return v9["myB%1"];
		end
	end
end
function hashStr(v62)
	v9["i%0"] = time();
	i = v9["i%0"] % 10000;
	i = tostring(i);
	i = string.utf8sub(i, 2, 3);
	i = string.format(v22("\238\116\67\50", "\155\203\68\112\86\19\197"), i);
	nomeLen = string.utf8len(v62);
	nome1 = {};
	for v401 = 1, nomeLen do
		nome1[v401] = string.utf8sub(v62, v401, v401);
		tmNome = nome1[v401];
		nome1[v401] = alfabet(tmNome);
	end
	nome11 = 0;
	for v403 = 1, nomeLen do
		nome11 = nome11 + nome1[v403];
	end
	nome11 = nome11 % 1000;
	hNome = string.format(v22("\3\141\101\248", "\152\38\189\86\156\32\24\133"), nome11);
	iN = tostring(i);
	r1 = string.utf8sub(iN, 1, 1);
	r2 = string.utf8sub(hNome, 1, 1);
	r3 = string.utf8sub(iN, 2, 2);
	r4 = string.utf8sub(hNome, 2, 2);
	r5 = string.utf8sub(iN, 3, 3);
	r6 = string.utf8sub(hNome, 3, 3);
	r = r1 .. r2 .. r3 .. r4 .. r5 .. r6;
	return r;
end
function tablelength(v64)
	v9["count%0"] = 0;
	for v404 in pairs(v64) do
		v9["count%0"] = v9["count%0"] + 1;
	end
	return v9["count%0"];
end
function getPOS(v66, v67)
	v9["YYY%0"] = (1 - v67) * 668;
	v9["XXX%0"] = v66 * 1002;
	return v9["XXX%0"], v9["YYY%0"];
end
function hshStrNuovo(v70, v71)
	v9["FlatIdent_8F59B%0"] = 0;
	v9["hshRarMsh1%0"] = nil;
	v9["hshRarMsh2%0"] = nil;
	v9["hshRarMsh3%0"] = nil;
	v9["hshNuovo1%0"] = nil;
	v9["hshNuovo2%0"] = nil;
	v9["hshNuovo3%0"] = nil;
	v9["hshRarMshRezult%0"] = nil;
	v9["hshMioNome%0"] = nil;
	v9["hshMioNome1%0"] = nil;
	v9["hshMioNome2%0"] = nil;
	v9["hshMioNome3%0"] = nil;
	v9["hshMioNomeRezult%0"] = nil;
	v9["hshNuovoRezult%0"] = nil;
	while true do
		if (v9["FlatIdent_8F59B%0"] == 4) then
			v9["hshMioNome2%0"] = string.utf8sub(nome11, 4, 4);
			v9["hshMioNome3%0"] = string.utf8sub(nome11, 6, 6);
			v9["hshMioNomeRezult%0"] = v9["hshMioNome1%0"] .. v9["hshMioNome2%0"] .. v9["hshMioNome3%0"];
			v9["hshNuovoRezult%0"] = v9["hshNuovo1%0"] .. v9["hshMioNome2%0"] .. v9["hshNuovo2%0"] .. v9["hshMioNome1%0"] .. v9["hshNuovo3%0"] .. v9["hshMioNome3%0"];
			v9["FlatIdent_8F59B%0"] = 5;
		end
		if (v9["FlatIdent_8F59B%0"] == 2) then
			v9["hshRarMsh2%0"] = string.sub(v70, 4, 4);
			v9["hshRarMsh3%0"] = string.sub(v70, 6, 6);
			v9["hshNuovo1%0"] = math.random(0, 9);
			v9["hshNuovo2%0"] = math.random(0, 9);
			v9["FlatIdent_8F59B%0"] = 3;
		end
		if (v9["FlatIdent_8F59B%0"] == 3) then
			v9["hshNuovo3%0"] = math.random(0, 9);
			v9["hshRarMshRezult%0"] = v9["hshRarMsh1%0"] .. v9["hshRarMsh2%0"] .. v9["hshRarMsh3%0"];
			v9["hshMioNome%0"] = hashStr(v71);
			v9["hshMioNome1%0"] = string.utf8sub(nome11, 2, 2);
			v9["FlatIdent_8F59B%0"] = 4;
		end
		if (v9["FlatIdent_8F59B%0"] == 0) then
			nomeLen = string.utf8len(v71);
			nome1 = {};
			for v749 = 1, nomeLen do
				nome1[v749] = string.utf8sub(v71, v749, v749);
				tmNome = nome1[v749];
				nome1[v749] = alfabet(tmNome);
			end
			nome11 = 0;
			v9["FlatIdent_8F59B%0"] = 1;
		end
		if (v9["FlatIdent_8F59B%0"] == 5) then
			return v9["hshRarMshRezult%0"], v9["hshMioNomeRezult%0"], v9["hshNuovoRezult%0"];
		end
		if (v9["FlatIdent_8F59B%0"] == 1) then
			for v751 = 1, nomeLen do
				nome11 = nome11 + nome1[v751];
			end
			nome11 = nome11 % 1000;
			hNome = string.format(v22("\185\7\244\66", "\38\156\55\199"), nome11);
			v9["hshRarMsh1%0"] = string.sub(v70, 2, 2);
			v9["FlatIdent_8F59B%0"] = 2;
		end
	end
end
function hshStrNuovo(v86, v87)
	v9["nomeLen%2"] = nil;
	v9["tmNome%2"] = nil;
	v9["nome11%6"] = nil;
	v9["hNome%2"] = nil;
	v9["hshMioNome1%0"] = nil;
	v9["hshMioNome2%0"] = nil;
	v9["hshMioNome3%0"] = nil;
	v9["qioC%0"] = nil;
	v9["hshRar1%0"] = nil;
	v9["hshRar2%0"] = nil;
	v9["hshRar3%0"] = nil;
	v9["hshRarMshRezult%0"] = nil;
	v9["hshMioNomeRezult%0"] = nil;
	nomeLen = string.utf8len(v87);
	v9["nome1%2"] = {};
	for v406 = 1, nomeLen do
		v9["nome1%2"][v406] = string.utf8sub(v87, v406, v406);
		v9["tmNome%2"] = v9["nome1%2"][v406];
		v9["nome1%2"][v406] = alfabet(v9["tmNome%2"]);
	end
	nome11 = 0;
	for v409 = 1, nomeLen do
		nome11 = nome11 + v9["nome1%2"][v409];
	end
	nome11 = nome11 % 1000;
	hNome = string.format(v22("\237\45\47\44", "\35\200\29\28\72\115\20\154"), nome11);
	hshMioNome1 = string.sub(hNome, 1, 1);
	hshMioNome2 = string.sub(hNome, 2, 2);
	hshMioNome3 = string.sub(hNome, 3, 3);
	qioC = string.sub(v86, 2, 2);
	qioC = tonumber(qioC);
	if (qioC == 0) then
		v9["FlatIdent_29B3D%0"] = 0;
		while true do
			if (v9["FlatIdent_29B3D%0"] == 1) then
				v9["hshRar3%0"] = string.sub(v86, 6, 6);
				break;
			end
			if (v9["FlatIdent_29B3D%0"] == 0) then
				v9["hshRar1%0"] = string.sub(v86, 3, 3);
				v9["hshRar2%0"] = string.sub(v86, 4, 4);
				v9["FlatIdent_29B3D%0"] = 1;
			end
		end
	elseif ((1404 == 1404) and (qioC == 1)) then
		v9["hshRar1%0"] = string.sub(v86, 4, 4);
		v9["hshRar2%0"] = string.sub(v86, 3, 3);
		v9["hshRar3%0"] = string.sub(v86, 6, 6);
	elseif (qioC == 2) then
		v9["FlatIdent_759F1%0"] = 0;
		while true do
			if (v9["FlatIdent_759F1%0"] == 1) then
				v9["hshRar3%0"] = string.sub(v86, 3, 3);
				break;
			end
			if (0 == v9["FlatIdent_759F1%0"]) then
				v9["hshRar1%0"] = string.sub(v86, 4, 4);
				v9["hshRar2%0"] = string.sub(v86, 6, 6);
				v9["FlatIdent_759F1%0"] = 1;
			end
		end
	elseif (qioC == 3) then
		v9["FlatIdent_6B983%0"] = 0;
		while true do
			if (v9["FlatIdent_6B983%0"] == 1) then
				v9["hshRar3%0"] = string.sub(v86, 4, 4);
				break;
			end
			if (v9["FlatIdent_6B983%0"] == 0) then
				v9["hshRar1%0"] = string.sub(v86, 3, 3);
				v9["hshRar2%0"] = string.sub(v86, 6, 6);
				v9["FlatIdent_6B983%0"] = 1;
			end
		end
	elseif ((qioC == 4) or (3748 < 2212)) then
		v9["FlatIdent_287B5%0"] = 0;
		while true do
			if (v9["FlatIdent_287B5%0"] == 0) then
				v9["hshRar1%0"] = string.sub(v86, 1, 1);
				v9["hshRar2%0"] = string.sub(v86, 6, 6);
				v9["FlatIdent_287B5%0"] = 1;
			end
			if (v9["FlatIdent_287B5%0"] == 1) then
				v9["hshRar3%0"] = string.sub(v86, 4, 4);
				break;
			end
		end
	elseif (qioC == 5) then
		v9["hshRar1%0"] = string.sub(v86, 1, 1);
		v9["hshRar2%0"] = string.sub(v86, 6, 6);
		v9["hshRar3%0"] = string.sub(v86, 3, 3);
	elseif ((qioC == 6) or (1180 == 2180)) then
		v9["hshRar1%0"] = string.sub(v86, 6, 6);
		v9["hshRar2%0"] = string.sub(v86, 1, 1);
		v9["hshRar3%0"] = string.sub(v86, 3, 3);
	elseif ((4090 < 4653) and (qioC == 7)) then
		v9["FlatIdent_D79D%0"] = 0;
		while true do
			if (0 == v9["FlatIdent_D79D%0"]) then
				v9["hshRar1%0"] = string.sub(v86, 6, 6);
				v9["hshRar2%0"] = string.sub(v86, 3, 3);
				v9["FlatIdent_D79D%0"] = 1;
			end
			if (v9["FlatIdent_D79D%0"] == 1) then
				v9["hshRar3%0"] = string.sub(v86, 1, 1);
				break;
			end
		end
	elseif (qioC == 8) then
		v9["hshRar1%0"] = string.sub(v86, 4, 4);
		v9["hshRar2%0"] = string.sub(v86, 5, 5);
		v9["hshRar3%0"] = string.sub(v86, 6, 6);
	elseif ((qioC == 9) or (2652 < 196)) then
		v9["FlatIdent_28F1%0"] = 0;
		while true do
			if (0 == v9["FlatIdent_28F1%0"]) then
				v9["hshRar1%0"] = string.sub(v86, 5, 5);
				v9["hshRar2%0"] = string.sub(v86, 1, 1);
				v9["FlatIdent_28F1%0"] = 1;
			end
			if (1 == v9["FlatIdent_28F1%0"]) then
				v9["hshRar3%0"] = string.sub(v86, 3, 3);
				break;
			end
		end
	end
	hshRarMshRezult = v9["hshRar1%0"] .. v9["hshRar2%0"] .. v9["hshRar3%0"];
	hshMioNomeRezult = hshMioNome1 .. hshMioNome2 .. hshMioNome3;
	return hshRarMshRezult, hshMioNomeRezult;
end
function hshSenderNomeC(v102)
	v9["nomeLen%2"] = nil;
	v9["nome1%2"] = nil;
	v9["nome11%6"] = nil;
	v9["hNomeC%0"] = nil;
	v9["hsSenderNomeC1%0"] = nil;
	v9["hsSenderNomeC2%0"] = nil;
	v9["hsSenderNomeC3%0"] = nil;
	v9["hshSenderRC1%0"] = nil;
	v9["hshSenderRC2%0"] = nil;
	v9["hshSenderRC3%0"] = nil;
	v9["hsSenderNomeCRezult%0"] = nil;
	nomeLen = string.utf8len(v102);
	nome1 = {};
	for v410 = 1, nomeLen do
		nome1[v410] = string.utf8sub(v102, v410, v410);
		tmNome = nome1[v410];
		nome1[v410] = alfabet(tmNome);
	end
	nome11 = 0;
	for v412 = 1, nomeLen do
		nome11 = nome11 + nome1[v412];
	end
	nome11 = nome11 % 1000;
	hNomeC = string.format(v22("\92\239\130\219", "\84\121\223\177\191\237\76"), nome11);
	hsSenderNomeC1 = string.sub(hNomeC, 1, 1);
	hsSenderNomeC2 = string.sub(hNomeC, 2, 2);
	hsSenderNomeC3 = string.sub(hNomeC, 3, 3);
	hshSenderRC1 = math.random(0, 9);
	hshSenderRC2 = math.random(0, 9);
	hshSenderRC3 = math.random(0, 9);
	if ((4135 < 4817) and (hshSenderRC2 == 0)) then
		v9["hsSenderNomeCRezult%0"] = hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC1 .. hsSenderNomeC2 .. hshSenderRC3 .. hsSenderNomeC3;
	elseif ((272 == 272) and (hshSenderRC2 == 1)) then
		v9["hsSenderNomeCRezult%0"] = hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC2 .. hsSenderNomeC1 .. hshSenderRC3 .. hsSenderNomeC3;
	elseif ((100 <= 3123) and (hshSenderRC2 == 2)) then
		v9["hsSenderNomeCRezult%0"] = hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC3 .. hsSenderNomeC1 .. hshSenderRC3 .. hsSenderNomeC2;
	elseif ((hshSenderRC2 == 3) or (1369 > 4987)) then
		v9["hsSenderNomeCRezult%0"] = hshSenderRC1 .. hshSenderRC2 .. hsSenderNomeC1 .. hsSenderNomeC3 .. hshSenderRC3 .. hsSenderNomeC2;
	elseif ((hshSenderRC2 == 4) or (863 >= 4584)) then
		v9["hsSenderNomeCRezult%0"] = hsSenderNomeC1 .. hshSenderRC2 .. hshSenderRC1 .. hsSenderNomeC3 .. hshSenderRC3 .. hsSenderNomeC2;
	elseif (hshSenderRC2 == 5) then
		v9["hsSenderNomeCRezult%0"] = hsSenderNomeC1 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hshSenderRC3 .. hsSenderNomeC2;
	elseif ((hshSenderRC2 == 6) or (724 >= 1668)) then
		v9["hsSenderNomeCRezult%0"] = hsSenderNomeC2 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hshSenderRC3 .. hsSenderNomeC1;
	elseif (hshSenderRC2 == 7) then
		v9["hsSenderNomeCRezult%0"] = hsSenderNomeC3 .. hshSenderRC2 .. hsSenderNomeC2 .. hshSenderRC3 .. hshSenderRC1 .. hsSenderNomeC1;
	elseif ((428 < 1804) and (hshSenderRC2 == 8)) then
		v9["hsSenderNomeCRezult%0"] = hshSenderRC1 .. hshSenderRC2 .. hshSenderRC3 .. hsSenderNomeC1 .. hsSenderNomeC2 .. hsSenderNomeC3;
	elseif ((hshSenderRC2 == 8) or (3325 > 4613)) then
		v9["hsSenderNomeCRezult%0"] = hsSenderNomeC1 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hsSenderNomeC2 .. hshSenderRC3;
	elseif (hshSenderRC2 ~= 9) then
	else
		v9["hsSenderNomeCRezult%0"] = hsSenderNomeC2 .. hshSenderRC2 .. hsSenderNomeC3 .. hshSenderRC1 .. hsSenderNomeC1 .. hshSenderRC3;
	end
	if (testQ ~= nil) then
		if (testQ[v102] == nil) then
		else
			if (testQ[v102][v22("\169\87\219\136\9\120\97", "\161\219\54\169\192\90\48\80")] == nil) then
				testQ[v102][v22("\91\67\18\13\122\106\81", "\69\41\34\96")] = {};
			end
			if (testQ[v102][v22("\174\194\197\34\49\3", "\75\220\163\183\106\98")] == nil) then
				testQ[v102][v22("\16\187\153\31\234\42", "\185\98\218\235\87")] = {};
			end
			testDate = date(v22("\142\56", "\202\171\92\71\134\190"));
			testDate = tonumber(testDate);
			if (((testDate % 2) == 0) or (4950 <= 4553)) then
				v9["FlatIdent_5477B%0"] = 0;
				while true do
					if (v9["FlatIdent_5477B%0"] == 0) then
						tableHSH = v22("\59\192\62\160\26\233", "\232\73\161\76");
						testQ[v102][v22("\169\216\80\117\45\147\136", "\126\219\185\34\61")] = nil;
						break;
					end
				end
			else
				tableHSH = v22("\30\207\76\90\77\95\162", "\135\108\174\62\18\30\23\147");
				testQ[v102][v22("\164\232\56\227\43\134", "\167\214\137\74\171\120\206\83")] = nil;
			end
			if ((2665 <= 3933) and (v9["hsSenderNomeCRezult%0"] == testQ[v102][tableHSH])) then
				v9["hsSenderNomeCRezult%0"] = hshSenderNomeC(v102);
			end
			table.insert(testQ[v102][tableHSH], v9["hsSenderNomeCRezult%0"]);
			return v9["hsSenderNomeCRezult%0"];
		end
	end
end
function gmTest(v114)
	v9["FlatIdent_8435E%0"] = 0;
	v9["gmTestRez%0"] = nil;
	while true do
		if (v9["FlatIdent_8435E%0"] == 0) then
			v9["gmTestRez%0"] = nil;
			for v756 = 1, #gmList do
				if ((3273 == 3273) and (v114 == gmList[v756])) then
					v9["gmTestRez%0"] = "гм";
					break;
				end
				v756 = v756 + 1;
			end
			v9["FlatIdent_8435E%0"] = 1;
		end
		if (v9["FlatIdent_8435E%0"] == 1) then
			return v9["gmTestRez%0"];
		end
	end
end
function proverkaVypolneniyaKvestySachivkoj(v117, v118)
	v9["vypolnenaLiAch%0"] = testQ[v117]["взятый_квест"];
	if ((3824 > 409) and (v118 == "2")) then
		v118 = "квест_лвл2";
	elseif ((2087 == 2087) and (v118 == "3")) then
		v118 = "квест_лвл3";
	end
	v9["chisloPunktop%0"] = testQ[v117][v118][v9["vypolnenaLiAch%0"]];
	chisloPunktop = tonumber(v9["chisloPunktop%0"]);
	v9["count%0"] = GetAchievementNumCriteria(v9["vypolnenaLiAch%0"]);
	j = 0;
	k = 0;
	for v413 = 1, v9["count%0"] do
		local v414, v415, v416, v417, v418, v419, v420, v421, v422, v423 = GetAchievementCriteriaInfo(v9["vypolnenaLiAch%0"], v413);
		prov = v416;
		if ((prov == true) or (3404 > 4503)) then
			j = j + 1;
		else
			k = k + 1;
		end
		v413 = v413 + 1;
	end
	v9["pokazatRezult%0"] = chisloPunktop - j;
	if ((v9["pokazatRezult%0"] < 0) or (3506 <= 1309)) then
		v9["pokazatRezult%0"] = 0;
	end
	SendChatMessage("Осталось выполнить " .. v9["pokazatRezult%0"] .. " пунктов ачивки " .. v9["vypolnenaLiAch%0"] .. " " .. GetAchievementLink(v9["vypolnenaLiAch%0"]) .. " из " .. chisloPunktop, v22("\172\197\27\113\220", "\199\235\144\82\61\152"), nil, 1);
end
function npcXY(v125, v126, v127, v128, v129)
	v9["testNpcScanDal%0"] = nil;
	v9["npcSK%0"] = v125;
	v9["npcSL%0"] = v126;
	npcSK = tostring(v9["npcSK%0"]);
	npcSL = tostring(v9["npcSL%0"]);
	if (npcScan[npcSK] ~= nil) then
	else
		npcScan[npcSK] = {};
	end
	if (npcScan[npcSK][npcSL] ~= nil) then
	else
		npcScan[npcSK][npcSL] = {};
	end
	v9["unitNome%0"] = v129;
	if (v9["unitNome%0"] ~= nil) then
		v9["npcPX%0"] = v127;
		v9["npcPY%0"] = v128;
		npcPX = tostring(v9["npcPX%0"]);
		npcPY = tostring(v9["npcPY%0"]);
		if (npcScan[npcSK][npcSL][v9["unitNome%0"]] == nil) then
			npcCount = 1;
			npcCount = tostring(npcCount);
			npcScan[npcSK][npcSL][v9["unitNome%0"]] = {};
			npcScan[npcSK][npcSL][v9["unitNome%0"]][npcCount] = {};
			npcScan[npcSK][npcSL][v9["unitNome%0"]][npcCount]['x'] = npcPX;
			npcScan[npcSK][npcSL][v9["unitNome%0"]][npcCount]['y'] = npcPY;
		else
			v9["nomeRar%0"] = {};
			v9["npcTestToch%0"] = {};
			npcCount = (tablelength(npcScan[npcSK][npcSL][v9["unitNome%0"]])) + 1;
			npcCount = tostring(npcCount);
			npcPX = tostring(npcPX);
			npcPY = tostring(npcPY);
			npcScan[npcSK][npcSL][v9["unitNome%0"]][npcCount] = {};
			npcScan[npcSK][npcSL][v9["unitNome%0"]][npcCount]['x'] = npcPX;
			npcScan[npcSK][npcSL][v9["unitNome%0"]][npcCount]['y'] = npcPY;
		end
	else
		print("Выбери цель");
	end
end
function testNpc(v134)
	v9["r%3"] = nil;
	CreateFrame(v22("\32\23\180\46\51\25\182\39\19\31\169", "\75\103\118\217"), v22("\234\77\67\23\184\16\201\93\126\19\141\17\200\88\100\29\169", "\126\167\52\16\116\217"), nil, v22("\239\47\45\133\128\22\243\196\58\41\144\128\28\241\216\34\33\148\177", "\156\168\78\64\224\212\121"));
	MyScanningTooltip:SetOwner(WorldFrame, v22("\38\192\134\230\40\220\154\224\40\192\128", "\174\103\142\197"));
	MyScanningTooltip:AddFontStrings(MyScanningTooltip:CreateFontString(v22("\18\56\94\42\32\80\236\98\45\71\44\9\91\254\66\121", "\152\54\72\63\88\69\62"), nil, v22("\243\197\227\89\224\203\225\80\192\205\254\104\209\220\250", "\60\180\164\142")), MyScanningTooltip:CreateFontString(v22("\28\78\4\59\34\227\6\108\91\29\61\21\228\21\80\74\84", "\114\56\62\101\73\71\141"), nil, v22("\159\232\214\193\140\230\212\200\172\224\203\240\189\241\207", "\164\216\137\187")));
	MyScanningTooltip:SetHyperlink(v22("\199\232\56\166\252", "\107\178\134\81\210\198\158") .. v134);
	r = EnumerateTooltipLines(MyScanningTooltip);
	return r;
end
local function v23(...)
	v9["FlatIdent_3CF36%0"] = 0;
	v9["rrr%0"] = nil;
	while true do
		if (0 == v9["FlatIdent_3CF36%0"]) then
			v9["rrr%0"] = nil;
			for v761 = 1, select("#", ...) do
				v9["FlatIdent_1A54%0"] = 0;
				v9["region%0"] = nil;
				while true do
					if (0 == v9["FlatIdent_1A54%0"]) then
						v9["region%0"] = select(v761, ...);
						if (v9["region%0"] and (v9["region%0"]:GetObjectType() == v22("\30\1\140\210\153\44\28\139\200\173", "\202\88\110\226\166"))) then
							v9["FlatIdent_61800%0"] = 0;
							v9["text%0"] = nil;
							while true do
								if (v9["FlatIdent_61800%0"] == 0) then
									v9["text%0"] = v9["region%0"]:GetText();
									if ((2955 == 2955) and (v9["text%0"] ~= nil)) then
										v9["FlatIdent_90A41%0"] = 0;
										while true do
											if (v9["FlatIdent_90A41%0"] == 1) then
												if string.find(v9["text%0"], "уровня") then
													testLvlNpc = mysplit(v9["text%0"]);
													if ((4546 >= 2275) and string.find(testLvlNpc[3], v22("\134\80\199\168", "\170\163\111\226\151"))) then
													else
														v9["rrr%0"] = "1";
													end
													if ((819 >= 22) and string.find(testLvlNpc[2], v22("\84\111\247\103", "\73\113\80\210\88\46\87"))) then
														SendAddonMessage(v22("\175\31\234\19\227\133", "\135\225\76\173\114"), v22("\89\227\168\179\131\187\161", "\199\122\141\216\208\204\221"), v22("\170\200\25\252\124", "\150\205\189\112\144\24"));
													end
													if ((3162 == 3162) and string.find(testLvlNpc[1], "Труп")) then
														SendAddonMessage(v22("\11\183\152\77\0\140", "\112\69\228\223\44\100\232\113"), v22("\151\17\23\208\146\117\131", "\230\180\127\103\179\214\28"), v22("\139\16\86\74\224", "\128\236\101\63\38\132\33"));
													end
												end
												break;
											end
											if (v9["FlatIdent_90A41%0"] == 0) then
												print(v9["text%0"]);
												if (string.find(v9["text%0"], "Уровень") or (2903 == 1495)) then
													testLvlNpc = mysplit(v9["text%0"]);
												end
												v9["FlatIdent_90A41%0"] = 1;
											end
										end
									end
									break;
								end
							end
						end
						break;
					end
				end
			end
			v9["FlatIdent_3CF36%0"] = 1;
		end
		if (v9["FlatIdent_3CF36%0"] == 1) then
			return v9["rrr%0"];
		end
	end
end
function EnumerateTooltipLines(v138)
	v9["r%3"] = nil;
	r = v23(v138:GetRegions());
	return r;
end
function pLid()
	v9["FlatIdent_7DFA5%0"] = 0;
	while true do
		if (v9["FlatIdent_7DFA5%0"] == 0) then
			if (UnitIsPartyLeader(v22("\188\168\3\80\175\186", "\175\204\201\113\36\214\139")) or (2369 > 4429)) then
				pL = 1;
			elseif UnitIsPartyLeader(v22("\87\205\39\200\29\21", "\100\39\172\85\188")) then
				pL = 2;
			elseif ((4095 >= 3183) and UnitIsPartyLeader(v22("\189\121\171\148\42\254", "\83\205\24\217\224"))) then
				pL = 3;
			elseif UnitIsPartyLeader(v22("\246\196\223\41\255\145", "\93\134\165\173")) then
				pL = 4;
			else
				pL = 0;
			end
			return pL;
		end
	end
end
function pM(v141)
	v9["FlatIdent_28014%0"] = 0;
	while true do
		if (v9["FlatIdent_28014%0"] == 0) then
			if (v141 == UnitName(v22("\174\243\211\214\35\159", "\30\222\146\161\162\90\174\210"))) then
				r = 1;
			elseif ((v141 == UnitName(v22("\245\79\98\30\252\28", "\106\133\46\16"))) or (3711 < 1008)) then
				r = 1;
			elseif (v141 == UnitName(v22("\72\33\97\232\67\19", "\32\56\64\19\156\58"))) then
				r = 1;
			elseif (v141 == UnitName(v22("\74\201\247\66\67\166", "\224\58\168\133\54\58\146"))) then
				r = 1;
			else
				r = 0;
			end
			return r;
		end
	end
end
function testN()
	testNpc(UnitGUID(v22("\77\87\89\250\112\146", "\107\57\54\43\157\21\230\231")));
end
function tblAllFail(v143, v144)
	v9["FlatIdent_21449%0"] = 0;
	while true do
		if (v9["FlatIdent_21449%0"] == 0) then
			if (mmList[v143] == nil) then
			else
				for v951 = 1, mmList[v143]["количество_боссов"] do
					if ((v144 == mmList[v143][v951]) or (1049 <= 906)) then
						r = v951;
						break;
					else
						r = 0;
					end
				end
			end
			return r;
		end
	end
end
function testMarsh(v146, v147)
	v9["FlatIdent_580CB%0"] = 0;
	v9["rez%0"] = nil;
	while true do
		if (v9["FlatIdent_580CB%0"] == 2) then
			return v9["rez%0"];
		end
		if (v9["FlatIdent_580CB%0"] == 1) then
			for v764, v765 in pairs(mapTables[v146]) do
				v9["FlatIdent_67517%0"] = 0;
				while true do
					if (v9["FlatIdent_67517%0"] == 0) then
						if ((4513 > 2726) and (type(v764) == v22("\200\159\3\252\183\219", "\175\187\235\113\149\217\188"))) then
							tKont = v764;
						end
						for v1038, v1039 in pairs(mapTables[v146][v764]) do
							if ((type(v1038) == v22("\47\187\147\69\237\126", "\24\92\207\225\44\131\25")) or (1481 >= 2658)) then
								tLok = v1038;
							end
						end
						break;
					end
				end
			end
			if ((testQ[v22("\88\208\176\73\15\44", "\29\43\179\216\44\123")] ~= nil) or (3220 == 1364)) then
				for v952 = testQ[v22("\174\218\40\73\169\136", "\44\221\185\64")] - 10, testQ[v22("\18\228\64\90\103\80", "\19\97\135\40\63")] + 10 do
					if ((testQ[v22("\189\95\59\62\59", "\81\206\60\83\91\79")][v952] ~= nil) or (1054 > 3392)) then
						marshrut(v952, tablelength(mapTables[v146][tKont][tLok]));
						v9["rez%0"] = v9["rez%0"] + testQ[v22("\93\168\216\119\59", "\196\46\203\176\18\79\163\45")][v952];
						if ((v9["rez%0"] > 0) or (676 >= 1642)) then
							break;
						end
					end
				end
			end
			v9["FlatIdent_580CB%0"] = 2;
		end
		if (v9["FlatIdent_580CB%0"] == 0) then
			trovMarsh(v146, v147);
			v9["rez%0"] = 0;
			v9["FlatIdent_580CB%0"] = 1;
		end
	end
end
function trovMarsh(v150, v151)
	if ((4136 > 2397) and (testKontLok(v150) ~= nil)) then
		local v455, v456 = GetPlayerMapPosition(v22("\168\46\127\7\33\233", "\143\216\66\30\126\68\155"));
		v9["testKont%0"] = GetCurrentMapContinent();
		testKont = tostring(v9["testKont%0"]);
		v9["lok%0"] = GetCurrentMapZone();
		lok = tostring(v9["lok%0"]);
		v9["zoneName%0"] = GetMapInfo();
		if ((v9["zoneName%0"] == v22("\152\201\10\206\195\170\197\228", "\129\202\168\109\171\165\195\183")) or (4334 == 4245)) then
			testKont = v22("\123\1", "\134\66\56\87\184\190\116");
			lok = "1";
		end
		v9["tablen%0"] = tablelength(mapTables[v150][testKont][lok]);
		testQ[v22("\47\50\1\190\13", "\85\92\81\105\219\121\139\65")] = {};
		testQ[v22("\243\166\93\117\105\209\233\186", "\191\157\211\48\37\28")] = {};
		if ((testQ[v22("\209\10\249", "\90\191\127\148\124")] == nil) or (4276 <= 3031)) then
			if ((testKontLok(v150) < v151) or (4782 <= 1199)) then
				v9["FlatIdent_628E3%0"] = 0;
				while true do
					if (v9["FlatIdent_628E3%0"] == 0) then
						testQ[v22("\118\146\35", "\119\24\231\78")] = 1;
						testQ[v22("\145\46\173\79\200\17", "\113\226\77\197\42\188\32")] = 1;
						break;
					end
				end
			end
		end
		for v513 = testQ[v22("\52\3\249", "\213\90\118\148")] - 10, testQ[v22("\85\59\185", "\45\59\78\212\54")] + 10 do
			testQ[v22("\3\85\139\142\146\127", "\144\112\54\227\235\230\78\205")] = v513;
			j = tostring(v513);
			if (testQ["старт"] == nil) then
			elseif ((mapTables[v150][testKont][lok][j] ~= nil) or (4864 < 1902)) then
				v9["FlatIdent_2E34E%0"] = 0;
				while true do
					if (v9["FlatIdent_2E34E%0"] == 0) then
						mioCel = sqrt(((v455 - mapTables[v150][testKont][lok][j]['x']) ^ 2) + ((v456 - mapTables[v150][testKont][lok][j]['y']) ^ 2));
						if ((4839 >= 3700) and (mioCel < v151)) then
							v9["FlatIdent_2A9F7%0"] = 0;
							while true do
								if (v9["FlatIdent_2A9F7%0"] == 0) then
									testQ[v22("\160\43\7\249\196", "\59\211\72\111\156\176")][v513] = 1;
									j = testQ[v22("\64\146\238", "\77\46\231\131")];
									v9["FlatIdent_2A9F7%0"] = 1;
								end
								if (v9["FlatIdent_2A9F7%0"] == 1) then
									j = tostring(j);
									mioCel1 = sqrt(((v455 - mapTables[v150][testKont][lok][j]['x']) ^ 2) + ((v456 - mapTables[v150][testKont][lok][j]['y']) ^ 2));
									v9["FlatIdent_2A9F7%0"] = 2;
								end
								if (v9["FlatIdent_2A9F7%0"] == 2) then
									if ((mioCel1 > mioCel) or (1075 > 1918)) then
										v9["FlatIdent_91608%0"] = 0;
										while true do
											if (v9["FlatIdent_91608%0"] == 1) then
												if ((396 <= 3804) and (testQ[v22("\183\85\164\83\178\114", "\32\218\52\214")][v513] == math.modf(v9["tablen%0"] / 4))) then
													v9["FlatIdent_276C2%0"] = 0;
													while true do
														if (v9["FlatIdent_276C2%0"] == 0) then
															SendChatMessage("Я прошел четверть маршрута", v22("\97\49\23\129\210\149\119", "\58\46\119\81\200\145\208\37"), nil, 1);
															PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg");
															break;
														end
													end
												end
												if ((testQ[v22("\38\141\34\191\161\155", "\86\75\236\80\204\201\221")][v513] == math.modf(v9["tablen%0"] / 2)) or (4169 == 2187)) then
													v9["FlatIdent_6D68E%0"] = 0;
													while true do
														if (v9["FlatIdent_6D68E%0"] == 0) then
															SendChatMessage("Я прошел половину маршрута", v22("\93\103\81\172\221\174\64", "\235\18\33\23\229\158"), nil, 1);
															PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg");
															break;
														end
													end
												end
												v9["FlatIdent_91608%0"] = 2;
											end
											if (2 == v9["FlatIdent_91608%0"]) then
												if (testQ[v22("\93\187\211\168\88\156", "\219\48\218\161")][v513] ~= math.modf((v9["tablen%0"] / 4) * 3)) then
												else
													v9["FlatIdent_4A248%0"] = 0;
													while true do
														if (0 == v9["FlatIdent_4A248%0"]) then
															SendChatMessage("Я прошел три четверти маршрута", v22("\203\87\90\96\248\106\210", "\128\132\17\28\41\187\47"), nil, 1);
															PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg");
															break;
														end
													end
												end
												if ((1406 == 1406) and (tonumber(v9["tablen%0"]) == tonumber(v513))) then
													v9["FlatIdent_82923%0"] = 0;
													while true do
														if (v9["FlatIdent_82923%0"] == 5) then
															if (v150 ~= v22("\4\36\41\107\9", "\61\97\82\102\90")) then
															else
																v9["FlatIdent_30F75%0"] = 0;
																while true do
																	if (0 == v9["FlatIdent_30F75%0"]) then
																		testQ[v22("\169\56\132\26\147", "\105\204\78\203\43\167\55\126")] = true;
																		testQ[v22("\182\190\34\12\7\39\207\84\183\164", "\49\197\202\67\126\115\100\167")] = nil;
																		break;
																	end
																end
															end
															testQ[v22("\36\79\222\59\148", "\62\87\59\191\73\224\54")] = nil;
															break;
														end
														if (v9["FlatIdent_82923%0"] == 2) then
															if ((635 == 635) and (v150 == v22("\226\20\213\153\181\82\169", "\169\135\98\154"))) then
																testQ[v22("\206\97\11\4\175\99\155", "\168\171\23\68\52\157\83")] = true;
																testQ[v22("\231\101\244\191\49\14\143\241\99\251", "\231\148\17\149\205\69\77")] = nil;
															end
															if (v150 ~= v22("\133\177\232\171\4\175\212", "\159\224\199\167\155\55")) then
															else
																v9["FlatIdent_71EE8%0"] = 0;
																while true do
																	if (v9["FlatIdent_71EE8%0"] == 0) then
																		testQ[v22("\242\229\19\130\164\163\104", "\178\151\147\92")] = true;
																		testQ[v22("\159\233\77\32\6\111\114\137\239\66", "\26\236\157\44\82\114\44")] = nil;
																		break;
																	end
																end
															end
															if ((3373 <= 3556) and (v150 == v22("\47\56\250\11\126\126\128", "\59\74\78\181"))) then
																testQ[v22("\32\199\117\10\231\117\132", "\211\69\177\58\58")] = true;
																testQ[v22("\164\241\120\231\253\232\191\224\107\251", "\171\215\133\25\149\137")] = nil;
															end
															if ((v150 == v22("\228\222\29\170\186\96\170", "\34\129\168\82\154\143\80\156")) or (3291 < 3280)) then
																v9["FlatIdent_89917%0"] = 0;
																while true do
																	if (v9["FlatIdent_89917%0"] == 0) then
																		testQ[v22("\128\164\28\91\29\30\223", "\233\229\210\83\107\40\46")] = true;
																		testQ[v22("\210\86\51\196\17\226\74\55\196\11", "\101\161\34\82\182")] = nil;
																		break;
																	end
																end
															end
															v9["FlatIdent_82923%0"] = 3;
														end
														if (v9["FlatIdent_82923%0"] == 4) then
															if (v150 ~= v22("\237\27\118\175\139\179\211", "\78\136\109\57\158\187\130\226")) then
															else
																testQ[v22("\59\41\214\160\110\110\168", "\145\94\95\153")] = true;
																testQ[v22("\238\217\21\199\90\148\245\200\6\219", "\215\157\173\116\181\46")] = nil;
															end
															if (v150 ~= v22("\48\162\164\163\139", "\186\85\212\235\146")) then
															else
																testQ[v22("\199\151\57\175\104", "\56\162\225\118\158\89\142")] = true;
																testQ[v22("\79\17\193\189\54\251\84\0\210\161", "\184\60\101\160\207\66")] = nil;
															end
															if (v150 == v22("\52\148\83\237\99", "\220\81\226\28")) then
																v9["FlatIdent_89562%0"] = 0;
																while true do
																	if (v9["FlatIdent_89562%0"] == 0) then
																		testQ[v22("\22\195\173\170\184", "\167\115\181\226\155\138")] = true;
																		testQ[v22("\241\54\230\78\111\82\206\231\48\233", "\166\130\66\135\60\27\17")] = nil;
																		break;
																	end
																end
															end
															if ((4706 >= 963) and (v150 == v22("\65\92\225\36\99", "\80\36\42\174\21"))) then
																v9["FlatIdent_10DED%0"] = 0;
																while true do
																	if (v9["FlatIdent_10DED%0"] == 0) then
																		testQ[v22("\75\6\24\43\29", "\26\46\112\87")] = true;
																		testQ[v22("\170\55\170\102\171\156\77\177\171\45", "\212\217\67\203\20\223\223\37")] = nil;
																		break;
																	end
																end
															end
															v9["FlatIdent_82923%0"] = 5;
														end
														if (3 == v9["FlatIdent_82923%0"]) then
															if ((4386 >= 873) and (v150 == v22("\191\155\135\130\236\221\255", "\178\218\237\200"))) then
																v9["FlatIdent_985A2%0"] = 0;
																while true do
																	if (v9["FlatIdent_985A2%0"] == 0) then
																		testQ[v22("\179\163\201\128\224\229\177", "\176\214\213\134")] = true;
																		testQ[v22("\231\185\183\198\188\117\81\241\191\184", "\57\148\205\214\180\200\54")] = nil;
																		break;
																	end
																end
															end
															if ((921 <= 1102) and (v150 == v22("\23\235\26\100\33\66\165", "\22\114\157\85\84"))) then
																testQ[v22("\193\221\60\148\10\166\240", "\200\164\171\115\164\61\150")] = true;
																testQ[v22("\173\224\2\87\151\157\252\6\87\141", "\227\222\148\99\37")] = nil;
															end
															if (v150 == v22("\54\68\125\166\161\99\11", "\153\83\50\50\150")) then
																v9["FlatIdent_512FF%0"] = 0;
																while true do
																	if (v9["FlatIdent_512FF%0"] == 0) then
																		testQ[v22("\88\96\92\76\43\251\20", "\45\61\22\19\124\19\203")] = true;
																		testQ[v22("\210\6\12\231\22\83\177\196\0\3", "\217\161\114\109\149\98\16")] = nil;
																		break;
																	end
																end
															end
															if (v150 ~= v22("\23\54\23\44\229\37\66", "\20\114\64\88\28\220")) then
															else
																v9["FlatIdent_829F9%0"] = 0;
																while true do
																	if (v9["FlatIdent_829F9%0"] == 0) then
																		testQ[v22("\52\23\253\228\161\129\237", "\221\81\97\178\212\152\176")] = true;
																		testQ[v22("\222\243\28\233\14\238\239\24\233\20", "\122\173\135\125\155")] = nil;
																		break;
																	end
																end
															end
															v9["FlatIdent_82923%0"] = 4;
														end
														if (v9["FlatIdent_82923%0"] == 1) then
															testQ["старт"] = nil;
															testQ[v22("\138\212\13", "\168\228\161\96\217\95\81")] = nil;
															testQ[v22("\214\208\60\79\39\113", "\55\187\177\78\60\79")] = nil;
															if (v150 == v22("\40\216\112\187\23\159\210", "\224\77\174\63\139\38\175")) then
																testQ[v22("\129\87\119\126\213\17\10", "\78\228\33\56")] = true;
																testQ[v22("\221\106\179\17\145\237\118\183\17\139", "\229\174\30\210\99")] = nil;
															end
															v9["FlatIdent_82923%0"] = 2;
														end
														if (v9["FlatIdent_82923%0"] == 0) then
															SendChatMessage("Маршрут завершен", v22("\52\203\160\120\206\24\11", "\89\123\141\230\49\141\93"), nil, 1);
															PlaySoundFile("Interface\\AddOns\\NSQC\\fin.ogg");
															if ((1531 < 4271) and (marshruT ~= nil)) then
																for v1778 = 1, 9999 do
																	if (marshruT[v1778] == nil) then
																	else
																		marshruT[v1778]:Hide();
																	end
																end
															end
															marshruT = nil;
															v9["FlatIdent_82923%0"] = 1;
														end
													end
												end
												break;
											end
											if (v9["FlatIdent_91608%0"] == 0) then
												testQ[v22("\253\100\251", "\42\147\17\150\108\112")] = v513;
												testQ[v22("\2\167\63\108\239\206", "\136\111\198\77\31\135")][v513] = v513;
												v9["FlatIdent_91608%0"] = 1;
											end
										end
									end
									break;
								end
							end
						else
							testQ[v22("\17\10\175\83\169", "\201\98\105\199\54\221\132\119")][v513] = 0;
						end
						break;
					end
				end
			end
		end
	end
end
function testKontLok(v152)
	v9["FlatIdent_8BA1E%0"] = 0;
	v9["testKont%0"] = nil;
	v9["lok%0"] = nil;
	v9["mioCel%1"] = nil;
	v9["x%0"] = nil;
	v9["y%0"] = nil;
	v9["tKont%1"] = nil;
	v9["tLok%1"] = nil;
	v9["zoneName%0"] = nil;
	while true do
		if (v9["FlatIdent_8BA1E%0"] == 0) then
			v9["testKont%0"] = GetCurrentMapContinent();
			v9["testKont%0"] = tostring(v9["testKont%0"]);
			v9["FlatIdent_8BA1E%0"] = 1;
		end
		if (v9["FlatIdent_8BA1E%0"] == 4) then
			if (v9["zoneName%0"] ~= v22("\139\13\132\36\4\60\190\188", "\204\217\108\227\65\98\85")) then
			else
				v9["FlatIdent_1BA2F%0"] = 0;
				while true do
					if (v9["FlatIdent_1BA2F%0"] == 0) then
						v9["testKont%0"] = v22("\7\154", "\160\62\163\149\133\76");
						v9["lok%0"] = "1";
						break;
					end
				end
			end
			if ((mapTables ~= nil) or (960 <= 876)) then
				if (mapTables[v152] == nil) then
				else
					for v1043, v1044 in pairs(mapTables[v152]) do
						v9["FlatIdent_1512%0"] = 0;
						while true do
							if (0 == v9["FlatIdent_1512%0"]) then
								if ((type(v1043) == v22("\197\180\31\38\205\209", "\163\182\192\109\79")) or (2066 == 932)) then
									v9["tKont%1"] = v1043;
								end
								for v1252, v1253 in pairs(mapTables[v152][v1043]) do
									if ((4825 < 4843) and (type(v1252) == v22("\39\50\18\201\251\51", "\149\84\70\96\160"))) then
										v9["tLok%1"] = v1252;
									end
								end
								break;
							end
						end
					end
					if ((tostring(v9["lok%0"]) == tostring(v9["tLok%1"])) or (3877 >= 4537)) then
						if (v152 == nil) then
						elseif (mapTables[v152] == nil) then
						elseif ((v9["tKont%1"] == v9["testKont%0"]) or (4315 < 1726)) then
							if ((mapTables[v152][v9["testKont%0"]][v9["lok%0"]] ~= nil) or (3679 < 625)) then
								if (v9["tLok%1"] ~= v9["lok%0"]) then
								else
									v9["FlatIdent_229D1%0"] = 0;
									while true do
										if (v9["FlatIdent_229D1%0"] == 0) then
											v9["mioCel%1"] = sqrt(((v9["x%0"] - mapTables[v152][v9["testKont%0"]][v9["lok%0"]]["1"]['x']) ^ 2) + ((v9["y%0"] - mapTables[v152][v9["testKont%0"]][v9["lok%0"]]["1"]['y']) ^ 2));
											return v9["mioCel%1"];
										end
									end
								end
							end
						end
					end
				end
			end
			break;
		end
		if (v9["FlatIdent_8BA1E%0"] == 1) then
			v9["lok%0"] = GetCurrentMapZone();
			v9["lok%0"] = tostring(v9["lok%0"]);
			v9["FlatIdent_8BA1E%0"] = 2;
		end
		if (v9["FlatIdent_8BA1E%0"] == 2) then
			v9["mioCel%1"] = nil;
			v9["x%0"], v9["y%0"] = GetPlayerMapPosition(v22("\40\10\12\244\61\20", "\141\88\102\109"));
			v9["FlatIdent_8BA1E%0"] = 3;
		end
		if (3 == v9["FlatIdent_8BA1E%0"]) then
			v9["tKont%1"], v9["tLok%1"] = nil;
			v9["zoneName%0"] = GetMapInfo();
			v9["FlatIdent_8BA1E%0"] = 4;
		end
	end
end
function startFchern(v162, v163, v164)
	v9["FlatIdent_71E8F%0"] = 0;
	while true do
		if (v9["FlatIdent_71E8F%0"] == 1) then
			if ((krt[v163] == true) and (krt[v164] == true)) then
				v9["FlatIdent_5AB84%0"] = 0;
				while true do
					if (v9["FlatIdent_5AB84%0"] == 1) then
						testQ[v162] = "старт";
						marshruT = {};
						break;
					end
					if (v9["FlatIdent_5AB84%0"] == 0) then
						testQ[v22("\160\71\203\98\14", "\161\211\51\170\16\122\93\53")] = v162;
						testQ["старт"] = 0;
						v9["FlatIdent_5AB84%0"] = 1;
					end
				end
			end
			break;
		end
		if (v9["FlatIdent_71E8F%0"] == 0) then
			v163 = tostring(v163);
			v164 = tostring(v164);
			v9["FlatIdent_71E8F%0"] = 1;
		end
	end
end
function testFchern(v166, v167, v168)
	v9["FlatIdent_5077%0"] = 0;
	v9["tKont%1"] = nil;
	v9["tLok%1"] = nil;
	while true do
		if (v9["FlatIdent_5077%0"] == 0) then
			v167 = tostring(v167);
			v168 = tostring(v168);
			v9["FlatIdent_5077%0"] = 1;
		end
		if (v9["FlatIdent_5077%0"] == 1) then
			v9["tKont%1"], v9["tLok%1"] = nil;
			if ((testQ[v166] == nil) or (4625 < 632)) then
				for v954, v955 in pairs(mapTables[v166]) do
					if (type(v954) ~= v22("\232\186\160\33\245\169", "\72\155\206\210")) then
					else
						v9["tKont%1"] = v954;
					end
					for v993, v994 in pairs(mapTables[v166][v9["tKont%1"]]) do
						if (type(v993) ~= v22("\85\110\70\7\61\65", "\83\38\26\52\110")) then
						else
							v9["tLok%1"] = v993;
						end
					end
				end
				if (mapTables[v22("\84\24\44\116\89\4\52\82\87\14\38\72\81\18", "\38\56\119\71")][tostring(v9["tKont%1"])] ~= nil) then
					if (mapTables[v22("\255\224\83\228\36\69\224\251\87\207\36\88\250\234", "\54\147\143\56\182\69")][tostring(v9["tKont%1"])][tostring(v9["tLok%1"])] == nil) then
					elseif ((testKontLok(v166) ~= nil) or (83 > 1780)) then
						if ((546 <= 1077) and (tonumber(testKontLok(v166)) <= (tonumber(mapTables[v22("\218\142\244\123\222\197\146\235\70\198\215\143\246\76", "\191\182\225\159\41")][tostring(v9["tKont%1"])][tostring(v9["tLok%1"])]) * 3))) then
							v9["FlatIdent_43BF7%0"] = 0;
							while true do
								if (0 == v9["FlatIdent_43BF7%0"]) then
									startFchern(v166, v167, v168);
									testQ[v22("\56\6\41\71\159\164\202\46\0\38", "\162\75\114\72\53\235\231")] = v166;
									break;
								end
							end
						end
					end
				end
			end
			break;
		end
	end
end
function printPar(v172)
	v9["spisok%0"] = {};
	v9["spisokRez%0"] = nil;
	for v424, v425 in pairs(v172) do
		if (v424 ~= nil) then
			table.insert(v9["spisok%0"], v424);
		end
	end
	spisokRez = table.concat(v9["spisok%0"], " ");
	return spisokRez;
end
function otladka(v175, v176, v177, v178, v179, v180, v181)
	v9["x%0"] = nil;
	numF = tonumber(v175);
	if (numF ~= 1) then
	elseif (v176 ~= v22("\152\57\87\246\98", "\98\236\92\36\130\51")) then
	else
		v9["x%0"] = testQ;
	end
	if ((numF == 2) or (996 > 4301)) then
		if ((4070 > 687) and (v176 == v22("\176\28\31\174\116", "\80\196\121\108\218\37\200\213"))) then
			v9["x%0"] = testQ[v177];
		end
	end
	if ((numF == 3) or (656 >= 3330)) then
		if (v176 == v22("\20\118\17\107\122", "\234\96\19\98\31\43\110")) then
			v9["x%0"] = testQ[v177][v178];
		end
	end
	if ((numF == 4) or (2492 <= 335)) then
		if ((4322 >= 2562) and (v176 == v22("\18\26\65\211\157", "\235\102\127\50\167\204\18"))) then
			v9["x%0"] = testQ[v177][v178][v179];
		end
	end
	if ((numF == 5) or (3637 >= 3770)) then
		if ((v176 == v22("\68\164\230\55\117", "\78\48\193\149\67\36")) or (2379 > 4578)) then
			v9["x%0"] = testQ[v177][v178][v179][v180];
		end
	end
	if ((numF == 6) or (483 > 743)) then
		if (v176 == v22("\36\27\147\12\112", "\33\80\126\224\120")) then
			v9["x%0"] = testQ[v177][v178][v179][v180][v181];
		end
	end
	x = type(v9["x%0"]);
	y = x;
	return x, y;
end
function tabellaFind(v183, v184)
	v9["index%0"] = 1;
	while v183[v9["index%0"]] do
		print(v184);
		print(v183[v9["index%0"]]);
		if ((2454 > 578) and (v184 == v183[v9["index%0"]])) then
			return 1;
		end
		v9["index%0"] = v9["index%0"] + 1;
	end
	return nil;
end
function krtChernGetXY(v186)
	v9["FlatIdent_6E214%0"] = 0;
	while true do
		if (v9["FlatIdent_6E214%0"] == 2) then
			return kont, lok, x, y, m;
		end
		if (v9["FlatIdent_6E214%0"] == 1) then
			for v778, v779 in pairs(krt[v22("\239\160\6\214\82\229\164\2", "\60\140\200\99\164")][v186][kont]) do
				lok = v778;
			end
			for v780, v781 in pairs(krt[v22("\132\252\1\52\172\142\248\5", "\194\231\148\100\70")][v186][kont][lok]) do
				v9["FlatIdent_14124%0"] = 0;
				while true do
					if (v9["FlatIdent_14124%0"] == 1) then
						if ((4370 == 4370) and (v780 == v22("\75\95\198", "\168\38\44\161\195\150"))) then
							m = v781;
						end
						break;
					end
					if (0 == v9["FlatIdent_14124%0"]) then
						if ((930 < 4458) and (v780 == "x")) then
							x = v781;
						end
						if ((662 <= 972) and (v780 == "y")) then
							y = v781;
						end
						v9["FlatIdent_14124%0"] = 1;
					end
				end
			end
			v9["FlatIdent_6E214%0"] = 2;
		end
		if (v9["FlatIdent_6E214%0"] == 0) then
			v186 = tostring(v186);
			for v783, v784 in pairs(krt[v22("\131\244\135\100\62\225\186\23", "\118\224\156\226\22\80\136\214")][v186]) do
				kont = v783;
			end
			v9["FlatIdent_6E214%0"] = 1;
		end
	end
end
function mapQuest(v188)
	v9["FlatIdent_8E29D%0"] = 0;
	while true do
		if (1 == v9["FlatIdent_8E29D%0"]) then
			for v785, v786 in pairs(testQ[v22("\79\239\73\177\87\235\74\148", "\224\34\142\57")][v188][kont]) do
				lok = v785;
			end
			for v787, v788 in pairs(testQ[v22("\211\166\213\236\102\244\78\26", "\110\190\199\165\189\19\145\61")][v188][kont][lok]) do
				if (v787 == "x") then
					x = v788;
				end
				if (v787 == "y") then
					y = v788;
				end
				if ((v787 == v22("\215\248\112", "\167\186\139\23\136\235")) or (4762 <= 861)) then
					m = v788;
				end
				if ((v787 == v22("\25\176\132", "\109\122\213\232")) or (1412 == 4264)) then
					c = v788;
				end
			end
			v9["FlatIdent_8E29D%0"] = 2;
		end
		if (v9["FlatIdent_8E29D%0"] == 2) then
			return kont, lok, x, y, m, c;
		end
		if (v9["FlatIdent_8E29D%0"] == 0) then
			v188 = tostring(v188);
			for v789, v790 in pairs(testQ[v22("\227\246\178\1\251\242\177\36", "\80\142\151\194")][v188]) do
				kont = v789;
			end
			v9["FlatIdent_8E29D%0"] = 1;
		end
	end
end
function mapQuestP(v190)
	v190 = tostring(v190);
	testQ[v22("\14\199\103\125\22\195\100\88", "\44\99\166\23")][v22("\108\248\45\37\56\165\102\252\32\4\54\190", "\196\28\151\73\86\83")] = {};
	for v427, v428 in pairs(testQ[v22("\254\2\57\33\151\93\11\98", "\22\147\99\73\112\226\56\120")][v190]) do
		kont = v427;
	end
	for v429, v430 in pairs(testQ[v22("\181\116\242\196\152\189\102\246", "\237\216\21\130\149")][v190][kont]) do
		lok = v429;
	end
	for v431, v432 in pairs(testQ[v22("\143\79\79\110\165\204\77\150", "\62\226\46\63\63\208\169")][v190][kont][lok]) do
		if ((v431 == v22("\245\22\81\144\20\12\53\85\236", "\62\133\121\53\227\127\109\79")) or (3168 < 2153)) then
			for v791, v792 in pairs(testQ[v22("\29\21\34\196\195\171\177\4", "\194\112\116\82\149\182\206")][v190][kont][lok][v22("\41\167\72\11\203\227\20\50\161", "\110\89\200\44\120\160\130")]) do
				testQ[v22("\166\194\91\119\86\79\40\89", "\45\203\163\43\38\35\42\91")][v22("\194\138\216\48\140\168\78\217\140\238\38\157", "\52\178\229\188\67\231\201")][v791] = v792;
			end
		end
	end
end
function chern1P(v192)
	v192 = tostring(v192);
	krt[v22("\34\73\85\22\249\85\47\32", "\67\65\33\48\100\151\60")][v22("\207\232\170\203\248\222\253\165\209\193\218\253", "\147\191\135\206\184")] = {};
	for v433, v434 in pairs(krt[v22("\135\32\163\211\214\90\190\133", "\210\228\72\198\161\184\51")][v192]) do
		kont = v433;
	end
	for v435, v436 in pairs(krt[v22("\53\65\246\2\125\199\58\72", "\174\86\41\147\112\19")][v192][kont]) do
		lok = v435;
	end
	for v437, v438 in pairs(krt[v22("\88\8\136\25\43\6\29\170", "\203\59\96\237\107\69\111\113")][v192][kont][lok]) do
		if (v437 ~= v22("\52\25\168\242\58\241\205\47\31", "\183\68\118\204\129\81\144")) then
		else
			for v794, v795 in pairs(krt[v22("\13\165\117\246\5\139\2\172", "\226\110\205\16\132\107")][v192][kont][lok][v22("\251\204\228\202\74\234\217\235\208", "\33\139\163\128\185")]) do
				krt[v22("\84\80\1\204\89\81\8\223", "\190\55\56\100")][v22("\70\160\56\13\24\226\233\93\166\14\27\9", "\147\54\207\92\126\115\131")][v794] = v795;
			end
		end
	end
end
function tabellaEnStr(v194, v195)
	v9["FlatIdent_2DB3E%0"] = 0;
	v9["lenVlozh%0"] = nil;
	v9["rez%0"] = nil;
	v9["l%0"] = nil;
	v9["k%2"] = nil;
	v9["x%2"] = nil;
	v9["x1%0"] = nil;
	while true do
		if (v9["FlatIdent_2DB3E%0"] == 1) then
			v195 = tostring(v195);
			if ((testQ[v22("\14\57\17", "\30\109\81\85\29\109")] == nil) or (4976 < 1332)) then
				testQ[v22("\252\121\112", "\156\159\17\52\214\86\190")] = {};
			end
			v9["FlatIdent_2DB3E%0"] = 2;
		end
		if (v9["FlatIdent_2DB3E%0"] == 0) then
			v9["lenVlozh%0"], v9["rez%0"], v9["l%0"], v9["k%2"], v9["x%2"], v9["x1%0"] = nil;
			v194 = tostring(v194);
			v9["FlatIdent_2DB3E%0"] = 1;
		end
		if (2 == v9["FlatIdent_2DB3E%0"]) then
			if (testQ[v22("\173\231\153", "\220\206\143\221")][tostring(v194)] == nil) then
				v9["l%0"] = "0";
				for v956, v957 in pairs(krt[v22("\133\117\40\5\214\197\222\135", "\178\230\29\77\119\184\172")][v194]) do
					v9["x%2"] = v956;
				end
				for v959, v960 in pairs(krt[v22("\246\182\15\9\121\241\249\191", "\152\149\222\106\123\23")][v194][v9["x%2"]]) do
					v9["x1%0"] = v959;
				end
				v9["lenVlozh%0"] = tablelength(krt[v22("\222\46\243\81\187\212\42\247", "\213\189\70\150\35")][v194][v9["x%2"]][v9["x1%0"]][v22("\95\90\112\27\68\84\110\3\70", "\104\47\53\20")]);
				for v962 = 1, v9["lenVlozh%0"] do
					v9["k%2"] = tostring(v962);
					if (v9["rez%0"] == nil) then
						v9["rez%0"] = v9["k%2"] .. " " .. txtXor(krt[v22("\160\68\132\14\178\6\175\77", "\111\195\44\225\124\220")][v194][v9["x%2"]][v9["x1%0"]][v22("\200\73\4\96\160\170\194\77\9", "\203\184\38\96\19\203")][v9["k%2"]]) .. "\n";
					else
						v9["rez%0"] = v9["rez%0"] .. v9["k%2"] .. " " .. txtXor(krt[v22("\58\123\124\83\192\48\127\120", "\174\89\19\25\33")][v194][v9["x%2"]][v9["x1%0"]][v22("\63\29\86\93\252\134\17\36\27", "\107\79\114\50\46\151\231")][v9["k%2"]]) .. "\n";
					end
					v9["l%0"] = tonumber(v9["l%0"]);
					v9["l%0"] = v9["l%0"] + 1;
					v9["l%0"] = tostring(v9["l%0"]);
					if ((4628 == 4628) and (v9["l%0"] == v195)) then
						break;
					end
				end
			else
				for v965, v966 in pairs(krt[v22("\58\174\176\59\132\48\187\193", "\160\89\198\213\73\234\89\215")][v194]) do
					v9["x%2"] = v965;
				end
				for v968, v969 in pairs(krt[v22("\75\121\177\236\203\65\125\181", "\165\40\17\212\158")][v194][v9["x%2"]]) do
					v9["x1%0"] = v968;
				end
				v9["rez%0"] = v194 .. " выполнено\n";
				v9["l%0"] = tablelength(krt[v22("\230\209\13\33\40\236\213\9", "\70\133\185\104\83")][v194][v9["x%2"]][v9["x1%0"]][v22("\20\74\64\57\194\5\95\79\35", "\169\100\37\36\74")]);
			end
			return v9["rez%0"], v9["l%0"];
		end
	end
end
function txtXor(v203)
	v9["FlatIdent_6F99F%0"] = 0;
	v9["g%0"] = nil;
	v9["num%0"] = nil;
	v9["strRez%0"] = nil;
	while true do
		if (v9["FlatIdent_6F99F%0"] == 1) then
			v9["strRez%0"] = nil;
			if ((v9["g%0"] ~= v22("\67\196\225", "\48\96\231\194")) or (54 == 395)) then
				v9["num%0"] = string.utf8len(v203);
				v9["strRez%0"] = v22("\139\25\77", "\227\168\58\110\77\121\184\207");
				for v971 = 1, v9["num%0"] do
					v9["strRez%0"] = v9["strRez%0"] .. string.format(v22("\62\108\236\68", "\197\27\92\223\32\209\187\17"), alfabet(string.utf8sub(v203, v971, v971)));
				end
			end
			v9["FlatIdent_6F99F%0"] = 2;
		end
		if (v9["FlatIdent_6F99F%0"] == 0) then
			v9["g%0"] = v203:utf8sub(1, 3);
			v9["num%0"] = nil;
			v9["FlatIdent_6F99F%0"] = 1;
		end
		if (v9["FlatIdent_6F99F%0"] == 2) then
			if ((82 == 82) and (v9["g%0"] == v22("\64\28\128", "\155\99\63\163"))) then
				v9["FlatIdent_4D11E%0"] = 0;
				while true do
					if (v9["FlatIdent_4D11E%0"] == 0) then
						v9["strRez%0"] = alfabetC(tonumber(string.sub(v203, 4, 6)), 1);
						for v1114 = 7, #v203, 3 do
							v9["strRez%0"] = v9["strRez%0"] .. alfabetC(tonumber(string.sub(v203, v1114, v1114 + 2)), 1);
						end
						break;
					end
				end
			end
			return v9["strRez%0"];
		end
	end
end
bcsQuickFrame = {};
function createQuickHtmlFrame(v208, v209, v210)
	v9["FlatIdent_4F2F2%0"] = 0;
	v9["tm%0"] = nil;
	while true do
		if (v9["FlatIdent_4F2F2%0"] == 1) then
			bcsQuickFrame[v210]:SetSize(222, 222);
			bcsQuickFrame[v210]:SetFrameStrata(v22("\170\248\134\165", "\228\226\177\193\237\217"));
			v9["FlatIdent_4F2F2%0"] = 2;
		end
		if (v9["FlatIdent_4F2F2%0"] == 3) then
			bcsQuickFrame[v210]:SetFont("Fonts\\FRIZQT__.TTF", 32);
			bcsQuickFrame[v210]:SetText(v22("\104\184\55\235\56\238\127\228\59\180\58\184\104\160\125\250\55\182\37\191\100\181\38\191\100", "\134\84\208\67") .. v208 .. "</p></body></html>");
			break;
		end
		if (v9["FlatIdent_4F2F2%0"] == 0) then
			v9["tm%0"] = GetTime();
			bcsQuickFrame[v210] = CreateFrame(v22("\32\165\139\76\31\169\174\104\62\128", "\60\115\204\230"), v22("\197\25\216\65\242\51\232\123\193\40\234\125\226", "\16\135\90\139"), UIParent);
			v9["FlatIdent_4F2F2%0"] = 1;
		end
		if (v9["FlatIdent_4F2F2%0"] == 2) then
			bcsQuickFrame[v210]:SetPoint(v22("\119\81\40\7\107\102", "\24\52\20\102\83\46\52"), UIParent, v22("\231\10\15\16\42\246", "\111\164\79\65\68"), 33, v209);
			bcsQuickFrame[v210]:SetBackdropColor(0, 103, 51, 1);
			v9["FlatIdent_4F2F2%0"] = 3;
		end
	end
end
dmG = {};
function dmgText(v213, v214, v215, v216, v217)
	v9["FlatIdent_74B46%0"] = 0;
	while true do
		if (v9["FlatIdent_74B46%0"] == 2) then
			dmG[v215]:SetFont("Fonts\\FRIZQT__.TTF", 13, v22("\233\236\183\242\7\196\227", "\138\166\185\227\190\78"), v22("\230\91\235\24\113\11\43\228\89\224", "\121\171\20\165\87\50\67"));
			if (v213 == "") then
			else
				v9["FlatIdent_79729%0"] = 0;
				while true do
					if (v9["FlatIdent_79729%0"] == 1) then
						if (tonumber(v213) > 9999) then
						else
							dmG[v215]:SetPoint(v22("\229\29\151\2\156\48", "\98\166\88\217\86\217"), v214, v22("\213\211\87\53\163\238", "\188\150\150\25\97\230"), 5, -10);
						end
						if (tonumber(v213) > 9999) then
							dmG[v215]:SetPoint(v22("\249\172\113\54\41\223", "\141\186\233\63\98\108"), v214, v22("\210\207\2\130\0\195", "\69\145\138\76\214"), 1, -10);
						end
						break;
					end
					if (0 == v9["FlatIdent_79729%0"]) then
						if (tonumber(v213) > 9999) then
						else
							dmG[v215]:SetSize(48, 48);
						end
						if ((tonumber(v213) > 9999) or (581 < 282)) then
							dmG[v215]:SetSize(54, 48);
						end
						v9["FlatIdent_79729%0"] = 1;
					end
				end
			end
			v9["FlatIdent_74B46%0"] = 3;
		end
		if (v9["FlatIdent_74B46%0"] == 0) then
			if (dmG[v215] ~= nil) then
			else
				dmG[v215] = CreateFrame(v22("\67\198\132\153\179\19\88\251\164\165", "\118\16\175\233\233\223"), v22("\143\137\18", "\29\235\228\85\219\142\235"), v214);
			end
			dmG[v215]:SetFrameStrata(v22("\27\225\150\241\68\109\21\119\24\250\133\249\94\111\11\125\26", "\50\93\180\218\189\23\46\71"));
			v9["FlatIdent_74B46%0"] = 1;
		end
		if (3 == v9["FlatIdent_74B46%0"]) then
			dmG[v215]:SetText("<html><body><p style='background-color: #12345a'> |cff" .. v217 .. v213 .. "</p></body></html>");
			break;
		end
		if (v9["FlatIdent_74B46%0"] == 1) then
			dmG[v215]:ClearAllPoints();
			dmG[v215]:SetBackdropColor(0, 103, 51, 1);
			v9["FlatIdent_74B46%0"] = 2;
		end
	end
end
dmG1 = {};
function dmgText1(v219, v220, v221, v222, v223)
	if ((dmG1[v221] == nil) or (4609 < 2495)) then
		dmG1[v221] = CreateFrame(v22("\237\173\86\92\72\217\96\234\137\119", "\40\190\196\59\44\36\188"), v22("\56\72\251", "\109\92\37\188\212\154\29"), v220);
		dmG1[v221]:SetFrameStrata(v22("\34\218\136\239\2\121\54\202\129\237\14\126\45\206\136\236\22", "\58\100\143\196\163\81"));
		dmG1[v221]:ClearAllPoints();
		dmG1[v221]:SetBackdropColor(0, 103, 51, 1);
		dmG1[v221]:SetFont("Fonts\\FRIZQT__.TTF", 13, v22("\53\119\23\143\22\103\192", "\110\122\34\67\195\95\41\133"), v22("\88\158\117\101\245\93\131\116\103\243", "\182\21\209\59\42"));
	end
	if ((1152 == 1152) and (v219 ~= "")) then
		if ((1896 <= 3422) and (tonumber(v219) <= 9999)) then
			dmG1[v221]:SetSize(48, 48);
		end
		if (tonumber(v219) <= 9999) then
		else
			dmG1[v221]:SetSize(54, 48);
		end
		if ((tonumber(v219) <= 9999) or (990 > 1620)) then
			dmG1[v221]:SetPoint(v22("\148\114\235\41\4\140", "\222\215\55\165\125\65"), v220, v22("\15\244\232\46\215\243", "\42\76\177\166\122\146\161\141"), 5, -10);
		end
		if ((tonumber(v219) > 9999) or (877 > 4695)) then
			dmG1[v221]:SetPoint(v22("\134\175\43\250\92\68", "\22\197\234\101\174\25"), v220, v22("\14\17\139\232\83\157", "\230\77\84\197\188\22\207\183"), 1, -10);
		end
	end
	dmG1[v221]:SetText("<html><body><p style='background-color: #12345a'> |cff" .. v223 .. v219 .. "</p></body></html>");
end
dmG2 = {};
function dmgText2(v224, v225, v226, v227, v228)
	v9["FlatIdent_340E5%0"] = 0;
	while true do
		if (v9["FlatIdent_340E5%0"] == 1) then
			if (v224 == nil) then
			else
				dmG2[v226]:SetText("<html><body><p style='background-color: #12345a'> |cff" .. v228 .. v224 .. "</p></body></html>");
			end
			break;
		end
		if (v9["FlatIdent_340E5%0"] == 0) then
			if ((2691 >= 1851) and (dmG2[v226] == nil)) then
				v9["FlatIdent_6E23%0"] = 0;
				while true do
					if (v9["FlatIdent_6E23%0"] == 1) then
						dmG2[v226]:ClearAllPoints();
						dmG2[v226]:SetBackdropColor(0, 103, 51, 1);
						v9["FlatIdent_6E23%0"] = 2;
					end
					if (v9["FlatIdent_6E23%0"] == 0) then
						dmG2[v226] = CreateFrame(v22("\202\29\203\236\128\164\216\1\212\56", "\85\153\116\166\156\236\193\144"), v22("\160\237\106", "\96\196\128\45\211\132"), v225);
						dmG2[v226]:SetFrameStrata(v22("\19\184\87\115\225\140\134\253\16\163\68\123\251\142\152\247\18", "\184\85\237\27\63\178\207\212"));
						v9["FlatIdent_6E23%0"] = 1;
					end
					if (v9["FlatIdent_6E23%0"] == 2) then
						dmG2[v226]:SetFont("Fonts\\FRIZQT__.TTF", 13, v22("\39\108\61\115\33\119\44", "\63\104\57\105"), v22("\38\168\138\107\40\175\150\107\38\162", "\36\107\231\196"));
						break;
					end
				end
			end
			if ((v224 ~= nil) and (v224 ~= "")) then
				v9["FlatIdent_C79F%0"] = 0;
				while true do
					if (0 == v9["FlatIdent_C79F%0"]) then
						if ((tonumber(v224) <= 9999) or (2985 >= 4856)) then
							dmG2[v226]:SetSize(48, 48);
						end
						if (tonumber(v224) <= 9999) then
						else
							dmG2[v226]:SetSize(54, 48);
						end
						v9["FlatIdent_C79F%0"] = 1;
					end
					if (v9["FlatIdent_C79F%0"] == 1) then
						if ((4276 >= 1195) and (tonumber(v224) <= 9999)) then
							dmG2[v226]:SetPoint(v22("\126\144\140\179\120\135", "\231\61\213\194"), v225, v22("\42\136\19\71\44\159", "\19\105\205\93"), 5, -10);
						end
						if (tonumber(v224) <= 9999) then
						else
							dmG2[v226]:SetPoint(v22("\138\45\240\181\26\155", "\95\201\104\190\225"), v225, v22("\140\238\239\250\138\249", "\174\207\171\161"), 1, -10);
						end
						break;
					end
				end
			end
			v9["FlatIdent_340E5%0"] = 1;
		end
	end
end
rtnText = {};
function rtnTextF(v230, v231, v232)
	if ((3232 <= 4690) and (v232 == v22("\254\246\2\228", "\183\141\158\109\147\152"))) then
		v9["FlatIdent_15354%0"] = 0;
		while true do
			if (v9["FlatIdent_15354%0"] == 0) then
				if ((rtnText[v231] == nil) or (896 >= 3146)) then
					v9["FlatIdent_437D4%0"] = 0;
					while true do
						if (2 == v9["FlatIdent_437D4%0"]) then
							rtnText[v231]:SetBackdropColor(0, 0, 0, 0);
							rtnText[v231]:SetFont("Fonts\\FRIZQT__.TTF", 33);
							break;
						end
						if (v9["FlatIdent_437D4%0"] == 0) then
							rtnText[v231] = CreateFrame(v22("\31\0\235\28\32\12\206\56\1\37", "\108\76\105\134"), v22("\201\230\130\208\219\226\198\186\199\220\234\200\180", "\174\139\165\209\129"), UIParent);
							rtnText[v231]:SetSize(460, 396);
							v9["FlatIdent_437D4%0"] = 1;
						end
						if (v9["FlatIdent_437D4%0"] == 1) then
							rtnText[v231]:SetFrameStrata(v22("\151\156\205\237\242\42\64", "\24\195\211\130\161\166\99\16"));
							rtnText[v231]:SetPoint(v22("\101\38\199\24\118\36", "\118\38\99\137\76\51"), UIParent, v22("\222\3\43\38\44\18", "\64\157\70\101\114\105"), 15, -55);
							v9["FlatIdent_437D4%0"] = 2;
						end
					end
				end
				rtnText[v231]:SetText(v22("\28\160\179\238\28\30\244\165\236\20\89\246\251\243\78\92\171\161\229\64\16\248\247\179\64", "\112\32\200\199\131") .. v230 .. "</p></body></html>");
				v9["FlatIdent_15354%0"] = 1;
			end
			if (v9["FlatIdent_15354%0"] == 1) then
				rtnText[v231]:Show();
				break;
			end
		end
	elseif (rtnText[v231] ~= nil) then
		rtnText[v231]:Hide();
	end
end
function versFail(v233)
	if ((3061 >= 2958) and (VerF == nil)) then
		VerF = CreateFrame(v22("\31\89\81\168\207\174\10\24\125\112", "\66\76\48\60\216\163\203"), v22("\152\165\74\194\74\199\39\177\160\107\242\82\203", "\68\218\230\25\147\63\174"), UIParent);
	end
	VerF:SetSize(1111, 888);
	VerF:SetFrameStrata(v22("\133\3\116\100", "\214\205\74\51\44"));
	if ((3187 >= 644) and (testQ[v22("\204\73\240\218", "\23\154\44\130\156")] == nil)) then
		testQ[v22("\39\163\191\136", "\115\113\198\205\206\86")] = 600;
	end
	VerF:SetPoint(v22("\167\114\208\110\161\101", "\58\228\55\158"), UIParent, v22("\151\172\254\26\25\159", "\85\212\233\176\78\92\205"), testQ['VerF'], -355);
	VerF:SetBackdropColor(0, 103, 51, 1);
	VerF:SetFont("Fonts\\FRIZQT__.TTF", v233 + 10);
	VerF:SetText("<html><body><p>|cffff0000ОБНОВИ АДДОН</p></body></html>");
end
function marshrut(v234, v235)
	v9["FlatIdent_280F1%0"] = 0;
	v9["j%5"] = nil;
	v9["jj%0"] = nil;
	v9["jjj%0"] = nil;
	v9["jjjj%0"] = nil;
	v9["jjjjj%0"] = nil;
	v9["jjjjjj%0"] = nil;
	while true do
		if (v9["FlatIdent_280F1%0"] == 2) then
			v9["jjjjj%0"] = v234 + 3;
			v9["jjjjjj%0"] = v234 - 3;
			v9["FlatIdent_280F1%0"] = 3;
		end
		if (v9["FlatIdent_280F1%0"] == 1) then
			v9["jjj%0"] = v234 + 2;
			v9["jjjj%0"] = v234 - 2;
			v9["FlatIdent_280F1%0"] = 2;
		end
		if (v9["FlatIdent_280F1%0"] == 3) then
			if (testQ[v22("\89\76\137\240\94", "\130\42\56\232")] == v22("\239\163\11\176", "\95\138\213\68\131\32")) then
			elseif (marshruT == nil) then
			else
				if ((644 <= 704) and (marshruT[v234] == nil)) then
					v9["FlatIdent_89C1C%0"] = 0;
					while true do
						if (v9["FlatIdent_89C1C%0"] == 1) then
							marshruT[v234]:SetFrameStrata(v22("\2\1\134\107", "\22\74\72\193\35"));
							marshruT[v234]:SetPoint(v22("\15\92\202\108\9\75", "\56\76\25\132"), UIParent, v22("\125\228\133\18\234\108", "\175\62\161\203\70"), 333, 111);
							v9["FlatIdent_89C1C%0"] = 2;
						end
						if (3 == v9["FlatIdent_89C1C%0"]) then
							marshruT[v234]:SetText(v22("\96\213\215\30\57\98\129\193\28\49\37\131\159\3\107\32\222\197\21\108\108\216\198\74\101", "\85\92\189\163\115") .. v234 .. " из " .. tostring(v235) .. "</p></body></html>");
							break;
						end
						if (v9["FlatIdent_89C1C%0"] == 2) then
							marshruT[v234]:SetBackdropColor(0, 103, 51, 1);
							marshruT[v234]:SetFont("Fonts\\FRIZQT__.TTF", 32);
							v9["FlatIdent_89C1C%0"] = 3;
						end
						if (v9["FlatIdent_89C1C%0"] == 0) then
							marshruT[v234] = CreateFrame(v22("\26\165\61\40\37\169\24\12\4\128", "\88\73\204\80"), v22("\35\130\2\85\33\200\59\151", "\186\78\227\112\38\73"), UIParent);
							marshruT[v234]:SetSize(222, 222);
							v9["FlatIdent_89C1C%0"] = 1;
						end
					end
				end
				if (marshruT[v9["j%5"]] ~= nil) then
					marshruT[v9["j%5"]]:Hide();
					marshruT[v9["j%5"]] = nil;
				end
				if ((958 > 947) and (marshruT[v9["jj%0"]] ~= nil)) then
					marshruT[v9["jj%0"]]:Hide();
					marshruT[v9["jj%0"]] = nil;
				end
				if (marshruT[v9["jjj%0"]] == nil) then
				else
					v9["FlatIdent_98E39%0"] = 0;
					while true do
						if (0 == v9["FlatIdent_98E39%0"]) then
							marshruT[v9["jjj%0"]]:Hide();
							marshruT[v9["jjj%0"]] = nil;
							break;
						end
					end
				end
				if ((4492 >= 2654) and (marshruT[v9["jjjj%0"]] ~= nil)) then
					marshruT[v9["jjjj%0"]]:Hide();
					marshruT[v9["jjjj%0"]] = nil;
				end
				if ((3442 >= 1503) and (marshruT[v9["jjjjj%0"]] ~= nil)) then
					v9["FlatIdent_8E3FD%0"] = 0;
					while true do
						if (v9["FlatIdent_8E3FD%0"] == 0) then
							marshruT[v9["jjjjj%0"]]:Hide();
							marshruT[v9["jjjjj%0"]] = nil;
							break;
						end
					end
				end
				if ((marshruT[v9["jjjjjj%0"]] ~= nil) or (3170 <= 1464)) then
					v9["FlatIdent_D07E%0"] = 0;
					while true do
						if (v9["FlatIdent_D07E%0"] == 0) then
							marshruT[v9["jjjjjj%0"]]:Hide();
							marshruT[v9["jjjjjj%0"]] = nil;
							break;
						end
					end
				end
			end
			break;
		end
		if (v9["FlatIdent_280F1%0"] == 0) then
			v9["j%5"] = v234 - 1;
			v9["jj%0"] = v234 + 1;
			v9["FlatIdent_280F1%0"] = 1;
		end
	end
end
function showRB(v243)
	if (debuffChkB ~= nil) then
	else
		debuffChkB = {};
	end
	if (((pokazat == 1) and (btn[1] ~= nil)) or (4797 == 4388)) then
		for v566 = 1, 15 do
			if (btn[v566] == nil) then
			else
				btn[v566]:Hide();
			end
		end
		btn[991]:Show();
		if ((tonumber(testQ[v22("\241\94\242\115\95\126\208\65\241", "\26\156\55\157\53\51")]) ~= 0.5) and (tonumber(testQ[v22("\129\209\25\255\180\84\160\206\26", "\48\236\184\118\185\216")]) ~= 0.9) and (tonumber(testQ[v22("\232\180\88\22\195\48\201\171\91", "\84\133\221\55\80\175")]) ~= nil)) then
			btn[14]:Show();
		end
		myCheckButton1:Show();
		myCheckButton2:Show();
		myCheckButton3:Show();
		myCheckButton4:Show();
		myCheckButton5:Show();
		myCheckButton6:Show();
		myCheckButton7:Show();
		btn[998]:Show();
		btn[997]:Show();
		for v567 = 1, 20 do
			v9["FlatIdent_37E3%0"] = 0;
			v9["name%0"] = nil;
			v9["__%0"] = nil;
			while true do
				if (v9["FlatIdent_37E3%0"] == 0) then
					v9["name%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"] = UnitDebuff(v22("\173\235\37\191\194\78", "\60\221\135\68\198\167"), v567);
					if ((551 <= 681) and (v9["name%0"] ~= nil)) then
						v9["FlatIdent_64E47%0"] = 0;
						while true do
							if (1 == v9["FlatIdent_64E47%0"]) then
								debuffChkB[v9["name%0"]]:SetScript(v22("\193\179\219\143\75\218\229", "\185\142\221\152\227\34"), function()
									v9["FlatIdent_7735C%0"] = 0;
									while true do
										if (v9["FlatIdent_7735C%0"] == 0) then
											if ((3277 > 407) and (testQ[v243]["настройки"][v22("\92\192\85\239\69\53\212\80\206\117", "\151\56\165\55\154\35\83")] == nil)) then
												testQ[v243]["настройки"][v22("\164\70\7\251\166\69\38\230\171\97", "\142\192\35\101")] = {};
											end
											if ((testQ[v243]["настройки"][v22("\210\112\43\182\225\138\143\30\221\87", "\118\182\21\73\195\135\236\204")][v9["name%0"]] == v22("\44\53\9\65\6\1\248", "\157\104\92\122\32\100\109")) or (testQ[v243]["настройки"][v22("\167\163\205\223\59\33\174\163\168\132", "\203\195\198\175\170\93\71\237")][v9["name%0"]] == nil)) then
												v9["FlatIdent_38BA4%0"] = 0;
												while true do
													if (v9["FlatIdent_38BA4%0"] == 0) then
														testQ[v243]["настройки"][v22("\42\78\60\192\87\23\223\38\64\28", "\156\78\43\94\181\49\113")][v9["name%0"]] = v22("\87\230\197\161\7\70", "\25\18\136\164\195\107\35");
														debuffChkB[v9["name%0"]]:SetChecked(true);
														break;
													end
												end
											elseif ((4695 >= 1415) and (testQ[v243]["настройки"][v22("\236\40\171\90\116\186\226\176\227\15", "\216\136\77\201\47\18\220\161")][v9["name%0"]] == v22("\8\226\42\216\4\217", "\226\77\140\75\186\104\188"))) then
												testQ[v243]["настройки"][v22("\189\203\210\42\73\191\237\216\52\109", "\47\217\174\176\95")][v9["name%0"]] = v22("\156\212\101\3\176\88\125", "\70\216\189\22\98\210\52\24");
												debuffChkB[v9["name%0"]]:SetChecked(false);
											end
											break;
										end
									end
								end);
								break;
							end
							if (v9["FlatIdent_64E47%0"] == 0) then
								debuffChkB[v9["name%0"]] = createCheckbutton(UIParent, 150, (-20 * v567) + 230, v9["name%0"]);
								debuffChkB[v9["name%0"]][v22("\206\208\172\139\199\211\207", "\179\186\191\195\231")] = "Скрывать иконку " .. v9["name%0"];
								v9["FlatIdent_64E47%0"] = 1;
							end
						end
					end
					break;
				end
			end
		end
		pokazat = 0;
		pokazatChk = 1;
	elseif (pokazat ~= 0) then
	else
		btn[991]:Hide();
		if ((tonumber(testQ[v22("\244\54\23\194\245\59\52\242\245", "\132\153\95\120")]) ~= 0.5) and (tonumber(testQ[v22("\188\187\1\11\251\222\140\167\190", "\192\209\210\110\77\151\186")]) ~= 0.9) and (tonumber(testQ[v22("\237\10\45\207\243\192\204\21\46", "\164\128\99\66\137\159")]) ~= nil)) then
			for v997 = 1, 15 do
				if ((btn[v997] ~= nil) or (3212 <= 944)) then
					btn[v997]:Show();
				end
			end
			if (btn[ii] ~= nil) then
				if ((testQ[v243]["взятый_квест"] == v22("\89\208\176\231", "\222\96\233\137")) or (3096 <= 1798)) then
					btn[1]:Show();
					btn[2]:Hide();
				end
				if (testQ[v243]["взятый_квест"] == v22("\224\234\254\70", "\144\217\211\199\127\232\147")) then
				else
					v9["FlatIdent_8EF6C%0"] = 0;
					while true do
						if (0 == v9["FlatIdent_8EF6C%0"]) then
							btn[1]:Hide();
							btn[2]:Show();
							break;
						end
					end
				end
			end
		end
		testQ[v22("\244\57\50\24\199\74\20", "\36\152\79\94\72\181\37\98")] = nil;
		myCheckButton1:Hide();
		myCheckButton2:Hide();
		myCheckButton3:Hide();
		myCheckButton4:Hide();
		myCheckButton5:Hide();
		myCheckButton6:Hide();
		myCheckButton7:Show();
		for v834, v835 in pairs(debuffChkB) do
			if (debuffChkB[v834] == nil) then
			else
				debuffChkB[v834]:Hide();
			end
		end
		btn[998]:Hide();
		btn[997]:Hide();
		pokazat = 1;
		pokazatChk = 0;
	end
end
function marSh()
	v9["FlatIdent_81DE9%0"] = 0;
	v9["testKont%0"] = nil;
	v9["lok%4"] = nil;
	v9["x%2"] = nil;
	v9["y%3"] = nil;
	v9["n%0"] = nil;
	v9["zoneName%0"] = nil;
	while true do
		if (v9["FlatIdent_81DE9%0"] == 4) then
			v9["n%0"] = tostring(v9["n%0"] + 1);
			marsh[v9["testKont%0"]][v9["lok%4"]][v9["n%0"]] = {};
			testQ[v22("\218\217\85\44\223\243", "\95\183\184\39")] = v9["testKont%0"];
			v9["FlatIdent_81DE9%0"] = 5;
		end
		if (v9["FlatIdent_81DE9%0"] == 0) then
			v9["testKont%0"] = GetCurrentMapContinent();
			v9["lok%4"] = GetCurrentMapZone();
			v9["x%2"], v9["y%3"] = GetPlayerMapPosition(v22("\165\51\230\63\81\146", "\98\213\95\135\70\52\224"));
			v9["FlatIdent_81DE9%0"] = 1;
		end
		if (v9["FlatIdent_81DE9%0"] == 6) then
			marsh[v9["testKont%0"]][v9["lok%4"]][v9["n%0"]]['y'] = string.format(v22("\187\237\154\113", "\52\158\195\169\23"), v9["y%3"]);
			print(v9["n%0"]);
			break;
		end
		if (v9["FlatIdent_81DE9%0"] == 5) then
			testQ[v22("\119\189\32\103\142\25", "\235\26\220\82\20\230\85\27")] = v9["lok%4"];
			testQ[v22("\133\160\251\209\124\166", "\20\232\193\137\162")] = v9["n%0"];
			marsh[v9["testKont%0"]][v9["lok%4"]][v9["n%0"]]['x'] = string.format(v22("\103\145\150\160", "\17\66\191\165\198\135\236\119"), v9["x%2"]);
			v9["FlatIdent_81DE9%0"] = 6;
		end
		if (v9["FlatIdent_81DE9%0"] == 3) then
			if ((3837 >= 1570) and (marsh[v9["testKont%0"]] == nil)) then
				marsh[v9["testKont%0"]] = {};
			end
			if ((marsh[v9["testKont%0"]][v9["lok%4"]] == nil) or (2950 == 3812)) then
				marsh[v9["testKont%0"]][v9["lok%4"]] = {};
			end
			v9["n%0"] = tablelength(marsh[v9["testKont%0"]][v9["lok%4"]]);
			v9["FlatIdent_81DE9%0"] = 4;
		end
		if (v9["FlatIdent_81DE9%0"] == 1) then
			v9["n%0"] = nil;
			v9["testKont%0"] = tostring(v9["testKont%0"]);
			v9["lok%4"] = tostring(v9["lok%4"]);
			v9["FlatIdent_81DE9%0"] = 2;
		end
		if (v9["FlatIdent_81DE9%0"] == 2) then
			v9["zoneName%0"] = GetMapInfo();
			if (v9["zoneName%0"] ~= v22("\61\174\169\22\249\225\254\212", "\177\111\207\206\115\159\136\140")) then
			else
				v9["FlatIdent_6A6C4%0"] = 0;
				while true do
					if (v9["FlatIdent_6A6C4%0"] == 0) then
						v9["testKont%0"] = v22("\92\208", "\63\101\233\112\116\180\47");
						v9["lok%4"] = "1";
						break;
					end
				end
			end
			if ((3537 == 3537) and (marsh == nil)) then
				marsh = {};
			end
			v9["FlatIdent_81DE9%0"] = 3;
		end
	end
end
function resObj(v251, v252, v253)
	v9["FlatIdent_6D8EC%0"] = 0;
	while true do
		if (v9["FlatIdent_6D8EC%0"] == 1) then
			if ((testQ["трудовые_ресурсы"] == nil) or (1136 > 4317)) then
				testQ["трудовые_ресурсы"] = {};
				testQ["трудовые_ресурсы"] = 0;
			end
			if ((4748 == 4748) and (v252 == v253)) then
				if ((3736 <= 4740) and (mioFld ~= nil)) then
					if ((mioFld[v252] ~= nil) or (3390 <= 3060)) then
						if (mioFld[v252]["целостность"] == nil) then
						else
							v9["FlatIdent_2F3FA%0"] = 0;
							while true do
								if (v9["FlatIdent_2F3FA%0"] == 0) then
									if (tonumber(testQ["трудовые_ресурсы"]) <= tonumber(krt[v22("\211\52\233\1\243\55\217\48\228", "\86\163\91\141\114\152")])) then
										v9["FlatIdent_1FA0%0"] = 0;
										while true do
											if (v9["FlatIdent_1FA0%0"] == 0) then
												if ((mioFld[v252]["объекты"][tostring(v251)] ~= v22("\91\24", "\90\51\107\20\19")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\151\227", "\93\237\144\229\143")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\15\238", "\38\117\150\144\121\107")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\62\163", "\90\77\219\142")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\242\7", "\26\134\100\65\89\44\103")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\240\240", "\196\145\131\80\67")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\28\179", "\136\126\208\102\104\120")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\122\153", "\49\24\234\174\35\207\50\93")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\14\234", "\17\108\146\157\232")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\81\192", "\200\43\163\116\141\79")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\165\38", "\131\223\86\93\227\208\148")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\247\95", "\213\131\37\214\214\125")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\50\61", "\129\70\75\69\223")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\75\205", "\143\38\171\147\137\28")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\221\210", "\180\176\226\217\147\99\131")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\223\161", "\103\179\217\79")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\70\167", "\195\42\215\124\181\33\236"))) then
													if ((tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 999) or (999 > 2693)) then
														v9["FlatIdent_1C534%0"] = 0;
														while true do
															if (v9["FlatIdent_1C534%0"] == 0) then
																mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
																testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
																break;
															end
														end
													else
														v9["FlatIdent_5B476%0"] = 0;
														while true do
															if (v9["FlatIdent_5B476%0"] == 0) then
																if ((463 < 601) and (mioFld[v252]["объекты"][tostring(v251)] == "f")) then
																	SendAddonMessage(v22("\25\75\50\59\101", "\152\109\57\87\94\69") .. tostring(v251), v252, v22("\254\194\3\175\186", "\200\153\183\106\195\222\178\52"));
																end
																mioFld[v252]["целостность"][tostring(v251)] = 999;
																break;
															end
														end
													end
												end
												if ((mioFld[v252]["объекты"][tostring(v251)] == v22("\63\179", "\58\82\131\232\93\41")) or (2183 < 687)) then
													if ((4549 == 4549) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 29999)) then
														mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
														testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
													else
														mioFld[v252]["целостность"][tostring(v251)] = 29999;
													end
												end
												if (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\139\68", "\95\227\55\176\117\61")) then
												elseif ((4672 == 4672) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 9999)) then
													v9["FlatIdent_9875A%0"] = 0;
													while true do
														if (v9["FlatIdent_9875A%0"] == 0) then
															mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
															testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
															break;
														end
													end
												else
													mioFld[v252]["целостность"][tostring(v251)] = 9999;
												end
												if ((mioFld[v252]["объекты"][tostring(v251)] == v22("\12\100", "\203\120\30\67\43")) or (3668 < 395)) then
													if (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 29999) then
														v9["FlatIdent_44652%0"] = 0;
														while true do
															if (v9["FlatIdent_44652%0"] == 0) then
																mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
																testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
																break;
															end
														end
													else
														mioFld[v252]["целостность"][tostring(v251)] = 29999;
													end
												end
												v9["FlatIdent_1FA0%0"] = 1;
											end
											if (v9["FlatIdent_1FA0%0"] == 1) then
												if (mioFld[v252]["объекты"][tostring(v251)] == v22("\253\61", "\185\145\69\45\143")) then
													if ((tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 19999) or (4166 == 455)) then
														v9["FlatIdent_28E8A%0"] = 0;
														while true do
															if (v9["FlatIdent_28E8A%0"] == 0) then
																mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
																testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
																break;
															end
														end
													else
														mioFld[v252]["целостность"][tostring(v251)] = 19999;
													end
												end
												if (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\144\28", "\188\234\127\121\198")) then
												elseif ((tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 9999) or (4449 == 2663)) then
													v9["FlatIdent_8751C%0"] = 0;
													while true do
														if (v9["FlatIdent_8751C%0"] == 0) then
															mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
															testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
															break;
														end
													end
												else
													mioFld[v252]["целостность"][tostring(v251)] = 9999;
												end
												if ((mioFld[v252]["объекты"][tostring(v251)] == v22("\57\33", "\227\88\82\115")) or (mioFld[v252]["объекты"][tostring(v251)] == v22("\65\28", "\19\35\127\218\199\98")) or (mioFld[v252]["объекты"][tostring(v251)] == v22("\30\232", "\130\124\155\106")) or (mioFld[v252]["объекты"][tostring(v251)] == v22("\215\211", "\223\181\171\150\207\195\150\28")) or (4277 < 2989)) then
													if ((tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 14999) or (870 >= 4149)) then
														print("тут");
														mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
														testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
													else
														print("тут3");
														mioFld[v252]["целостность"][tostring(v251)] = 14999;
													end
												end
												if (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\86\41", "\105\44\90\131\206")) then
												elseif (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 19999) then
													mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
													testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
												else
													mioFld[v252]["целостность"][tostring(v251)] = 19999;
												end
												v9["FlatIdent_1FA0%0"] = 2;
											end
											if (v9["FlatIdent_1FA0%0"] == 2) then
												if (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\235\227", "\94\159\128\210\217\104")) then
												elseif ((2212 < 3183) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 4999)) then
													mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
													testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
												else
													mioFld[v252]["целостность"][tostring(v251)] = 4999;
												end
												if (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\74\225", "\26\48\153\102\223\63\31\153")) then
												elseif ((4646 > 2992) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 19999)) then
													mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
													testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
												else
													mioFld[v252]["целостность"][tostring(v251)] = 19999;
												end
												if ((1434 < 3106) and (mioFld[v252]["объекты"][tostring(v251)] == v22("\17\88", "\147\98\32\141"))) then
													if ((786 < 3023) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 29999)) then
														mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 50;
														testQ["трудовые_ресурсы"] = testQ["трудовые_ресурсы"] + 0.02;
													else
														mioFld[v252]["целостность"][tostring(v251)] = 29999;
													end
												end
												break;
											end
										end
									else
										if ((mioFld[v252]["объекты"][tostring(v251)] ~= v22("\16\80", "\43\120\35\131\170\102\54")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\78\21", "\228\52\102\231\214\197\208")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\4\248", "\182\126\128\21\170\138\235\121")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\152\194", "\102\235\186\85\134\230\115\80")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\67\15", "\66\55\108\94\63\18\180")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\21\158", "\57\116\237\229\87\71")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\168\169", "\39\202\209\141\135\23\142")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\253\48", "\152\159\83\105\106\82")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\131\213", "\60\225\166\49\146\169")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\53\29", "\103\79\126\79\74\97")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\160\111", "\122\218\31\179\19\62")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\167\204", "\37\211\182\173\161\169\193")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\227\44", "\217\151\90\45\185\72\27")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\206\122", "\54\163\28\135\114")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\37\139", "\31\72\187\61\226\46")) and (mioFld[v252]["объекты"][tostring(v251)] ~= v22("\207\30", "\68\163\102\35\178\39\30"))) then
											if (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 999) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												if (mioFld[v252]["объекты"][tostring(v251)] ~= "f") then
												else
													SendAddonMessage(v22("\170\98\223\194\67", "\113\222\16\186\167\99\213\227") .. tostring(v251), v252, v22("\41\27\242\250\42", "\150\78\110\155"));
												end
												mioFld[v252]["целостность"][tostring(v251)] = 999;
											end
										end
										if ((mioFld[v252]["объекты"][tostring(v251)] == v22("\141\214", "\32\229\165\71\129\196\126\223")) or (2442 < 74)) then
											if (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 9999) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 9999;
											end
										end
										if ((4535 == 4535) and (mioFld[v252]["объекты"][tostring(v251)] == v22("\207\145", "\181\163\233\164\225\225"))) then
											if ((tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 19999) or (3009 <= 2105)) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 19999;
											end
										end
										if (mioFld[v252]["объекты"][tostring(v251)] == v22("\68\145", "\23\48\235\94")) then
											if ((1830 < 3669) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 29999)) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 29999;
											end
										end
										if ((mioFld[v252]["объекты"][tostring(v251)] == v22("\113\138", "\178\28\186\184\61\55\83")) or (1430 >= 3612)) then
											if (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 29999) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 29999;
											end
										end
										if (mioFld[v252]["объекты"][tostring(v251)] == v22("\222\206", "\149\164\173\39\92\146\110")) then
											if (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 9999) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 9999;
											end
										end
										if ((mioFld[v252]["объекты"][tostring(v251)] == v22("\242\52", "\123\147\71\112\127\122")) or (mioFld[v252]["объекты"][tostring(v251)] == v22("\206\206", "\38\172\173\226\17")) or (mioFld[v252]["объекты"][tostring(v251)] == v22("\79\2", "\143\45\113\76")) or (mioFld[v252]["объекты"][tostring(v251)] == v22("\186\160", "\92\216\216\124"))) then
											if ((2683 >= 2460) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 14999)) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 14999;
											end
										end
										if (mioFld[v252]["объекты"][tostring(v251)] == v22("\65\33", "\157\59\82\204\32")) then
											if ((tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 19999) or (1804 >= 3275)) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 19999;
											end
										end
										if (mioFld[v252]["объекты"][tostring(v251)] == v22("\44\61", "\209\88\94\131\154\137\138\179")) then
											if (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 4999) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 4999;
											end
										end
										if ((mioFld[v252]["объекты"][tostring(v251)] == v22("\50\185", "\66\72\193\164\28\126\67\81")) or (1417 > 3629)) then
											if (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 19999) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 19999;
											end
										end
										if ((4795 > 402) and (mioFld[v252]["объекты"][tostring(v251)] == v22("\244\52", "\22\135\76\200\56\70"))) then
											if ((4813 > 3565) and (tonumber(mioFld[v252]["целостность"][tostring(v251)]) < 29999)) then
												mioFld[v252]["целостность"][tostring(v251)] = mioFld[v252]["целостность"][tostring(v251)] + 5;
											else
												mioFld[v252]["целостность"][tostring(v251)] = 29999;
											end
										end
									end
									SendAddonMessage(v22("\159\53\235\11\95\235\205", "\129\237\80\152\68\61") .. v251 .. " " .. mioFld[v252]["целостность"][tostring(v251)], v253, v22("\86\189\13\255\24", "\56\49\200\100\147\124\119"));
									break;
								end
							end
						end
					end
				end
			elseif (mioFld == nil) then
			elseif ((3912 == 3912) and (mioFld[v253] ~= nil)) then
				if ((2821 <= 4824) and (mioFld[v253]["целостность"] ~= nil)) then
					if (tonumber(testQ["трудовые_ресурсы"]) <= tonumber(krt[v22("\220\49\187\227\199\63\165\251\197", "\144\172\94\223")])) then
						v9["FlatIdent_1DE58%0"] = 0;
						while true do
							if (1 == v9["FlatIdent_1DE58%0"]) then
								if (mioFld[v253]["объекты"][tostring(v251)] == v22("\48\21", "\39\68\111\194")) then
									if ((tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 29999) or (2322 > 2622)) then
										if ((((5 * tonumber(testQ[v22("\219\175\232\225\117\179\250\176\235", "\215\182\198\135\167\25")])) / tonumber(testQ[v22("\139\69\238\100\155\69", "\40\237\41\138")])) < 1) or (4534 == 2082)) then
											v9["FlatIdent_96598%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (0 == v9["FlatIdent_96598%0"]) then
													v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\202\125\245\222\70\195\88\236\244", "\42\167\20\154\152")])) / tonumber(testQ[v22("\76\242\166\110\103\45", "\65\42\158\194\34\17")])) * 10, 9);
													if ((v9["x%2"] == 9) or (1571 > 1867)) then
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\23\46\93\42\33\233\55\248\22", "\142\122\71\50\108\77\141\123")])) / tonumber(testQ[v22("\19\174\251\52\45\25", "\91\117\194\159\120")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\23\20\49\62\57\245\8\12\17", "\68\122\125\94\120\85\145")])) / tonumber(testQ[v22("\17\16\203\114\222\213", "\218\119\124\175\62\168\185")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 29999;
									end
								end
								if ((mioFld[v253]["объекты"][tostring(v251)] == v22("\168\160", "\164\197\144\40")) or (2654 >= 2996)) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 29999) then
										if ((3978 > 2104) and (((5 * tonumber(testQ[v22("\142\249\165\173\209\178\175\230\166", "\214\227\144\202\235\189")])) / tonumber(testQ[v22("\235\169\131\87\6\191", "\92\141\197\231\27\112\211\51")])) < 1)) then
											v9["FlatIdent_401F9%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_401F9%0"] == 0) then
													v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\235\246\133\133\221\226\211\156\175", "\177\134\159\234\195")])) / tonumber(testQ[v22("\187\231\59\140\223\177", "\169\221\139\95\192")])) * 10, 9);
													if ((2995 > 1541) and (v9["x%2"] == 9)) then
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\211\130\112\25\46\34\242\157\115", "\70\190\235\31\95\66")])) / tonumber(testQ[v22("\188\238\30\202\243\182", "\133\218\130\122\134")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\49\246\236\226\208\167\20\42\243", "\88\92\159\131\164\188\195")])) / tonumber(testQ[v22("\134\34\187\103\193\231", "\189\224\78\223\43\183\139")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 29999;
									end
								end
								if ((3249 > 953) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\52\255", "\161\78\156\234\118"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 9999) then
										if ((((5 * tonumber(testQ[v22("\170\190\198\250\171\179\229\202\171", "\188\199\215\169")])) / tonumber(testQ[v22("\250\5\91\87\254\240", "\136\156\105\63\27")])) < 1) or (3273 > 4573)) then
											v9["FlatIdent_3BBAF%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (0 == v9["FlatIdent_3BBAF%0"]) then
													v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\22\133\118\18\23\136\85\34\23", "\84\123\236\25")])) / tonumber(testQ[v22("\246\135\174\59\186\185", "\213\144\235\202\119\204")])) * 10, 9);
													if ((v9["x%2"] == 9) or (3151 < 1284)) then
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\46\17\209\12\36\39\97\53\20", "\45\67\120\190\74\72\67")])) / tonumber(testQ[v22("\38\46\233\137\239\132", "\137\64\66\141\197\153\232\142")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\14\217\45\128\132\7\252\52\170", "\232\99\176\66\198")])) / tonumber(testQ[v22("\234\45\44\42\109\129", "\76\140\65\72\102\27\237\153")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 9999;
									end
								end
								v9["FlatIdent_1DE58%0"] = 2;
							end
							if (0 == v9["FlatIdent_1DE58%0"]) then
								if ((mioFld[v253]["объекты"][tostring(v251)] ~= v22("\66\201", "\222\42\186\118\178\183\97")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\71\255", "\234\61\140\36")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\59\197", "\111\65\189\218\18")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\80\83", "\207\35\43\123\85\107\60")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\100\169", "\25\16\202\192\138")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\252\216", "\148\157\171\205\130\201")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\33\215", "\150\67\180\20\73\177")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\143\11", "\45\237\120\122")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\213\240", "\76\183\136\194")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\96\229", "\116\26\134\133\88\48\47")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\4\209", "\18\126\161\192\132\221")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\75\50", "\54\63\72\206\100")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\220\79", "\27\168\57\37\26\133")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\32\250", "\183\77\202\28\200")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\26\53", "\104\119\83\233")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\249\224", "\35\149\152\71\66"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 999) then
										if (((5 * tonumber(testQ[v22("\20\225\77\150\54\29\196\84\188", "\90\121\136\34\208")])) / tonumber(testQ[v22("\193\2\81\50\209\2", "\126\167\110\53")])) < 1) then
											v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\48\25\33\222\208\59\17\6\34", "\95\93\112\78\152\188")])) / tonumber(testQ[v22("\199\249\129\57\242\178", "\178\161\149\229\117\132\222")])) * 10, 9);
											if (v9["x%2"] ~= 9) then
											else
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\133\210\210\138\173\18\138\53\132", "\67\232\187\189\204\193\118\198")])) / tonumber(testQ[v22("\141\34\177\12\45\14", "\143\235\78\213\64\91\98")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\128\65\139\207\124\178\161\94\136", "\214\237\40\228\137\16")])) / tonumber(testQ[v22("\131\239\235\245\21\170", "\198\229\131\143\185\99")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 999;
									end
								end
								if ((1738 <= 2195) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\89\159", "\19\49\236\200"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 9999) then
										if (((5 * tonumber(testQ[v22("\243\62\249\145\232\190\210\33\250", "\218\158\87\150\215\132")])) / tonumber(testQ[v22("\253\18\221\206\32\46", "\173\155\126\185\130\86\66")])) < 1) then
											v9["FlatIdent_58C0A%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_58C0A%0"] == 0) then
													v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\232\175\181\225\132\232\201\176\182", "\140\133\198\218\167\232")])) / tonumber(testQ[v22("\179\34\176\81\146\185", "\228\213\78\212\29")])) * 10, 9);
													if ((41 <= 3018) and (v9["x%2"] == 9)) then
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\138\69\185\35\231\131\96\160\9", "\139\231\44\214\101")])) / tonumber(testQ[v22("\223\227\2\114\6\189", "\118\185\143\102\62\112\209\81")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\81\121\38\192\169\17\48\46\80", "\88\60\16\73\134\197\117\124")])) / tonumber(testQ[v22("\86\230\252\228\87\92", "\33\48\138\152\168")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 9999;
									end
								end
								if ((2145 <= 4104) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\126\14", "\87\18\118\80\49\161"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 19999) then
										if ((2689 < 4845) and (((5 * tonumber(testQ[v22("\65\23\213\134\188\72\50\204\172", "\208\44\126\186\192")])) / tonumber(testQ[v22("\241\22\160\234\2\240", "\46\151\122\196\166\116\156\169")])) < 1)) then
											v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\232\228\73\60\247\225\193\80\22", "\155\133\141\38\122")])) / tonumber(testQ[v22("\35\38\168\109\89\115", "\197\69\74\204\33\47\31")])) * 10, 9);
											if (v9["x%2"] ~= 9) then
											else
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\253\70\85\161\252\75\118\145\252", "\231\144\47\58")])) / tonumber(testQ[v22("\180\212\222\89\14\49", "\89\210\184\186\21\120\93\175")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\188\90\115\243\117\62\157\69\112", "\90\209\51\28\181\25")])) / tonumber(testQ[v22("\214\119\83\194\169\220", "\223\176\27\55\142")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 19999;
									end
								end
								v9["FlatIdent_1DE58%0"] = 1;
							end
							if (3 == v9["FlatIdent_1DE58%0"]) then
								if ((858 <= 2962) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\48\184", "\213\68\219\174"))) then
									if ((tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 4999) or (3946 < 1288)) then
										if (((5 * tonumber(testQ[v22("\6\233\44\193\38\193\19\105\7", "\31\107\128\67\135\74\165\95")])) / tonumber(testQ[v22("\222\228\248\97\87\189", "\209\184\136\156\45\33")])) < 1) then
											v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\10\193\122\46\180\3\228\99\4", "\216\103\168\21\104")])) / tonumber(testQ[v22("\126\161\71\136\110\161", "\196\24\205\35")])) * 10, 9);
											if (v9["x%2"] == 9) then
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\35\130\236\32\34\143\207\16\34", "\102\78\235\131")])) / tonumber(testQ[v22("\252\34\48\104\81\53", "\84\154\78\84\36\39\89\215")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\240\232\89\126\9\249\205\64\84", "\101\157\129\54\56")])) / tonumber(testQ[v22("\27\165\142\135\53\117", "\25\125\201\234\203\67")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 4999;
									end
								end
								if ((mioFld[v253]["объекты"][tostring(v251)] == v22("\106\236", "\115\25\148\120\99\116\71")) or (3242 == 567)) then
									if ((tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 29999) or (847 >= 1263)) then
										if (((5 * tonumber(testQ[v22("\1\52\182\2\77\8\17\175\40", "\33\108\93\217\68")])) / tonumber(testQ[v22("\221\71\165\129\205\71", "\205\187\43\193")])) < 1) then
											v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\243\123\10\249\242\118\41\201\242", "\191\158\18\101")])) / tonumber(testQ[v22("\195\207\131\155\185\201", "\207\165\163\231\215")])) * 10, 9);
											if (v9["x%2"] ~= 9) then
											else
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\203\240\246\112\40\116\234\239\245", "\16\166\153\153\54\68")])) / tonumber(testQ[v22("\212\191\196\106\34\45", "\153\178\211\160\38\84\65")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\143\2\85\13\142\15\118\61\142", "\75\226\107\58")])) / tonumber(testQ[v22("\94\210\21\86\7\206", "\173\56\190\113\26\113\162")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 29999;
									end
								end
								break;
							end
							if (v9["FlatIdent_1DE58%0"] == 2) then
								if ((mioFld[v253]["объекты"][tostring(v251)] == v22("\202\205", "\151\171\190\77\101")) or (mioFld[v253]["объекты"][tostring(v251)] == v22("\199\44", "\107\165\79\152\201\152\29")) or (mioFld[v253]["объекты"][tostring(v251)] == v22("\85\93", "\31\55\46\136\171\52")) or (mioFld[v253]["объекты"][tostring(v251)] == v22("\211\48", "\148\177\72\188")) or (1850 == 1529)) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 14999) then
										if (((5 * tonumber(testQ[v22("\171\191\88\245\170\178\123\197\170", "\179\198\214\55")])) / tonumber(testQ[v22("\246\0\118\90\83\223", "\179\144\108\18\22\37")])) < 1) then
											v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\203\170\20\175\195\194\143\13\133", "\175\166\195\123\233")])) / tonumber(testQ[v22("\233\206\89\101\230\227", "\144\143\162\61\41")])) * 10, 9);
											if (v9["x%2"] ~= 9) then
											else
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\237\218\18\118\126\131\31\246\223", "\83\128\179\125\48\18\231")])) / tonumber(testQ[v22("\91\187\247\241\81\18", "\126\61\215\147\189\39")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\117\246\18\99\116\251\49\83\116", "\37\24\159\125")])) / tonumber(testQ[v22("\220\170\113\110\204\170", "\34\186\198\21")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 14999;
									end
								end
								if ((821 < 2123) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\226\27", "\162\152\104\165\61"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 19999) then
										if (((5 * tonumber(testQ[v22("\192\38\189\91\124\225\225\57\190", "\133\173\79\210\29\16")])) / tonumber(testQ[v22("\139\112\233\7\155\112", "\75\237\28\141")])) < 1) then
											v9["FlatIdent_734D3%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_734D3%0"] == 0) then
													v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\209\86\195\151\35\31\203\247\208", "\129\188\63\172\209\79\123\135")])) / tonumber(testQ[v22("\70\232\226\225\86\232", "\173\32\132\134")])) * 10, 9);
													if (v9["x%2"] ~= 9) then
													else
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\67\18\7\201\162\53\225\88\23", "\173\46\123\104\143\206\81")])) / tonumber(testQ[v22("\178\17\38\166\83\143", "\97\212\125\66\234\37\227")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\135\234\185\19\18\142\207\160\57", "\126\234\131\214\85")])) / tonumber(testQ[v22("\130\217\77\118\89\136", "\47\228\181\41\58")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 19999;
									end
								end
								if ((902 < 2325) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\188\228", "\127\198\156\185\91\99\80"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 19999) then
										if (((5 * tonumber(testQ[v22("\248\19\195\214\171\15\21\200\249", "\190\149\122\172\144\199\107\89")])) / tonumber(testQ[v22("\52\9\245\210\232\62", "\158\82\101\145\158")])) < 1) then
											v9["FlatIdent_4185D%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_4185D%0"] == 0) then
													v9["x%2"] = math.random(((5 * tonumber(testQ[v22("\125\247\13\48\72\116\210\20\26", "\36\16\158\98\118")])) / tonumber(testQ[v22("\198\26\199\215\78\228", "\133\160\118\163\155\56\136\71")])) * 10, 9);
													if (v9["x%2"] ~= 9) then
													else
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\251\171\126\212\186\27\153\224\174", "\213\150\194\17\146\214\127")])) / tonumber(testQ[v22("\29\165\160\248\80\168", "\86\123\201\196\180\38\196\194")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((5 * tonumber(testQ[v22("\250\225\214\137\251\236\245\185\251", "\207\151\136\185")])) / tonumber(testQ[v22("\174\143\44\174\98\116", "\17\200\227\72\226\20\24")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 19999;
									end
								end
								v9["FlatIdent_1DE58%0"] = 3;
							end
						end
					else
						v9["FlatIdent_4FBC5%0"] = 0;
						while true do
							if (v9["FlatIdent_4FBC5%0"] == 1) then
								if ((4255 >= 55) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\188\89", "\159\208\33\123\183\169\145\143"))) then
									if ((2999 > 1156) and (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 19999)) then
										if (((1 * tonumber(testQ[v22("\255\83\55\16\254\94\20\32\254", "\86\146\58\88")])) / tonumber(testQ[v22("\94\211\238\236\184\229", "\154\56\191\138\160\206\137\86")])) < 1) then
											v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\139\80\250\161\112\62\173\218\138", "\172\230\57\149\231\28\90\225")])) / tonumber(testQ[v22("\4\166\130\254\62\215", "\187\98\202\230\178\72")])) * 10, 9);
											if ((2350 > 1155) and (v9["x%2"] == 9)) then
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\44\232\171\22\70\37\205\178\60", "\42\65\129\196\80")])) / tonumber(testQ[v22("\4\70\89\246\1\11", "\142\98\42\61\186\119\103\98")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\53\182\13\46\52\187\46\30\52", "\104\88\223\98")])) / tonumber(testQ[v22("\66\251\230\226\20\225", "\141\36\151\130\174\98")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 19999;
									end
								end
								if ((4029 <= 4853) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\144\96", "\109\228\26\162"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 29999) then
										if ((((1 * tonumber(testQ[v22("\83\236\242\94\236\226\114\243\241", "\134\62\133\157\24\128")])) / tonumber(testQ[v22("\1\169\30\245\57\189", "\182\103\197\122\185\79\209")])) < 1) or (516 > 3434)) then
											v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\254\142\238\81\12\76\223\145\237", "\40\147\231\129\23\96")])) / tonumber(testQ[v22("\115\244\136\105\173\160", "\188\21\152\236\37\219\204")])) * 10, 9);
											if (v9["x%2"] ~= 9) then
											else
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\77\224\56\42\76\237\27\26\76", "\108\32\137\87")])) / tonumber(testQ[v22("\172\228\4\138\57\245", "\57\202\136\96\198\79\153\43")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\166\42\165\129\129\163\212\189\47", "\152\203\67\202\199\237\199")])) / tonumber(testQ[v22("\252\79\164\35\9\121", "\134\154\35\192\111\127\21\25")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 29999;
									end
								end
								v9["FlatIdent_4FBC5%0"] = 2;
							end
							if (3 == v9["FlatIdent_4FBC5%0"]) then
								if ((mioFld[v253]["объекты"][tostring(v251)] == v22("\185\53", "\178\216\70\105\106\64")) or (525 == 2109)) then
									if ((33 == 33) and (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 14999)) then
										if (((1 * tonumber(testQ[v22("\50\34\117\208\197\209\248\150\51", "\224\95\75\26\150\169\181\180")])) / tonumber(testQ[v22("\13\214\220\4\82\160", "\22\107\186\184\72\36\204")])) < 1) then
											v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\234\180\43\104\2\227\145\50\66", "\110\135\221\68\46")])) / tonumber(testQ[v22("\229\58\8\199\216\191", "\91\131\86\108\139\174\211")])) * 10, 9);
											if ((3054 <= 4015) and (v9["x%2"] == 9)) then
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\246\34\183\49\81\255\7\174\27", "\61\155\75\216\119")])) / tonumber(testQ[v22("\2\167\182\16\78\5", "\189\100\203\210\92\56\105")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\34\88\242\14\35\85\209\62\35", "\72\79\49\157")])) / tonumber(testQ[v22("\142\188\53\144\158\188", "\220\232\208\81")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 14999;
									end
								end
								if ((1871 < 3382) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\239\173", "\193\149\222\133\80\76\58"))) then
									if ((1293 <= 2166) and (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 19999)) then
										if ((((1 * tonumber(testQ[v22("\203\84\64\244\202\89\99\196\202", "\178\166\61\47")])) / tonumber(testQ[v22("\253\70\236\86\220\50", "\94\155\42\136\26\170")])) < 1) or (2579 < 123)) then
											v9["FlatIdent_3EDDC%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_3EDDC%0"] == 0) then
													v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\137\54\41\147\136\59\10\163\136", "\213\228\95\70")])) / tonumber(testQ[v22("\44\183\198\168\97\38", "\23\74\219\162\228")])) * 10, 9);
													if ((v9["x%2"] == 9) or (846 >= 2368)) then
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\52\239\73\137\55\61\202\80\163", "\91\89\134\38\207")])) / tonumber(testQ[v22("\66\226\204\26\5\220", "\71\36\142\168\86\115\176")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\210\168\125\153\15\186\122\95\211", "\41\191\193\18\223\99\222\54")])) / tonumber(testQ[v22("\173\42\195\6\188\167", "\202\203\70\167\74")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 19999;
									end
								end
								v9["FlatIdent_4FBC5%0"] = 4;
							end
							if (0 == v9["FlatIdent_4FBC5%0"]) then
								if ((mioFld[v253]["объекты"][tostring(v251)] ~= v22("\36\18", "\17\76\97\188\83")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\159\52", "\195\229\71\185\87\80\227\43")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\250\228", "\143\128\156\96\48")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\171\201", "\119\216\177\144\114")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\221\42", "\34\169\73\153")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\171\255", "\235\202\140\107")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\14\119", "\165\108\20\84\200\137\71\151")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\120\167", "\232\26\212\75")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\53\81", "\151\87\41\18\136")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\65\172", "\158\59\207\170\176")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\85\78", "\236\47\62\83\41")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\238\179", "\226\154\201\64\91\202")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\213\95", "\220\161\41\125\120\42")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\177\33", "\110\220\17\192")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\121\127", "\199\20\25\84\122\139\87\145")) and (mioFld[v253]["объекты"][tostring(v251)] ~= v22("\75\17", "\138\39\105\189\206\123"))) then
									if ((tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 999) or (2253 == 1851)) then
										if ((((1 * tonumber(testQ[v22("\18\14\134\11\255\253\227\233\19", "\159\127\103\233\77\147\153\175")])) / tonumber(testQ[v22("\1\252\224\134\86\199", "\171\103\144\132\202\32")])) < 1) or (2087 > 2372)) then
											v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\29\38\230\42\28\43\197\26\28", "\108\112\79\137")])) / tonumber(testQ[v22("\57\206\112\4\187\13", "\85\95\162\20\72\205\97\137")])) * 10, 9);
											if (v9["x%2"] ~= 9) then
											else
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\250\244\37\250\1\252\225\225\241", "\173\151\157\74\188\109\152")])) / tonumber(testQ[v22("\34\4\60\241\202\88", "\147\68\104\88\189\188\52\181")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\23\129\132\246\22\140\167\198\22", "\176\122\232\235")])) / tonumber(testQ[v22("\134\121\62\99\248\140", "\142\224\21\90\47")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 999;
									end
								end
								if ((mioFld[v253]["объекты"][tostring(v251)] == v22("\124\199", "\229\20\180\71\54\196\235")) or (4445 < 4149)) then
									if ((tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 9999) or (1818 == 85)) then
										if ((630 < 2127) and (((1 * tonumber(testQ[v22("\36\119\206\197\249\174\172\63\114", "\224\73\30\161\131\149\202")])) / tonumber(testQ[v22("\247\233\245\124\231\233", "\48\145\133\145")])) < 1)) then
											v9["FlatIdent_30E68%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_30E68%0"] == 0) then
													v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\87\69\186\200\221\40\118\90\185", "\76\58\44\213\142\177")])) / tonumber(testQ[v22("\205\40\22\1\110\199", "\24\171\68\114\77")])) * 10, 9);
													if ((v9["x%2"] == 9) or (1938 == 2514)) then
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\226\20\95\116\139\218\40\187\227", "\205\143\125\48\50\231\190\100")])) / tonumber(testQ[v22("\199\171\16\41\247\239", "\194\161\199\116\101\129\131\191")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\225\45\199\142\251\166\192\50\196", "\194\140\68\168\200\151")])) / tonumber(testQ[v22("\68\247\209\9\227\78", "\149\34\155\181\69")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 9999;
									end
								end
								v9["FlatIdent_4FBC5%0"] = 1;
							end
							if (v9["FlatIdent_4FBC5%0"] == 4) then
								if ((mioFld[v253]["объекты"][tostring(v251)] == v22("\25\229", "\154\99\157\181")) or (4012 <= 3358)) then
									if ((1494 <= 3005) and (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 19999)) then
										if (((1 * tonumber(testQ[v22("\128\6\227\134\224\137\35\250\172", "\140\237\111\140\192")])) / tonumber(testQ[v22("\0\21\121\52\16\21", "\120\102\121\29")])) < 1) then
											v9["FlatIdent_643B6%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_643B6%0"] == 0) then
													v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\161\234\182\29\160\231\149\45\160", "\91\204\131\217")])) / tonumber(testQ[v22("\200\243\81\248\165\209", "\158\174\159\53\180\211\189")])) * 10, 9);
													if (v9["x%2"] ~= 9) then
													else
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\95\244\226\251\123\177\126\235\225", "\213\50\157\141\189\23")])) / tonumber(testQ[v22("\248\42\128\140\100\168", "\196\158\70\228\192\18")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\71\86\30\104\213\78\115\7\66", "\185\42\63\113\46")])) / tonumber(testQ[v22("\210\209\37\21\13\216", "\123\180\189\65\89")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 19999;
									end
								end
								if (mioFld[v253]["объекты"][tostring(v251)] == v22("\209\148", "\233\162\236\144\132")) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 29999) then
										if (((1 * tonumber(testQ[v22("\191\205\241\60\181\242\115\164\200", "\63\210\164\158\122\217\150")])) / tonumber(testQ[v22("\53\199\242\192\95\244", "\152\83\171\150\140\41")])) < 1) then
											v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\143\236\140\21\216\31\36\148\233", "\104\226\133\227\83\180\123")])) / tonumber(testQ[v22("\5\7\39\124\21\7", "\48\99\107\67")])) * 10, 9);
											if ((v9["x%2"] == 9) or (3111 == 2134)) then
												mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\211\175\114\246\33\127\242\176\113", "\27\190\198\29\176\77")])) / tonumber(testQ[v22("\233\71\249\24\191\66", "\46\143\43\157\84\201")]));
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\90\113\89\228\83\23\228\65\116", "\168\55\24\54\162\63\115")])) / tonumber(testQ[v22("\17\246\36\172\196\194", "\174\119\154\64\224\178")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 29999;
									end
								end
								break;
							end
							if (v9["FlatIdent_4FBC5%0"] == 2) then
								if ((4046 >= 3033) and (mioFld[v253]["объекты"][tostring(v251)] == v22("\39\46", "\132\74\30\165\27\101\199\122"))) then
									if (tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 29999) then
										if (((1 * tonumber(testQ[v22("\34\238\240\129\171\177\152\57\235", "\212\79\135\159\199\199\213")])) / tonumber(testQ[v22("\127\172\177\107\74\219", "\120\25\192\213\39\60\183")])) < 1) then
											v9["FlatIdent_755A7%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_755A7%0"] == 0) then
													v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\21\73\48\110\20\68\19\94\20", "\40\120\32\95")])) / tonumber(testQ[v22("\60\167\61\86\185\19", "\127\90\203\89\26\207")])) * 10, 9);
													if (v9["x%2"] ~= 9) then
													else
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\208\60\160\237\5\249\241\35\163", "\157\189\85\207\171\105")])) / tonumber(testQ[v22("\192\173\220\153\21\202", "\99\166\193\184\213")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\219\190\143\157\0\142\250\161\140", "\234\182\215\224\219\108")])) / tonumber(testQ[v22("\198\141\191\25\214\141", "\85\160\225\219")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 29999;
									end
								end
								if ((mioFld[v253]["объекты"][tostring(v251)] == v22("\72\6", "\43\60\101\227\169\86\188")) or (2719 <= 1447)) then
									if ((tonumber(mioFld[v253]["целостность"][tostring(v251)]) < 4999) or (4134 < 3926)) then
										if (((1 * tonumber(testQ[v22("\125\193\222\153\86\200\149\33\124", "\87\16\168\177\223\58\172\217")])) / tonumber(testQ[v22("\50\193\93\241\45\56", "\91\84\173\57\189")])) < 1) then
											v9["FlatIdent_47C14%0"] = 0;
											v9["x%2"] = nil;
											while true do
												if (v9["FlatIdent_47C14%0"] == 0) then
													v9["x%2"] = math.random(((1 * tonumber(testQ[v22("\29\176\3\218\172\210\60\175\0", "\182\112\217\108\156\192")])) / tonumber(testQ[v22("\172\4\76\195\157\166", "\235\202\104\40\143")])) * 10, 9);
													if ((v9["x%2"] == 9) or (164 >= 2785)) then
														mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\0\130\20\159\1\143\55\175\1", "\217\109\235\123")])) / tonumber(testQ[v22("\33\133\122\122\102\220", "\221\71\233\30\54\16\176\173")]));
													end
													break;
												end
											end
										else
											mioFld[v253]["целостность"][tostring(v251)] = tonumber(mioFld[v253]["целостность"][tostring(v251)]) + round((1 * tonumber(testQ[v22("\57\245\81\153\56\248\114\169\56", "\223\84\156\62")])) / tonumber(testQ[v22("\208\240\230\241\161\55", "\91\182\156\130\189\215")]));
										end
									else
										mioFld[v253]["целостность"][tostring(v251)] = 4999;
									end
								end
								v9["FlatIdent_4FBC5%0"] = 3;
							end
						end
					end
					SendAddonMessage(v22("\108\118\191\122\124\121\236", "\53\30\19\204") .. v251 .. " " .. mioFld[v253]["целостность"][tostring(v251)], v253, v22("\254\245\121\136\163", "\199\153\128\16\228"));
				end
			end
			break;
		end
		if (v9["FlatIdent_6D8EC%0"] == 0) then
			if ((4723 >= 2318) and (krt == nil)) then
				krt = {};
			end
			if ((krt[v22("\193\37\225\10\172\208\48\238\16", "\199\177\74\133\121")] == nil) or (2027 > 2852)) then
				krt[v22("\168\198\184\237\60\199\48\179\192", "\74\216\169\220\158\87\166")] = 1;
			end
			v9["FlatIdent_6D8EC%0"] = 1;
		end
	end
end
function gKam(v255, v256)
	v9["testK%0"] = nil;
	if ((2355 == 2355) and (tonumber(v256) == 500)) then
		v9["FlatIdent_8DBF2%0"] = 0;
		while true do
			if (v9["FlatIdent_8DBF2%0"] == 0) then
				for v975 = 1, 100 do
					if (mioFld[v255]["объекты"][tostring(v975)] ~= v22("\251\40", "\58\136\67\115\76")) then
					elseif ((v9["testK%0"] == nil) or (588 <= 432)) then
						v9["testK%0"] = 1;
					else
						v9["testK%0"] = v9["testK%0"] + 1;
					end
				end
				if ((4797 >= 3895) and (v9["testK%0"] == nil)) then
					v9["FlatIdent_4BEE8%0"] = 0;
					while true do
						if (v9["FlatIdent_4BEE8%0"] == 0) then
							testQ[v22("\250\171\213\92\139", "\61\145\202\184\57\229\64\203")] = testQ[v22("\87\83\132\66\82", "\39\60\50\233")] + 1;
							testQ[v22("\20\58\168\29\169", "\195\122\83\195\76\226\72\210")] = antc(testQ[v22("\239\213\54\251\47", "\65\132\180\91\158")]);
							v9["FlatIdent_4BEE8%0"] = 1;
						end
						if (v9["FlatIdent_4BEE8%0"] == 2) then
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg");
							break;
						end
						if (v9["FlatIdent_4BEE8%0"] == 1) then
							if ((3577 == 3577) and (ach_ach[11] == nil)) then
								SendAddonMessage(v22("\70\125\210\38\51\79\244", "\78\101\28\177"), 11, v22("\34\161\233\93\33", "\49\69\212\128"));
							end
							SendAddonMessage(v22("\25\31\239\249\209", "\129\119\108\176\146"), "0", v22("\59\218\14\193\33", "\124\92\175\103\173\69\110"));
							v9["FlatIdent_4BEE8%0"] = 2;
						end
					end
				elseif (v9["testK%0"] == 1) then
					testQ[v22("\202\57\14\50\207", "\87\161\88\99")] = testQ[v22("\25\248\226\201\185", "\67\114\153\143\172\215\176")] + 1;
					testQ[v22("\176\171\229\63\149", "\110\222\194\142")] = antc(testQ[v22("\28\216\22\172\92", "\193\119\185\123\201\50")]);
					if (ach_ach[11] ~= nil) then
					else
						SendAddonMessage(v22("\52\9\250\46\57\74\58", "\127\23\104\153\70\111\25"), 11, v22("\14\18\175\163\47", "\211\105\103\198\207\75\76\215"));
					end
					SendAddonMessage(v22("\192\180\143\228\78", "\214\174\199\208\143\30\108\218"), "1", v22("\22\145\2\166\161", "\41\113\228\107\202\197\54\184"));
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg");
				elseif ((3794 > 3693) and (v9["testK%0"] == 2)) then
					v9["FlatIdent_23A2C%0"] = 0;
					while true do
						if (1 == v9["FlatIdent_23A2C%0"]) then
							if ((ach_ach[11] == nil) or (1275 == 4100)) then
								SendAddonMessage(v22("\57\140\59\84\76\190\29", "\60\26\237\88"), 11, v22("\223\63\125\234\170", "\206\184\74\20\134"));
							end
							SendAddonMessage(v22("\54\247\209\186\195", "\172\88\132\142\209\147\42\88"), "2", v22("\128\159\197\1\50", "\222\231\234\172\109\86\149"));
							v9["FlatIdent_23A2C%0"] = 2;
						end
						if (v9["FlatIdent_23A2C%0"] == 2) then
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg");
							break;
						end
						if (v9["FlatIdent_23A2C%0"] == 0) then
							testQ[v22("\230\238\205\29\227", "\120\141\143\160")] = testQ[v22("\75\173\187\87\78", "\50\32\204\214")] + 1;
							testQ[v22("\136\78\62\72\152", "\113\230\39\85\25\211")] = antc(testQ[v22("\213\186\11\237\41", "\43\190\219\102\136\71\171\203")]);
							v9["FlatIdent_23A2C%0"] = 1;
						end
					end
				elseif (v9["testK%0"] == 3) then
					testQ[v22("\41\127\61\92\44", "\57\66\30\80")] = testQ[v22("\34\217\173\16\138", "\228\73\184\192\117\228\89\148")] + 1;
					testQ[v22("\193\128\126\37\228", "\116\175\233\21")] = antc(testQ[v22("\245\249\179\67\213", "\95\158\152\222\38\187\81")]);
					if (ach_ach[11] ~= nil) then
					else
						SendAddonMessage(v22("\187\188\54\186\149\251\221", "\168\152\221\85\210\195"), 11, v22("\172\203\252\139\175", "\231\203\190\149"));
					end
					SendAddonMessage(v22("\195\46\220\250\140", "\123\173\93\131\145\220\149"), "3", v22("\17\209\228\45\112", "\153\118\164\141\65\20"));
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg");
				elseif ((v9["testK%0"] == 4) or (1591 >= 3580)) then
					testQ[v22("\229\51\139\231\249", "\96\142\82\230\130\151")] = testQ[v22("\68\177\66\71\234", "\142\47\208\47\34\132")] + 1;
					testQ[v22("\248\183\15\51\112", "\60\150\222\100\98\59")] = antc(testQ[v22("\78\61\90\83\213", "\81\37\92\55\54\187\218")]);
					if (ach_ach[11] ~= nil) then
					else
						SendAddonMessage(v22("\67\69\174\63\183\51\97", "\225\96\36\205\87"), 11, v22("\238\179\75\117\120", "\105\137\198\34\25\28\47"));
					end
					SendAddonMessage(v22("\31\186\126\125\240", "\160\113\201\33\22"), "4", v22("\211\77\165\171\173", "\205\180\56\204\199\201"));
					PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg");
				elseif ((983 <= 1808) and (v9["testK%0"] == 5)) then
					v9["FlatIdent_5062%0"] = 0;
					while true do
						if (0 == v9["FlatIdent_5062%0"]) then
							testQ[v22("\136\223\49\29\141", "\120\227\190\92")] = testQ[v22("\54\93\18\126\45", "\130\93\60\127\27\67\60\185")] + 1;
							testQ[v22("\70\59\51\127\203", "\29\40\82\88\46\128\35")] = antc(testQ[v22("\48\68\217\24\15", "\216\91\37\180\125\97")]);
							v9["FlatIdent_5062%0"] = 1;
						end
						if (v9["FlatIdent_5062%0"] == 1) then
							if ((ach_ach[11] == nil) or (2150 <= 1197)) then
								SendAddonMessage(v22("\102\119\31\203\97\22\83", "\55\69\22\124\163"), 11, v22("\127\198\85\228\219", "\148\24\179\60\136\191\17\48"));
							end
							SendAddonMessage(v22("\188\57\198\171\198", "\150\210\74\153\192"), "5", v22("\228\221\49\134\113", "\212\131\168\88\234\21\26"));
							v9["FlatIdent_5062%0"] = 2;
						end
						if (v9["FlatIdent_5062%0"] == 2) then
							PlaySoundFile("Interface\\AddOns\\NSQC\\libs\\k.ogg");
							break;
						end
					end
				end
				break;
			end
		end
	end
end
function bdf(v258)
	v9["FlatIdent_81F6A%0"] = 0;
	while true do
		if (v9["FlatIdent_81F6A%0"] == 0) then
			if ((3769 >= 1173) and (testQ == nil)) then
				testQ = {};
			end
			if (testQ[v22("\72\109\167\131\53\34", "\71\37\20\233\236\88")] == nil) then
				testQ[v22("\192\95\158\25\77\233", "\60\173\38\208\118\32\140\44")] = {};
			end
			v9["FlatIdent_81F6A%0"] = 1;
		end
		if (v9["FlatIdent_81F6A%0"] == 1) then
			if (testQ[v258]["настройки"] ~= nil) then
			else
				testQ[v258]["настройки"] = {};
			end
			if ((1485 == 1485) and (testQ[v258]["настройки"][v22("\69\55\227\198\38\201\98\58\234\241", "\175\33\82\129\179\64")] == nil)) then
				testQ[v258]["настройки"][v22("\234\234\50\218\58\180\205\231\59\237", "\210\142\143\80\175\92")] = {};
			end
			v9["FlatIdent_81F6A%0"] = 2;
		end
		if (v9["FlatIdent_81F6A%0"] == 2) then
			if (DebuffButton1 == nil) then
			elseif ((tonumber(testQ[v22("\187\252\245\192\129", "\166\217\137\147")]) ~= nil) and (tonumber(testQ[v22("\225\182\116\160\201", "\38\131\195\18\198\145")]) ~= 0)) then
				v9["FlatIdent_EE01%0"] = 0;
				v9["__%0"] = nil;
				v9["tempPoint%0"] = nil;
				v9["tempPointB%0"] = nil;
				while true do
					if (0 == v9["FlatIdent_EE01%0"]) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["tempPoint%0"] = DebuffButton1:GetPoint();
						v9["__%0"], v9["__%0"], v9["__%0"], v9["tempPointB%0"] = btn[991]:GetPoint();
						v9["FlatIdent_EE01%0"] = 1;
					end
					if (v9["FlatIdent_EE01%0"] == 1) then
						if (v9["tempPoint%0"] ~= v9["tempPointB%0"]) then
							local v1262, v1263 = DebuffButton1:GetSize();
							v9["getSize%0"] = UIParent:GetSize() / 2;
							j = 1;
							for v1293 = 1, DEBUFF_MAX_DISPLAY do
								if (AuraButton_Update(v22("\119\211\56\254\62\82\113\195\46\255\55\90", "\52\51\182\90\139\88"), v1293, v22("\222\152\226\202\101\195\149", "\35\150\217\176\135")) or (3315 <= 2782)) then
									local v1346, v1347, v1347, v1347, v1347, v1347, v1347, v1347 = UnitDebuff(v22("\233\92\10\21\114\81", "\22\153\48\107\108\23\35"), v1293);
									v9["buff%0"] = _G[v22("\42\128\185\15\121\115\99\252\26\145\180\20", "\137\110\229\219\122\31\21\33") .. v1293];
									if ((v9["buff%0"] ~= nil) and ((testQ[v258]["настройки"][v22("\30\184\58\110\48\77\7\118\17\159", "\30\122\221\88\27\86\43\68")][v1346] == nil) or (testQ[v258]["настройки"][v22("\60\45\233\147\62\46\200\142\51\10", "\230\88\72\139")][v1346] == v22("\86\189\5\26\1\4\93", "\56\18\212\118\123\99\104")))) then
										v9["buff%0"]:ClearAllPoints();
										if ((tonumber(testQ[v22("\28\252\254\213\231", "\190\126\137\152\179\191")]) < v9["getSize%0"]) or (876 >= 2964)) then
											v9["FlatIdent_5C3A6%0"] = 0;
											while true do
												if (0 == v9["FlatIdent_5C3A6%0"]) then
													v9["buff%0"]:SetPoint(v22("\10\45\70\255\133\109\4\39\84\255", "\32\72\98\18\171\202"), UIParent, v22("\38\167\6\64\216\41\164\23\82\195", "\151\100\232\82\20"), tonumber(testQ[v22("\125\204\240\14\71", "\104\31\185\150")]) + (v1262 * j), testQ['buffY']);
													j = j + 1;
													break;
												end
											end
										else
											v9["buff%0"]:SetPoint(v22("\254\150\199\195\200\225\204\229\250\141", "\160\188\217\147\151\135\172\128"), UIParent, v22("\45\242\36\196\21\228\35\248\54\196", "\169\111\189\112\144\90"), tonumber(testQ[v22("\207\150\35\171\135", "\226\173\227\69\205\223\224\105")]) - (v1262 * j), testQ['buffY']);
											j = j + 1;
										end
									elseif ((v9["buff%0"] ~= nil) and v9["buff%0"]:IsVisible()) then
										v9["buff%0"]:Hide();
									end
								end
							end
						end
						if (testQ[v22("\90\43\36\93\247", "\123\56\94\66\59\175")] ~= 0) then
						else
							testQ[v22("\248\86\117\231\34", "\225\154\35\19\129\122\158")] = nil;
						end
						break;
					end
				end
			end
			break;
		end
	end
end
function gtest()
	v9["FlatIdent_7FA00%0"] = 0;
	while true do
		if (v9["FlatIdent_7FA00%0"] == 0) then
			gTest = nil;
			gTest = {};
			v9["FlatIdent_7FA00%0"] = 1;
		end
		if (v9["FlatIdent_7FA00%0"] == 1) then
			for v798 = 1, 50 do
				v9["FlatIdent_30671%0"] = 0;
				v9["t1%0"] = nil;
				v9["t2%0"] = nil;
				v9["g%0"] = nil;
				v9["r%10"] = nil;
				v9["t3%0"] = nil;
				v9["t4%0"] = nil;
				v9["t%0"] = nil;
				while true do
					if (v9["FlatIdent_30671%0"] == 0) then
						v9["t1%0"], v9["t2%0"], v9["g%0"], v9["r%10"], v9["t3%0"], v9["t4%0"], v9["t%0"] = GetWhoInfo(v798);
						if (v9["t2%0"] ~= "") then
						elseif ((v9["r%10"] ~= "Дреней") and (v9["r%10"] ~= "Ночная эльфийка") and (v9["r%10"] ~= "Человек") and (v9["r%10"] ~= "Ночной эльф") and (v9["r%10"] ~= "Гном") and (v9["r%10"] ~= "Дворф")) then
							table.insert(gTest, v9["t1%0"]);
						end
						break;
					end
				end
			end
			break;
		end
	end
end
function closeFld()
	v9["FlatIdent_6C277%0"] = 0;
	while true do
		if (v9["FlatIdent_6C277%0"] == 0) then
			for v807 = 1, 100 do
				fBtn[v807]:Hide();
			end
			for v808 = 1, 100 do
				if ((mgznIcon[1] == nil) or not mgznIcon[1]:IsVisible()) then
					if ((resursy[v808] ~= nil) or (2232 > 2497)) then
						if (v808 == 5) then
							if ((mgznIcon[1] ~= nil) and mgznIcon[1]:IsVisible()) then
							end
						else
							resursy[v808]:Hide();
						end
					end
				end
			end
			v9["FlatIdent_6C277%0"] = 1;
		end
		if (v9["FlatIdent_6C277%0"] == 1) then
			btn[989]:Hide();
			btn[989]:ClearAllPoints();
			v9["FlatIdent_6C277%0"] = 2;
		end
		if (v9["FlatIdent_6C277%0"] == 2) then
			btn[989]:SetPoint(v22("\120\47\223\99\218\202\252\17\124\52", "\84\58\96\139\55\149\135\176"), GuildMemberDetailFrame, v22("\39\16\147\44\107\233\10", "\94\115\95\195\96\46\175"), 96, -3);
			break;
		end
	end
end
function hX()
	quesT(v22("\75\66\59\56", "\128\35\43\95\93\78\77\231"));
	okNo:configure(1, v22("\172\20\50\49", "\201\196\125\86\84\119\30"));
	rtnTextF(v22("\197\234\23\190", "\223\163\142\100"), 1, v22("\138\31\199\180", "\216\226\118\163\209"));
	for v439 = 1, 100 do
		fBtn[v439]:Hide();
	end
	if ((resursy[1] ~= nil) or (2110 <= 332)) then
		resursy[1]:Hide();
		resursy[2]:Hide();
		resursy[3]:Hide();
	end
	if ((3686 > 3172) and (okNo ~= nil)) then
		v9["FlatIdent_FA0F%0"] = 0;
		while true do
			if (v9["FlatIdent_FA0F%0"] == 0) then
				okNo[1]:Hide();
				okNo[2]:Hide();
				break;
			end
		end
	end
	btn[989]:Hide();
	btn[989]:ClearAllPoints();
	btn[989]:SetPoint(v22("\156\223\47\53\120\93\19\155\214\47", "\95\222\144\123\97\55\16"), GuildMemberDetailFrame, v22("\45\171\138\111\198\63\176", "\131\121\228\218\35"), 96, -3);
end
function showFld(v262, v263)
	v9["FlatIdent_18D84%0"] = 0;
	v9["nome%0"] = nil;
	v9["proverkaLvla%0"] = nil;
	v9["proverkaLvla1%0"] = nil;
	while true do
		if (v9["FlatIdent_18D84%0"] == 1) then
			v9["proverkaLvla1%0"] = nil;
			if (not fBtn[1]:IsVisible() or (4474 < 820)) then
				if ((4279 >= 2882) and (not GuildFrameLFGButton:GetChecked() or (v262 == "1"))) then
					v9["FlatIdent_3423%0"] = 0;
					while true do
						if (v9["FlatIdent_3423%0"] == 3) then
							SendAddonMessage(v22("\202\216\15\39\117\31\153", "\123\185\176\66\97\25") .. testQ[v22("\206\61\24\95\17\126", "\81\168\111\121\49\117\79\56")], v9["nome%0"] .. " " .. v263, v22("\192\31\236\186\195", "\214\167\106\133"));
							FriendsFrame:Hide();
							break;
						end
						if (0 == v9["FlatIdent_3423%0"]) then
							if (v262 == "0") then
								v9["nome%0"] = GuildFrame[v22("\58\61\64\74\55\107\220\45\22\77\66\49", "\185\73\88\44\47\84\31")];
							else
								v9["nome%0"] = v263;
							end
							btn[989]:ClearAllPoints();
							v9["FlatIdent_3423%0"] = 1;
						end
						if (v9["FlatIdent_3423%0"] == 1) then
							btn[989]:SetPoint(v22("\170\248\46\148\252\210\186\254\61\136\231", "\159\232\183\122\192\179"), fBtn[10], v22("\16\29\152\19\13\21\128\21", "\65\68\82\200"), 1, 1);
							for v1217 = 1, GetNumGuildMembers(true) do
								local v1218, v1219, v1220, v1221, v1222, v1223, v1224, v1225, v1226, v1227, v1228, v1229, v1230, v1231, v1232, v1233, v1234 = GetGuildRosterInfo(v1217);
								if ((v9["nome%0"] ~= v263) or (2029 >= 3521)) then
									if ((v1218 == v9["nome%0"]) or (2037 >= 4642)) then
										v9["proverkaLvla%0"] = string.sub(v1225, 1, 1);
										v9["proverkaLvla1%0"] = string.sub(v1225, 2, 2);
										if ((v1225 ~= "") and (v9["proverkaLvla%0"] ~= "1") and (v9["proverkaLvla%0"] ~= "0")) then
											testQ[v22("\35\92\118\12\217\195", "\30\69\48\18\64\175\175")] = tonumber(v9["proverkaLvla%0"]);
											testQ[v22("\225\2\10\225", "\91\144\76\127\140")] = string.sub(v1225, 8, 8);
											testQ[v22("\241\44\71\56", "\176\128\104\38\65\179\218\181")] = string.sub(v1225, 6, 7);
										elseif (v9["proverkaLvla%0"] == "1") then
											v9["FlatIdent_3E39%0"] = 0;
											while true do
												if (v9["FlatIdent_3E39%0"] == 0) then
													testQ[v22("\214\200\198\57\198\200", "\117\176\164\162")] = 0.9;
													testQ[v22("\149\236\16\253", "\25\228\162\101\144\186")] = string.sub(v1225, 8, 8);
													v9["FlatIdent_3E39%0"] = 1;
												end
												if (1 == v9["FlatIdent_3E39%0"]) then
													testQ[v22("\89\18\184\23", "\132\40\86\217\110\146")] = string.sub(v1225, 6, 7);
													break;
												end
											end
										elseif (v9["proverkaLvla%0"] == "0") then
											testQ[v22("\120\199\35\144\177\127", "\62\30\171\71\220\199\19\156")] = 0.5;
											testQ[v22("\81\107\185\59", "\45\32\37\204\86\61\169\79")] = 0;
											testQ[v22("\68\113\4\165", "\28\53\53\101\220\213")] = 0;
										elseif (v9["proverkaLvla%0"] == "") then
											v9["FlatIdent_8E53E%0"] = 0;
											while true do
												if (v9["FlatIdent_8E53E%0"] == 0) then
													testQ[v22("\11\80\12\109\76\173", "\191\109\60\104\33\58\193\48")] = 0.5;
													testQ[v22("\150\249\13\234", "\135\231\183\120")] = 0;
													v9["FlatIdent_8E53E%0"] = 1;
												end
												if (1 == v9["FlatIdent_8E53E%0"]) then
													testQ[v22("\247\46\77\253", "\201\134\106\44\132\85\122")] = 0;
													break;
												end
											end
										end
										if ((1720 < 4458) and (v9["proverkaLvla1%0"] == nil)) then
											v9["FlatIdent_2CA66%0"] = 0;
											while true do
												if (v9["FlatIdent_2CA66%0"] == 0) then
													testQ[v22("\48\0\115\19\23\0", "\67\86\108\23\95\97\108\168")] = 0.5;
													testQ[v22("\181\22\89\7", "\48\196\88\44\106\196\68\181")] = 0;
													v9["FlatIdent_2CA66%0"] = 1;
												end
												if (v9["FlatIdent_2CA66%0"] == 1) then
													testQ[v22("\147\251\221\58", "\76\226\191\188\67\224\196\194")] = 0;
													break;
												end
											end
										end
									end
									if ((v1218 == v263) or (436 > 3021)) then
										v9["proverkaLvla%0"] = string.sub(v1225, 1, 1);
										if ((713 <= 847) and (v1225 ~= "") and (v9["proverkaLvla%0"] ~= "1") and (v9["proverkaLvla%0"] ~= "0")) then
											testQ[v22("\212\33\8\214\241\221\4\17\252", "\157\185\72\103\144")] = string.sub(v1225, 1, 1);
										elseif ((2154 <= 4031) and (v9["proverkaLvla%0"] == "1")) then
											testQ[v22("\84\186\133\92\164\181\117\165\134", "\209\57\211\234\26\200")] = 0.9;
										elseif ((4615 == 4615) and (v9["proverkaLvla%0"] == "0")) then
											testQ[v22("\12\199\169\167\92\214\45\216\170", "\178\97\174\198\225\48")] = 0.5;
										elseif (v9["proverkaLvla%0"] ~= "") then
										else
											testQ[v22("\194\95\11\215\116\226\35\217\90", "\111\175\54\100\145\24\134")] = 0.5;
										end
									end
								elseif (v1218 ~= v263) then
								else
									v9["proverkaLvla%0"] = string.sub(v1225, 1, 1);
									v9["proverkaLvla1%0"] = string.sub(v1225, 2, 2);
									if ((v1225 ~= "") and (v9["proverkaLvla%0"] ~= "1") and (v9["proverkaLvla%0"] ~= "0")) then
										v9["FlatIdent_69E54%0"] = 0;
										while true do
											if (1 == v9["FlatIdent_69E54%0"]) then
												testQ[v22("\82\55\53\24", "\117\35\121\64")] = string.sub(v1225, 8, 8);
												testQ[v22("\204\153\239\207", "\47\189\221\142\182\67")] = string.sub(v1225, 6, 7);
												break;
											end
											if (v9["FlatIdent_69E54%0"] == 0) then
												testQ[v22("\45\182\40\237\68\173\12\63\44", "\73\64\223\71\171\40\201\64")] = string.sub(v1225, 1, 1);
												testQ[v22("\12\129\192\117\182\113", "\29\106\237\164\57\192")] = testQ[v22("\188\173\232\156\217\214\140\228\189", "\146\209\196\135\218\181\178\192")];
												v9["FlatIdent_69E54%0"] = 1;
											end
										end
									elseif ((v9["proverkaLvla%0"] == "1") or (3790 == 500)) then
										testQ[v22("\32\57\140\55\92\163\1\38\143", "\199\77\80\227\113\48")] = 0.9;
										testQ[v22("\44\51\90\225\60\51", "\173\74\95\62")] = testQ[v22("\203\16\83\16\199\3\144\208\21", "\220\166\121\60\86\171\103")];
										testQ[v22("\248\44\40\189", "\122\137\98\93\208\91\170")] = string.sub(v1225, 8, 8);
										testQ[v22("\150\197\29\86", "\170\231\129\124\47\181\210\201")] = string.sub(v1225, 6, 7);
									elseif ((89 < 221) and (v9["proverkaLvla%0"] == "0")) then
										testQ[v22("\134\178\53\22\6\46\167\173\54", "\74\235\219\90\80\106")] = 0.5;
										testQ[v22("\74\207\95\23\44\248", "\146\44\163\59\91\90\148\26")] = testQ[v22("\120\36\183\167\69\113\1\174\141", "\41\21\77\216\225")];
										testQ[v22("\5\99\103\72", "\37\116\45\18")] = 0;
										testQ[v22("\222\219\87\187", "\203\175\159\54\194")] = 0;
									elseif ((2054 >= 1421) and (v9["proverkaLvla%0"] == "")) then
										v9["FlatIdent_4B539%0"] = 0;
										while true do
											if (v9["FlatIdent_4B539%0"] == 1) then
												testQ[v22("\106\224\12\54", "\162\27\174\121\91\58\47")] = 0;
												testQ[v22("\194\225\30\236", "\185\179\165\127\149\95")] = 0;
												break;
											end
											if (v9["FlatIdent_4B539%0"] == 0) then
												testQ[v22("\92\124\192\210\27\85\89\217\248", "\119\49\21\175\148")] = 0.5;
												testQ[v22("\81\185\18\113\59\69", "\149\55\213\118\61\77\41\234")] = testQ[v22("\16\15\197\224\229\61\131\13\17", "\123\125\102\170\166\137\89\207")];
												v9["FlatIdent_4B539%0"] = 1;
											end
										end
									end
									if ((692 < 3058) and (v9["proverkaLvla1%0"] == nil)) then
										v9["FlatIdent_6D84C%0"] = 0;
										while true do
											if (v9["FlatIdent_6D84C%0"] == 0) then
												testQ[v22("\67\9\87\27\2\135\133\88\12", "\201\46\96\56\93\110\227")] = 0.5;
												testQ[v22("\189\15\234\213\3\205", "\161\219\99\142\153\117")] = testQ[v22("\113\184\169\85\193\120\157\176\127", "\173\28\209\198\19")];
												v9["FlatIdent_6D84C%0"] = 1;
											end
											if (v9["FlatIdent_6D84C%0"] == 1) then
												testQ[v22("\100\194\162\182", "\219\21\140\215")] = 0;
												testQ[v22("\89\156\199\190", "\56\40\216\166\199")] = 0;
												break;
											end
										end
									end
								end
								if (tonumber(testQ[v22("\43\189\26\9\42\176\57\57\42", "\79\70\212\117")]) ~= 0) then
								else
									testQ[v22("\170\31\238\224\245\9\139\0\237", "\109\199\118\129\166\153")] = 0.5;
								end
								if ((tonumber(testQ[v22("\55\188\115\218\39\188", "\150\81\208\23")]) == 0) or (3254 == 1655)) then
									testQ[v22("\255\201\228\167\239\201", "\235\153\165\128")] = 0.5;
								end
							end
							v9["FlatIdent_3423%0"] = 2;
						end
						if (v9["FlatIdent_3423%0"] == 2) then
							testQ[v22("\189\123\163\33\66\119", "\158\219\41\194\79\38\70\202")] = math.random(1, 1000000);
							testQ[v22("\80\44\40\12", "\232\35\69\79\98\142\182")] = v262;
							v9["FlatIdent_3423%0"] = 3;
						end
					end
				else
					v9["FlatIdent_6E9BC%0"] = 0;
					while true do
						if (4 == v9["FlatIdent_6E9BC%0"]) then
							testQ[v22("\106\9\24\243", "\157\25\96\127")] = nil;
							testQ[v22("\161\177\244\11\84\21\246\141\250\8\85", "\81\199\227\149\101\48")] = nil;
							break;
						end
						if (v9["FlatIdent_6E9BC%0"] == 2) then
							for v1235 = 1, 100 do
								if ((3368 == 3368) and (dmG[v1235] ~= nil) and dmG[v1235]:IsVisible()) then
									dmG[v1235]:Hide();
								end
							end
							for v1236 = 1, 3 do
								if ((mgznIcon[1] == nil) or not mgznIcon[1]:IsVisible()) then
									if (resursy[v1236] == nil) then
									elseif ((2643 < 3815) and (v1236 == 5)) then
										if ((1913 > 493) and (mgznIcon[1] ~= nil) and mgznIcon[1]:IsVisible()) then
										end
									else
										resursy[v1236]:Hide();
									end
								end
							end
							v9["FlatIdent_6E9BC%0"] = 3;
						end
						if (v9["FlatIdent_6E9BC%0"] == 0) then
							for v1237 = 1, 100 do
								fBtn[v1237]:Hide();
							end
							btn[989]:ClearAllPoints();
							v9["FlatIdent_6E9BC%0"] = 1;
						end
						if (v9["FlatIdent_6E9BC%0"] == 3) then
							for v1238 = 101, 103 do
								if ((4755 > 3428) and (dmG[v1238] ~= nil)) then
									dmG[v1238]:Hide();
								end
							end
							if (tonumber(testQ[v22("\110\91\252\31", "\219\29\50\155\113\150\230\92")]) ~= 0) then
							else
								FriendsFrame:Show();
							end
							v9["FlatIdent_6E9BC%0"] = 4;
						end
						if (1 == v9["FlatIdent_6E9BC%0"]) then
							btn[989]:SetPoint(v22("\243\15\241\79\208\101\97\244\6\241", "\45\177\64\165\27\159\40"), GuildMemberDetailFrame, v22("\41\57\63\134\87\59\34", "\18\125\118\111\202"), 96, -3);
							if ((resursy[1] ~= nil) or (1296 == 4910)) then
								v9["FlatIdent_943B1%0"] = 0;
								while true do
									if (v9["FlatIdent_943B1%0"] == 1) then
										resursy[3]:Hide();
										break;
									end
									if (v9["FlatIdent_943B1%0"] == 0) then
										resursy[1]:Hide();
										resursy[2]:Hide();
										v9["FlatIdent_943B1%0"] = 1;
									end
								end
							end
							v9["FlatIdent_6E9BC%0"] = 2;
						end
					end
				end
			else
				v9["FlatIdent_2394%0"] = 0;
				while true do
					if (v9["FlatIdent_2394%0"] == 3) then
						testQ[v22("\67\53\94\244", "\155\48\92\57\154\80\205\167")] = nil;
						break;
					end
					if (v9["FlatIdent_2394%0"] == 2) then
						for v1125 = 101, 103 do
							if ((dmG[v1125] ~= nil) or (4540 == 916)) then
								dmG[v1125]:Hide();
							end
						end
						if (tonumber(testQ[v22("\170\196\188\177", "\37\217\173\219\223\152\203")]) ~= 0) then
						else
							FriendsFrame:Show();
						end
						v9["FlatIdent_2394%0"] = 3;
					end
					if (v9["FlatIdent_2394%0"] == 1) then
						for v1126 = 1, 100 do
							if ((1381 <= 2369) and (dmG[v1126] ~= nil) and dmG[v1126]:IsVisible()) then
								dmG[v1126]:Hide();
							end
						end
						for v1127 = 1, 100 do
							if ((mgznIcon[1] == nil) or not mgznIcon[1]:IsVisible() or (4843 == 4084)) then
								if ((4669 > 363) and (resursy[v1127] ~= nil)) then
									if ((v1127 == 5) or (1877 >= 3138)) then
										if ((4742 >= 3626) and (mgznIcon[1] ~= nil) and mgznIcon[1]:IsVisible()) then
										end
									else
										resursy[v1127]:Hide();
									end
								end
							end
						end
						v9["FlatIdent_2394%0"] = 2;
					end
					if (v9["FlatIdent_2394%0"] == 0) then
						for v1128 = 1, 100 do
							v9["FlatIdent_3A079%0"] = 0;
							while true do
								if (v9["FlatIdent_3A079%0"] == 0) then
									fBtn[v1128]:Hide();
									btn[989]:ClearAllPoints();
									v9["FlatIdent_3A079%0"] = 1;
								end
								if (v9["FlatIdent_3A079%0"] == 1) then
									btn[989]:SetPoint(v22("\43\42\43\2\96\133\218\44\35\43", "\150\105\101\127\86\47\200"), GuildMemberDetailFrame, v22("\250\221\195\153\226\230\250", "\160\174\146\147\213\167"), 96, -3);
									break;
								end
							end
						end
						if (resursy[1] ~= nil) then
							resursy[1]:Hide();
							resursy[2]:Hide();
							resursy[3]:Hide();
						end
						v9["FlatIdent_2394%0"] = 1;
					end
				end
			end
			break;
		end
		if (v9["FlatIdent_18D84%0"] == 0) then
			v9["nome%0"] = nil;
			v9["proverkaLvla%0"] = nil;
			v9["FlatIdent_18D84%0"] = 1;
		end
	end
end
function qLvl33c1()
	v9["FlatIdent_6D399%0"] = 0;
	v9["idNpc%0"] = nil;
	v9["nomeNpc1%0"] = nil;
	v9["nomeNpc2%0"] = nil;
	v9["nomeNpc3%0"] = nil;
	v9["emotQ%0"] = nil;
	v9["emotQ1%0"] = nil;
	v9["emotQ2%0"] = nil;
	while true do
		if (v9["FlatIdent_6D399%0"] == 1) then
			v9["emotQ%0"] = nil;
			v9["emotQ1%0"] = nil;
			v9["emotQ2%0"] = nil;
			v9["emotQ%0"] = rndTblc(eMotC)["квест"];
			v9["FlatIdent_6D399%0"] = 2;
		end
		if (v9["FlatIdent_6D399%0"] == 3) then
			v9["nomeNpc1%0"] = npcListC1[v9["idNpc%0"]]["имя"];
			v9["idNpc%0"] = rndTblc(npcListC1)["айди"];
			v9["nomeNpc2%0"] = npcListC1[v9["idNpc%0"]]["имя"];
			while true do
				if ((v9["nomeNpc1%0"] == v9["nomeNpc2%0"]) or (1156 > 4345)) then
					v9["FlatIdent_7334F%0"] = 0;
					while true do
						if (v9["FlatIdent_7334F%0"] == 0) then
							v9["idNpc%0"] = rndTblc(npcListC1)["айди"];
							v9["nomeNpc2%0"] = npcListC1[v9["idNpc%0"]]["имя"];
							break;
						end
					end
				else
					break;
				end
			end
			v9["FlatIdent_6D399%0"] = 4;
		end
		if (v9["FlatIdent_6D399%0"] == 0) then
			v9["idNpc%0"] = nil;
			v9["nomeNpc1%0"] = nil;
			v9["nomeNpc2%0"] = nil;
			v9["nomeNpc3%0"] = nil;
			v9["FlatIdent_6D399%0"] = 1;
		end
		if (v9["FlatIdent_6D399%0"] == 4) then
			v9["idNpc%0"] = rndTblc(npcListC1)["айди"];
			v9["nomeNpc3%0"] = npcListC1[v9["idNpc%0"]]["имя"];
			while true do
				if ((2237 < 4249) and ((v9["nomeNpc3%0"] == v9["nomeNpc2%0"]) or (v9["nomeNpc3%0"] == v9["nomeNpc1%0"]))) then
					v9["idNpc%0"] = rndTblc(npcListC1)["айди"];
					v9["nomeNpc3%0"] = npcListC1[v9["idNpc%0"]]["имя"];
				else
					break;
				end
			end
			return v9["emotQ%0"], v9["nomeNpc1%0"], v9["nomeNpc2%0"], v9["nomeNpc3%0"], v9["emotQ1%0"], v9["emotQ2%0"];
		end
		if (v9["FlatIdent_6D399%0"] == 2) then
			print(v9["emotQ%0"]);
			v9["emotQ1%0"] = eMotC[v9["emotQ%0"]]["поиск"];
			v9["emotQ2%0"] = eMotC[v9["emotQ%0"]]["ответ"];
			v9["idNpc%0"] = rndTblc(npcListC1)["айди"];
			v9["FlatIdent_6D399%0"] = 3;
		end
	end
end
function qLvl33c2()
	v9["idNpc%0"] = nil;
	v9["nomeNpc1%0"] = nil;
	v9["nomeNpc2%0"] = nil;
	v9["nomeNpc3%0"] = nil;
	v9["emotQ%0"] = nil;
	v9["emotQ1%0"] = nil;
	v9["emotQ2%0"] = nil;
	emotQ = rndTblc(eMotC)["квест"];
	print(emotQ);
	emotQ1 = eMotC[emotQ]["поиск"];
	emotQ2 = eMotC[emotQ]["ответ"];
	idNpc = rndTblc(npcListC2)["айди"];
	nomeNpc1 = npcListC2[idNpc]["имя"];
	idNpc = rndTblc(npcListC2)["айди"];
	nomeNpc2 = npcListC2[idNpc]["имя"];
	while true do
		if (nomeNpc1 == nomeNpc2) then
			idNpc = rndTblc(npcListC2)["айди"];
			nomeNpc2 = npcListC2[idNpc]["имя"];
		else
			break;
		end
	end
	idNpc = rndTblc(npcListC2)["айди"];
	nomeNpc3 = npcListC2[idNpc]["имя"];
	while true do
		if ((nomeNpc3 == nomeNpc2) or (nomeNpc3 == nomeNpc1)) then
			idNpc = rndTblc(npcListC2)["айди"];
			nomeNpc3 = npcListC2[idNpc]["имя"];
		else
			break;
		end
	end
	return emotQ, nomeNpc1, nomeNpc2, nomeNpc3, emotQ1, emotQ2;
end
function qLvl33c3()
	v9["FlatIdent_2644E%0"] = 0;
	v9["idNpc%0"] = nil;
	v9["nomeNpc1%0"] = nil;
	v9["nomeNpc2%0"] = nil;
	v9["nomeNpc3%0"] = nil;
	v9["emotQ%0"] = nil;
	v9["emotQ1%0"] = nil;
	v9["emotQ2%0"] = nil;
	while true do
		if (v9["FlatIdent_2644E%0"] == 2) then
			print(v9["emotQ%0"]);
			v9["emotQ1%0"] = eMotC[v9["emotQ%0"]]["поиск"];
			v9["emotQ2%0"] = eMotC[v9["emotQ%0"]]["ответ"];
			v9["idNpc%0"] = rndTblc(npcListC3)["айди"];
			v9["FlatIdent_2644E%0"] = 3;
		end
		if (v9["FlatIdent_2644E%0"] == 1) then
			v9["emotQ%0"] = nil;
			v9["emotQ1%0"] = nil;
			v9["emotQ2%0"] = nil;
			v9["emotQ%0"] = rndTblc(eMotC)["квест"];
			v9["FlatIdent_2644E%0"] = 2;
		end
		if (v9["FlatIdent_2644E%0"] == 0) then
			v9["idNpc%0"] = nil;
			v9["nomeNpc1%0"] = nil;
			v9["nomeNpc2%0"] = nil;
			v9["nomeNpc3%0"] = nil;
			v9["FlatIdent_2644E%0"] = 1;
		end
		if (4 == v9["FlatIdent_2644E%0"]) then
			v9["idNpc%0"] = rndTblc(npcListC3)["айди"];
			v9["nomeNpc3%0"] = npcListC3[v9["idNpc%0"]]["имя"];
			while true do
				if ((697 <= 826) and ((v9["nomeNpc3%0"] == v9["nomeNpc2%0"]) or (v9["nomeNpc3%0"] == v9["nomeNpc1%0"]))) then
					v9["FlatIdent_4A784%0"] = 0;
					while true do
						if (v9["FlatIdent_4A784%0"] == 0) then
							v9["idNpc%0"] = rndTblc(npcListC3)["айди"];
							v9["nomeNpc3%0"] = npcListC3[v9["idNpc%0"]]["имя"];
							break;
						end
					end
				else
					break;
				end
			end
			return v9["emotQ%0"], v9["nomeNpc1%0"], v9["nomeNpc2%0"], v9["nomeNpc3%0"], v9["emotQ1%0"], v9["emotQ2%0"];
		end
		if (v9["FlatIdent_2644E%0"] == 3) then
			v9["nomeNpc1%0"] = npcListC3[v9["idNpc%0"]]["имя"];
			v9["idNpc%0"] = rndTblc(npcListC3)["айди"];
			v9["nomeNpc2%0"] = npcListC3[v9["idNpc%0"]]["имя"];
			while true do
				if ((v9["nomeNpc1%0"] == v9["nomeNpc2%0"]) or (2683 < 23)) then
					v9["idNpc%0"] = rndTblc(npcListC3)["айди"];
					v9["nomeNpc2%0"] = npcListC3[v9["idNpc%0"]]["имя"];
				else
					break;
				end
			end
			v9["FlatIdent_2644E%0"] = 4;
		end
	end
end
function rndTblc(v296)
	v9["FlatIdent_282A9%0"] = 0;
	v9["keys%0"] = nil;
	while true do
		if (v9["FlatIdent_282A9%0"] == 1) then
			return v296[v9["keys%0"][math.random(#v9["keys%0"])]];
		end
		if (0 == v9["FlatIdent_282A9%0"]) then
			v9["keys%0"] = {};
			for v809 in pairs(v296) do
				table.insert(v9["keys%0"], v809);
			end
			v9["FlatIdent_282A9%0"] = 1;
		end
	end
end
function htimer(v299)
	v9["testTO%0"] = 0;
	for v440 = 1, 100 do
		if (mioFld[v299]["объекты"][tostring(v440)] ~= v22("\84\235", "\33\32\132\122\36\108")) then
		else
			v9["testTO%0"] = v22("\173\27", "\28\217\116\18\43");
		end
	end
	if (testQ[v299][v22("\214\99\223\89\213\188", "\92\178\55\182\52\176\206")][30] == nil) then
		testQ[v299][v22("\30\1\120\24\31\39", "\117\122\85\17")][30] = 26000;
	end
	if (testQ[v299][v22("\140\219\35\73\163\207", "\189\232\143\74\36\198")][tonumber(date(v22("\185\174", "\106\156\202\106\46\183"))) - 1] ~= nil) then
	else
		testQ[v299][v22("\57\45\114\62\47\47", "\74\93\121\27\83")][tonumber(date(v22("\56\191", "\30\29\219\134"))) - 1] = 26000;
	end
	if ((tonumber(testQ[v22("\88\174\22\220\248\91\52\24\89", "\110\53\199\121\154\148\63\120")]) == 0.5) or (tonumber(testQ[v22("\12\19\240\25\85\248\45\12\243", "\156\97\122\159\95\57")]) == 0.9)) then
		if ((1105 <= 1176) and (testQ[v299][v22("\198\130\211\245\14\16", "\95\174\214\186\152\107\98")] == nil)) then
			if ((3379 <= 3812) and (testQ[v299][v22("\141\58\120\134\22\212", "\166\233\110\17\235\115")][tonumber(date(v22("\61\10", "\28\24\110\164\161\146\222"))) - 1] == nil) and (testQ[v299][v22("\95\247\95\40\94\209", "\69\59\163\54")][30] == nil)) then
				if ((v9["testTO%0"] ~= v22("\164\167", "\214\208\200\170\42\83\173")) or (788 >= 1616)) then
					testQ[v299][v22("\209\21\123\173\112\203", "\21\185\65\18\192")] = 50400;
				else
					testQ[v299][v22("\246\98\84\22\164\236", "\193\158\54\61\123")] = 26000;
				end
			elseif ((1854 <= 3379) and (tonumber(date(v22("\112\21", "\217\85\113\64"))) ~= 1)) then
				if (testQ[v299][v22("\79\59\197\205\234\144", "\133\43\111\172\160\143\226")][tonumber(date(v22("\142\167", "\160\171\195\48\177"))) - 1] > 10800) then
					if ((4549 == 4549) and (v9["testTO%0"] ~= v22("\199\12", "\167\179\99\22\77\60\161\207"))) then
						testQ[v299][v22("\9\75\130\85\73\19", "\44\97\31\235\56")] = testQ[v299][v22("\245\58\241\169\244\28", "\196\145\110\152")][tonumber(date(v22("\29\42", "\146\56\78\158"))) - 1];
					else
						testQ[v299][v22("\37\239\70\235\95\63", "\58\77\187\47\134")] = tonumber(string.format(v22("\87\32", "\126\114\85\193\103\133\78\52"), tonumber(testQ[v299][v22("\192\239\59\117\193\201", "\24\164\187\82")][tonumber(date(v22("\180\222", "\145\145\186\60\202"))) - 1]) / 1.5));
					end
				elseif (v9["testTO%0"] ~= v22("\242\223", "\100\134\176\83")) then
					testQ[v299][v22("\219\245\75\176\182\7", "\117\179\161\34\221\211")] = 10800;
				else
					testQ[v299][v22("\69\132\243\203\1\237", "\197\45\208\154\166\100\159")] = 7000;
				end
			elseif ((testQ[v299][v22("\45\192\143\177\54\59", "\83\73\148\230\220")][30] ~= nil) and (testQ[v299][v22("\55\235\255\237\234\155", "\233\83\191\150\128\143")][30] > 10800)) then
				if (v9["testTO%0"] ~= v22("\227\137", "\109\151\230\175\18")) then
					testQ[v299][v22("\168\206\72\73\133\178", "\224\192\154\33\36")] = testQ[v299][v22("\135\96\17\143\134\70", "\226\227\52\120")][30];
				else
					testQ[v299][v22("\13\223\229\169\79\173", "\217\101\139\140\196\42\223\183")] = tonumber(string.format(v22("\95\26", "\36\122\111\207\122"), tonumber(testQ[v299][v22("\8\60\237\181\189\38", "\84\108\104\132\216\216")][30]) / 1.5));
				end
			elseif (v9["testTO%0"] ~= v22("\216\20", "\34\172\123\166\56\128\196")) then
				testQ[v299][v22("\172\157\161\198\79\97", "\116\196\201\200\171\42\19\181")] = 10800;
			else
				testQ[v299][v22("\126\178\242\80\16\18", "\124\22\230\155\61\117\96")] = 7000;
			end
		end
	elseif (tonumber(testQ[v22("\200\162\233\205\242\233\217\211\167", "\149\165\203\134\139\158\141")]) == 2) then
		if ((testQ[v299][v22("\59\152\73\43\54\190", "\70\83\204\32")] == nil) or (3022 >= 3024)) then
			if ((4820 > 2198) and (testQ[v299][v22("\10\181\2\141\11\147", "\224\110\225\107")][tonumber(date(v22("\177\114", "\164\148\22\189\81\80\164"))) - 1] == nil) and (testQ[v299][v22("\182\180\126\190\34\89", "\23\210\224\23\211\71\43")][30] == nil)) then
				if (v9["testTO%0"] ~= v22("\189\137", "\144\201\230\112\215\53\75\188")) then
					testQ[v299][v22("\93\241\16\231\243\183", "\197\53\165\121\138\150")] = 25200;
				else
					testQ[v299][v22("\229\235\208\45\232\205", "\64\141\191\185")] = 16000;
				end
			elseif (tonumber(date(v22("\70\238", "\198\99\138\208\186\151\169"))) ~= 1) then
				if ((testQ[v299][v22("\9\193\138\83\8\231", "\62\109\149\227")][tonumber(date(v22("\182\140", "\96\147\232\233\180"))) - 1] > 10800) or (1061 >= 4891)) then
					if (v9["testTO%0"] ~= v22("\60\55", "\89\72\88\122\43\237")) then
						testQ[v299][v22("\36\143\172\59\30\62", "\123\76\219\197\86")] = tonumber(string.format(v22("\29\205", "\95\56\184\117\108\142"), testQ[v299][v22("\244\246\47\225\245\208", "\140\144\162\70")][tonumber(date(v22("\149\44", "\142\176\72\57\18"))) - 1] / 2));
						if ((1364 <= 4473) and (testQ[v299][v22("\174\5\25\41\163\35", "\68\198\81\112")] < 10800)) then
							testQ[v299][v22("\191\59\185\25\73\15", "\125\215\111\208\116\44")] = 10800;
						end
					else
						v9["FlatIdent_80D6%0"] = 0;
						while true do
							if (v9["FlatIdent_80D6%0"] == 0) then
								testQ[v299][v22("\15\115\70\254\125\78", "\60\103\39\47\147\24")] = tonumber(string.format(v22("\169\31", "\46\140\106\151\224\182\147"), (tonumber(string.format(v22("\174\56", "\34\139\77\29"), testQ[v299][v22("\180\196\20\89\44\162", "\73\208\144\125\52")][tonumber(date(v22("\111\232", "\171\74\140\234\171\167\112\51"))) - 1] / 2))) / 1.5));
								if ((testQ[v299][v22("\39\58\69\82\244\191", "\205\79\110\44\63\145")] < 7000) or (3595 <= 3)) then
									testQ[v299][v22("\175\107\54\197\177\25", "\124\199\63\95\168\212\107\196")] = 7000;
								end
								break;
							end
						end
					end
				elseif (v9["testTO%0"] ~= v22("\18\167", "\147\102\200\51\90\196\151\233")) then
					testQ[v299][v22("\51\196\230\192\187\242", "\91\91\144\143\173\222\128")] = 10800;
				else
					testQ[v299][v22("\43\148\69\92\174\92", "\46\67\192\44\49\203")] = 7000;
				end
			elseif ((testQ[v299][v22("\0\226\39\175\33\182", "\101\100\182\78\194\68\196")][30] ~= nil) and (testQ[v299][v22("\76\124\57\248\136\89", "\181\40\40\80\149\237\43\24")][30] > 10800)) then
				if ((v9["testTO%0"] ~= v22("\1\189", "\114\117\210\69\82\218\42")) or (4672 == 3852)) then
					v9["FlatIdent_10CBF%0"] = 0;
					while true do
						if (v9["FlatIdent_10CBF%0"] == 0) then
							testQ[v299][v22("\76\226\81\126\169\86", "\204\36\182\56\19")] = tonumber(string.format(v22("\172\94", "\114\137\43\188\227\29\88"), testQ[v299][v22("\224\41\161\29\225\15", "\112\132\125\200")][tonumber(date(v22("\184\188", "\149\157\216\147\19\58"))) - 1] / 2));
							if ((1559 == 1559) and (testQ[v299][v22("\193\178\17\197\204\148", "\168\169\230\120")] < 10800)) then
								testQ[v299][v22("\244\185\141\26\249\159", "\119\156\237\228")] = 10800;
							end
							break;
						end
					end
				else
					v9["FlatIdent_5C5DB%0"] = 0;
					while true do
						if (v9["FlatIdent_5C5DB%0"] == 0) then
							testQ[v299][v22("\203\229\9\115\198\195", "\30\163\177\96")] = tonumber(string.format(v22("\95\53", "\180\122\64\53\233\93\75"), (tonumber(string.format(v22("\147\2", "\93\182\119\115"), testQ[v299][v22("\134\43\218\129\178\236", "\158\226\127\179\236\215")][tonumber(date(v22("\180\196", "\182\145\160\169"))) - 1] / 2))) / 1.5));
							if (testQ[v299][v22("\49\20\57\27\162\29", "\111\89\64\80\118\199")] < 7000) then
								testQ[v299][v22("\183\131\7\75\186\165", "\38\223\215\110")] = 7000;
							end
							break;
						end
					end
				end
			elseif (v9["testTO%0"] ~= v22("\74\212", "\203\62\187\108\165")) then
				testQ[v299][v22("\241\64\65\51\116\236", "\176\153\20\40\94\17\158")] = 10800;
			else
				testQ[v299][v22("\160\7\178\94\192\186", "\165\200\83\219\51")] = 7000;
			end
		end
	elseif (tonumber(testQ[v22("\202\227\123\93\221\177\144\242\203", "\132\167\138\20\27\177\213\220")]) == 3) then
		if (testQ[v299][v22("\250\225\234\65\57\224", "\92\146\181\131\44")] ~= nil) then
		elseif (((testQ[v299][v22("\79\202\72\139\187\82", "\189\43\158\33\230\222\32\119")][tonumber(date(v22("\27\196", "\232\62\160\45\49"))) - 1] == nil) and (testQ[v299][v22("\112\231\252\161\164\102", "\193\20\179\149\204")][30] == nil)) or (1752 <= 788)) then
			if ((v9["testTO%0"] ~= v22("\195\14", "\162\183\97\225")) or (3907 == 177)) then
				testQ[v299][v22("\33\241\237\250\25\240", "\193\73\165\132\151\124\130")] = 14500;
			else
				testQ[v299][v22("\197\246\160\86\179\164", "\214\173\162\201\59\214")] = 10000;
			end
		elseif ((3470 > 555) and (tonumber(date(v22("\102\125", "\64\67\25\202\33\183"))) ~= 1)) then
			if (testQ[v299][v22("\237\218\120\177\43\192", "\35\137\142\17\220\78\178")][tonumber(date(v22("\104\74", "\97\77\46\69"))) - 1] > 10800) then
				if (v9["testTO%0"] ~= v22("\203\208", "\197\191\191\96")) then
					testQ[v299][v22("\194\29\228\67\93\250", "\45\170\73\141\46\56\136")] = tonumber(string.format(v22("\196\26", "\103\225\111\173\133\207\231"), testQ[v299][v22("\72\176\252\88\73\150", "\53\44\228\149")][tonumber(date(v22("\136\223", "\68\173\187\91\101\171"))) - 1] / 3));
					if ((testQ[v299][v22("\244\59\27\202\76\144", "\185\156\111\114\167\41\226\29")] < 10800) or (972 == 645)) then
						testQ[v299][v22("\3\49\31\45\177\241", "\131\107\101\118\64\212")] = 10800;
					end
				else
					testQ[v299][v22("\201\226\37\38\66\210", "\169\161\182\76\75\39\160")] = tonumber(string.format(v22("\156\71", "\200\185\50\215\235\123\66"), (tonumber(string.format(v22("\183\148", "\122\146\225\185\130\234\22"), testQ[v299][v22("\189\214\201\194\234\169", "\219\217\130\160\175\143")][tonumber(date(v22("\123\184", "\93\94\220\34"))) - 1] / 3))) / 1.5));
					if ((3182 >= 2115) and (testQ[v299][v22("\7\252\200\135\223\229", "\157\111\168\161\234\186\151")] < 7000)) then
						testQ[v299][v22("\115\116\124\60\199\171", "\229\27\32\21\81\162\217\210")] = 7000;
					end
				end
			elseif ((3893 < 4429) and (v9["testTO%0"] ~= v22("\56\195", "\42\76\172\155\90"))) then
				testQ[v299][v22("\250\185\136\36\5\224", "\96\146\237\225\73")] = 10800;
			else
				testQ[v299][v22("\224\74\1\229\76\104", "\194\136\30\104\136\41\26")] = 7000;
			end
		elseif ((testQ[v299][v22("\216\226\10\69\17\162", "\79\188\182\99\40\116\208\201")][30] ~= nil) and (testQ[v299][v22("\121\247\35\76\38\45", "\95\29\163\74\33\67")][30] > 10800)) then
			if ((v9["testTO%0"] ~= v22("\104\61", "\100\28\82\32\87\31\234")) or (2867 < 1905)) then
				v9["FlatIdent_1CE81%0"] = 0;
				while true do
					if (v9["FlatIdent_1CE81%0"] == 0) then
						testQ[v299][v22("\57\102\233\124\254\196", "\94\81\50\128\17\155\182\136")] = tonumber(string.format(v22("\206\41", "\231\235\92\132\89\130\212\124"), testQ[v299][v22("\250\128\253\50\212\87", "\37\158\212\148\95\177")][tonumber(date(v22("\49\24", "\109\20\124\196\231"))) - 1] / 3));
						if ((testQ[v299][v22("\168\137\125\168\52\50", "\64\192\221\20\197\81")] < 10800) or (1796 >= 4051)) then
							testQ[v299][v22("\167\194\235\175\162\189", "\199\207\150\130\194")] = 10800;
						end
						break;
					end
				end
			else
				testQ[v299][v22("\189\126\114\229\70\167", "\35\213\42\27\136")] = tonumber(string.format(v22("\229\146", "\146\192\231\91\223\184"), (tonumber(string.format(v22("\31\228", "\110\58\145\150\73\177\212\103"), testQ[v299][v22("\240\0\195\255\78\217", "\137\148\84\170\146\43\171")][tonumber(date(v22("\68\219", "\23\97\191\31\157"))) - 1] / 3))) / 1.5));
				if ((1619 <= 3756) and (testQ[v299][v22("\142\182\14\8\216\32", "\82\230\226\103\101\189")] < 7000)) then
					testQ[v299][v22("\131\30\186\188\17\153", "\116\235\74\211\209")] = 7000;
				end
			end
		elseif ((604 == 604) and (v9["testTO%0"] ~= v22("\60\51", "\69\72\92\190"))) then
			testQ[v299][v22("\62\15\237\217\174\186", "\215\86\91\132\180\203\200\118")] = 10800;
		else
			testQ[v299][v22("\59\218\143\222\54\252", "\179\83\142\230")] = 7000;
		end
	elseif (tonumber(testQ[v22("\215\38\242\19\53\27\219\201\214", "\191\186\79\157\85\89\127\151")]) == 4) then
		if (testQ[v299][v22("\254\78\173\195\129\87", "\37\150\26\196\174\228")] ~= nil) then
		elseif ((testQ[v299][v22("\205\196\187\88\50\155", "\233\169\144\210\53\87")][tonumber(date(v22("\103\66", "\188\66\38\141"))) - 1] == nil) and (testQ[v299][v22("\229\100\4\60\118\80", "\168\129\48\109\81\19\34\104")][30] == nil)) then
			if (v9["testTO%0"] ~= v22("\99\27", "\153\23\116\108\80\191\69\219")) then
				testQ[v299][v22("\65\43\244\213\253\153", "\22\41\127\157\184\152\235")] = 11000;
			else
				testQ[v299][v22("\31\243\232\199\18\213", "\170\119\167\129")] = 8000;
			end
		elseif ((tonumber(date(v22("\159\244", "\62\186\144\220\19\227"))) ~= 1) or (4484 == 900)) then
			if (testQ[v299][v22("\165\200\229\219\164\238", "\182\193\156\140")][tonumber(date(v22("\132\72", "\95\161\44\118\210\134"))) - 1] > 10800) then
				if ((v9["testTO%0"] ~= v22("\242\79", "\206\134\32\115\109\26\182\133")) or (4459 <= 1113)) then
					testQ[v299][v22("\62\204\198\30\88\79", "\61\86\152\175\115\61")] = tonumber(string.format(v22("\236\20", "\167\201\97\188\80\177\225\67"), testQ[v299][v22("\74\60\141\162\249\147", "\225\46\104\228\207\156")][tonumber(date(v22("\239\196", "\223\202\160\211\46\87\51\210"))) - 1] / 4));
					if ((3632 > 3398) and (testQ[v299][v22("\222\221\19\121\8\196", "\109\182\137\122\20")] < 10800)) then
						testQ[v299][v22("\90\157\27\247\229\197", "\28\50\201\114\154\128\183\138")] = 10800;
					end
				else
					v9["FlatIdent_79739%0"] = 0;
					while true do
						if (v9["FlatIdent_79739%0"] == 0) then
							testQ[v299][v22("\162\178\16\255\175\148", "\146\202\230\121")] = tonumber(string.format(v22("\171\250", "\94\142\143\142\126\167\210\192"), (tonumber(string.format(v22("\69\208", "\167\96\165\125\129"), testQ[v299][v22("\3\226\31\75\71\52", "\232\103\182\118\38\34\70\43")][tonumber(date(v22("\112\83", "\17\85\55\79\131\80"))) - 1] / 4))) / 1.5));
							if ((4082 <= 4917) and (testQ[v299][v22("\192\177\176\161\58\218", "\95\168\229\217\204")] < 7000)) then
								testQ[v299][v22("\130\15\143\132\143\41", "\233\234\91\230")] = 7000;
							end
							break;
						end
					end
				end
			elseif (v9["testTO%0"] ~= v22("\69\78", "\199\49\33\226\19")) then
				testQ[v299][v22("\90\111\74\18\194\64", "\167\50\59\35\127")] = 10800;
			else
				testQ[v299][v22("\64\39\91\225\173\90", "\200\40\115\50\140")] = 7000;
			end
		elseif ((4832 >= 1386) and (testQ[v299][v22("\247\25\126\18\246\63", "\127\147\77\23")][30] ~= nil) and (testQ[v299][v22("\143\210\252\121\117\153", "\16\235\134\149\20")][30] > 10800)) then
			if ((137 == 137) and (v9["testTO%0"] ~= v22("\206\68", "\108\186\43\46\198\108\231"))) then
				v9["FlatIdent_12479%0"] = 0;
				while true do
					if (v9["FlatIdent_12479%0"] == 0) then
						testQ[v299][v22("\58\139\252\12\121\32", "\28\82\223\149\97")] = tonumber(string.format(v22("\232\32", "\62\205\85\45"), testQ[v299][v22("\113\56\168\164\7\155", "\105\21\108\193\201\98\233")][tonumber(date(v22("\5\129", "\186\32\229\123\158\163\94"))) - 1] / 4));
						if ((testQ[v299][v22("\12\23\120\199\28\183", "\87\100\67\17\170\121\197")] < 10800) or (1570 >= 4332)) then
							testQ[v299][v22("\230\191\179\141\82\167", "\213\142\235\218\224\55")] = 10800;
						end
						break;
					end
				end
			else
				testQ[v299][v22("\0\150\240\200\13\176", "\165\104\194\153")] = tonumber(string.format(v22("\194\37", "\237\231\80\185\203\153\61"), (tonumber(string.format(v22("\224\37", "\37\197\80\224\18"), testQ[v299][v22("\29\118\69\75\177\11", "\212\121\34\44\38")][tonumber(date(v22("\255\190", "\62\218\218\74\101\30\205\146"))) - 1] / 4))) / 1.5));
				if ((testQ[v299][v22("\74\157\112\252\216\44", "\79\34\201\25\145\189\94\36")] < 7000) or (4064 <= 1819)) then
					testQ[v299][v22("\72\24\227\7\69\70", "\52\32\76\138\106\32")] = 7000;
				end
			end
		elseif (v9["testTO%0"] ~= v22("\172\245", "\26\216\154\80\166")) then
			testQ[v299][v22("\196\253\228\78\120\62", "\76\172\169\141\35\29")] = 10800;
		else
			testQ[v299][v22("\212\237\241\14\217\203", "\99\188\185\152")] = 7000;
		end
	elseif ((tonumber(testQ[v22("\223\29\185\40\175\214\56\160\2", "\195\178\116\214\110")]) == 5) or (4986 < 1574)) then
		if (testQ[v299][v22("\13\195\143\120\196\244", "\134\101\151\230\21\161")] ~= nil) then
		elseif ((4426 > 172) and (testQ[v299][v22("\173\190\51\89\38\32", "\128\201\234\90\52\67\82")][tonumber(date(v22("\225\73", "\170\196\45\94\20"))) - 1] == nil) and (testQ[v299][v22("\122\112\12\57\196\50", "\80\30\36\101\84\161\64")][30] == nil)) then
			if (v9["testTO%0"] ~= v22("\178\94", "\91\198\49\121\34\184")) then
				testQ[v299][v22("\60\242\126\180\140\38", "\233\84\166\23\217")] = 10500;
			else
				testQ[v299][v22("\112\76\241\235\51\51", "\65\24\24\152\134\86")] = 7000;
			end
		elseif (tonumber(date(v22("\249\51", "\41\220\87\136"))) ~= 1) then
			if ((586 > 455) and (testQ[v299][v22("\33\2\234\253\203\185", "\203\69\86\131\144\174")][tonumber(date(v22("\252\26", "\113\217\126\51\57\168\48\135"))) - 1] > 10800)) then
				if ((826 == 826) and (v9["testTO%0"] ~= v22("\11\26", "\174\127\117\86\40\40\31\22"))) then
					v9["FlatIdent_45054%0"] = 0;
					while true do
						if (v9["FlatIdent_45054%0"] == 0) then
							testQ[v299][v22("\212\15\69\214\217\41", "\187\188\91\44")] = tonumber(string.format(v22("\90\226", "\109\127\151\30\69\130"), testQ[v299][v22("\214\177\126\21\192\194", "\118\178\229\23\120\165\176\210")][tonumber(date(v22("\64\216", "\221\101\188\44\105\108\207\65"))) - 1] / 5));
							if ((testQ[v299][v22("\94\4\30\175\215\68", "\178\54\80\119\194")] < 10800) or (4019 > 4441)) then
								testQ[v299][v22("\60\59\72\207\234\235", "\162\84\111\33\162\143\153\217")] = 10800;
							end
							break;
						end
					end
				else
					testQ[v299][v22("\47\239\20\135\34\201", "\234\71\187\125")] = tonumber(string.format(v22("\84\41", "\158\113\92\49\59"), (tonumber(string.format(v22("\169\101", "\103\140\16\33\16\158\102\186"), testQ[v299][v22("\195\185\180\120\6\46", "\92\167\237\221\21\99")][tonumber(date(v22("\186\36", "\70\159\64\77"))) - 1] / 5))) / 1.5));
					if ((2017 < 4261) and (testQ[v299][v22("\223\123\91\242\31\197", "\122\183\47\50\159")] < 7000)) then
						testQ[v299][v22("\202\5\174\66\133\208", "\224\162\81\199\47")] = 7000;
					end
				end
			elseif ((4716 > 80) and (v9["testTO%0"] ~= v22("\252\74", "\227\136\37\83\93"))) then
				testQ[v299][v22("\81\153\1\121\92\191", "\20\57\205\104")] = 10800;
			else
				testQ[v299][v22("\32\159\17\180\31\72", "\83\72\203\120\217\122\58")] = 7000;
			end
		elseif (((testQ[v299][v22("\184\221\178\174\170\175", "\223\220\137\219\195\207\221")][30] ~= nil) and (testQ[v299][v22("\23\124\86\239\41\1", "\76\115\40\63\130")][30] > 10800)) or (3507 == 3272)) then
			if ((v9["testTO%0"] ~= v22("\147\21", "\177\231\122\77\205\214")) or (876 >= 3075)) then
				v9["FlatIdent_94DD1%0"] = 0;
				while true do
					if (v9["FlatIdent_94DD1%0"] == 0) then
						testQ[v299][v22("\76\39\72\77\172\78", "\60\36\115\33\32\201")] = tonumber(string.format(v22("\242\99", "\193\215\22\55\38\44\62\93"), testQ[v299][v22("\43\38\7\194\208\233", "\155\79\114\110\175\181")][tonumber(date(v22("\29\80", "\181\56\52\185\132\209\236"))) - 1] / 5));
						if (testQ[v299][v22("\58\120\219\165\64\187", "\154\82\44\178\200\37\201")] < 10800) then
							testQ[v299][v22("\125\223\11\0\187\90", "\21\21\139\98\109\222\40")] = 10800;
						end
						break;
					end
				end
			else
				v9["FlatIdent_35814%0"] = 0;
				while true do
					if (v9["FlatIdent_35814%0"] == 0) then
						testQ[v299][v22("\12\216\165\129\63\22", "\90\100\140\204\236")] = tonumber(string.format(v22("\233\1", "\120\204\116\94\172\215"), (tonumber(string.format(v22("\70\168", "\31\99\221\216\104\139\194\16"), testQ[v299][v22("\49\148\227\1\12\241", "\131\85\192\138\108\105")][tonumber(date(v22("\115\160", "\99\86\196\31"))) - 1] / 5))) / 1.5));
						if ((4352 > 2554) and (testQ[v299][v22("\88\0\70\240\90\181", "\111\48\84\47\157\63\199")] < 7000)) then
							testQ[v299][v22("\18\50\137\170\43\8", "\78\122\102\224\199")] = 7000;
						end
						break;
					end
				end
			end
		elseif ((v9["testTO%0"] ~= v22("\232\23", "\159\156\120\20\99\84\101\206")) or (4406 < 4043)) then
			testQ[v299][v22("\116\37\133\114\205\83", "\71\28\113\236\31\168\33\23")] = 10800;
		else
			testQ[v299][v22("\69\202\42\245\220\203", "\199\45\158\67\152\185\185\91")] = 7000;
		end
	elseif ((tonumber(testQ[v22("\87\112\178\136\220\18\251\198\86", "\176\58\25\221\206\176\118\183")]) == 6) or (1889 >= 3383)) then
		if ((1892 <= 2734) and (testQ[v299][v22("\58\37\208\11\235\170", "\216\82\113\185\102\142")] == nil)) then
			if ((testQ[v299][v22("\70\111\41\213\120\80", "\29\34\59\64\184")][tonumber(date(v22("\87\26", "\61\114\126\40\170\85"))) - 1] == nil) and (testQ[v299][v22("\200\28\126\52\198\97", "\19\172\72\23\89\163")][30] == nil)) then
				if ((1923 < 2218) and (v9["testTO%0"] ~= v22("\35\83", "\197\87\60\175\133\85\50"))) then
					testQ[v299][v22("\28\74\221\222\17\108", "\179\116\30\180")] = 10800;
				else
					testQ[v299][v22("\227\242\228\140\238\212", "\225\139\166\141")] = 7000;
				end
			elseif (tonumber(date(v22("\8\143", "\64\45\235\148"))) ~= 1) then
				if (testQ[v299][v22("\114\101\51\239\89\199", "\181\22\49\90\130\60")][tonumber(date(v22("\74\213", "\105\111\177\216"))) - 1] > 10800) then
					if ((2173 > 379) and (v9["testTO%0"] ~= v22("\160\21", "\179\212\122\168\114\112"))) then
						testQ[v299][v22("\113\78\141\192\124\104", "\173\25\26\228")] = tonumber(string.format(v22("\83\99", "\120\118\22\169\218"), testQ[v299][v22("\195\20\191\235\194\50", "\134\167\64\214")][tonumber(date(v22("\65\141", "\168\100\233\158\232\169"))) - 1] / 6));
						if ((testQ[v299][v22("\122\96\16\241\119\70", "\156\18\52\121")] < 10800) or (2591 == 3409)) then
							testQ[v299][v22("\75\36\210\199\129\167", "\191\35\112\187\170\228\213\101")] = 10800;
						end
					else
						v9["FlatIdent_94874%0"] = 0;
						while true do
							if (v9["FlatIdent_94874%0"] == 0) then
								testQ[v299][v22("\176\155\117\88\59\14", "\31\216\207\28\53\94\124")] = tonumber(string.format(v22("\100\50", "\59\65\71\203\111"), (tonumber(string.format(v22("\82\181", "\84\119\192\28\20\235\108"), testQ[v299][v22("\136\202\45\251\31\46", "\33\236\158\68\150\122\92\201")][tonumber(date(v22("\165\220", "\89\128\184\153\121\41\145"))) - 1] / 6))) / 1.5));
								if (testQ[v299][v22("\228\1\173\140\39\149", "\91\140\85\196\225\66\231\96")] >= 7000) then
								else
									testQ[v299][v22("\59\140\190\188\78\33", "\43\83\216\215\209")] = 7000;
								end
								break;
							end
						end
					end
				elseif (v9["testTO%0"] ~= v22("\95\168", "\78\43\199\208\107")) then
					testQ[v299][v22("\122\188\9\19\190\40", "\182\18\232\96\126\219\90\165")] = 10800;
				else
					testQ[v299][v22("\53\106\46\165\56\76", "\200\93\62\71")] = 7000;
				end
			elseif ((testQ[v299][v22("\66\121\71\215\193\160", "\110\38\45\46\186\164\210")][30] ~= nil) and (testQ[v299][v22("\124\138\161\27\59\106", "\94\24\222\200\118")][30] > 10800)) then
				if (v9["testTO%0"] ~= v22("\9\207", "\121\125\160\70")) then
					testQ[v299][v22("\251\222\50\191\246\248", "\210\147\138\91")] = tonumber(string.format(v22("\112\232", "\115\85\157\168\43\80"), testQ[v299][v22("\251\110\142\90\137\219", "\169\159\58\231\55\236\169\38")][tonumber(date(v22("\84\197", "\28\113\161\223\112\164\116"))) - 1] / 6));
					if ((4514 > 3324) and (testQ[v299][v22("\206\108\78\116\94\212", "\59\166\56\39\25")] < 10800)) then
						testQ[v299][v22("\186\236\207\197\70\160", "\35\210\184\166\168")] = 10800;
					end
				else
					testQ[v299][v22("\81\109\116\79\33\101", "\23\57\57\29\34\68")] = tonumber(string.format(v22("\21\36", "\76\48\81\127"), (tonumber(string.format(v22("\75\176", "\48\110\197\49\215\106\20\189"), testQ[v299][v22("\25\38\65\161\197\57", "\108\125\114\40\204\160\75\38")][tonumber(date(v22("\112\116", "\109\85\16\159"))) - 1] / 6))) / 1.5));
					if (testQ[v299][v22("\47\199\164\86\30\74", "\208\71\147\205\59\123\56")] >= 7000) then
					else
						testQ[v299][v22("\95\20\141\181\82\50", "\216\55\64\228")] = 7000;
					end
				end
			elseif ((v9["testTO%0"] ~= v22("\171\135", "\139\223\232\94\162\217\149")) or (208 >= 4828)) then
				testQ[v299][v22("\221\183\42\252\190\71", "\170\181\227\67\145\219\53")] = 10800;
			else
				testQ[v299][v22("\81\177\23\191\92\151", "\210\57\229\126")] = 7000;
			end
		end
	elseif ((tonumber(testQ[v22("\181\58\229\128\62\193\175\174\63", "\227\216\83\138\198\82\165")]) == 7) or (1583 > 3567)) then
		if ((testQ[v299][v22("\35\129\191\117\247\57", "\146\75\213\214\24")] == nil) or (1313 == 794)) then
			if ((3174 > 2902) and (testQ[v299][v22("\78\74\200\73\127\87", "\53\42\30\161\36\26\37")][tonumber(date(v22("\184\253", "\128\157\153\151"))) - 1] == nil) and (testQ[v299][v22("\114\65\133\36\16\97", "\19\22\21\236\73\117")][30] == nil)) then
				if (v9["testTO%0"] ~= v22("\99\202", "\150\23\165\194\201\151\221\77")) then
					testQ[v299][v22("\118\15\225\23\123\41", "\122\30\91\136")] = 10800;
				else
					testQ[v299][v22("\183\144\236\189\136\173", "\237\223\196\133\208")] = 7000;
				end
			elseif ((4120 <= 4260) and (tonumber(date(v22("\153\12", "\154\188\104\163\222\62"))) ~= 1)) then
				if (testQ[v299][v22("\49\217\36\246\21\93", "\162\85\141\77\155\112\47")][tonumber(date(v22("\87\45", "\46\114\73\198"))) - 1] > 10800) then
					if (v9["testTO%0"] ~= v22("\177\113", "\42\197\30\22\143\78")) then
						v9["FlatIdent_40B3B%0"] = 0;
						while true do
							if (v9["FlatIdent_40B3B%0"] == 0) then
								testQ[v299][v22("\123\113\86\50\118\87", "\95\19\37\63")] = tonumber(string.format(v22("\52\57", "\103\17\76\199\156\17"), testQ[v299][v22("\183\30\140\229\89\2", "\154\211\74\229\136\60\112\217")][tonumber(date(v22("\234\24", "\39\207\124\138\173\101"))) - 1] / 7));
								if (testQ[v299][v22("\198\53\74\205\167\220", "\194\174\97\35\160")] >= 10800) then
								else
									testQ[v299][v22("\247\20\52\15\250\50", "\98\159\64\93")] = 10800;
								end
								break;
							end
						end
					else
						v9["FlatIdent_88AD8%0"] = 0;
						while true do
							if (v9["FlatIdent_88AD8%0"] == 0) then
								testQ[v299][v22("\6\133\36\18\20\20", "\68\110\209\77\127\113\102\59")] = tonumber(string.format(v22("\235\241", "\206\206\132\199\47\99\163"), (tonumber(string.format(v22("\179\215", "\49\150\162\183\18"), testQ[v299][v22("\77\30\178\44\31\242", "\120\41\74\219\65\122\128")][tonumber(date(v22("\31\2", "\181\58\102\60\122\133\199"))) - 1] / 7))) / 1.5));
								if (testQ[v299][v22("\91\214\213\20\127\65", "\26\51\130\188\121")] >= 7000) then
								else
									testQ[v299][v22("\224\182\37\20\76\12", "\57\136\226\76\121\41\126\151")] = 7000;
								end
								break;
							end
						end
					end
				elseif (v9["testTO%0"] ~= v22("\54\216", "\29\66\183\105\51\68\131")) then
					testQ[v299][v22("\77\17\64\195\64\55", "\174\37\69\41")] = 10800;
				else
					testQ[v299][v22("\137\130\71\3\21\147", "\112\225\214\46\110")] = 7000;
				end
			elseif (((testQ[v299][v22("\26\16\42\86\225\175", "\140\126\68\67\59\132\221")][30] ~= nil) and (testQ[v299][v22("\134\69\14\70\72\13", "\230\226\17\103\43\45\127")][30] > 10800)) or (883 > 4778)) then
				if (v9["testTO%0"] ~= v22("\196\67", "\231\176\44\164\43")) then
					v9["FlatIdent_394C%0"] = 0;
					while true do
						if (0 == v9["FlatIdent_394C%0"]) then
							testQ[v299][v22("\169\242\45\164\171\158", "\236\193\166\68\201\206")] = tonumber(string.format(v22("\65\46", "\17\100\91\168"), testQ[v299][v22("\94\146\133\225\182\49", "\27\58\198\236\140\211\67")][tonumber(date(v22("\100\201", "\139\65\173\172\42\233"))) - 1] / 7));
							if (testQ[v299][v22("\143\98\120\213\193\101", "\40\231\54\17\184\164\23\128")] >= 10800) then
							else
								testQ[v299][v22("\140\253\118\245\128\248", "\138\228\169\31\152\229")] = 10800;
							end
							break;
						end
					end
				else
					v9["FlatIdent_41EB8%0"] = 0;
					while true do
						if (v9["FlatIdent_41EB8%0"] == 0) then
							testQ[v299][v22("\196\56\75\56\229\209", "\163\172\108\34\85\128")] = tonumber(string.format(v22("\98\4", "\52\71\113\151\231\187\36\232"), (tonumber(string.format(v22("\51\152", "\205\22\237\24"), testQ[v299][v22("\186\76\122\197\60\172", "\89\222\24\19\168")][tonumber(date(v22("\176\93", "\113\149\57\51\215"))) - 1] / 7))) / 1.5));
							if (testQ[v299][v22("\113\68\194\187\231\210", "\160\25\16\171\214\130")] < 7000) then
								testQ[v299][v22("\121\236\62\112\120\192", "\235\17\184\87\29\29\178")] = 7000;
							end
							break;
						end
					end
				end
			elseif (v9["testTO%0"] ~= v22("\190\166", "\144\202\201\25\152")) then
				testQ[v299][v22("\49\239\13\115\254\88", "\96\89\187\100\30\155\42\135")] = 10800;
			else
				testQ[v299][v22("\37\249\10\71\127\111", "\29\77\173\99\42\26")] = 7000;
			end
		end
	end
end
function ml()
	if (BrowseBuyoutButton ~= nil) then
		v9["FlatIdent_4DBE1%0"] = 0;
		while true do
			if (1 == v9["FlatIdent_4DBE1%0"]) then
				if (name == "Обычное письмо") then
					aucBtn:Show();
					if (highBidder ~= "Хефе") then
					else
						aucBtn:Hide();
					end
				elseif (aucBtn == nil) then
				else
					aucBtn:Hide();
				end
				break;
			end
			if (v9["FlatIdent_4DBE1%0"] == 0) then
				if (aucBtn ~= nil) then
				else
					v9["FlatIdent_179D7%0"] = 0;
					while true do
						if (v9["FlatIdent_179D7%0"] == 1) then
							aucBtn:SetSize(222, 32);
							aucBtn:SetPoint(v22("\167\199\41\78\126\221", "\109\228\130\103\26\59\143\151"), BrowseBidButton, v22("\160\93\128\237\27\120", "\228\227\24\206\185\94\42\79"), 22, 0);
							v9["FlatIdent_179D7%0"] = 2;
						end
						if (2 == v9["FlatIdent_179D7%0"]) then
							aucBtn:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\auk.tga");
							aucBtn:Hide();
							break;
						end
						if (v9["FlatIdent_179D7%0"] == 0) then
							aucBtn = CreateFrame(v22("\236\55\35\188\187\21", "\80\174\66\87\200\212\123"), nil, UIParent, "");
							aucBtn:SetFrameStrata(v22("\255\86\17\228\195\58\251", "\115\171\25\94\168\151"));
							v9["FlatIdent_179D7%0"] = 1;
						end
					end
				end
				name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, owner, saleStatus, itemId, hasAllInfo = GetAuctionItemInfo(v22("\0\187\247\53", "\151\108\210\132\65"), tonumber(GetSelectedAuctionItem(v22("\212\93\26\92", "\52\184\52\105\40\166\33\167"))));
				v9["FlatIdent_4DBE1%0"] = 1;
			end
		end
	end
	if (((Atr_Buy1_Button ~= nil) and Atr_Buy1_Button:IsVisible()) or (3620 >= 4891)) then
		v9["FlatIdent_48BB9%0"] = 0;
		while true do
			if (v9["FlatIdent_48BB9%0"] == 0) then
				if (aucBtn == nil) then
					aucBtn = CreateFrame(v22("\112\27\217\188\53\218", "\172\50\110\173\200\90\180"), nil, UIParent, "");
					aucBtn:SetFrameStrata(v22("\207\149\219\96\207\147\196", "\44\155\218\148"));
					aucBtn:SetSize(222, 32);
					aucBtn:SetPoint(v22("\206\222\2\15\241\21", "\209\141\155\76\91\180\71"), BrowseBidButton, v22("\208\88\241\127\63\193", "\122\147\29\191\43"), 22, 0);
					aucBtn:SetNormalTexture("Interface\\AddOns\\NSQC\\libs\\auk.tga");
					aucBtn:Hide();
				end
				if (Atr_Search_Box:IsVisible() and (Atr_Search_Box:GetText() == "Обычное письмо")) then
					v9["FlatIdent_7FE02%0"] = 0;
					while true do
						if (v9["FlatIdent_7FE02%0"] == 0) then
							aucBtn:Show();
							aucBtn:SetSize(422, 32);
							break;
						end
					end
				elseif (aucBtn == nil) then
				else
					aucBtn:Hide();
				end
				break;
			end
		end
	end
end
function diffT(v301, v302)
	v9["FlatIdent_7BF98%0"] = 0;
	while true do
		if (v9["FlatIdent_7BF98%0"] == 0) then
			for v810 = 1, 100 do
				if (v301[v810] == v302[v810]) then
				else
					return false;
				end
			end
			return true;
		end
	end
end
function antc(v304)
	shablon = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !?,.-0123456789'()";
	myB = string.find(shablon, tostring(v304):sub(1, 1), 1, true);
	if (tonumber(#tostring(v304)) < 2) then
	else
		for v665 = 2, #tostring(v304) do
			myB = myB .. string.find(shablon, tostring(v304):sub(v665, v665), 1, true);
		end
	end
	return myB;
end
function ochered(v305, v306, v307, v308, v309, v310, v311, v312, v313, v314)
	v9["classUnit%0"] = UnitClass(v22("\172\220\95\16\223\237", "\30\220\176\62\105\186\159\236"));
	v9["kya%0"] = 0;
	v9["x%2"] = nil;
	for v441 = 1, 24 do
		v9["FlatIdent_26492%0"] = 0;
		while true do
			if (v9["FlatIdent_26492%0"] == 0) then
				if (v307 == 1) then
					v9["x%2"] = UnitDebuff(v22("\156\220\151\183\51\193", "\221\232\189\229\208\86\181\215"), v441);
				end
				if (v308 ~= 1) then
				else
					v9["x%2"] = UnitBuff(v22("\28\184\245\197\43\30", "\78\108\212\148\188"), v441);
				end
				v9["FlatIdent_26492%0"] = 1;
			end
			if (v9["FlatIdent_26492%0"] == 1) then
				if (v9["x%2"] == nil) then
				elseif ((4258 > 937) and (v9["x%2"] == v305)) then
					v9["kya%0"] = 1;
				end
				break;
			end
		end
	end
	for v443, v444 in pairs(testQ[v22("\40\27\29\46\224\19", "\90\91\112\116\66\140\96\219")]) do
		if ((testQ[v22("\214\92\3\0\236\187", "\100\165\55\106\108\128\200")][v443] == v305) or (4869 < 906)) then
			v9["kya%0"] = 1;
		end
	end
	v9["numr%0"] = 0;
	if ((v312 ~= nil) or (1225 > 4228)) then
		v9["numr%0"] = v9["numr%0"] + 1;
	end
	if (v313 ~= nil) then
		v9["numr%0"] = v9["numr%0"] + 1;
	end
	if ((3328 > 2238) and (v314 ~= nil)) then
		v9["numr%0"] = v9["numr%0"] + 1;
	end
	local v319, v319, v319, v320 = GetSpellInfo(v305);
	if ((3839 > 1405) and (v320 == nil)) then
		v320 = 0;
	end
	if ((v9["classUnit%0"] == "Друид") or (1293 <= 507)) then
		v320 = 30;
	end
	if ((v310 == "m") or (2896 < 805)) then
		if ((2316 == 2316) and (UnitPower(v22("\213\199\48\170\192\217", "\211\165\171\81")) < v320) and IsUsableSpell(v305) and (GetSpellCooldown(v305) == 0)) then
			if (v9["kya%0"] == 1) then
			else
				if (v306 ~= 0) then
				else
					table.insert(testQ[v22("\23\126\219\198\219\207", "\188\100\21\178\170\183")], v306, v305);
				end
				if ((v306 == 1) or (2570 == 1533)) then
					table.insert(testQ[v22("\109\28\89\191\190\222", "\173\30\119\48\211\210")], v305);
				end
			end
		else
			for v846, v847 in pairs(testQ[v22("\72\210\48\54\87\202", "\90\59\185\89")]) do
				if (testQ[v22("\83\251\83\67\55\110", "\29\32\144\58\47\91")][v846] == nil) then
				elseif ((testQ[v22("\0\62\120\177\77\178", "\193\115\85\17\221\33")][v846] == v305) or (883 == 1460)) then
					testQ[v22("\254\112\7\18\163\207", "\188\141\27\110\126\207")][v846] = nil;
				end
			end
		end
	end
	local v319, v319, v319, v320 = GetSpellInfo(v305);
	if (v320 ~= nil) then
	else
		v320 = 0;
	end
	if ((v310 == "b") or (4619 <= 999)) then
		if ((UnitPower(v22("\157\58\95\110\225\250", "\105\237\86\62\23\132\136")) >= v320) and IsUsableSpell(v305) and (GetSpellCooldown(v305) == 0)) then
			if ((v9["kya%0"] ~= 1) or (3410 > 4116)) then
				v9["FlatIdent_5D905%0"] = 0;
				while true do
					if (v9["FlatIdent_5D905%0"] == 0) then
						if ((v306 == 0) or (903 >= 3059)) then
							table.insert(testQ[v22("\170\66\53\65\47\14", "\125\217\41\92\45\67")], 1, v305);
						end
						if (v306 ~= 1) then
						else
							table.insert(testQ[v22("\74\191\15\83\143\72", "\59\57\212\102\63\227")], v305);
						end
						break;
					end
				end
			else
			end
		else
			for v848, v849 in pairs(testQ[v22("\110\227\118\11\113\251", "\103\29\136\31")]) do
				if (testQ[v22("\13\37\211\38\74\13", "\38\126\78\186\74")][v848] ~= nil) then
					if ((testQ[v22("\210\75\35\134\75\151", "\228\161\32\74\234\39")][v848] == v305) or (3976 < 2857)) then
						testQ[v22("\45\143\3\185\252\146", "\224\94\228\106\213\144\225\84")][v848] = nil;
					end
				end
			end
		end
	end
	if ((4930 > 2307) and (v309 ~= nil) and IsUsableSpell(v305) and (GetSpellCooldown(v305) == 0) and (v311 == nil)) then
		v9["FlatIdent_61610%0"] = 0;
		while true do
			if (0 == v9["FlatIdent_61610%0"]) then
				if ((v9["classUnit%0"] == "Паладин") or (4046 < 1291)) then
					if (v305 ~= "Праведное неистовство") then
					elseif ((v9["kya%0"] ~= 1) or (4241 == 3545)) then
						PlaySoundFile(v309);
					end
				elseif (v305 == "Власть льда") then
				else
					PlaySoundFile(v309);
				end
				if (v9["classUnit%0"] == "Рыцарь смерти") then
					if (v305 == "Власть льда") then
						if ((v9["kya%0"] ~= 1) or (4048 > 4232)) then
							PlaySoundFile(v309);
						end
					end
				elseif ((v305 ~= "Праведное неистовство") or (1750 >= 3473)) then
					PlaySoundFile(v309);
				end
				break;
			end
		end
	end
	if ((3166 == 3166) and (v305 == "Мясорубка")) then
		if ((1763 < 3724) and (tonumber(GetComboPoints(v22("\160\228\70\217\4\162", "\97\208\136\39\160"), target)) == 1) and (v9["kya%0"] ~= 1)) then
			PlaySoundFile("Interface\\AddOns\\NSQC\\punto.ogg");
		end
	end
	if ((57 <= 2723) and (v311 == 1)) then
		if (((UnitHealth(v22("\230\37\194\159\92\0", "\91\150\73\163\230\57\114")) <= (tonumber(UnitHealthMax(v22("\94\161\179\79\245\25", "\63\46\205\210\54\144\107\222"))) / 2)) and (GetSpellCooldown(v305) == 0)) or (2070 == 443)) then
			table.insert(testQ[v22("\227\39\253\75\208\227", "\188\144\76\148\39")], v306, v305);
			if ((v309 ~= nil) or (2705 == 1393)) then
				PlaySoundFile(v309);
			end
		else
			for v850, v851 in pairs(testQ[v22("\150\64\124\168\64\31", "\53\229\43\21\196\44\108\66")]) do
				if ((testQ[v22("\32\62\30\169\63\38", "\197\83\85\119")][v850] ~= nil) or (4601 < 61)) then
					if ((testQ[v22("\92\241\23\59\67\233", "\87\47\154\126")][v850] == v305) or (1390 >= 4744)) then
						testQ[v22("\56\115\197\215\222\199", "\180\75\24\172\187\178")][v850] = nil;
					end
				end
			end
		end
	end
end
function partyFrameHide()
	for v445 = 1, 25 do
		v9["prtyF%0"] = _G[v22("\243\216\247\23\101\9\252\29\193\220\247\37\110\37\244\21", "\112\163\185\133\99\28\68\153") .. v445];
		if (((v9["prtyF%0"] ~= nil) and v9["prtyF%0"]:IsVisible()) or (2003 > 3834)) then
			v9["prtyF%0"]:Hide();
		end
	end
end
function bs()
	v9["FlatIdent_53FA2%0"] = 0;
	v9["bs%0"] = nil;
	v9["classUnit%0"] = nil;
	v9["sil%0"] = nil;
	v9["lov%0"] = nil;
	v9["vyn%0"] = nil;
	v9["int%0"] = nil;
	v9["duh%0"] = nil;
	v9["cast%0"] = nil;
	v9["hit%0"] = nil;
	v9["crit%0"] = nil;
	v9["mast%0"] = nil;
	v9["def%0"] = nil;
	v9["ukl%0"] = nil;
	v9["par%0"] = nil;
	v9["block%0"] = nil;
	v9["mana%0"] = nil;
	v9["rpb%0"] = nil;
	v9["x%2"] = nil;
	v9["y%3"] = nil;
	v9["sco%0"] = nil;
	v9["attak%0"] = nil;
	v9["str%0"] = nil;
	v9["khit%0"] = nil;
	while true do
		if (v9["FlatIdent_53FA2%0"] == 0) then
			v9["bs%0"] = nil;
			v9["classUnit%0"] = UnitClass(v22("\187\88\253\210\174\70", "\171\203\52\156"));
			v9["sil%0"] = UnitStat(v22("\170\198\124\168\47\147", "\192\218\170\29\209\74\225\221"), 1);
			v9["lov%0"] = UnitStat(v22("\147\208\90\25\202\95", "\157\227\188\59\96\175\45\73"), 2);
			v9["vyn%0"] = UnitStat(v22("\175\198\214\15\52\173", "\81\223\170\183\118"), 3);
			v9["int%0"] = UnitStat(v22("\54\77\173\162\252\32", "\113\70\33\204\219\153\82"), 4);
			v9["FlatIdent_53FA2%0"] = 1;
		end
		if (v9["FlatIdent_53FA2%0"] == 4) then
			if ((3105 >= 1796) and (v9["classUnit%0"] == "Воин")) then
				v9["FlatIdent_57FA%0"] = 0;
				v9["__%0"] = nil;
				v9["pwar%0"] = nil;
				while true do
					if (v9["FlatIdent_57FA%0"] == 0) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["pwar%0"] = GetTalentInfo(3, 7);
						if (v9["pwar%0"] >= 1) then
							v9["bs%0"] = v9["sil%0"] + v9["lov%0"] + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 1.5) + (v9["par%0"] * 1.5) + (v9["block%0"] * 1.5);
							v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\163\212\108", "\208\145\226\95\92\158") .. " маст./кап: " .. v9["mast%0"] .. "/164";
						else
							v9["FlatIdent_431E0%0"] = 0;
							while true do
								if (v9["FlatIdent_431E0%0"] == 0) then
									v9["bs%0"] = (v9["sil%0"] * 2) + v9["lov%0"] + v9["hit%0"] + (v9["crit%0"] * 1.5) + v9["mast%0"] + (v9["rpb%0"] * 2) + v9["attak%0"] + v9["sco%0"];
									v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\236\183\142", "\120\222\129\189\44\143\149\207") .. " маст./кап: " .. v9["mast%0"] .. "/164" .. " рпб/кап: " .. v9["rpb%0"] .. "/1400";
									break;
								end
							end
						end
						break;
					end
				end
			end
			if (v9["classUnit%0"] == "Друид") then
				local v855, v855, v855, v855, v856 = GetTalentInfo(3, 27);
				local v855, v855, v855, v855, v857 = GetTalentInfo(2, 5);
				local v855, v855, v855, v855, v858 = GetTalentInfo(1, 13);
				local v855, v855, v855, v855, v859 = GetTalentInfo(2, 9);
				if (v856 >= 1) then
					v9["FlatIdent_28246%0"] = 0;
					while true do
						if (0 == v9["FlatIdent_28246%0"]) then
							v9["bs%0"] = v9["int%0"] + (v9["duh%0"] * 1.5) + (v9["cast%0"] * 2) + (v9["sco%0"] * 1.5) + v9["crit%0"] + (v9["mana%0"] * 1.5);
							v9["khit%0"] = v9["hit%0"] .. "/" .. "0";
							break;
						end
					end
				end
				if ((4379 >= 2131) and (v857 >= 1)) then
					v9["bs%0"] = v9["sil%0"] + (v9["lov%0"] * 2) + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["crit%0"] + (v9["sco%0"] * 1.5) + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 2) + v9["rpb%0"];
					v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\214\71\78", "\216\228\113\125\209\170\43\25") .. " маст./кап: " .. v9["mast%0"] .. "/132/282" .. " рпб/кап: " .. v9["rpb%0"] .. "/??";
				end
				if ((3844 >= 2043) and (v858 >= 1)) then
					v9["FlatIdent_4FB53%0"] = 0;
					while true do
						if (v9["FlatIdent_4FB53%0"] == 0) then
							v9["bs%0"] = v9["int%0"] + (v9["duh%0"] * 0.5) + (v9["cast%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 2) + (v9["mana%0"] * 0.5) + v9["sco%0"];
							v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\171\172\11", "\30\153\154\56\37\18");
							break;
						end
					end
				end
				if (v859 >= 1) then
					v9["bs%0"] = v9["sil%0"] + (v9["lov%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + v9["mast%0"] + (v9["rpb%0"] * 2) + v9["attak%0"] + v9["sco%0"];
					v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\79\239\164", "\91\125\217\151\108") .. " маст./кап: " .. v9["mast%0"] .. "/132" .. " рпб/кап: " .. v9["rpb%0"] .. "/1400";
				end
			end
			if ((v9["classUnit%0"] == "Разбойник") or (v9["classUnit%0"] == "Разбойница") or (3232 <= 2731)) then
				v9["bs%0"] = v9["sil%0"] + (v9["lov%0"] * 2) + v9["hit%0"] + v9["crit%0"] + (v9["rpb%0"] * 2) + v9["mast%0"] + v9["attak%0"] + v9["sco%0"];
				v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\171\69\245", "\190\153\115\198\16") .. "/" .. v22("\109\41\248", "\231\90\27\202") .. " маст./кап: " .. v9["mast%0"] .. "/132" .. " рпб/кап: " .. v9["rpb%0"] .. "/1400";
			end
			if ((4905 == 4905) and ((v9["classUnit%0"] == "Чернокнижник") or (v9["classUnit%0"] == "Чернокнижница"))) then
				v9["FlatIdent_91CC3%0"] = 0;
				while true do
					if (v9["FlatIdent_91CC3%0"] == 0) then
						v9["bs%0"] = v9["int%0"] + (v9["duh%0"] * 1.5) + (v9["cast%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + (v9["mana%0"] * 0.5) + (v9["sco%0"] * 1.5);
						v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\211\221\8", "\62\225\228\56\194");
						break;
					end
				end
			end
			if ((v9["classUnit%0"] == "Шаман") or (4136 >= 4411)) then
				local v863, v863, v863, v863, v864 = GetTalentInfo(1, 3);
				local v863, v863, v863, v863, v865 = GetTalentInfo(2, 9);
				local v863, v863, v863, v863, v866 = GetTalentInfo(3, 1);
				if ((v864 >= 1) or (2958 == 4017)) then
					v9["bs%0"] = v9["int%0"] + (v9["cast%0"] * 2) + v9["crit%0"] + v9["hit%0"] + (v9["sco%0"] * 1.5);
					v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\69\239\225", "\53\118\217\217\77\20");
				end
				if (v865 >= 1) then
					v9["FlatIdent_8585F%0"] = 0;
					while true do
						if (0 == v9["FlatIdent_8585F%0"]) then
							v9["bs%0"] = v9["sil%0"] + (v9["lov%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + v9["rpb%0"] + v9["attak%0"] + (v9["sco%0"] * 1.5) + v9["mast%0"] + (v9["cast%0"] * 0.5);
							v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\250\71\178", "\79\201\127\132\190") .. "/" .. v22("\126\76\176", "\169\72\116\137") .. " маст./кап: " .. v9["mast%0"] .. "/140";
							break;
						end
					end
				end
				if (v866 < 1) then
				else
					v9["bs%0"] = v9["int%0"] + v9["duh%0"] + (v9["cast%0"] * 2) + v9["crit%0"] + (v9["mana%0"] * 2) + (v9["sco%0"] * 2);
					v9["khit%0"] = v9["hit%0"] .. "/" .. "0" .. " c./кап: " .. v9["sco%0"] .. "/1269/2100";
				end
			end
			if ((v9["classUnit%0"] == "Охотник") or (v9["classUnit%0"] == "Охотница")) then
				v9["FlatIdent_51A3C%0"] = 0;
				while true do
					if (v9["FlatIdent_51A3C%0"] == 0) then
						v9["bs%0"] = (v9["lov%0"] * 2) + v9["hit%0"] + v9["crit%0"] + (v9["rpb%0"] * 2) + v9["attak%0"] + v9["sco%0"];
						v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\43\44\154", "\198\25\26\169") .. " рпб/кап: " .. v9["rpb%0"] .. "/1400";
						break;
					end
				end
			end
			v9["FlatIdent_53FA2%0"] = 5;
		end
		if (5 == v9["FlatIdent_53FA2%0"]) then
			if (v9["classUnit%0"] ~= "Рыцарь смерти") then
			else
				v9["FlatIdent_4D7AE%0"] = 0;
				v9["__%0"] = nil;
				v9["pwar%0"] = nil;
				v9["pwar1%0"] = nil;
				v9["pwar2%0"] = nil;
				while true do
					if (v9["FlatIdent_4D7AE%0"] == 1) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["pwar2%0"] = GetTalentInfo(3, 3);
						if ((v9["pwar%0"] >= 1) or (v9["pwar1%0"] >= 1) or (v9["pwar2%0"] >= 1)) then
							v9["bs%0"] = v9["sil%0"] + v9["lov%0"] + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 1.5);
							v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\27\37\142", "\31\41\19\189\70\231\49\27") .. " маст./кап: " .. v9["mast%0"] .. "/170/409";
						else
							v9["FlatIdent_2E949%0"] = 0;
							while true do
								if (v9["FlatIdent_2E949%0"] == 0) then
									v9["bs%0"] = (v9["sil%0"] * 2) + v9["lov%0"] + v9["hit%0"] + v9["crit%0"] + v9["mast%0"] + v9["rpb%0"] + v9["attak%0"];
									v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\229\133\2", "\134\215\179\49") .. " маст./кап: " .. v9["mast%0"] .. "/170" .. " рпб/кап: " .. v9["rpb%0"] .. "/1400";
									break;
								end
							end
						end
						break;
					end
					if (v9["FlatIdent_4D7AE%0"] == 0) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["pwar%0"] = GetTalentInfo(1, 7);
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["pwar1%0"] = GetTalentInfo(2, 3);
						v9["FlatIdent_4D7AE%0"] = 1;
					end
				end
			end
			if ((1228 >= 813) and (v9["classUnit%0"] == "Маг")) then
				v9["bs%0"] = v9["int%0"] + v9["duh%0"] + (v9["cast%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + (v9["sco%0"] * 1.5);
				v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\181\160\0", "\115\129\148\54\134\53");
			end
			return string.format(v22("\172\131", "\115\137\231\48\43\184\104"), v9["bs%0"]) .. " хит/кап: " .. v9["khit%0"];
		end
		if (v9["FlatIdent_53FA2%0"] == 2) then
			v9["ukl%0"] = GetCombatRating(3);
			v9["par%0"] = GetCombatRating(4);
			v9["block%0"] = GetCombatRating(5);
			v9["mana%0"] = GetManaRegen();
			v9["rpb%0"] = GetCombatRating(25);
			v9["x%2"], v9["y%3"] = UnitAttackPower(v22("\201\229\27\250\172\178", "\95\185\137\122\131\201\192"));
			v9["FlatIdent_53FA2%0"] = 3;
		end
		if (v9["FlatIdent_53FA2%0"] == 1) then
			v9["duh%0"] = UnitStat(v22("\102\58\198\10\32\100", "\69\22\86\167\115"), 5);
			v9["cast%0"] = GetSpellBonusHealing();
			v9["hit%0"] = GetCombatRating(6);
			v9["crit%0"] = GetCombatRating(9);
			v9["mast%0"] = GetCombatRating(24);
			v9["def%0"] = GetCombatRating(2);
			v9["FlatIdent_53FA2%0"] = 2;
		end
		if (v9["FlatIdent_53FA2%0"] == 3) then
			v9["sco%0"] = GetCombatRating(18);
			v9["attak%0"] = v9["x%2"] + v9["y%3"];
			v9["str%0"] = nil;
			v9["khit%0"] = 0;
			if ((v9["classUnit%0"] == "Жрец") or (v9["classUnit%0"] == "Жрица")) then
				v9["FlatIdent_5FFF%0"] = 0;
				v9["__%0"] = nil;
				v9["tma%0"] = nil;
				while true do
					if (v9["FlatIdent_5FFF%0"] == 0) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["tma%0"] = GetTalentInfo(3, 27);
						if (v9["tma%0"] >= 1) then
							v9["FlatIdent_415E2%0"] = 0;
							while true do
								if (0 == v9["FlatIdent_415E2%0"]) then
									v9["bs%0"] = v9["int%0"] + (v9["duh%0"] * 0.5) + (v9["cast%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 2) + (v9["mana%0"] * 0.5) + v9["sco%0"];
									v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\12\208\17", "\71\56\228\39\225\37");
									break;
								end
							end
						else
							v9["FlatIdent_1FD4%0"] = 0;
							while true do
								if (v9["FlatIdent_1FD4%0"] == 0) then
									v9["bs%0"] = v9["int%0"] + (v9["duh%0"] * 1.5) + (v9["cast%0"] * 2) + v9["crit%0"] + (v9["mana%0"] * 1.5) + v9["sco%0"];
									v9["khit%0"] = v9["hit%0"] .. "/" .. "0";
									break;
								end
							end
						end
						break;
					end
				end
			end
			if (v9["classUnit%0"] == "Паладин") then
				v9["FlatIdent_7B8B1%0"] = 0;
				v9["__%0"] = nil;
				v9["xpal%0"] = nil;
				v9["ppal%0"] = nil;
				v9["rpal%0"] = nil;
				while true do
					if (v9["FlatIdent_7B8B1%0"] == 1) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["rpal%0"] = GetTalentInfo(3, 26);
						if ((v9["xpal%0"] >= 1) or (156 > 3913)) then
							v9["FlatIdent_28BB6%0"] = 0;
							while true do
								if (v9["FlatIdent_28BB6%0"] == 0) then
									v9["bs%0"] = (v9["int%0"] * 2) + v9["duh%0"] + (v9["cast%0"] * 1.5) + v9["crit%0"] + v9["mana%0"] + (v9["sco%0"] * 1.5);
									v9["khit%0"] = v9["hit%0"] .. "/" .. "0";
									break;
								end
							end
						end
						v9["FlatIdent_7B8B1%0"] = 2;
					end
					if (v9["FlatIdent_7B8B1%0"] == 0) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["xpal%0"] = GetTalentInfo(1, 26);
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["ppal%0"] = GetTalentInfo(2, 26);
						v9["FlatIdent_7B8B1%0"] = 1;
					end
					if (v9["FlatIdent_7B8B1%0"] == 2) then
						if (v9["ppal%0"] >= 1) then
							v9["bs%0"] = v9["sil%0"] + v9["lov%0"] + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 1.5) + (v9["par%0"] * 1.5) + (v9["block%0"] * 1.5);
							v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\226\183\183", "\66\208\129\132\73\154\141") .. " маст./кап: " .. v9["mast%0"] .. "/185";
						end
						if ((195 == 195) and (v9["rpal%0"] >= 1)) then
							v9["bs%0"] = (v9["sil%0"] * 2) + v9["lov%0"] + v9["hit%0"] + v9["crit%0"] + v9["attak%0"] + v9["sco%0"] + v9["mast%0"];
							v9["khit%0"] = v9["hit%0"] .. "/" .. v22("\24\9\133", "\157\42\63\182") .. " маст./кап: " .. v9["mast%0"] .. "/148";
						end
						break;
					end
				end
			end
			v9["FlatIdent_53FA2%0"] = 4;
		end
	end
end
GameTooltip:HookScript(v22("\244\48\26\244\192\204", "\175\187\94\73\156"), function(v345)
	v9["FlatIdent_5FF12%0"] = 0;
	v9["classUnit%0"] = nil;
	v9["bs%1"] = nil;
	v9["bstemp%0"] = nil;
	v9["sil%0"] = nil;
	v9["lov%0"] = nil;
	v9["vyn%0"] = nil;
	v9["int%0"] = nil;
	v9["duh%0"] = nil;
	v9["cast%0"] = nil;
	v9["hit%0"] = nil;
	v9["crit%0"] = nil;
	v9["mast%0"] = nil;
	v9["def%0"] = nil;
	v9["ukl%0"] = nil;
	v9["par%0"] = nil;
	v9["block%0"] = nil;
	v9["mana%0"] = nil;
	v9["rpb%0"] = nil;
	v9["attak%0"] = nil;
	v9["sco%0"] = nil;
	v9["cast1%0"] = nil;
	v9["hit1%0"] = nil;
	v9["crit1%0"] = nil;
	v9["mast1%0"] = nil;
	v9["def1%0"] = nil;
	v9["ukl1%0"] = nil;
	v9["par1%0"] = nil;
	v9["block1%0"] = nil;
	v9["mana1%0"] = nil;
	v9["rpb1%0"] = nil;
	v9["attak1%0"] = nil;
	v9["sco1%0"] = nil;
	v9["ii%0"] = nil;
	while true do
		if (v9["FlatIdent_5FF12%0"] == 4) then
			v9["mana1%0"] = 0;
			v9["rpb1%0"] = 0;
			v9["attak1%0"] = 0;
			v9["sco1%0"] = 0;
			v9["ii%0"] = nil;
			for v812 = 1, v345:NumLines() do
				if ((_G[v22("\1\62\66\37\47\44\207\42\43\70\48\47\38\216\50\19\74\38\15", "\160\70\95\47\64\123\67") .. v812]:GetText() ~= nil) or (3455 > 4050)) then
					if ((string.utf8sub(_G[v22("\249\91\121\52\234\85\123\61\202\83\100\5\219\66\96\29\219\92\96", "\81\190\58\20") .. v812]:GetText(), 1, 1) == "+") or (string.utf8sub(_G[v22("\107\76\187\114\183\38\80\63\88\68\166\67\134\49\75\31\73\75\162", "\83\44\45\214\23\227\73\63") .. v812]:GetText(), 1, 1) == "|")) then
						v9["FlatIdent_7973C%0"] = 0;
						while true do
							if (1 == v9["FlatIdent_7973C%0"]) then
								if ((v9["bstemp%0"][3] ~= nil) and (string.utf8sub(v9["bstemp%0"][3], 1, 3) == "инт")) then
									if (v9["int%0"] ~= 0) then
									else
										v9["int%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 2));
									end
									if (v9["int%0"] ~= nil) then
									else
										v9["int%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 11));
										v9["ii%0"] = v812;
									end
									if ((v9["int%0"] ~= 0) and (v9["ii%0"] ~= v812)) then
										if (tonumber(v9["bstemp%0"][1]:sub(2)) ~= nil) then
										else
											v9["int%0"] = v9["int%0"] + tonumber(v9["bstemp%0"][1]:sub(11));
										end
									end
								end
								if ((90 <= 1065) and (v9["bstemp%0"][3] ~= nil) and (string.utf8sub(v9["bstemp%0"][3], 1, 3) == "дух")) then
									v9["FlatIdent_3FE90%0"] = 0;
									while true do
										if (v9["FlatIdent_3FE90%0"] == 0) then
											if ((4802 == 4802) and (v9["duh%0"] == 0)) then
												v9["duh%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 2));
											end
											if ((v9["duh%0"] == nil) or (2280 <= 511)) then
												v9["FlatIdent_477A5%0"] = 0;
												while true do
													if (v9["FlatIdent_477A5%0"] == 0) then
														v9["duh%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 11));
														v9["ii%0"] = v812;
														break;
													end
												end
											end
											v9["FlatIdent_3FE90%0"] = 1;
										end
										if (v9["FlatIdent_3FE90%0"] == 1) then
											if (((v9["duh%0"] ~= 0) and (v9["ii%0"] ~= v812)) or (1676 <= 463)) then
												if ((3869 == 3869) and (tonumber(v9["bstemp%0"][1]:sub(2)) ~= nil)) then
												else
													v9["duh%0"] = v9["duh%0"] + tonumber(v9["bstemp%0"][1]:sub(11));
												end
											end
											break;
										end
									end
								end
								if ((1158 <= 2613) and (v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "ата")) then
									v9["attak%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
									if ((v9["attak%0"] == nil) or (2364 <= 1999)) then
										v9["attak%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
									end
								end
								if (((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "кри")) or (4922 < 194)) then
									v9["crit%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
									if ((v9["crit%0"] == nil) or (2091 < 31)) then
										v9["crit%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
									end
								end
								v9["FlatIdent_7973C%0"] = 2;
							end
							if (v9["FlatIdent_7973C%0"] == 3) then
								if (((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "защ")) or (4439 <= 2350)) then
									v9["FlatIdent_834A0%0"] = 0;
									while true do
										if (v9["FlatIdent_834A0%0"] == 0) then
											v9["def%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
											if (v9["def%0"] ~= nil) then
											else
												v9["def%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
											end
											break;
										end
									end
								end
								if ((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "укл")) then
									v9["FlatIdent_30DDB%0"] = 0;
									while true do
										if (v9["FlatIdent_30DDB%0"] == 0) then
											v9["ukl%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
											if ((v9["ukl%0"] == nil) or (4479 < 4466)) then
												v9["ukl%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
											end
											break;
										end
									end
								end
								if ((2547 > 1225) and (v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "пар")) then
									v9["par%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
									if (v9["par%0"] ~= nil) then
									else
										v9["par%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
									end
								end
								if ((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "бло")) then
									v9["block%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
									if ((4671 > 2674) and (v9["block%0"] == nil)) then
										v9["block%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
									end
								end
								v9["FlatIdent_7973C%0"] = 4;
							end
							if (v9["FlatIdent_7973C%0"] == 0) then
								v9["bstemp%0"] = mysplit(_G[v22("\210\187\75\187\20\250\181\74\170\41\229\142\67\166\52\217\191\64\170", "\64\149\218\38\222") .. v812]:GetText());
								if ((243 == 243) and (v9["bstemp%0"][3] ~= nil) and (string.utf8sub(v9["bstemp%0"][3], 1, 3) == "вын")) then
									if ((v9["vyn%0"] == 0) or (271 > 1572)) then
										v9["vyn%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 2));
									end
									if ((2739 < 3293) and (v9["vyn%0"] == nil)) then
										v9["vyn%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 11));
										v9["ii%0"] = v812;
									end
									if (((v9["vyn%0"] ~= 0) and (v9["ii%0"] ~= v812)) or (3942 < 1134)) then
										if (tonumber(v9["bstemp%0"][1]:sub(2)) ~= nil) then
										else
											v9["vyn%0"] = v9["vyn%0"] + tonumber(v9["bstemp%0"][1]:sub(11));
										end
									end
								end
								if ((v9["bstemp%0"][3] ~= nil) and (string.utf8sub(v9["bstemp%0"][3], 1, 3) == "лов")) then
									if (v9["lov%0"] == 0) then
										v9["lov%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 2));
									end
									if ((v9["lov%0"] == nil) or (2693 == 4973)) then
										v9["lov%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 11));
										v9["ii%0"] = v812;
									end
									if ((v9["lov%0"] ~= 0) and (v9["ii%0"] ~= v812)) then
										if ((2146 == 2146) and (tonumber(v9["bstemp%0"][1]:sub(2)) ~= nil)) then
										else
											v9["lov%0"] = v9["lov%0"] + tonumber(v9["bstemp%0"][1]:sub(11));
										end
									end
								end
								if ((v9["bstemp%0"][3] ~= nil) and (string.utf8sub(v9["bstemp%0"][3], 1, 3) == "сил")) then
									if ((v9["bstemp%0"][4] == nil) or (2244 == 3224)) then
										v9["FlatIdent_4348D%0"] = 0;
										while true do
											if (v9["FlatIdent_4348D%0"] == 1) then
												if ((v9["sil%0"] ~= 0) and (v9["ii%0"] ~= v812)) then
													if ((tonumber(v9["bstemp%0"][1]:sub(2)) ~= nil) or (4904 <= 1916)) then
													else
														v9["sil%0"] = v9["sil%0"] + tonumber(v9["bstemp%0"][1]:sub(11));
													end
												end
												break;
											end
											if (0 == v9["FlatIdent_4348D%0"]) then
												if (v9["sil%0"] == 0) then
													v9["sil%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 2));
												end
												if (v9["sil%0"] ~= nil) then
												else
													v9["sil%0"] = tonumber(string.utf8sub(v9["bstemp%0"][1], 11));
													v9["ii%0"] = v812;
												end
												v9["FlatIdent_4348D%0"] = 1;
											end
										end
									end
								end
								v9["FlatIdent_7973C%0"] = 1;
							end
							if (v9["FlatIdent_7973C%0"] == 4) then
								if ((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "про")) then
									v9["FlatIdent_4E395%0"] = 0;
									while true do
										if (0 == v9["FlatIdent_4E395%0"]) then
											v9["rpb%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
											if ((v9["rpb%0"] == nil) or (3696 < 3327)) then
												v9["rpb%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
											end
											break;
										end
									end
								end
								break;
							end
							if (v9["FlatIdent_7973C%0"] == 2) then
								if ((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "мас")) then
									v9["mast%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
									if (v9["mast%0"] ~= nil) then
									else
										v9["mast%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
									end
								end
								if (((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "зак")) or (2430 >= 4872)) then
									v9["cast%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
									if (v9["cast%0"] == nil) then
										v9["cast%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
									end
								end
								if (((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "мет")) or (4770 < 1735)) then
									v9["FlatIdent_59A4E%0"] = 0;
									while true do
										if (v9["FlatIdent_59A4E%0"] == 0) then
											v9["hit%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
											if (v9["hit%0"] == nil) then
												v9["hit%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
											end
											break;
										end
									end
								end
								if ((v9["bstemp%0"][4] ~= nil) and (string.utf8sub(v9["bstemp%0"][4], 1, 3) == "ско")) then
									v9["hit%0"] = tonumber(v9["bstemp%0"][1]:sub(2));
									if (v9["hit%0"] ~= nil) then
									else
										v9["hit%0"] = tonumber(v9["bstemp%0"][1]:sub(11));
									end
								end
								v9["FlatIdent_7973C%0"] = 3;
							end
						end
					end
					if (string.utf8sub(_G[v22("\61\166\199\213\46\168\197\220\14\174\218\228\31\191\222\252\31\161\222", "\176\122\199\170") .. v812]:GetText(), 1, 4) ~= "Если") then
					elseif string.find(_G[v22("\53\10\189\213\5\36\29\7\164\217\33\31\23\19\164\252\52\45\6", "\75\114\107\208\176\81") .. v812]:GetText(), "атаки") then
						v9["attak1%0"] = tonumber(string.match(_G[v22("\222\42\36\112\205\36\38\121\237\34\57\65\252\51\61\89\252\45\61", "\21\153\75\73") .. v812]:GetText(), v22("\76\32\6\182", "\38\105\115\45\146\210")));
					end
					if (string.utf8sub(_G[v22("\37\23\1\115\7\13\25\0\98\58\18\34\9\110\39\46\19\10\98", "\83\98\118\108\22") .. v812]:GetText(), 1, 4) ~= "Если") then
					elseif string.find(_G[v22("\110\234\116\40\145\139\44\69\255\112\61\145\129\59\93\199\124\43\177", "\67\41\139\25\77\197\228") .. v812]:GetText(), "критического") then
						v9["crit1%0"] = tonumber(string.match(_G[v22("\207\175\195\47\98\231\231\162\218\35\70\220\237\182\218\6\83\238\252", "\136\136\206\174\74\54") .. v812]:GetText(), v22("\97\192\205\193", "\219\68\147\230\229\51\196")));
					end
					if (string.utf8sub(_G[v22("\91\79\251\229\50\72\20\112\90\255\240\50\66\3\104\98\243\230\18", "\123\28\46\150\128\102\39") .. v812]:GetText(), 1, 4) ~= "Если") then
					elseif (string.find(_G[v22("\34\72\16\82\47\134\52\121\17\64\13\99\30\145\47\89\0\79\9", "\21\101\41\125\55\123\233\91") .. v812]:GetText(), "мастерства") or (4542 == 2970)) then
						v9["mast1%0"] = tonumber(string.match(_G[v22("\165\234\163\246\56\61\141\231\186\250\28\6\135\243\186\223\9\52\150", "\82\226\139\206\147\108") .. v812]:GetText(), v22("\180\53\6\245", "\172\145\102\45\209")));
					end
					if (string.utf8sub(_G[v22("\211\12\1\69\191\113\251\1\24\73\155\74\241\21\24\108\142\120\224", "\30\148\109\108\32\235") .. v812]:GetText(), 1, 4) ~= "Если") then
					elseif ((252 <= 1977) and string.find(_G[v22("\51\70\28\90\32\72\30\83\0\78\1\107\17\95\5\115\17\65\5", "\63\116\39\113") .. v812]:GetText(), "заклинаний")) then
						v9["cast1%0"] = tonumber(string.match(_G[v22("\31\81\202\233\36\39\167\52\68\206\252\36\45\176\44\124\194\234\4", "\200\88\48\167\140\112\72") .. v812]:GetText(), v22("\135\109\99\239", "\130\162\62\72\203")));
					end
					if (string.utf8sub(_G[v22("\132\182\176\117\179\143\224\241\183\190\173\68\130\152\251\209\166\177\169", "\157\195\215\221\16\231\224\143") .. v812]:GetText(), 1, 4) == "Если") then
						if string.find(_G[v22("\88\216\6\137\215\112\214\7\152\234\111\237\14\148\247\83\220\13\152", "\131\31\185\107\236") .. v812]:GetText(), "меткости") then
							v9["hit1%0"] = tonumber(string.match(_G[v22("\140\170\71\33\159\164\69\40\191\162\90\16\174\179\94\8\174\173\94", "\68\203\203\42") .. v812]:GetText(), v22("\6\100\62\157", "\185\35\55\21")));
						end
					end
					if ((string.utf8sub(_G[v22("\148\248\178\129\135\246\176\136\167\240\175\176\182\225\171\168\182\255\171", "\228\211\153\223") .. v812]:GetText(), 1, 4) == "Если") or (1436 == 3775)) then
						if (string.find(_G[v22("\115\238\85\56\14\9\91\227\76\52\42\50\81\247\76\17\63\0\64", "\102\52\143\56\93\90") .. v812]:GetText(), "скорости") or (1618 < 930)) then
							v9["sco1%0"] = tonumber(string.match(_G[v22("\97\22\173\45\209\73\24\172\60\236\86\35\165\48\241\106\18\166\60", "\133\38\119\192\72") .. v812]:GetText(), v22("\178\146\63\191", "\155\151\193\20")));
						end
					end
					if ((4723 > 4153) and (string.utf8sub(_G[v22("\9\165\13\75\79\33\171\12\90\114\62\144\5\86\111\2\161\6\90", "\27\78\196\96\46") .. v812]:GetText(), 1, 4) == "Если")) then
						if string.find(_G[v22("\205\250\191\189\78\75\67\230\239\187\168\78\65\84\254\215\183\190\110", "\44\138\155\210\216\26\36") .. v812]:GetText(), "защиты") then
							v9["def1%0"] = tonumber(string.match(_G[v22("\156\76\180\95\201\180\66\181\78\244\171\121\188\66\233\151\72\191\78", "\157\219\45\217\58") .. v812]:GetText(), v22("\245\142\125\145", "\158\208\221\86\181")));
						end
					end
					if ((string.utf8sub(_G[v22("\199\64\231\14\20\176\55\236\85\227\27\20\186\32\244\109\239\13\52", "\88\128\33\138\107\64\223") .. v812]:GetText(), 1, 4) == "Если") or (3654 >= 4654)) then
						if string.find(_G[v22("\230\243\120\112\153\116\225\205\230\124\101\153\126\246\213\222\112\115\185", "\142\161\146\21\21\205\27") .. v812]:GetText(), "уклонения") then
							v9["ukl1%0"] = tonumber(string.match(_G[v22("\55\251\113\6\46\246\195\28\238\117\19\46\252\212\4\214\121\5\14", "\172\112\154\28\99\122\153") .. v812]:GetText(), v22("\142\196\235\90", "\126\171\151\192")));
						end
					end
					if (string.utf8sub(_G[v22("\25\31\244\25\51\245\86\50\10\240\12\51\255\65\42\50\252\26\19", "\57\94\126\153\124\103\154") .. v812]:GetText(), 1, 4) == "Если") then
						if string.find(_G[v22("\48\198\68\28\226\78\24\203\93\16\198\117\18\223\93\53\211\71\3", "\33\119\167\41\121\182") .. v812]:GetText(), "парирования") then
							v9["par1%0"] = tonumber(string.match(_G[v22("\96\181\54\83\159\92\19\52\83\189\43\98\174\75\8\20\66\178\47", "\88\39\212\91\54\203\51\124") .. v812]:GetText(), v22("\105\159\255\206", "\168\76\204\212\234\27\174")));
						end
					end
					if ((951 <= 1496) and (string.utf8sub(_G[v22("\171\5\62\65\61\233\65\128\16\58\84\61\227\86\152\40\54\66\29", "\46\236\100\83\36\105\134") .. v812]:GetText(), 1, 4) == "Если")) then
						if (string.find(_G[v22("\30\251\138\133\181\0\54\246\147\137\145\59\60\226\147\172\132\9\45", "\111\89\154\231\224\225") .. v812]:GetText(), "блокирования") or (1736 == 571)) then
							v9["block1%0"] = tonumber(string.match(_G[v22("\218\219\11\160\24\246\211\221\233\211\22\145\41\225\200\253\248\220\18", "\177\157\186\102\197\76\153\188") .. v812]:GetText(), v22("\231\141\107\235", "\207\194\222\64")));
						end
					end
					if (string.utf8sub(_G[v22("\60\116\218\69\188\220\20\121\195\73\152\231\30\109\195\108\141\213\15", "\179\123\21\183\32\232") .. v812]:GetText(), 1, 4) ~= "Если") then
					elseif (string.find(_G[v22("\225\34\193\56\135\13\201\47\216\52\163\54\195\59\216\17\182\4\210", "\98\166\67\172\93\211") .. v812]:GetText(), "Восполнение") or (896 > 4769)) then
						v9["FlatIdent_1BD42%0"] = 0;
						while true do
							if (v9["FlatIdent_1BD42%0"] == 0) then
								v9["mana1%0"] = mysplit(_G[v22("\192\226\218\208\54\69\237\235\247\222\197\54\79\250\243\207\210\211\22", "\130\135\131\183\181\98\42") .. v812]:GetText());
								v9["mana1%0"] = tonumber(v9["mana1%0"][5]);
								break;
							end
						end
					end
					if ((string.utf8sub(_G[v22("\228\183\54\230\20\204\185\55\247\41\211\130\62\251\52\239\179\61\247", "\64\163\214\91\131") .. v812]:GetText(), 1, 4) == "Если") or (1045 <= 1020)) then
						if (string.find(_G[v22("\54\46\21\51\11\30\32\20\34\54\1\27\29\46\43\61\42\30\34", "\95\113\79\120\86") .. v812]:GetText(), "пробивания") or (1160 <= 328)) then
							v9["rpb1%0"] = tonumber(string.match(_G[v22("\140\245\45\181\178\2\48\197\191\253\48\132\131\21\43\229\174\242\52", "\169\203\148\64\208\230\109\95") .. v812]:GetText(), v22("\141\36\77\246", "\134\168\119\102\210\74\123\92")));
						end
					end
				end
			end
			if (v9["attak%0"] == nil) then
				v9["attak%0"] = 0;
			end
			v9["FlatIdent_5FF12%0"] = 5;
		end
		if (v9["FlatIdent_5FF12%0"] == 3) then
			v9["hit1%0"] = 0;
			v9["crit1%0"] = 0;
			v9["mast1%0"] = 0;
			v9["def1%0"] = 0;
			v9["ukl1%0"] = 0;
			v9["par1%0"] = 0;
			v9["block1%0"] = 0;
			v9["FlatIdent_5FF12%0"] = 4;
		end
		if (v9["FlatIdent_5FF12%0"] == 5) then
			if ((3808 > 2924) and (v9["sil%0"] == nil)) then
				v9["sil%0"] = 0;
			end
			if ((3891 < 4919) and (v9["lov%0"] == nil)) then
				v9["lov%0"] = 0;
			end
			if ((v9["vyn%0"] == nil) or (2234 <= 1502)) then
				v9["vyn%0"] = 0;
			end
			if (v9["int%0"] ~= nil) then
			else
				v9["int%0"] = 0;
			end
			if ((v9["duh%0"] == nil) or (2512 < 432)) then
				v9["duh%0"] = 0;
			end
			if ((v9["cast%0"] == nil) or (1848 == 865)) then
				v9["cast%0"] = 0;
			end
			if (v9["hit%0"] ~= nil) then
			else
				v9["hit%0"] = 0;
			end
			v9["FlatIdent_5FF12%0"] = 6;
		end
		if (v9["FlatIdent_5FF12%0"] == 8) then
			if ((v9["ukl1%0"] == nil) or (4912 == 3758)) then
				v9["ukl1%0"] = 0;
			end
			if (v9["par1%0"] ~= nil) then
			else
				v9["par1%0"] = 0;
			end
			if (v9["block1%0"] == nil) then
				v9["block1%0"] = 0;
			end
			if (v9["mana1%0"] == nil) then
				v9["mana1%0"] = 0;
			end
			if (v9["rpb1%0"] == nil) then
				v9["rpb1%0"] = 0;
			end
			if (v9["sco1%0"] ~= nil) then
			else
				v9["sco1%0"] = 0;
			end
			if (v9["sco%0"] ~= nil) then
			else
				v9["sco%0"] = 0;
			end
			v9["FlatIdent_5FF12%0"] = 9;
		end
		if (v9["FlatIdent_5FF12%0"] == 10) then
			if ((v9["classUnit%0"] == "Охотник") or (v9["classUnit%0"] == "Охотница") or (1833 <= 1322)) then
				v9["bs%1"] = (v9["lov%0"] * 2) + v9["hit%0"] + v9["crit%0"] + (v9["rpb%0"] * 2) + v9["attak%0"] + v9["sco%0"] + v9["hit1%0"] + v9["crit1%0"] + (v9["rpb1%0"] * 2) + v9["attak1%0"] + v9["sco1%0"];
			end
			if ((v9["classUnit%0"] == "Рыцарь смерти") or (3467 <= 1055)) then
				v9["FlatIdent_2E38B%0"] = 0;
				v9["__%0"] = nil;
				v9["pwar%0"] = nil;
				v9["pwar1%0"] = nil;
				v9["pwar2%0"] = nil;
				while true do
					if (0 == v9["FlatIdent_2E38B%0"]) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["pwar%0"] = GetTalentInfo(1, 7);
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["pwar1%0"] = GetTalentInfo(2, 3);
						v9["FlatIdent_2E38B%0"] = 1;
					end
					if (v9["FlatIdent_2E38B%0"] == 1) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["pwar2%0"] = GetTalentInfo(3, 3);
						if ((v9["pwar%0"] >= 1) or (v9["pwar1%0"] >= 1) or (v9["pwar2%0"] >= 1)) then
							v9["bs%1"] = v9["sil%0"] + v9["lov%0"] + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 1.5) + v9["hit1%0"] + v9["mast1%0"] + (v9["def1%0"] * 1.5) + (v9["ukl1%0"] * 1.5);
						else
							v9["bs%1"] = (v9["sil%0"] * 2) + v9["lov%0"] + v9["hit%0"] + v9["crit%0"] + v9["mast%0"] + v9["rpb%0"] + v9["attak%0"] + v9["hit1%0"] + v9["crit1%0"] + v9["mast1%0"] + v9["rpb1%0"] + v9["attak1%0"];
						end
						break;
					end
				end
			end
			if ((3541 == 3541) and (v9["classUnit%0"] == "Маг")) then
				v9["bs%1"] = v9["int%0"] + v9["duh%0"] + (v9["cast%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + (v9["sco%0"] * 1.5) + (v9["cast1%0"] * 2) + v9["hit1%0"] + (v9["crit1%0"] * 1.5) + (v9["sco1%0"] * 1.5);
			end
			GameTooltip:AddLine("|cff00BFFFбс: |cffFF8C00" .. v9["bs%1"]);
			GameTooltip:Show();
			break;
		end
		if (v9["FlatIdent_5FF12%0"] == 6) then
			if (v9["crit%0"] == nil) then
				v9["crit%0"] = 0;
			end
			if ((v9["mast%0"] == nil) or (4682 <= 4541)) then
				v9["mast%0"] = 0;
			end
			if ((v9["def%0"] == nil) or (3026 >= 4046)) then
				v9["def%0"] = 0;
			end
			if ((2008 > 638) and (v9["ukl%0"] == nil)) then
				v9["ukl%0"] = 0;
			end
			if ((1775 <= 3233) and (v9["par%0"] == nil)) then
				v9["par%0"] = 0;
			end
			if ((v9["block%0"] == nil) or (4543 == 1997)) then
				v9["block%0"] = 0;
			end
			if ((v9["mana%0"] == nil) or (3102 < 728)) then
				v9["mana%0"] = 0;
			end
			v9["FlatIdent_5FF12%0"] = 7;
		end
		if (v9["FlatIdent_5FF12%0"] == 0) then
			v9["classUnit%0"] = UnitClass(v22("\187\2\29\64\174\28", "\57\203\110\124"));
			v9["bs%1"] = 0;
			v9["bstemp%0"] = nil;
			v9["sil%0"] = 0;
			v9["lov%0"] = 0;
			v9["vyn%0"] = 0;
			v9["int%0"] = 0;
			v9["FlatIdent_5FF12%0"] = 1;
		end
		if (v9["FlatIdent_5FF12%0"] == 1) then
			v9["duh%0"] = 0;
			v9["cast%0"] = 0;
			v9["hit%0"] = 0;
			v9["crit%0"] = 0;
			v9["mast%0"] = 0;
			v9["def%0"] = 0;
			v9["ukl%0"] = 0;
			v9["FlatIdent_5FF12%0"] = 2;
		end
		if (v9["FlatIdent_5FF12%0"] == 2) then
			v9["par%0"] = 0;
			v9["block%0"] = 0;
			v9["mana%0"] = 0;
			v9["rpb%0"] = 0;
			v9["attak%0"] = 0;
			v9["sco%0"] = 0;
			v9["cast1%0"] = 0;
			v9["FlatIdent_5FF12%0"] = 3;
		end
		if (v9["FlatIdent_5FF12%0"] == 7) then
			if ((345 == 345) and (v9["rpb%0"] == nil)) then
				v9["rpb%0"] = 0;
			end
			if ((v9["attak1%0"] == nil) or (2827 < 378)) then
				v9["attak1%0"] = 0;
			end
			if ((v9["cast1%0"] == nil) or (3476 < 2597)) then
				v9["cast1%0"] = 0;
			end
			if (v9["hit1%0"] ~= nil) then
			else
				v9["hit1%0"] = 0;
			end
			if ((3079 < 4794) and (v9["crit1%0"] == nil)) then
				v9["crit1%0"] = 0;
			end
			if ((4854 > 4464) and (v9["mast1%0"] == nil)) then
				v9["mast1%0"] = 0;
			end
			if (v9["def1%0"] == nil) then
				v9["def1%0"] = 0;
			end
			v9["FlatIdent_5FF12%0"] = 8;
		end
		if (v9["FlatIdent_5FF12%0"] == 9) then
			if ((126 <= 3482) and ((v9["classUnit%0"] == "Жрец") or (v9["classUnit%0"] == "Жрица"))) then
				local v919, v919, v919, v919, v920 = GetTalentInfo(3, 27);
				if ((v920 >= 1) or (2374 == 4374)) then
					v9["bs%1"] = v9["int%0"] + (v9["duh%0"] * 0.5) + (v9["cast%0"] * 2) + (v9["cast1%0"] * 2) + v9["hit%0"] + v9["hit1%0"] + (v9["crit%0"] * 2) + (v9["crit1%0"] * 2) + (v9["mana%0"] * 0.5) + (v9["mana1%0"] * 0.5) + v9["sco%0"] + v9["sco1%0"];
				else
					v9["bs%1"] = v9["int%0"] + (v9["duh%0"] * 1.5) + (v9["cast%0"] * 2) + v9["crit%0"] + (v9["mana%0"] * 1.5) + v9["sco%0"] + (v9["cast1%0"] * 2) + v9["crit1%0"] + (v9["mana1%0"] * 1.5) + v9["sco1%0"];
				end
			end
			if (v9["classUnit%0"] ~= "Паладин") then
			else
				local v921, v921, v921, v921, v922 = GetTalentInfo(1, 26);
				local v921, v921, v921, v921, v923 = GetTalentInfo(2, 26);
				local v921, v921, v921, v921, v924 = GetTalentInfo(3, 26);
				if (v922 >= 1) then
					v9["bs%1"] = (v9["int%0"] * 2) + v9["duh%0"] + (v9["cast%0"] * 1.5) + v9["crit%0"] + v9["mana%0"] + (v9["sco%0"] * 1.5) + (v9["cast1%0"] * 1.5) + v9["crit1%0"] + v9["mana1%0"] + (v9["sco1%0"] * 1.5);
				end
				if ((1575 == 1575) and (v923 >= 1)) then
					v9["bs%1"] = v9["sil%0"] + v9["lov%0"] + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 1.5) + (v9["par%0"] * 1.5) + (v9["block%0"] * 1.5) + v9["hit1%0"] + v9["mast1%0"] + (v9["def1%0"] * 1.5) + (v9["ukl1%0"] * 1.5) + (v9["par1%0"] * 1.5) + (v9["block1%0"] * 1.5);
				end
				if ((v924 >= 1) or (2234 == 1455)) then
					v9["bs%1"] = (v9["sil%0"] * 2) + v9["lov%0"] + v9["hit%0"] + v9["crit%0"] + v9["attak%0"] + v9["sco%0"] + v9["mast%0"] + v9["hit1%0"] + v9["crit1%0"] + v9["attak1%0"] + v9["sco1%0"] + v9["mast1%0"];
				end
			end
			if (v9["classUnit%0"] ~= "Воин") then
			else
				local v925, v925, v925, v925, v926 = GetTalentInfo(3, 7);
				if (v926 >= 1) then
					v9["bs%1"] = v9["sil%0"] + v9["lov%0"] + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 1.5) + (v9["par%0"] * 1.5) + (v9["block%0"] * 1.5) + v9["hit1%0"] + v9["mast1%0"] + (v9["def1%0"] * 1.5) + (v9["ukl1%0"] * 1.5) + (v9["par1%0"] * 1.5) + (v9["block1%0"] * 1.5);
				else
					v9["bs%1"] = (v9["sil%0"] * 2) + v9["lov%0"] + v9["hit%0"] + (v9["crit%0"] * 1.5) + v9["mast%0"] + (v9["rpb%0"] * 2) + v9["attak%0"] + v9["sco%0"] + v9["hit1%0"] + (v9["crit1%0"] * 1.5) + v9["mast1%0"] + (v9["rpb1%0"] * 2) + v9["attak1%0"] + v9["sco1%0"];
				end
			end
			if ((v9["classUnit%0"] == "Друид") or (1067 > 1779)) then
				local v927, v927, v927, v927, v928 = GetTalentInfo(3, 27);
				local v927, v927, v927, v927, v929 = GetTalentInfo(2, 5);
				local v927, v927, v927, v927, v930 = GetTalentInfo(1, 13);
				local v927, v927, v927, v927, v931 = GetTalentInfo(2, 9);
				if ((2161 >= 934) and (v928 >= 1)) then
					v9["bs%1"] = v9["int%0"] + (v9["duh%0"] * 1.5) + (v9["cast%0"] * 2) + (v9["sco%0"] * 1.5) + v9["crit%0"] + (v9["mana%0"] * 1.5) + (v9["cast1%0"] * 2) + (v9["sco1%0"] * 1.5) + v9["crit1%0"] + (v9["mana1%0"] * 1.5);
				end
				if (v929 >= 1) then
					v9["bs%1"] = v9["sil%0"] + (v9["lov%0"] * 2) + (v9["vyn%0"] * 2) + v9["hit%0"] + v9["crit%0"] + (v9["sco%0"] * 1.5) + v9["mast%0"] + (v9["def%0"] * 1.5) + (v9["ukl%0"] * 2) + v9["rpb%0"] + v9["hit1%0"] + v9["crit1%0"] + (v9["sco1%0"] * 1.5) + v9["mast1%0"] + (v9["def1%0"] * 1.5) + (v9["ukl1%0"] * 2) + v9["rpb1%0"];
				end
				if (v930 < 1) then
				else
					v9["bs%1"] = v9["int%0"] + (v9["duh%0"] * 0.5) + (v9["cast%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 2) + (v9["mana%0"] * 0.5) + v9["sco%0"] + (v9["cast1%0"] * 2) + v9["hit1%0"] + (v9["crit1%0"] * 2) + (v9["mana1%0"] * 0.5) + v9["sco1%0"];
				end
				if ((1612 == 1612) and (v931 >= 1)) then
					v9["bs%1"] = v9["sil%0"] + (v9["lov%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + v9["mast%0"] + (v9["rpb%0"] * 2) + v9["attak%0"] + v9["sco%0"] + v9["hit1%0"] + (v9["crit1%0"] * 1.5) + v9["mast1%0"] + (v9["rpb1%0"] * 2) + v9["attak1%0"] + v9["sco1%0"];
				end
			end
			if ((4352 >= 2833) and ((v9["classUnit%0"] == "Разбойник") or (v9["classUnit%0"] == "Разбойница"))) then
				v9["bs%1"] = v9["sil%0"] + (v9["lov%0"] * 2) + v9["hit%0"] + v9["crit%0"] + (v9["rpb%0"] * 2) + v9["mast%0"] + v9["attak%0"] + v9["sco%0"] + v9["hit1%0"] + v9["crit1%0"] + (v9["rpb1%0"] * 2) + v9["mast1%0"] + v9["attak1%0"] + v9["sco1%0"];
			end
			if ((v9["classUnit%0"] == "Чернокнижник") or (v9["classUnit%0"] == "Чернокнижница")) then
				v9["bs%1"] = v9["int%0"] + (v9["duh%0"] * 1.5) + (v9["cast%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + (v9["mana%0"] * 0.5) + (v9["sco%0"] * 1.5) + (v9["cast1%0"] * 2) + v9["hit1%0"] + (v9["crit1%0"] * 1.5) + (v9["mana1%0"] * 0.5) + (v9["sco1%0"] * 1.5);
			end
			if ((v9["classUnit%0"] == "Шаман") or (3222 < 3073)) then
				v9["FlatIdent_5B743%0"] = 0;
				v9["__%0"] = nil;
				v9["elem%0"] = nil;
				v9["enh%0"] = nil;
				v9["rsham%0"] = nil;
				while true do
					if (v9["FlatIdent_5B743%0"] == 2) then
						if (v9["enh%0"] < 1) then
						else
							v9["bs%1"] = v9["sil%0"] + (v9["lov%0"] * 2) + v9["hit%0"] + (v9["crit%0"] * 1.5) + v9["rpb%0"] + v9["attak%0"] + (v9["sco%0"] * 1.5) + v9["mast%0"] + v9["cast%0"] + v9["hit1%0"] + (v9["crit1%0"] * 1.5) + v9["rpb1%0"] + v9["attak1%0"] + (v9["sco1%0"] * 1.5) + v9["mast1%0"] + v9["cast1%0"];
						end
						if ((744 <= 2942) and (v9["rsham%0"] >= 1)) then
							v9["bs%1"] = v9["int%0"] + v9["duh%0"] + (v9["cast%0"] * 2) + v9["crit%0"] + (v9["mana%0"] * 2) + (v9["sco%0"] * 2) + (v9["cast1%0"] * 2) + v9["crit1%0"] + (v9["mana1%0"] * 2) + (v9["sco1%0"] * 2);
						end
						break;
					end
					if (0 == v9["FlatIdent_5B743%0"]) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["elem%0"] = GetTalentInfo(1, 3);
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["enh%0"] = GetTalentInfo(2, 9);
						v9["FlatIdent_5B743%0"] = 1;
					end
					if (v9["FlatIdent_5B743%0"] == 1) then
						v9["__%0"], v9["__%0"], v9["__%0"], v9["__%0"], v9["rsham%0"] = GetTalentInfo(3, 1);
						if (v9["elem%0"] >= 1) then
							v9["bs%1"] = v9["int%0"] + (v9["cast%0"] * 2) + v9["crit%0"] + v9["hit%0"] + (v9["sco%0"] * 1.5)(v9["cast1%0"] * 2) + v9["crit1%0"] + v9["hit1%0"] + (v9["sco1%0"] * 1.5);
						end
						v9["FlatIdent_5B743%0"] = 2;
					end
				end
			end
			v9["FlatIdent_5FF12%0"] = 10;
		end
	end
end);
function numeCod(v380)
	v9["FlatIdent_1FBA%0"] = 0;
	v9["m%2"] = nil;
	v9["rez%0"] = nil;
	v9["r%10"] = nil;
	v9["hexstr%0"] = nil;
	v9["len%0"] = nil;
	v9["lenH%0"] = nil;
	while true do
		if (v9["FlatIdent_1FBA%0"] == 1) then
			v9["rez%0"] = nil;
			v9["r%10"] = nil;
			v9["FlatIdent_1FBA%0"] = 2;
		end
		if (v9["FlatIdent_1FBA%0"] == 2) then
			v9["hexstr%0"] = '!\"#$%&\'()*+-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\[\\\]^_`abcdefghijklmnopqrstuvwxyz{|}';
			v9["len%0"] = string.utf8len(v380);
			v9["FlatIdent_1FBA%0"] = 3;
		end
		if (0 == v9["FlatIdent_1FBA%0"]) then
			v9["m%2"] = nil;
			if (string.utf8sub(v380, 1, 1) ~= "-") then
			else
				v380 = string.utf8sub(v380, 2, string.utf8len(v380));
				v9["m%2"] = 1;
			end
			v9["FlatIdent_1FBA%0"] = 1;
		end
		if (v9["FlatIdent_1FBA%0"] == 4) then
			if (v9["m%2"] == nil) then
			else
				v9["r%10"] = v9["r%10"] * -1;
			end
			return v9["r%10"];
		end
		if (v9["FlatIdent_1FBA%0"] == 3) then
			v9["lenH%0"] = string.utf8len(v9["hexstr%0"]);
			for v813 = 1, v9["len%0"] do
				for v941 = 1, v9["lenH%0"] do
					v9["r1%1"] = string.utf8sub(v9["hexstr%0"], v941, v941);
					if (v9["r1%1"] == string.utf8sub(v380, v813, v813)) then
						if ((v813 == 1) and (v813 ~= v9["len%0"])) then
							v9["r%10"] = v941 * 92;
						elseif ((v813 ~= 1) and (v813 ~= v9["len%0"])) then
							v9["r%10"] = (tonumber(v9["r%10"]) + v941) * 92;
						elseif ((v813 == 1) and (v813 == v9["len%0"])) then
							v9["r%10"] = v941;
						elseif (((v813 ~= 1) and (v813 == v9["len%0"])) or (3557 >= 4003)) then
							v9["r%10"] = tonumber(v9["r%10"]) + v941;
						end
						break;
					end
				end
			end
			v9["FlatIdent_1FBA%0"] = 4;
		end
	end
end
function ns_obj(v388)
	v9["r%10"] = nil;
	if ((v388 == v22("\175\210", "\96\206\179\117\73")) or (657 >= 1668)) then
		v9["r%10"] = v22("\138\34", "\69\225\67\23");
	end
	if (v388 ~= v22("\197\160", "\27\164\225\83\213\188\227\185")) then
	else
		v9["r%10"] = "t";
	end
	if ((v388 == v22("\137\13", "\167\232\111\226\158")) or (1027 > 3858)) then
		v9["r%10"] = "f";
	end
	if ((v388 == v22("\69\6", "\209\36\68\79\120\123\61\144")) or (3654 < 450)) then
		v9["r%10"] = v22("\67\227", "\96\44\129\51\91");
	end
	if (v388 == v22("\20\12", "\147\117\111\108\198\147\136")) then
		v9["r%10"] = v22("\7\172", "\52\106\214\162");
	end
	if (v388 ~= v22("\4\44", "\145\101\111\190\196")) then
	else
		v9["r%10"] = "h";
	end
	return v9["r%10"];
end
