local Z=CreateFrame("\070\114\097\109\101")Z:RegisterEvent("\067\072\065\084\095\077\083\071\095\071\085\073\076\068")Z:SetScript("\079\110\069\118\101\110\116",function(Z,q,e,F)local G=F local A=mysplit(e)local g="\208\189\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190\095\209\129\208\180\208\181\208\187\208\176\209\130\209\140"local B=string.gsub(e,"\037\115\043","")local s=GetUnitName("\112\108\097\121\101\114")if testQ[s]==nil then testQ[s]={}end local N testGM=gmTest(F)N=hshSenderNomeC(s)msg3=mysplit(e)if e=="\033\208\186\208\184\208\186"and F==s then SendAddonMessage("\103\075\105\099\107","","\103\117\105\108\100")end if A[1]=="\"\209\135\209\129"and(F=="\208\165\208\181\209\132\208\181"or F=="\208\148\208\181\209\128\208\178\208\184\208\189"or F=="\208\155\209\142\209\134\208\183\208\181"or F=="\208\159\208\190\209\129\208\181\209\130\208\184"or F=="\208\146\208\184\209\130\208\184\208\189\208\176\209\128\208\184"or F=="\208\151\208\187\208\190\208\185\208\186\208\176\208\186\208\176\209\136"or F=="\208\160\208\176\208\183\208\177\209\128\208\181\208\180\208\190\208\178\208\184\208\189\208\176"or F=="\081\111\115\104\097\100\111\119\115"or F=="\208\165\208\184\208\187\209\143\208\187\208\186\208\190"or F=="\208\161\208\176\208\189\209\130\208\176\208\189\208\184\208\179\208\179\208\176"or F=="\208\154\209\131\209\129\209\143\208\190"or F=="\208\154\208\190\208\187\208\190\208\189"or F=="\208\154\208\181\209\128\208\177\208\181\209\129"or F=="\208\144\209\132\209\132\208\176"or F=="\208\156\208\176\208\183\208\180\208\176\208\188"or F=="\208\157\209\131\208\179\208\179\208\176\208\189"or F=="\077\097\103\105\116\114\111\110"or F=="\083\104\111\119\109\101\098\108\111\111\100"or F=="\083\104\111\119\109\101\102\101\097\114")then if testQ.chs==nil then testQ.chs={}end local Z=nil for q=1,#testQ.chs,1 do if testQ.chs[q]==A[2]then Z=1 end end if Z~=1 then local Z=0 while true do if Z==0 then table.insert(testQ.chs,A[2])SendChatMessage(A[2].." \208\177\209\139\208\187 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189 \208\178 \209\135\208\181\209\128\208\189\209\139\208\185 \209\129\208\191\208\184\209\129\208\190\208\186","\079\070\070\073\067\069\082",nil,1)break end end else SendChatMessage(A[2].." \209\131\208\182\208\181 \208\181\209\129\209\130\209\140 \208\178 \209\135\208\181\209\128\208\189\208\190\208\188 \209\129\208\191\208\184\209\129\208\186\208\181","\079\070\070\073\067\069\082",nil,1)end end if A[1]=="\033\209\131\209\129\209\130\208\176\208\178"then if F==s or A[3]==s then local Z=0 while true do if Z==0 then if A[2]==nil or A[2]=="\049"then local Z=0 while true do if Z==0 then SendChatMessage(ustav["\049"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050"],"\079\070\070\073\067\069\082",nil,1)break end end end if A[2]=="\050"then SendChatMessage(ustav["\051"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\051"then SendChatMessage(ustav["\052"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\052"then SendChatMessage(ustav["\053"],"\079\070\070\073\067\069\082",nil,1)end Z=1 end if Z==6 then if A[2]=="\050\053"then SendChatMessage(ustav["\051\050"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\050\054"then SendChatMessage(ustav["\051\051"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\050\055"then SendChatMessage(ustav["\051\052"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\050\056"then SendChatMessage(ustav["\051\053"],"\079\070\070\073\067\069\082",nil,1)end Z=7 end if Z==1 then if A[2]=="\053"then SendChatMessage(ustav["\054"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\054"then SendChatMessage(ustav["\055"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\055"then SendChatMessage(ustav["\056"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\056"then local Z=0 while true do if Z==0 then SendChatMessage(ustav["\057"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\049\048"],"\079\070\070\073\067\069\082",nil,1)break end end end Z=2 end if Z==5 then if A[2]=="\050\049"then SendChatMessage(ustav["\050\056"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\050\050"then SendChatMessage(ustav["\050\057"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\050\051"then SendChatMessage(ustav["\051\048"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\050\052"then SendChatMessage(ustav["\051\049"],"\079\070\070\073\067\069\082",nil,1)end Z=6 end if Z==4 then if A[2]=="\049\055"then SendChatMessage(ustav["\050\049"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050\050"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\049\056"then SendChatMessage(ustav["\050\051"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\049\057"then SendChatMessage(ustav["\050\052"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\050\048"then local Z=0 while true do if Z==0 then SendChatMessage(ustav["\050\053"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050\054"],"\079\070\070\073\067\069\082",nil,1)Z=1 end if 1==Z then SendChatMessage(ustav["\050\055"],"\079\070\070\073\067\069\082",nil,1)break end end end Z=5 end if Z==3 then if A[2]=="\049\051"then SendChatMessage(ustav["\049\054"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\049\052"then SendChatMessage(ustav["\049\055"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\049\053"then SendChatMessage(ustav["\049\056"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\049\054"then local Z=0 while true do if Z==0 then SendChatMessage(ustav["\049\057"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\050\048"],"\079\070\070\073\067\069\082",nil,1)break end end end Z=4 end if Z==2 then if A[2]=="\057"then SendChatMessage(ustav["\049\049"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\049\048"then local Z=0 while true do if Z==0 then SendChatMessage(ustav["\049\050"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\049\051"],"\079\070\070\073\067\069\082",nil,1)break end end end if A[2]=="\049\049"then SendChatMessage(ustav["\049\052"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\049\050"then SendChatMessage(ustav["\049\053"],"\079\070\070\073\067\069\082",nil,1)end Z=3 end if 8==Z then if A[2]=="\051\051"then SendChatMessage(ustav["\052\049"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\051\052"then SendChatMessage(ustav["\052\050"],"\079\070\070\073\067\069\082",nil,1)end break end if Z==7 then if A[2]=="\050\057"then SendChatMessage(ustav["\051\054"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\051\048"then local Z=0 while true do if Z==0 then SendChatMessage(ustav["\051\055"],"\079\070\070\073\067\069\082",nil,1)SendChatMessage(ustav["\051\056"],"\079\070\070\073\067\069\082",nil,1)break end end end if A[2]=="\051\049"then SendChatMessage(ustav["\051\057"],"\079\070\070\073\067\069\082",nil,1)end if A[2]=="\051\050"then SendChatMessage(ustav["\051\057"],"\079\070\070\073\067\069\082",nil,1)end Z=8 end end end end if A[1]=="\"\208\184\208\187\208\178\208\187"then if F==s then local Z=0 local q while true do if Z==0 then q=nil if GS_Data~=nil then if GS_Data[GetRealmName()].Players[s]~=nil then local Z=0 while true do if Z==0 then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(s))..(" \208\179\209\129\058 "..(GS_Data[GetRealmName()].Players[s].GearScore..(" "..("\208\177\209\129\058 "..bs()))))),"\079\070\070\073\067\069\082",nil,1)q=1 break end end end else local Z=0 while true do if Z==0 then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(s))..(" "..("\208\177\209\129\058 "..bs()))),"\079\070\070\073\067\069\082",nil,1)q=1 break end end end Z=1 end if 1==Z then if q~=1 then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(s))..(" "..("\208\177\209\129\058 "..bs()))),"\079\070\070\073\067\069\082",nil,1)end break end end elseif A[2]==s then local Z=0 local q while true do if Z==1 then if q~=1 then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(s))..(" "..("\208\177\209\129\058 "..bs()))),"\079\070\070\073\067\069\082",nil,1)end break end if Z==0 then q=nil if GS_Data~=nil then if GS_Data[GetRealmName()].Players[s]~=nil then local Z=0 while true do if 0==Z then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(s))..(" \208\179\209\129\058 "..(GS_Data[GetRealmName()].Players[s].GearScore..(" "..("\208\177\209\129\058 "..bs()))))),"\079\070\070\073\067\069\082",nil,1)q=1 break end end end else local Z=0 while true do if Z==0 then SendChatMessage("\208\156\208\190\208\185 \208\184\208\187\208\178\208\187\058 "..(string.format("\037\100",CalculateAverageItemLevel(s))..(" "..("\208\177\209\129\058 "..bs()))),"\079\070\070\073\067\069\082",nil,1)q=1 break end end end Z=1 end end end end if A[1]=="\"\209\135\209\129\208\178"and(F=="\208\165\208\181\209\132\208\181"or F=="\208\148\208\181\209\128\208\178\208\184\208\189"or F=="\208\155\209\142\209\134\208\183\208\181"or F=="\208\159\208\190\209\129\208\181\209\130\208\184"or F=="\208\146\208\184\209\130\208\184\208\189\208\176\209\128\208\184"or F=="\208\151\208\187\208\190\208\185\208\186\208\176\208\186\208\176\209\136"or F=="\208\160\208\176\208\183\208\177\209\128\208\181\208\180\208\190\208\178\208\184\208\189\208\176"or F=="\081\111\115\104\097\100\111\119\115"or F=="\208\165\208\184\208\187\209\143\208\187\208\186\208\190"or F=="\208\161\208\176\208\189\209\130\208\176\208\189\208\184\208\179\208\179\208\176"or F=="\208\154\209\131\209\129\209\143\208\190"or F=="\208\154\208\190\208\187\208\190\208\189"or F=="\208\154\208\181\209\128\208\177\208\181\209\129"or F=="\208\144\209\132\209\132\208\176"or F=="\208\156\208\176\208\183\208\180\208\176\208\188"or F=="\208\157\209\131\208\179\208\179\208\176\208\189")then local Z=0 while true do if Z==0 then if testQ.chs==nil then testQ.chs={}end for Z=1,#testQ.chs,1 do if testQ.chs[Z]==A[2]then SendChatMessage(testQ.chs[Z].." \208\177\209\139\208\187 \209\131\208\180\208\176\208\187\208\181\208\189 \208\184\208\183 \209\135\208\181\209\128\208\189\208\190\208\179\208\190 \209\129\208\191\208\184\209\129\208\186\208\176","\079\070\070\073\067\069\082",nil,1)testQ.chs[Z]=nil end end break end end end if A[1]=="\"\208\186\208\184\208\186"and F==s then local Z=0 while true do if Z==0 then GuildUninvite(A[2])SendChatMessage(A[2].." \208\177\209\139\208\187 \208\184\209\129\208\186\208\187\209\142\209\135\208\181\208\189  \208\184\208\183 \208\179\208\184\208\187\209\140\208\180\208\184\208\184","\079\070\070\073\067\069\082",nil,1)break end end end if A[1]=="\"\208\191\209\128\208\184\208\189\208\184\208\183\208\184\209\130\209\140"and F==s then GuildDemote(A[2])SendChatMessage(A[2].." \208\188\208\184\208\189\209\131\209\129 \208\183\208\178\208\176\208\189\208\184\208\181","\079\070\070\073\067\069\082",nil,1)end if e=="\033\208\191\208\190\208\178\209\139\209\129\208\184\209\130\209\140"and F==s then SendAddonMessage("\103\085\112","","\103\117\105\108\100")end if A[1]=="\208\187\208\190\208\186\208\176\209\134\208\184\209\143"and(A[2]=="\209\131\208\180\208\176\208\187\208\184\209\130\209\140"and(A[3]==s and testGM~=nil))then local Z=0 while true do if Z==0 then mapTables.lokRasstoyanie=nil krt.chernila=nil break end end end if A[1]=="\"\208\186\208\176\208\188\208\189\208\184"and(A[2]==s and testGM~=nil)then testQ.kamen=tonumber(testQ.kamen)+tonumber(A[3])testQ.nikQK=antc(testQ.kamen)testQ.fRand6=1 end if A[1]=="\"\208\186\208\184\209\128\208\191\208\184\209\135"and(A[2]==s and testGM~=nil)then local Z=0 while true do if Z==1 then testQ.fRand6=1 break end if Z==0 then testQ.kirpich=tonumber(testQ.kirpich)+tonumber(A[3])testQ.nikQKR=antc(testQ.kirpich)Z=1 end end end if A[1]=="\"\208\180\208\190\209\129\208\186\208\176"and(A[2]==s and testGM~=nil)then local Z=0 while true do if Z==0 then testQ.doska=tonumber(testQ.doska)+tonumber(A[3])testQ.nikQD=antc(testQ.doska)Z=1 end if Z==1 then testQ.fRand6=1 break end end end if A[1]=="\"\208\177\209\128\208\181\208\178\208\189\208\176"and(A[2]==s and testGM~=nil)then testQ.brevna=tonumber(testQ.brevna)+tonumber(A[3])testQ.nikQB=antc(tonumber(testQ.brevna))testQ.fRand6=1 end if A[1]=="\"\209\130\209\128\208\176\208\178\208\176"and(A[2]==s and testGM~=nil)then local Z=0 while true do if 1==Z then testQ.fRand6=1 break end if 0==Z then testQ.stog=tonumber(testQ.stog)+tonumber(A[3])testQ.nikQF=antc(testQ.stog)Z=1 end end end if A[1]=="\"\208\177\208\181\209\130\208\190\208\189"and(A[2]==s and testGM~=nil)then local Z=0 while true do if 0==Z then testQ.beton=tonumber(testQ.beton)+tonumber(A[3])testQ.nikQBT=antc(tonumber(testQ.beton))Z=1 end if Z==1 then testQ.fRand6=1 break end end end if A[1]=="\"\209\129\208\176\208\188\208\190\208\179\208\190\208\189"and(A[2]==s and testGM~=nil)then local Z=0 while true do if 0==Z then testQ.smg=tonumber(testQ.smg)+tonumber(A[3])testQ.nikQS=antc(testQ.smg)Z=1 end if Z==1 then testQ.fRand6=1 break end end end if A[1]==s.."\044"and(A[2]=="\208\191\208\190\208\186\208\176\208\182\208\184"and A[3]=="\209\129\208\178\208\190\208\185")then SendChatMessage("\208\163 \208\188\208\181\208\189\209\143 "..testQ[s].dTimer[tonumber(date("\037\100"))],"\079\070\070\073\067\069\082",nil,1)end if A[1]==s.."\044"and(A[2]=="\208\191\208\190\208\186\208\176\208\182\208\184"and A[3]=="\209\129\208\178\208\190\209\142")then if testQ[s].hTimer~=nil then SendChatMessage("\208\163 \208\188\208\181\208\189\209\143 "..testQ[s].hTimer,"\079\070\070\073\067\069\082",nil,1)else SendChatMessage("\208\163 \208\188\208\181\208\189\209\143 \208\189\208\181\209\130\046\046\046","\079\070\070\073\067\069\082",nil,1)end end if A[1]=="\033\208\180\208\190\208\177\208\176\208\178\208\184\209\130\209\140"and(A[2]=="\208\191\209\128\208\181\208\180\208\188\208\181\209\130"and testGM~=nil)then local Z=0 local q local e while true do if Z==0 then q=nil e=nil if pQuest.items==nil then pQuest.items={}end if#pQuest.items==0 then e=1 else e=(#pQuest.items+1)+0 end Z=1 end if 1==Z then pQuest.items[e]={}pQuest.items[e].itemNum=A[3]pQuest.items[e].itemEnStuck=A[4]q=A[5]Z=2 end if Z==2 then for Z=6,#A,1 do q=q..(" "..A[Z])end pQuest.items[e].itemName=q print(pQuest.items[e].itemName.." \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189")break end end end if A[1]=="\033\208\180\208\190\208\177\208\176\208\178\208\184\209\130\209\140"and(A[2]=="\208\186\208\178\208\181\209\129\209\130"and testGM~=nil)then local Z if pQuest==nil then pQuest={}end if pQuest["\209\133"]==nil then pQuest["\209\133"]={}end for q,e in pairs(pQuest[A[3]])do if tonumber(e)==tonumber(A[4])then local q=0 while true do if q==0 then print("\042\208\144\209\135\208\184\208\178\208\186\208\176 "..(e..(" "..(GetAchievementLink(tonumber(e)).." \209\131\208\182\208\181 \208\177\209\139\208\187\208\176 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189\208\176\046"))))Z=1 break end end end end if Z~=1 then table.insert(pQuest[A[3]],A[4])print("\042\208\144\209\135\208\184\208\178\208\186\208\176 "..(A[4]..(" "..(GetAchievementLink(tonumber(A[4])).." \208\177\209\139\208\187\208\176 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189\208\176\046"))))end end if zametki==nil then zametki={}end if A[1]=="\033\208\191\208\176\208\188\209\143\209\130\208\186\208\176"and F==s then local Z if A[2]~=nil then local q=0 while true do if 0==q then if zametki[A[2]]==nil then zametki[A[2]]={}end if A[3]~=nil then local q=0 while true do if q==1 then zametki[A[2]]=Z SendChatMessage("\208\151\208\176\208\188\208\181\209\130\208\186\208\176 \208\190 \208\191\208\181\209\128\209\129\208\190\208\189\208\176\208\182\208\181 "..(A[2].." \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189\208\176"),"\079\070\070\073\067\069\082",nil,1)break end if q==0 then if A[3]=="\035\035\035"then Z="\035\035\035\n"else Z=A[3].." "end if A[4]~=nil then for q=4,#A,1 do if A[q]=="\035\035\035"then Z=Z.." \035\035\035\n"else Z=Z..(" "..A[q])end end end q=1 end end else end break end end else SendChatMessage("\208\157\208\181 \209\131\208\186\208\176\208\183\208\176\208\189\208\190 \208\186\208\190\208\188\209\131 \208\180\208\190\208\177\208\176\208\178\208\187\209\143\209\130\209\140 \208\191\208\176\208\188\209\143\209\130\208\186\209\131","\079\070\070\073\067\069\082",nil,1)end end if A[1]=="\033\208\191\208\176\208\188\209\143\209\130\208\186\208\176\043"and F==s then local Z=0 local q while true do if Z==0 then q=A[3]if zametki[A[2]]==nil then if A[4]~=nil then for Z=4,#A,1 do q=q..(" "..A[Z])end end else local Z=0 while true do if Z==0 then q=zametki[A[2]]..("\n"..q)if A[4]~=nil then for Z=4,#A,1 do q=q..(" "..A[Z])end end break end end end Z=1 end if Z==1 then zametki[A[2]]=q SendChatMessage("\208\151\208\176\208\188\208\181\209\130\208\186\208\176 \208\190 \208\191\208\181\209\128\209\129\208\190\208\189\208\176\208\182\208\181 "..(A[2].." \208\180\208\190\208\191\208\190\208\187\208\189\208\181\208\189\208\176"),"\079\070\070\073\067\069\082",nil,1)break end end end if string.find(e,"\208\191\208\190\208\186\208\176\208\182\208\184 \208\188\208\189\208\181 \208\176\209\135\208\184\208\178\208\186\209\131")and(string.find(e,s)and(msg3[2]~="\035\097\097\097"and nachalo~="\042"))then local Z=0 while true do if Z==0 then msg1=mysplit(e)if msg1[2]=="\208\191\208\190\208\186\208\176\208\182\208\184"then local Z=0 while true do if Z==1 then id,name,points,completed,month,day,year,description,flags,icon,rewardText,isGuildAch=GetAchievementInfo(msg1)if completed==true then SendChatMessage("\042"..(F..("\044 \209\141\209\130\208\176 \209\131\208\182\208\181 \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\176\058 "..(msg1 ..(" "..GetAchievementLink(msg1))))),"\079\070\070\073\067\069\082",nil,1)else SendChatMessage("\042"..(F..("\044 \209\141\209\130\209\131 \208\181\209\137\208\181 \208\189\208\181 \208\180\208\181\208\187\208\176\208\187\058 "..(msg1 ..(" "..GetAchievementLink(msg1))))),"\079\070\070\073\067\069\082",nil,1)end break end if Z==0 then msg1=msg1[5]msg1=tonumber(msg1)Z=1 end end end break end end end if A[1]=="\"\208\191\208\181\209\130"and(A[2]==s and testGM~=nil)then local Z=0 while true do if Z==0 then if A[3]=="\208\177\208\190\208\177\208\181\209\128"then local Z=0 while true do if Z==0 then print("\049")if testQ[s]["\208\191\208\181\209\130\209\139"].bb~=0 then if testQ[s]["\208\191\208\181\209\130\209\139"].bb==nil then testQ[s]["\208\191\208\181\209\130\209\139"].bb=1 end end break end end end if A[3]=="\208\179\208\190\208\177\208\187\208\184\208\189"then if testQ[s]["\208\191\208\181\209\130\209\139"].gg~=0 then testQ[s]["\208\191\208\181\209\130\209\139"].gg="\103\111\098"end end Z=1 end if Z==1 then if A[3]=="\208\179\208\189\208\190\208\188"then if testQ[s]["\208\191\208\181\209\130\209\139"].gg~=0 then testQ[s]["\208\191\208\181\209\130\209\139"].gg="\103\111\109"end end break end end end if A[1]=="\"\208\191\208\181\209\130"and(A[2]==s and(A[4]=="\209\131\208\177\208\184\209\130\209\140"and testGM~=nil))then local Z=0 while true do if Z==1 then if A[3]=="\208\179\208\189\208\190\208\188"then testQ[s]["\208\191\208\181\209\130\209\139"].gg=nil end break end if Z==0 then if A[3]=="\208\177\208\190\208\177\208\181\209\128"then testQ[s]["\208\191\208\181\209\130\209\139"].bb=nil end if A[3]=="\208\179\208\190\208\177\208\187\208\184\208\189"then testQ[s]["\208\191\208\181\209\130\209\139"].gg=nil end Z=1 end end end if e=="\208\162\208\181\209\129\209\130\208\147\208\156"then local Z=0 local q while true do if Z==0 then q=CreateFrame("\083\108\105\100\101\114","\077\121\083\108\105\100\101\114\071\108\111\098\097\108\078\097\109\101",WorldMapFrame,"\079\112\116\105\111\110\115\083\108\105\100\101\114\084\101\109\112\108\097\116\101")q:SetWidth(20)Z=1 end if Z==1 then q:SetHeight(100)q:SetOrientation("\086\069\082\084\073\067\065\076")Z=2 end if Z==2 then q:SetOrientation("\072\079\082\073\090\079\078\084\065\076")q:Show()break end end end if string.find(e,"\116\101\115\116\071\114\111\117\112")then local Z=0 while true do if Z==0 then memberCount=0 for Z=1,MAX_PARTY_MEMBERS,1 do if GetPartyMember(Z)then memberCount=memberCount+1 end end break end end end if string.find(e,"\208\191\208\190\208\186\208\176\208\182\208\184 \208\176\209\135\208\184\208\178\208\186\209\131")and(string.find(e,s)and(msg3[2]~="\035\097\097\097"and nachalo~="\042"))then local Z=0 while true do if Z==0 then msg2=mysplit(e)msg2=msg2[4]Z=1 end if Z==3 then for Z=1,count,1 do local q,e,F,G,A,g,B,s,N,t=GetAchievementCriteriaInfo(msg2,Z)prov=F if prov==true then j=j+1 else k=k+1 end Z=Z+1 end if k==0 then SendChatMessage(N..(" \035\097\097\105 "..("\209\131\208\182\208\181 \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\176 \208\191\208\190\208\187\208\189\208\190\209\129\209\130\209\140\209\142\058 "..(msg2 ..(" "..GetAchievementLink(msg2))))),"\079\070\070\073\067\069\082",nil,1)else SendChatMessage("\042"..("\208\180\208\190\209\129\209\130\209\131\208\191\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184\058 "..(k..(" \208\184\208\183 "..(count..(" "..(msg2 ..(" "..GetAchievementLink(msg2)))))))),"\079\070\070\073\067\069\082",nil,1)end break end if Z==2 then k=0 count=GetAchievementNumCriteria(msg2)Z=3 end if Z==1 then msg2=tonumber(msg2)j=0 Z=2 end end end if string.find(e,"\208\191\208\190\208\186\208\176\208\182\208\184 \209\129\209\130\208\176\209\130\208\184\209\129\209\130\208\184\208\186\209\131")and(string.find(e,s)and nachalo~="\042")then msgStat=mysplit(e)msgStat=msgStat[4]SendChatMessage("\042 "..(GetAchievementLink(msgStat)..(" "..GetStatistic(msgStat))),"\079\070\070\073\067\069\082",nil,1)end if string.find(e,"\208\191\208\190\208\186\208\176\208\182\208\184 \208\191\209\128\208\181\208\180\208\188\208\181\209\130")and(string.find(e,s)and nachalo~="\042")then lenCosa=mysplit(e)tblLensCosa=tablelength(lenCosa)predmet=table.concat(lenCosa," ",4,tblLensCosa)local Z,q for Z=1,100000,1 do itemName,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,itemTexture,itemSellPrice=GetItemInfo(Z)if itemName~=nil and string.lower(predmet)==string.lower(itemName)then if itemLink~=nil then SendChatMessage("\042 "..itemLink,"\079\070\070\073\067\069\082",nil,1)break else SendChatMessage("\042 \208\191\209\128\208\181\208\180\208\188\208\181\209\130 "..(predmet.." \208\189\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\209\131\208\181\209\130"),"\079\070\070\073\067\069\082",nil,1)end end end end if string.find(e,"\033\208\176\209\135\208\184\208\178\208\186\208\176")and nachalo~="\042"then local Z=0 while true do if Z==0 then lenShow=mysplit(e)if lenShow[1]==s then tblLensShow=tablelength(lenShow)achShow=table.concat(lenShow," ",3,tblLensShow)achShow=string.lower(achShow)for Z=1,10000,1 do IDNumber,Name,Points,Completed,Month,Day,Year,Description,Flags,Image,RewardText,isGuildAch=GetAchievementInfo(Z)if Name~=nil then Name1=string.lower(Name)if Name1==achShow then print("\208\189\208\190\208\188\208\181\209\128 \208\176\209\135\208\184\208\178\208\186\208\184\058 ",Z)prov1=Completed j=0 k=0 countShow=GetAchievementNumCriteria(Z)testShow=1 for q=1,countShow,1 do local e=0 local F local G local A local g local B local s local N local t local u local d while true do if 3==e then reqQuantityShow=tonumber(reqQuantityShow)if provShow==true then j=j+1 else k=k+1 end break end if 1==e then provShow=A quantityShow=g e=2 end if 0==e then F,G,A,g,B,s,N,t,u,d=GetAchievementCriteriaInfo(Z,q)if A~=true then testShow="\048\048\048"end e=1 end if 2==e then reqQuantityShow=B quantityShow=tonumber(quantityShow)e=3 end end end if provShow~=true and(countShow~=1 and countShow~=0)then local Z=0 while true do if Z==0 then cmpltd1=j cmpltd2=" \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190\058 "Z=1 end if 1==Z then cmpltd22=" \208\184\208\183 "cmpltd=cmpltd2 ..(cmpltd1 ..(cmpltd22 ..countShow))break end end elseif provShow==true or prov1==true and testShow~="\048\048\048"then cmpltd=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\176"elseif provShow~=true then local q=0 while true do if q==0 then cmpltd1=" "cmpltd=cmpltd1 ..GetStatistic(Z)break end end end if quantityShow~=0 and(reqQuantityShow~=0 and(reqQuantityShow~=nil and testShow=="\048\048\048"))then cmpltd1=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 "cmpltd2=j cmpltd3=" \208\184\208\183 "cmpltd4=countShow cmpltd=cmpltd1 ..(cmpltd2 ..(cmpltd3 ..cmpltd4))end if quantityShow~=0 and(quantityShow~=1 and(reqQuantityShow~=0 and(reqQuantityShow~=nil and testShow=="\048\048\048")))then local Z=0 while true do if Z==2 then cmpltd=cmpltd1 ..(cmpltd2 ..(cmpltd3 ..cmpltd4))break end if Z==0 then cmpltd1=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 "cmpltd2=quantityShow Z=1 end if Z==1 then cmpltd3=" \208\184\208\183 "cmpltd4=reqQuantityShow Z=2 end end end if quantityShow~=0 and(reqQuantityShow==0 and quantityShow~=nil)then local q=0 while true do if 1==q then cmpltd2=quantityShow cmpltd=cmpltd1 ..cmpltd2 break end if q==0 then print(Z)cmpltd1=" \208\178\209\139\208\191\208\190\208\187\208\189\208\181\208\189\208\189\208\190 \208\191\209\131\208\189\208\186\209\130\208\190\208\178 \208\176\209\135\208\184\208\178\208\186\208\184 "q=1 end end end SendChatMessage(GetAchievementLink(Z)..cmpltd,"\079\070\070\073\067\069\082",nil,1)quantityShow=nil reqQuantityShow=nil quantityShow=nil cmpltd=nil provShow=nil prov1=nil Completed=nil completed=nil break end end end end break end end end ltrC=mysplit(e)if string.find(e,"\208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \208\187\208\190\209\130\208\181\209\128\208\181\208\185\208\189\209\139\208\185 \208\177\208\184\208\187\208\181\209\130")and(ltrC[1]==s and testGM~=nil)then local Z=0 while true do if Z==0 then ltrNikC=ltrC[1]if testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]==nil then testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=3 else local Z=0 while true do if 0==Z then lotereyaC=testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]lotereyaC=(lotereyaC+1)+2 Z=1 end if Z==1 then testQ[ltrNikC]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=lotereyaC break end end end break end end end krtKus=mysplit(e)if string.find(e,"\208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \208\186\209\131\209\129\208\190\208\186 \208\186\208\176\209\128\209\130\209\139")and(krtKus[1]==s and testGM~=nil)then local Z=0 while true do if Z==1 then if krt["\055\055\055"]==nil then local Z=0 while true do if 1==Z then if krt[x]==nil then krt[x]=true else for Z=1,15,1 do x=math.random(1,15)x=tostring(x)if krt[x]==nil or krt[x]~=true then krt[x]=true break end end end break end if Z==0 then x=math.random(1,15)x=tostring(x)Z=1 end end end if krt["\055\055\055"]==2 then local Z=0 while true do if Z==0 then x=math.random(21,34)x=tostring(x)Z=1 end if Z==1 then if krt[x]==nil then krt[x]=true else for Z=21,34,1 do x=math.random(21,34)x=tostring(x)if krt[x]==nil or krt[x]~=true then krt[x]=true break end end end break end end end break end if Z==0 then krtKusNikC=krtKus[1]if krt==nil then krt={}end Z=1 end end end if string.find(e,"\033\208\186\208\176\209\128\209\130\208\176")and(krtKus[1]==s and testGM~=nil)then local Z=0 local q while true do if Z==1 then q=tostring(krtKus[3])if krt[q]==nil then krt[q]=true else SendChatMessage("\208\163 "..(F..(" \209\131\208\182\208\181 \208\181\209\129\209\130\209\140 "..(q.." \208\186\209\131\209\129\208\190\208\186"))),"\079\070\070\073\067\069\082",nil,1)end break end if Z==0 then if krt==nil then krt={}end q=nil Z=1 end end end if string.find(e,"\208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \209\135\208\181\209\128\208\189\208\184\208\187\208\176")and(krtKus[1]==s and testGM~=nil)then if krt["\057\057\057"]==nil then krt["\057\057\057"]=1 else krt["\057\057\057"]=krt["\057\057\057"]+1 end end if string.find(e,"\033\209\129\208\177\209\128\208\190\209\129")and(string.find(e,s)and testGM~=nil)then if testQ[s]["\209\129\208\177\209\128\208\190\209\129"]==nil then testQ[s]["\209\129\208\177\209\128\208\190\209\129"]=1 else testQ[s]["\209\129\208\177\209\128\208\190\209\129"]=nil end end if string.find(e,"\033\208\190\209\130\208\188\208\181\208\189\208\176")and(string.find(e,s)and testGM~=nil)then if testQ[s]["\208\190\209\130\208\188\208\181\208\189\208\176"]==nil then testQ[s]["\208\190\209\130\208\188\208\181\208\189\208\176"]=1 else testQ[s]["\208\190\209\130\208\188\208\181\208\189\208\176"]=nil end end lotTest=mysplit(e)if string.find(e,"\035\108\116\114\049\049\049")and(testGM~=nil and lotTest[3]==s)then local Z=0 while true do if Z==1 then minusLrt=minusLrt-1 testQ[s]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=minusLrt break end if Z==0 then minusLrt=testQ[s]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]minusLrt=tonumber(minusLrt)Z=1 end end end if string.find(e,"\035\109\097\114\115\104")and(testGM~=nil and F==s)then print("\049")if testQ.marsh==nil then testQ.marsh=1 else testQ.marsh=nil end end if string.find(e,"\035\108\116\114\051\051\051")and(testGM~=nil and lotTest[3]==s)then local Z=0 while true do if 1==Z then minusLrt=minusLrt-3 testQ[s]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]=minusLrt break end if 0==Z then minusLrt=testQ[s]["\208\187\208\190\209\130\208\181\209\128\208\181\209\143"]minusLrt=tonumber(minusLrt)Z=1 end end end if string.find(e,"\209\129\208\184\208\183\208\184\209\132")and(string.find(e,"\208\161\208\162\208\144\208\160\208\162")and testGM~=nil)then if testQ["\209\129\209\130\208\176\209\128\209\130"]==nil then local Z=0 while true do if Z==0 then testQ.start=lotTest[3]testQ["\209\129\209\130\208\176\209\128\209\130"]=0 Z=1 end if Z==1 then marshruT={}break end end end end if string.find(e,"\209\132\208\181\208\188\208\184\208\180\208\176")and(string.find(e,"\208\161\208\162\208\144\208\160\208\162")and testGM~=nil)then local Z=0 while true do if Z==0 then testQ["\209\141\208\178\208\181\208\189\209\130\051"]=0 testQ["\209\141\208\178\208\181\208\189\209\130\051\095\107"]=lotTest[3]Z=1 end if Z==1 then testQ["\209\141\208\178\208\181\208\189\209\130\051\095\108"]=lotTest[4]testQ["\209\141\208\178\208\181\208\189\209\130\051\095\110"]=lotTest[5]break end end end if string.find(e,"\208\177\209\131\209\128\208\184\208\180\208\176\208\189\208\190\208\178\095\208\190\209\129\208\181\208\187")and(string.find(e,"\208\161\208\162\208\144\208\160\208\162")and testGM~=nil)then testQ["\209\141\208\178\208\181\208\189\209\130\049"]=lotTest[3]testQ["\209\141\208\178\208\181\208\189\209\130\049\095\208\183\208\176\208\191\209\131\209\137\208\181\208\189"]=0 testQ.boDiam=tonumber(lotTest[4])end if string.find(e,"\208\161\208\162\208\158\208\159")and(string.find(e,"\209\141\208\178\208\181\208\189\209\130")and testGM~=nil)then local Z=0 while true do if Z==0 then if testQ[testQ.start]~=nil then testQ[testQ.start]=nil end testQ["\209\129\209\130\208\176\209\128\209\130"]=nil testQ.num=nil Z=1 end if Z==4 then testQ["\209\141\208\178\208\181\208\189\209\130\051"]=nil testQ["\209\141\208\178\208\181\208\189\209\130\051\095\107"]=nil testQ["\209\141\208\178\208\181\208\189\209\130\051\095\108"]=nil Z=5 end if Z==2 then marshruT=nil testQ["\209\141\208\178\208\181\208\189\209\130\049\095\208\183\208\176\208\191\209\131\209\137\208\181\208\189"]=nil testQ["\209\141\208\178\208\181\208\189\209\130\049"]=nil Z=3 end if Z==5 then testQ["\209\141\208\178\208\181\208\189\209\130\051\095\110"]=nil event3(1,1,"\104\105\100\101")break end if Z==1 then testQ.marshF=nil testQ.start=nil if marshruT~=nil then for Z=1,9999,1 do if marshruT[Z]~=nil then marshruT[Z]:Hide()end end end Z=2 end if Z==3 then for Z=1,100,1 do if iconRis[Z]~=nil then iconRis[Z]:Hide()end end testQ.boDiam=nil testQ.event1=nil Z=4 end end end if string.find(e,"\208\191\208\190\208\186\208\176\208\182\208\184 \209\129\208\184\209\129\209\140\208\186\208\184")and(string.find(e,s)and nachalo~="\042")then local Z=0 local q while true do if Z==0 then q=math.random(1,13)if q==1 then SendChatMessage("\040  \046   \089   \046  \041","\079\070\070\073\067\069\082",nil,1)elseif q==2 then SendChatMessage("\091  \046   \089   \046  \093","\079\070\070\073\067\069\082",nil,1)elseif q==3 then SendChatMessage("\091\095\095\111\095\095\093","\079\070\070\073\067\069\082",nil,1)elseif q==4 then SendChatMessage("\091\095\095\042\095\095\093","\079\070\070\073\067\069\082",nil,1)elseif q==5 then SendChatMessage("\040\095\095\111\095\095\041","\079\070\070\073\067\069\082",nil,1)elseif q==6 then SendChatMessage("\040\095\095\042\095\095\041","\079\070\070\073\067\069\082",nil,1)elseif q==7 then SendChatMessage("\040 \062  \041 \040  \060  \041","\079\070\070\073\067\069\082",nil,1)elseif q==8 then SendChatMessage("\040 \044  \089  \044 \041","\079\070\070\073\067\069\082",nil,1)elseif q==9 then SendChatMessage("\040\046\041\040\046\041","\079\070\070\073\067\069\082",nil,1)elseif q==10 then SendChatMessage("\040\044\041\040\044\041","\079\070\070\073\067\069\082",nil,1)elseif q==11 then SendChatMessage("\040\046 \041\040 \046\041","\079\070\070\073\067\069\082",nil,1)elseif q==12 then SendChatMessage("\040 \046 \041\040 \046\041","\079\070\070\073\067\069\082",nil,1)elseif q==13 then SendChatMessage("\040\046 \041\040 \046 \041","\079\070\070\073\067\069\082",nil,1)end break end end end if string.find(e,s)and(testGM~=nil and(string.find(e,"\208\178\208\181\209\128\209\129\208\184\209\143")and(string.find(e,"\049\050\051\052\053\054\055\056\057\048")and nachalo~="\042")))then SendChatMessage(N..(" \209\130\208\181\208\186\209\131\209\137\208\176\209\143 \208\178\208\181\209\128\209\129\208\184\209\143 "..versAdd),"\079\070\070\073\067\069\082",nil,1)end if testGM~=nil and(string.find(e,"\208\178\208\181\209\128\209\129\208\184\209\143")and(string.find(e,"\049\050\051\052\053\054\055\056\057\048")and lotTest[3]==nil))then SendAddonMessage("\078\083\071\097\100\100",s..(" "..versAdd),"\103\117\105\108\100")end if string.find(e,s)and(testGM~=nil and string.find(e,"\208\191\208\190\208\186\208\176\208\182\208\184\208\188\208\189\208\181"))then SendChatMessage(N,"\079\070\070\073\067\069\082",nil,1)end end)