function testTab(tabella)
	if incTabC == nil then
		incTabC = {}
	end
	if inQuest == nil then
		inQuest = {}
	end
	if tabella ~= nil then
		if inQuest[tabella] == nil then
			inQuest[tabella] = {}
		end
		if incTabC[tabella] == nil then
			incTabC[tabella] = {}
		end
		if incTabC[tabella]["смерть"] == nil then
			incTabC[tabella]["смерть"] = {}
		end
		if incTabC[tabella]["крики"] == nil then
			incTabC[tabella]["крики"] = {}
		end
		if incTabC[tabella]["систем"] == nil then
			incTabC[tabella]["систем"] = {}
		end
		if incTabC[tabella] ~= nil and incTabC[tabella]["название"] ~= nil then
			return incTabC[tabella]["название"]
		end
	end
end


