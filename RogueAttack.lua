function MakeMyAttacks()
	local c=GetComboPoints()
	local b=IsBuffActive("Zerh\195\164ckseln")
	local e=UnitMana("player")
	local playerHealth=UnitHealth("player")*100/UnitHealthMax("player")
	local h = MobHealth_GetTargetCurHP()
	local inFight = UnitAffectingCombat("player")
	
	--DEFAULT_CHAT_FRAME:AddMessage("Debug")	
	
	-- Falls MobHealth_GetTargetCurHP nil geliefert hat wird die HP des Targets auf 0 gesetzt
	if h == nil then h = 0 end
	-- Wenn man im Kampf ist und nur noch 5 % HP oder darunter hat, dann wird ein Heiltrank genommen
	if playerHealth <= 5 and inFight == 1 then
		useContainerItemByName("Erheblicher Heiltrank") -- 1050-1751
		useContainerItemByName("\195\156berragender Heiltrank") -- 700-901
		useContainerItemByName("Gro\195\159er Heiltrank") -- 455-586
		useContainerItemByName("Heiltrank") -- 280-361
		useContainerItemByName("Geringer Heiltrank") -- 140-181
	end
	-- Wenn man min. 1 Combopunkt hat, Zerhäckseln inaktiv ist und man min. 25 Energie hat wird Zerhäckseln aktiviert
	if c > 0 and not b and e >= 25 then
		CastSpellByName("Zerh\195\164ckseln")
	-- Wenn man 5 Combopunkte hat oder der Gegner fast tot ist und man min. 35 Energie hat wird Ausweiden benutzt
	elseif (c == 5 or (c > 0 and h <= getAvgEviscerateDamage(c))) and e >= 35 then
		CastSpellByName("Ausweiden")
	-- Wenn man min. 40 Energie hat wird Finsterer Stoß benutzt
	elseif e >= 40 then
		CastSpellByName("Finsterer Sto\195\159")
	end
end

function useContainerItemByName(pName)
	for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local itemlink = GetContainerItemLink(bag, slot)
			if itemlink ~= nil and string.find(tostring(itemlink), pName) then
				UseContainerItem(bag, slot, 1)
				break
			end
		end
	end
end

function getAvgEviscerateDamage(pComboPoints)
	local base, pos, neg = UnitAttackPower("player")
	local ap = base + pos + neg
	local modifier = ap * pComboPoints * 0.03
	local rank = getRank("Ausweiden")
	local avgDmg
	if rank == "Rang 1" and pComboPoints == 1 then avgDmg = 8 end
	if rank == "Rang 1" and pComboPoints == 2 then avgDmg = 13 end
	if rank == "Rang 1" and pComboPoints == 3 then avgDmg = 18 end
	if rank == "Rang 1" and pComboPoints == 4 then avgDmg = 23 end
	if rank == "Rang 1" and pComboPoints == 5 then avgDmg = 28 end
	if rank == "Rang 2" and pComboPoints == 1 then avgDmg = 18 end
	if rank == "Rang 2" and pComboPoints == 2 then avgDmg = 29 end
	if rank == "Rang 2" and pComboPoints == 3 then avgDmg = 40 end
	if rank == "Rang 2" and pComboPoints == 4 then avgDmg = 51 end
	if rank == "Rang 2" and pComboPoints == 5 then avgDmg = 62 end
	if rank == "Rang 3" and pComboPoints == 1 then avgDmg = 32 end
	if rank == "Rang 3" and pComboPoints == 2 then avgDmg = 51 end
	if rank == "Rang 3" and pComboPoints == 3 then avgDmg = 70 end
	if rank == "Rang 3" and pComboPoints == 4 then avgDmg = 89 end
	if rank == "Rang 3" and pComboPoints == 5 then avgDmg = 108 end
	if rank == "Rang 4" and pComboPoints == 1 then avgDmg = 51 end
	if rank == "Rang 4" and pComboPoints == 2 then avgDmg = 82 end
	if rank == "Rang 4" and pComboPoints == 3 then avgDmg = 113 end
	if rank == "Rang 4" and pComboPoints == 4 then avgDmg = 144 end
	if rank == "Rang 4" and pComboPoints == 5 then avgDmg = 175 end
	if rank == "Rang 5" and pComboPoints == 1 then avgDmg = 75 end
	if rank == "Rang 5" and pComboPoints == 2 then avgDmg = 120 end
	if rank == "Rang 5" and pComboPoints == 3 then avgDmg = 165 end
	if rank == "Rang 5" and pComboPoints == 4 then avgDmg = 210 end
	if rank == "Rang 5" and pComboPoints == 5 then avgDmg = 255 end
	if rank == "Rang 6" and pComboPoints == 1 then avgDmg = 121 end
	if rank == "Rang 6" and pComboPoints == 2 then avgDmg = 198 end
	if rank == "Rang 6" and pComboPoints == 3 then avgDmg = 275 end
	if rank == "Rang 6" and pComboPoints == 4 then avgDmg = 352 end
	if rank == "Rang 6" and pComboPoints == 5 then avgDmg = 429 end
	if rank == "Rang 7" and pComboPoints == 1 then avgDmg = 178 end
	if rank == "Rang 7" and pComboPoints == 2 then avgDmg = 288 end
	if rank == "Rang 7" and pComboPoints == 3 then avgDmg = 398 end
	if rank == "Rang 7" and pComboPoints == 4 then avgDmg = 508 end
	if rank == "Rang 7" and pComboPoints == 5 then avgDmg = 618 end
	if rank == "Rang 8" and pComboPoints == 1 then avgDmg = 247 end
	if rank == "Rang 8" and pComboPoints == 2 then avgDmg = 398 end
	if rank == "Rang 8" and pComboPoints == 3 then avgDmg = 549 end
	if rank == "Rang 8" and pComboPoints == 4 then avgDmg = 700 end
	if rank == "Rang 8" and pComboPoints == 5 then avgDmg = 851 end
	if rank == "Rang 9" and pComboPoints == 1 then avgDmg = 278 end
	if rank == "Rang 9" and pComboPoints == 2 then avgDmg = 448 end
	if rank == "Rang 9" and pComboPoints == 3 then avgDmg = 618 end
	if rank == "Rang 9" and pComboPoints == 4 then avgDmg = 788 end
	if rank == "Rang 9" and pComboPoints == 5 then avgDmg = 958 end
	
	-- 30 % Crit
	local crit = avgDmg * 0.3
	
	-- Der Schaden wird noch um 0 % reduziert was die Rüstung des Gegeners simulieren soll
	return (avgDmg + modifier + crit) * 1.00
end

function getRank(pSpellName)
	local i = 1
	while true do
		local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
		if not spellName then
			do break end
		end
		if spellName == pSpellName then
			return spellRank
		end
		i = i + 1
	end
end