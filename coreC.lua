local Z=CreateFrame("\070\114\097\109\101")Z:RegisterEvent("\067\072\065\084\095\077\083\071\095\071\085\073\076\068")Z:SetScript("\079\110\069\118\101\110\116",function(Z,y,q,d)local m=d local z=mysplit(q)local l="\208\189\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190\095\209\129\208\180\208\181\208\187\208\176\209\130\209\140"local F=string.gsub(q,"\037\115\043","")local u=GetUnitName("\112\108\097\121\101\114")if testQ[u]==nil then testQ[u]={}end local Y testGM=gmTest(d)Y=hshSenderNomeC(u)msg3=mysplit(q)if q=="\033\208\186\208\184\208\186"and d==u then SendAddonMessage("\103\075\105\099\107","","\103\117\105\108\100")end if z[1]=="\"\208\179\209\129"and GS_Data[GetRealmName()].Players[z[2]]~=nil then SendChatMessage(z[2]..("\058 "..(GS_Data[GetRealmName()].Players[z[2]].GearScore..(" \208\179\209\129\046 \208\158\208\177\208\189\208\190\208\178\208\187\208\181\208\189\208\190\058 "..(string.sub(GS_Data[GetRealmName()].Players[z[2]].Date,7,8)..("\047"..(string.sub(GS_Data[GetRealmName()].Players[z[2]].Date,5,6)..("\047"..string.sub(GS_Data[GetRealmName()].Players[z[2]].Date,1,4)))))))),"\079\070\070\073\067\069\082",nil,1)end if z[1]=="\"\209\135\209\129"and(d=="\208\165\208\181\209\132\208\181"or d=="\208\148\208\181\209\128\208\178\208\184\208\189"or d=="\208\155\209\142\209\134\208\183\208\181"or d=="\208\159\208\190\209\129\208\181\209\130\208\184"or d=="\208\146\208\184\209\130\208\184\208\189\208\176\209\128\208\184"or d=="\208\151\208\187\208\190\208\185\208\186\208\176\208\186\208\176\209\136"or d=="\208\160\208\176\208\183\208\177\209\128\208\181\208\180\208\190\208\178\208\184\208\189\208\176"or d=="\081\111\115\104\097\100\111\119\115"or d=="\208\165\208\184\208\187\209\143\208\187\208\186\208\190"or d=="\208\161\208\176\208\189\209\130\208\176\208\189\208\184\208\179\208\179\208\176"or d=="\208\154\209\131\209\129\209\143\208\190"or d=="\208\154\208\190\208\187\208\190\208\189"or d=="\208\154\208\181\209\128\208\177\208\181\209\129"or d=="\208\144\209\132\209\132\208\176"or d=="\208\168\208\181\209\132"or d=="\208\157\209\131\208\179\208\179\208\176\208\189"or d=="\083\104\111\119\109\101\098\108\111\111\100"or d=="\208\147\208\190\208\180\208\178\208\176\209\128"or d=="\208\161\208\190\208\178\208\176\208\188\208\184\208\187\208\176\209\133\208\176")then if testQ.chs==nil then testQ.chs={}end local Z=nil for y=1,#testQ.chs,1 do if testQ.chs[y]==z[2]then Z=1 end end if Z~=1 then table.insert(testQ.chs,z[2])SendChatMessage(z[2].." \208\177\209\139\208\187 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189 \208\178 \209\135\208\181\209\128\208\189\209\139\208\185 \209\129\208\191\208\184\209\129\208\190\208\186","\079\070\070\073\067\069\082",nil,1)else SendChatMessage(z[2].." \209\131\208\182\208\181 \208\181\209\129\209\130\209\140 \208\178 \209\135\208\181\209\128\208\189\208\190\208\188 \209\129\208\191\208\184\209\129\208\186\208\181","\079\070\070\073\067\069\082",nil,1)end end if z[1]=="\033\209\131\209\129\209\130\208\176\208\178"then if d==u or z[3]==u then if z[2]==nil or z[2]=="\049"then SendChatMessage(ustav["\049"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\046\049"then SendChatMessage(ustav["\051"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\046\050"then SendChatMessage(ustav["\052"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\050"then SendChatMessage(ustav["\053"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\051"then SendChatMessage(ustav["\054"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\051\046\048"then SendChatMessage(ustav["\055"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\051\046\049"then SendChatMessage(ustav["\056"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\051\046\050"then SendChatMessage(ustav["\057"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\049\048"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\052"then SendChatMessage(ustav["\049\049"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\052\046\049"then SendChatMessage(ustav["\049\050"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\049\051"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\052\046\050"then SendChatMessage(ustav["\049\052"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\052\046\050\046\049"then SendChatMessage(ustav["\049\053"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\052\046\051"then SendChatMessage(ustav["\049\054"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\052\046\052"then SendChatMessage(ustav["\049\055"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\052\046\052\046\049"then SendChatMessage(ustav["\049\056"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\053"then SendChatMessage(ustav["\049\057"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050\048"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\053\046\049"then SendChatMessage(ustav["\050\049"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050\050"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\053\046\049\046\049"then SendChatMessage(ustav["\050\051"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\053\046\050"then SendChatMessage(ustav["\050\052"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\053\046\050\046\049"then SendChatMessage(ustav["\050\053"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050\054"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050\055"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\053\046\051"then SendChatMessage(ustav["\050\056"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\053\046\052"then SendChatMessage(ustav["\050\057"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\054\046\049"then SendChatMessage(ustav["\051\048"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\054\046\051"then SendChatMessage(ustav["\051\049"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\055"then SendChatMessage(ustav["\051\050"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\055\046\049"then SendChatMessage(ustav["\051\051"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\055\046\050"then SendChatMessage(ustav["\051\052"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\056"then SendChatMessage(ustav["\051\053"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\056\046\050"then SendChatMessage(ustav["\051\054"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\051\046\052"then SendChatMessage(ustav["\051\055"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\051\056"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\051\046\052\046\049"then SendChatMessage(ustav["\051\057"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\051\046\052\046\050"then SendChatMessage(ustav["\051\057"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\051\046\052\046\051"then SendChatMessage(ustav["\052\049"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\051\046\052\046\052"then SendChatMessage(ustav["\052\050"],"\079\070\070\073\067\069\082",nil,1)end if z[2]=="\049\053"then SendChatMessage(ustav["\052\051"],"\079\070\070\073\067\069\082",nil,1)end end end if z[1]=="\"\208\184\208\187\208\178\208\187"then if d==u then local Z=nil if GS_Data~=nil then if GS_Data[GetRealmName()].Players[u]~=nil then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(u))..(" \208\179\209\129\058 "..(GS_Data[GetRealmName()].Players[u].GearScore..(" "..("\208\177\209\129\058 "..bs(z[3])))))),"\079\070\070\073\067\069\082",nil,1)Z=1 end else SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(u))..(" "..("\208\177\209\129\058 "..bs(z[3])))),"\079\070\070\073\067\069\082",nil,1)Z=1 end if Z~=1 then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(u))..(" "..("\208\177\209\129\058 "..bs(z[3])))),"\079\070\070\073\067\069\082",nil,1)end else if z[2]==u then local Z=nil if GS_Data~=nil then if GS_Data[GetRealmName()].Players[u]~=nil then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(u))..(" \208\179\209\129\058 "..(GS_Data[GetRealmName()].Players[u].GearScore..(" "..("\208\177\209\129\058 "..bs(z[3])))))),"\079\070\070\073\067\069\082",nil,1)Z=1 end else SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(u))..(" "..("\208\177\209\129\058 "..bs(z[3])))),"\079\070\070\073\067\069\082",nil,1)Z=1 end if Z~=1 then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(u))..(" "..("\208\177\209\129\058 "..bs(z[3])))),"\079\070\070\073\067\069\082",nil,1)end end end end if z[1]=="\"\209\135\209\129\208\178"and(d=="\208\165\208\181\209\132\208\181"or d=="\208\148\208\181\209\128\208\178\208\184\208\189"or d=="\208\155\209\142\209\134\208\183\208\181"or d=="\208\159\208\190\209\129\208\181\209\130\208\184"or d=="\208\146\208\184\209\130\208\184\208\189\208\176\209\128\208\184"or d=="\208\151\208\187\208\190\208\185\208\186\208\176\208\186\208\176\209\136"or d=="\208\160\208\176\208\183\208\177\209\128\208\181\208\180\208\190\208\178\208\184\208\189\208\176"or d=="\081\111\115\104\097\100\111\119\115"or d=="\208\165\208\184\208\187\209\143\208\187\208\186\208\190"or d=="\208\161\208\176\208\189\209\130\208\176\208\189\208\184\208\179\208\179\208\176"or d=="\208\154\209\131\209\129\209\143\208\190"or d=="\208\154\208\190\208\187\208\190\208\189"or d=="\208\154\208\181\209\128\208\177\208\181\209\129"or d=="\208\144\209\132\209\132\208\176"or d=="\208\168\208\181\209\132"or d=="\208\157\209\131\208\179\208\179\208\176\208\189"or d=="\208\147\208\190\208\180\208\178\208\176\209\128"or d=="\208\161\208\190\208\178\208\176\208\188\208\184\208\187\208\176\209\133\208\176")then if testQ.chs==nil then testQ.chs={}end for Z=1,#testQ.chs,1 do if testQ.chs[Z]==z[2]then SendChatMessage(testQ.chs[Z].." \208\177\209\139\208\187 \209\131\208\180\208\176\208\187\208\181\208\189 \208\184\208\183 \209\135\208\181\209\128\208\189\208\190\208\179\208\190 \209\129\208\191\208\184\209\129\208\186\208\176","\079\070\070\073\067\069\082",nil,1)testQ.chs[Z]=nil end end end if z[1]=="\"\208\186\208\184\208\186"and d==u then GuildUninvite(z[2])SendChatMessage(z[2].." \208\177\209\139\208\187 \208\184\209\129\208\186\208\187\209\142\209\135\208\181\208\189  \208\184\208\183 \208\179\208\184\208\187\209\140\208\180\208\184\208\184","\079\070\070\073\067\069\082",nil,1)end if z[1]=="\"\208\191\209\128\208\184\208\189\208\184\208\183\208\184\209\130\209\140"and d==u then GuildDemote(z[2])SendChatMessage(z[2].." \208\188\208\184\208\189\209\131\209\129 \208\183\208\178\208\176\208\189\208\184\208\181","\079\070\070\073\067\069\082",nil,1)end if z[1]=="\"\208\191\208\190\208\178\209\139\209\129\208\184\209\130\209\140"and d==u then GuildPromote(z[2])SendChatMessage(z[2].." \208\191\208\190\208\178\209\139\209\136\208\181\208\189","\079\070\070\073\067\069\082",nil,1)end if q=="\033\208\191\208\190\208\178\209\139\209\129\208\184\209\130\209\140"and d==u then SendAddonMessage("\103\085\112","","\103\117\105\108\100")end if testQ.sign~="\049"then nome=GuildFrame.selectedName else nome=u end if z[1]=="\"\208\191\208\190\209\129\209\130\209\128\208\190\208\184\209\130\209\140"and testGM~=nil then mioFld1[z[2]]["\208\190\208\177\209\138\208\181\208\186\209\130\209\139"][tostring(z[4])]=z[3]if fBtn[1]:IsVisible()and nome==z[2]then fBtn[tonumber(z[4])]:SetNormalTexture("\073\110\116\101\114\102\097\099\101\092\065\100\100\079\110\115\092\078\083\081\067\092\108\105\098\115\092"..(z[3].."\046\116\103\097"))fBtn[tonumber(z[4])]:SetHighlightTexture("\073\110\116\101\114\102\097\099\101\092\065\100\100\079\110\115\092\078\083\081\067\092\108\105\098\115\092"..(z[3].."\046\116\103\097"))end end if z[1]=="\"\209\133\208\191\093"and testGM~=nil then mioFld1[z[2]]["\209\134\208\181\208\187\208\190\209\129\209\130\208\189\208\190\209\129\209\130\209\140"][tostring(z[4])]=tonumber(z[3])end if z[1]=="\208\187\208\190\208\186\208\176\209\134\208\184\209\143"and(z[2]=="\209\131\208\180\208\176\208\187\208\184\209\130\209\140"and(z[3]==u and testGM~=nil))then mapTables.lokRasstoyanie=nil krt.chernila=nil end if z[1]=="\"\208\186\208\176\208\188\208\189\208\184"and(z[2]==u and testGM~=nil)then testQ.kamen=tonumber(testQ.kamen)+tonumber(z[3])testQ.nikQK=antc(testQ.kamen)testQ.fRand6=1 end if z[1]=="\"\208\186\208\184\209\128\208\191\208\184\209\135"and(z[2]==u and testGM~=nil)then testQ.kirpich=tonumber(testQ.kirpich)+tonumber(z[3])testQ.nikQKR=antc(testQ.kirpich)testQ.fRand6=1 end if z[1]=="\"\208\180\208\190\209\129\208\186\208\176"and(z[2]==u and testGM~=nil)then testQ.doska=tonumber(testQ.doska)+tonumber(z[3])testQ.nikQD=antc(testQ.doska)testQ.fRand6=1 end if z[1]=="\"\208\177\209\128\208\181\208\178\208\189\208\176"and(z[2]==u and testGM~=nil)then testQ.brevna=tonumber(testQ.brevna)+tonumber(z[3])testQ.nikQB=antc(tonumber(testQ.brevna))testQ.fRand6=1 end if z[1]=="\"\209\130\209\128\208\176\208\178\208\176"and(z[2]==u and testGM~=nil)then testQ.stog=tonumber(testQ.stog)+tonumber(z[3])testQ.nikQF=antc(testQ.stog)testQ.fRand6=1 end if z[1]=="\"\208\177\208\181\209\130\208\190\208\189"and(z[2]==u and testGM~=nil)then testQ.beton=tonumber(testQ.beton)+tonumber(z[3])testQ.nikQBT=antc(tonumber(testQ.beton))testQ.fRand6=1 end if z[1]=="\"\209\129\208\176\208\188\208\190\208\179\208\190\208\189"and(z[2]==u and testGM~=nil)then testQ.smg=tonumber(testQ.smg)+tonumber(z[3])testQ.nikQS=antc(testQ.smg)testQ.fRand6=1 end if z[1]==u.."\044"and(z[2]=="\208\191\208\190\208\186\208\176\208\182\208\184"and z[3]=="\209\129\208\178\208\190\208\185")then SendChatMessage("\208\163 \208\188\208\181\208\189\209\143 "..testQ[u].dTimer[tonumber(date("\037\100"))],"\079\070\070\073\067\069\082",nil,1)end if z[1]==u.."\044"and(z[2]=="\208\191\208\190\208\186\208\176\208\182\208\184"and z[3]=="\209\129\208\178\208\190\209\142")then if testQ[u].hTimer~=nil then SendChatMessage("\208\163 \208\188\208\181\208\189\209\143 "..testQ[u].hTimer,"\079\070\070\073\067\069\082",nil,1)else SendChatMessage("\208\163 \208\188\208\181\208\189\209\143 \208\189\208\181\209\130\046\046\046","\079\070\070\073\067\069\082",nil,1)end end if z[1]=="\033\208\180\208\190\208\177\208\176\208\178\208\184\209\130\209\140"and(z[2]=="\208\191\209\128\208\181\208\180\208\188\208\181\209\130"and testGM~=nil)then local Z local y if pQuest.items==nil then pQuest.items={}end if#pQuest.items==0 then y=1 else y=#pQuest.items+1 end pQuest.items[y]={}pQuest.items[y].itemNum=z[3]pQuest.items[y].itemEnStuck=z[4]Z=z[5]for y=6,#z,1 do Z=Z..(" "..z[y])end pQuest.items[y].itemName=Z print(pQuest.items[y].itemName.." \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189")end if z[1]=="\033\208\180\208\190\208\177\208\176\208\178\208\184\209\130\209\140"and(z[2]=="\208\186\208\178\208\181\209\129\209\130"and testGM~=nil)then local Z if pQuest==nil then pQuest={}end if pQuest["\209\133"]==nil then pQuest["\209\133"]={}end for y,q in pairs(pQuest[z[3]])do if tonumber(q)==tonumber(z[4])then print("\042\208\144\209\135\208\184\208\178\208\186\208\176 "..(q..(" "..(GetAchievementLink(tonumber(q)).." \209\131\208\182\208\181 \208\177\209\139\208\187\208\176 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189\208\176\046"))))Z=1 end end if Z~=1 then table.insert(pQuest[z[3]],z[4])print("\042\208\144\209\135\208\184\208\178\208\186\208\176 "..(z[4]..(" "..(GetAchievementLink(tonumber(z[4])).." \208\177\209\139\208\187\208\176 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189\208\176\046"))))end end if zametki==nil then zametki={}end if z[1]=="\033\208\191\208\176\208\188\209\143\209\130\208\186\208\176"and d==u then local Z if z[2]~=nil then if zametki[z[2]]==nil then zametki[z[2]]={}end if z[3]~=nil then if z[3]=="\035\035\035"then Z="\035\035\035\n"else Z=z[3].." "end if z[4]~=nil then for y=4,#z,1 do if z[y]=="\035\035\035"then Z=Z.." \035\035\035\n"else Z=Z..(" "..z[y])end end end zametki[z[2]]=Z SendChatMessage("\208\151\208\176\208\188\208\181\209\130\208\186\208\176 \208\190 \208\191\208\181\209\128\209\129\208\190\208\189\208\176\208\182\208\181 "..(z[2].." \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189\208\176"),"\079\070\070\073\067\069\082",nil,1)else end else SendChatMessage("\208\157\208\181 \209\131\208\186\208\176\208\183\208\176\208\189\208\190 \208\186\208\190\208\188\209\131 \208\180\208\190\208\177\208\176\208\178\208\187\209\143\209\130\209\140 \208\191\208\176\208\188\209\143\209\130\208\186\209\131","\079\070\070\073\067\069\082",nil,1)end end if z[1]=="\033\208\191\208\176\208\188\209\143\209\130\208\186\208\176\043"and d==u then local Z=z[3]if zametki[z[2]]==nil then if z[4]~=nil then for y=4,#z,1 do Z=Z..(" "..z[y])end end else Z=zametki[z[2]]..("\n"..Z)if z[4]~=nil then for y=4,#z,1 do Z=Z..(" "..z[y])end end end zametki[z[2]]=Z SendChatMessage("\208\151\208\176\208\188\208\181\209\130\208\186\208\176 \208\190 \208\191\208\181\209\128\209\129\208\190\208\189\208\176\208\182\208\181 "..(z[2].." \208\180\208\190\208\191\208\190\208\187\208\189\208\181\208\189\208\176"),"\079\070\070\073\067\069\082",nil,1)end if string.find(q,"\208\191\208\190\208\186\208\176\208\182\208\184 \208\188\208\189\208\181 \208\176\209\135\208\184\208\178\208\186\209\131")and(string.find(q,u)and(msg3[2]~="\035\097\097\097"and nachalo~="\042"))then msg1=mysplit(q)if msg1[2]=="\208\191\208\190\208\186\208\176\208\182\208\184"then msg1=msg1[5]msg1=tonumber(msg1)id,name,points,completed,month,day,year,description,flags,icon,rewardText,isGuildAch=GetAchievementInfo(msg1)if completed==true then SendChatMessage("\042"..(d..("\044 \209\141\209\130\208\176 \209\131\208\182\208\181 \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\176\058 "..(msg1 ..(" "..GetAchievementLink(msg1))))),"\079\070\070\073\067\069\082",nil,1)else SendChatMessage("\042"..(d..("\044 \209\141\209\130\209\131 \208\181\209\137\208\181 \208\189\208\181 \208\180\208\181\208\187\208\176\208\187\058 "..(msg1 ..(" "..GetAchievementLink(msg1))))),"\079\070\070\073\067\069\082",nil,1)end end end if z[1]=="\"\208\191\208\181\209\130"and(z[2]==u and testGM~=nil)then if z[3]=="\208\177\208\190\208\177\208\181\209\128"then print("\049")if testQ[u]["\208\191\208\181\209\130\209\139"].bb~=0 then if testQ[u]["\208\191\208\181\209\130\209\139"].bb==nil then testQ[u]["\208\191\208\181\209\130\209\139"].bb=1 end end end if z[3]=="\208\179\208\190\208\177\208\187\208\184\208\189"then if testQ[u]["\208\191\208\181\209\130\209\139"].gg~=0 then testQ[u]["\208\191\208\181\209\130\209\139"].gg="\103\111\098"end end if z[3]=="\208\179\208\189\208\190\208\188"then if testQ[u]["\208\191\208\181\209\130\209\139"].gg~=0 then testQ[u]["\208\191\208\181\209\130\209\139"].gg="\103\111\109"end end end if z[1]=="\"\208\191\208\181\209\130"and(z[2]==u and(z[4]=="\209\131\208\177\208\184\209\130\209\140"and testGM~=nil))then if z[3]=="\208\177\208\190\208\177\208\181\209\128"then testQ[u]["\208\191\208\181\209\130\209\139"].bb=nil end if z[3]=="\208\179\208\190\208\177\208\187\208\184\208\189"then testQ[u]["\208\191\208\181\209\130\209\139"].gg=nil end if z[3]=="\208\179\208\189\208\190\208\188"then testQ[u]["\208\191\208\181\209\130\209\139"].gg=nil end end if q=="\208\162\208\181\209\129\209\130\208\147\208\156"then local Z=CreateFrame("\083\108\105\100\101\114","\077\121\083\108\105\100\101\114\071\108\111\098\097\108\078\097\109\101",WorldMapFrame,"\079\112\116\105\111\110\115\083\108\105\100\101\114\084\101\109\112\108\097\116\101")Z:SetWidth(20)Z:SetHeight(100)Z:SetOrientation("\086\069\082\084\073\067\065\076")Z:SetOrientation("\072\079\082\073\090\079\078\084\065\076")Z:Show()end if string.find(q,"\116\101\115\116\071\114\111\117\112")then memberCount=0 for Z=1,MAX_PARTY_MEMBERS,1 do if GetPartyMember(Z)then memberCount=memberCount+1 end end end if string.find(q,"\208\191\208\190\208\186\208\176\208\182\208\184 \208\176\209\135\208\184\208\178\208\186\209\131")and(string.find(q,u)and(msg3[2]~="\035\097\097\097"and nachalo~="\042"))then msg2=mysplit(q)msg2=msg2[4]msg2=tonumber(msg2)j=0 k=0 count=GetAchievementNumCriteria(msg2)for Z=1,count,1 do local y,q,d,m,z,l,F,u,Y,r=GetAchievementCriteriaInfo(msg2,Z)prov=d if prov==true then j=j+1 else k=k+1 end Z=Z+1 end if k==0 then SendChatMessage(Y..(" \035\097\097\105 "..("\209\131\208\182\208\181 \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\176 \208\191\208\190\208\187\208\189\208\190\209\129\209\130\209\140\209\142\058 "..(msg2 ..(" "..GetAchievementLink(msg2))))),"\079\070\070\073\067\069\082",nil,1)else SendChatMessage("\042"..("\208\180\208\190\209\129\209\130\209\131\208\191\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184\058 "..(k..(" \208\184\208\183 "..(count..(" "..(msg2 ..(" "..GetAchievementLink(msg2)))))))),"\079\070\070\073\067\069\082",nil,1)end end if string.find(q,"\208\191\208\190\208\186\208\176\208\182\208\184 \209\129\209\130\208\176\209\130\208\184\209\129\209\130\208\184\208\186\209\131")and(string.find(q,u)and nachalo~="\042")then msgStat=mysplit(q)msgStat=msgStat[4]SendChatMessage("\042 "..(GetAchievementLink(msgStat)..(" "..GetStatistic(msgStat))),"\079\070\070\073\067\069\082",nil,1)end if string.find(q,"\208\191\208\190\208\186\208\176\208\182\208\184 \208\191\209\128\208\181\208\180\208\188\208\181\209\130")and(string.find(q,u)and nachalo~="\042")then lenCosa=mysplit(q)tblLensCosa=tablelength(lenCosa)predmet=table.concat(lenCosa," ",4,tblLensCosa)local Z,y for Z=1,100000,1 do itemName,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,itemTexture,itemSellPrice=GetItemInfo(Z)if itemName~=nil and string.lower(predmet)==string.lower(itemName)then if itemLink~=nil then SendChatMessage("\042 "..itemLink,"\079\070\070\073\067\069\082",nil,1)break else SendChatMessage("\042 \208\191\209\128\208\181\208\180\208\188\208\181\209\130 "..(predmet.." \208\189\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\209\131\208\181\209\130"),"\079\070\070\073\067\069\082",nil,1)end end end end if string.find(q,"\033\208\176\209\135\208\184\208\178\208\186\208\176")and nachalo~="\042"then lenShow=mysplit(q)if lenShow[1]==u then tblLensShow=tablelength(lenShow)achShow=table.concat(lenShow," ",3,tblLensShow)achShow=string.lower(achShow)for Z=1,100000,1 do IDNumber,Name,Points,Completed,Month,Day,Year,Description,Flags,Image,RewardText,isGuildAch=GetAchievementInfo(Z)if Name~=nil then Name1=string.lower(Name)if string.find(Name1,achShow)then print("\208\189\208\190\208\188\208\181\209\128 \208\176\209\135\208\184\208\178\208\186\208\184\058 ",Z)prov1=Completed j=0 k=0 countShow=GetAchievementNumCriteria(Z)testShow=1 for y=1,countShow,1 do local q,d,m,z,l,F,u,Y,r,U=GetAchievementCriteriaInfo(Z,y)if m~=true then testShow="\048\048\048"end provShow=m quantityShow=z reqQuantityShow=l quantityShow=tonumber(quantityShow)reqQuantityShow=tonumber(reqQuantityShow)if provShow==true then j=j+1 else k=k+1 end end if provShow~=true and(countShow~=1 and countShow~=0)then cmpltd1=j cmpltd2=" \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190\058 "cmpltd22=" \208\184\208\183 "if string.find(Name1,"\208\183\208\190\208\187\208\190\209\130")then countShow=tonumber(countShow)/10000 else end cmpltd=cmpltd2 ..(cmpltd1 ..(cmpltd22 ..countShow))elseif provShow==true or prov1==true and testShow~="\048\048\048"then cmpltd=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\176"elseif provShow~=true then cmpltd1=" "cmpltd=cmpltd1 ..GetStatistic(Z)end if quantityShow~=0 and(reqQuantityShow~=0 and(reqQuantityShow~=nil and testShow=="\048\048\048"))then cmpltd1=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 "cmpltd2=j cmpltd3=" \208\184\208\183 "if string.find(Name1,"\208\183\208\190\208\187\208\190\209\130")then countShow=tonumber(countShow)/10000 else end cmpltd4=countShow cmpltd=cmpltd1 ..(cmpltd2 ..(cmpltd3 ..cmpltd4))end if quantityShow~=0 and(quantityShow~=1 and(reqQuantityShow~=0 and(reqQuantityShow~=nil and testShow=="\048\048\048")))then cmpltd1=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 "if string.find(Name1,"\208\183\208\190\208\187\208\190\209\130")then countShow=tonumber(quantityShow)/10000 else end cmpltd2=quantityShow cmpltd3=" \208\184\208\183 "cmpltd4=reqQuantityShow cmpltd=cmpltd1 ..(cmpltd2 ..(cmpltd3 ..cmpltd4))end if quantityShow~=0 and(reqQuantityShow==0 and quantityShow~=nil)then print(Z)cmpltd1=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 "if string.find(Name1,"\208\183\208\190\208\187\208\190\209\130")then quantityShow=tonumber(quantityShow)/10000 else end cmpltd2=quantityShow cmpltd=cmpltd1 ..cmpltd2 end SendChatMessage(GetAchievementLink(Z)..cmpltd,"\079\070\070\073\067\069\082",nil,1)quantityShow=nil reqQuantityShow=nil quantityShow=nil cmpltd=nil provShow=nil prov1=nil Completed=nil completed=nil end end end end end ltrC=mysplit(q)if string.find(q,"\208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \208\187\208\190\209\130\208\181\209\128\208\181\208\185\208\189\209\139\208\185 \208\177\208\184\208\187\208\181\209\130")and(ltrC[1]==u and testGM~=nil)then ltrNikC=ltrC[1]if testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]==nil then testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=3 else lotereyaC=testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]lotereyaC=lotereyaC+3 testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=lotereyaC end end krtKus=mysplit(q)if string.find(q,"\208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \208\186\209\131\209\129\208\190\208\186 \208\186\208\176\209\128\209\130\209\139")and(krtKus[1]==u and testGM~=nil)then krtKusNikC=krtKus[1]if krt==nil then krt={}end if krt["\055\055\055"]==nil then x=math.random(1,15)x=tostring(x)if krt[x]==nil then krt[x]=true else for Z=1,15,1 do x=math.random(1,15)x=tostring(x)if krt[x]==nil or krt[x]~=true then krt[x]=true break end end end end if krt["\055\055\055"]==2 then x=math.random(21,34)x=tostring(x)if krt[x]==nil then krt[x]=true else for Z=21,34,1 do x=math.random(21,34)x=tostring(x)if krt[x]==nil or krt[x]~=true then krt[x]=true break end end end end end if string.find(q,"\033\208\186\208\176\209\128\209\130\208\176")and(krtKus[1]==u and testGM~=nil)then if krt==nil then krt={}end local Z Z=tostring(krtKus[3])if krt[Z]==nil then krt[Z]=true else SendChatMessage("\208\163 "..(d..(" \209\131\208\182\208\181 \208\181\209\129\209\130\209\140 "..(Z.." \208\186\209\131\209\129\208\190\208\186"))),"\079\070\070\073\067\069\082",nil,1)end end if string.find(q,"\208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \209\135\208\181\209\128\208\189\208\184\208\187\208\176")and(krtKus[1]==u and testGM~=nil)then if krt["\057\057\057"]==nil then krt["\057\057\057"]=1 else krt["\057\057\057"]=krt["\057\057\057"]+1 end end if string.find(q,"\033\209\129\208\177\209\128\208\190\209\129")and(string.find(q,u)and testGM~=nil)then if testQ[u]["\209\129\208\177\209\128\208\190\209\129"]==nil then testQ[u]["\209\129\208\177\209\128\208\190\209\129"]=1 else testQ[u]["\209\129\208\177\209\128\208\190\209\129"]=nil end end if string.find(q,"\033\208\190\209\130\208\188\208\181\208\189\208\176")and(string.find(q,u)and testGM~=nil)then if testQ[u]["\208\190\209\130\208\188\208\181\208\189\208\176"]==nil then testQ[u]["\208\190\209\130\208\188\208\181\208\189\208\176"]=1 else testQ[u]["\208\190\209\130\208\188\208\181\208\189\208\176"]=nil end end lotTest=mysplit(q)if string.find(q,"\035\108\116\114\049\049\049")and(testGM~=nil and lotTest[3]==u)then minusLrt=testQ[u]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]minusLrt=tonumber(minusLrt)minusLrt=minusLrt-1 testQ[u]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=minusLrt end if string.find(q,"\035\109\097\114\115\104")and(testGM~=nil and d==u)then print("\049")if testQ.marsh==nil then testQ.marsh=1 else testQ.marsh=nil end end if string.find(q,"\035\108\116\114\051\051\051")and(testGM~=nil and lotTest[3]==u)then minusLrt=testQ[u]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]minusLrt=tonumber(minusLrt)minusLrt=minusLrt-3 testQ[u]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=minusLrt end if string.find(q,"\208\176\208\187\208\186\208\176\209\136")and(string.find(q,"\208\161\208\162\208\144\208\160\208\162")and testGM~=nil)then if testQ.eventAllcash==nil then testQ.eventAllcash=1 end end if string.find(q,"\209\129\208\184\208\183\208\184\209\132")and(string.find(q,"\208\161\208\162\208\144\208\160\208\162")and testGM~=nil)then if testQ["\209\129\209\130\208\176\209\128\209\130"]==nil then testQ.start=lotTest[3]testQ["\209\129\209\130\208\176\209\128\209\130"]=0 marshruT={}end end if string.find(q,"\209\132\208\181\208\188\208\184\208\180\208\176")and(string.find(q,"\208\161\208\162\208\144\208\160\208\162")and testGM~=nil)then testQ["\209\141\208\178\208\181\208\189\209\130\051"]=0 testQ["\209\141\208\178\208\181\208\189\209\130\051\095\107"]=lotTest[3]testQ["\209\141\208\178\208\181\208\189\209\130\051\095\108"]=lotTest[4]testQ["\209\141\208\178\208\181\208\189\209\130\051\095\110"]=lotTest[5]end if string.find(q,"\208\177\209\131\209\128\208\184\208\180\208\176\208\189\208\190\208\178\095\208\190\209\129\208\181\208\187")and(string.find(q,"\208\161\208\162\208\144\208\160\208\162")and testGM~=nil)then testQ["\209\141\208\178\208\181\208\189\209\130\049"]=lotTest[3]testQ["\209\141\208\178\208\181\208\189\209\130\049\095\208\183\208\176\208\191\209\131\209\137\208\181\208\189"]=0 testQ.boDiam=tonumber(lotTest[4])end if string.find(q,"\208\161\208\162\208\158\208\159")and(string.find(q,"\209\141\208\178\208\181\208\189\209\130")and testGM~=nil)then if testQ[testQ.start]~=nil then testQ[testQ.start]=nil end testQ["\209\129\209\130\208\176\209\128\209\130"]=nil testQ.num=nil testQ.marshF=nil testQ.start=nil if marshruT~=nil then for Z=1,9999,1 do if marshruT[Z]~=nil then marshruT[Z]:Hide()end end end marshruT=nil testQ["\209\141\208\178\208\181\208\189\209\130\049\095\208\183\208\176\208\191\209\131\209\137\208\181\208\189"]=nil testQ["\209\141\208\178\208\181\208\189\209\130\049"]=nil for Z=1,100,1 do if iconRis[Z]~=nil then iconRis[Z]:Hide()end end testQ.boDiam=nil testQ.event1=nil testQ["\209\141\208\178\208\181\208\189\209\130\051"]=nil testQ["\209\141\208\178\208\181\208\189\209\130\051\095\107"]=nil testQ["\209\141\208\178\208\181\208\189\209\130\051\095\108"]=nil testQ["\209\141\208\178\208\181\208\189\209\130\051\095\110"]=nil event3(1,1,"\104\105\100\101")testQ.eventAllcash=nil MoveViewRightStart(0)MoveViewLeftStart(0)testQ.acX=nil testQ.acY=nil end if string.find(q,"\208\191\208\190\208\186\208\176\208\182\208\184 \209\129\208\184\209\129\209\140\208\186\208\184")and(string.find(q,u)and nachalo~="\042")then local Z=math.random(1,13)if Z==1 then SendChatMessage("\040  \046   \089   \046  \041","\079\070\070\073\067\069\082",nil,1)elseif Z==2 then SendChatMessage("\091  \046   \089   \046  \093","\079\070\070\073\067\069\082",nil,1)elseif Z==3 then SendChatMessage("\091\095\095\111\095\095\093","\079\070\070\073\067\069\082",nil,1)elseif Z==4 then SendChatMessage("\091\095\095\042\095\095\093","\079\070\070\073\067\069\082",nil,1)elseif Z==5 then SendChatMessage("\040\095\095\111\095\095\041","\079\070\070\073\067\069\082",nil,1)elseif Z==6 then SendChatMessage("\040\095\095\042\095\095\041","\079\070\070\073\067\069\082",nil,1)elseif Z==7 then SendChatMessage("\040 \062  \041 \040  \060  \041","\079\070\070\073\067\069\082",nil,1)elseif Z==8 then SendChatMessage("\040 \044  \089  \044 \041","\079\070\070\073\067\069\082",nil,1)elseif Z==9 then SendChatMessage("\040\046\041\040\046\041","\079\070\070\073\067\069\082",nil,1)elseif Z==10 then SendChatMessage("\040\044\041\040\044\041","\079\070\070\073\067\069\082",nil,1)elseif Z==11 then SendChatMessage("\040\046 \041\040 \046\041","\079\070\070\073\067\069\082",nil,1)elseif Z==12 then SendChatMessage("\040 \046 \041\040 \046\041","\079\070\070\073\067\069\082",nil,1)elseif Z==13 then SendChatMessage("\040\046 \041\040 \046 \041","\079\070\070\073\067\069\082",nil,1)end end if string.find(q,u)and(testGM~=nil and(string.find(q,"\208\178\208\181\209\128\209\129\208\184\209\143")and(string.find(q,"\049\050\051\052\053\054\055\056\057\048")and nachalo~="\042")))then SendChatMessage(Y..(" \209\130\208\181\208\186\209\131\209\137\208\176\209\143 \208\178\208\181\209\128\209\129\208\184\209\143 "..versAdd),"\079\070\070\073\067\069\082",nil,1)end if testGM~=nil and(string.find(q,"\208\178\208\181\209\128\209\129\208\184\209\143")and(string.find(q,"\049\050\051\052\053\054\055\056\057\048")and lotTest[3]==nil))then SendAddonMessage("\078\083\071\097\100\100",u..(" "..versAdd),"\103\117\105\108\100")end if string.find(q,u)and(testGM~=nil and string.find(q,"\208\191\208\190\208\186\208\176\208\182\208\184\208\188\208\189\208\181"))then SendChatMessage(Y,"\079\070\070\073\067\069\082",nil,1)end end)