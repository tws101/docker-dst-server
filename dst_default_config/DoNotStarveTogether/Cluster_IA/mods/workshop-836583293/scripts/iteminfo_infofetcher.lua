local CacheItem = require "iteminfo_cacheitem"
local easing = require "easing"

local InfoFetcher = Class(function(self)
	self.cached_items = {}
end)

function InfoFetcher:AddItemToCache(inst)
	local IsMasterSim = TheWorld.ismastersim
	TheWorld.ismastersim = true
	
	MOD_ITEMINFO.SPAWNING_ITEM = true
	local inst_copy = SpawnPrefab(inst.prefab)
	MOD_ITEMINFO.SPAWNING_ITEM = false
	
	self.cached_items[inst.prefab] = CacheItem(inst_copy)
	--print("Added", self.item.prefab, "to cache")aw
	
	inst_copy:Remove()
	TheWorld.ismastersim = IsMasterSim
end

function InfoFetcher:IsInCache(inst)
	return self.cached_items[inst.prefab]
end

function InfoFetcher:FetchInfo()
	print("Fetched info!")
end

-- ##################################################
-- Has component functions
-- ##################################################

function InfoFetcher:HasDapperness(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.equippable and base_inst.components.equippable.dapperness and base_inst.components.equippable.dapperness ~= 0
end

function InfoFetcher:IsPerishable(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.perishable
end

function InfoFetcher:IsInsulator(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.insulator
end
		
function InfoFetcher:IsWaterproofer(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.waterproofer
end
		
function InfoFetcher:HasFiniteUses(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.finiteuses
end
	
		
function InfoFetcher:IsWeapon(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.weapon
end
		
function InfoFetcher:IsFueled(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.fueled
end
		
function InfoFetcher:IsArmor(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.armor
end
		
function InfoFetcher:IsHealer(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.healer
end

function InfoFetcher:IsEdible(inst)
	local base_inst = self.cached_items[inst.prefab]
	return base_inst.components.edible
end

-- ##################################################
-- Perishable
-- ##################################################
function InfoFetcher:GetSpoilModifier(inst, owner)
	local modifier = 1.0
	
	if owner:HasTag("fridge") then
		modifier = TUNING.PERISH_FRIDGE_MULT
	elseif owner:HasTag("saltbox") then -- saltbox actually uses preserver component, but we have no way to access it
		modifier = TUNING.PERISH_SALTBOX_MULT
	elseif owner:HasTag("foodpreserver") then
		modifier = TUNING.PERISH_FOOD_PRESERVER_MULT
	elseif owner:HasTag("spoiler") then
		modifier = TUNING.PERISH_GROUND_MULT 
	end
	
	if inst.replica.inventoryitem:IsWet() then
		modifier = modifier * TUNING.PERISH_WET_MULT
	end
	
	if TheWorld.state.temperature < 0 then
		modifier = modifier * TUNING.PERISH_WINTER_MULT
	elseif TheWorld.state.temperature > TUNING.OVERHEAT_TEMP then
		modifier = modifier * TUNING.PERISH_SUMMER_MULT
	end
	
	modifier = modifier * TUNING.PERISH_GLOBAL_MULT
	
	return modifier
end

function InfoFetcher:GetPerishFreshness(inst)
	return inst.replica.inventoryitem.classified.perish:value() / 62
end

function InfoFetcher:CalculateFinalPerishValues(base_inst, inst, owner)
	local freshness = self:GetPerishFreshness(inst)
	local perishtime = base_inst.components.perishable.perishtime
	local max_perishtime = perishtime
	
	local modifier = self:GetSpoilModifier(inst, owner)
	
	perishtime = perishtime * freshness / modifier
	max_perishtime = max_perishtime / modifier

	return freshness, perishtime, max_perishtime
end

function InfoFetcher:GetPerishValues(inst, container)
	local base_inst = self.cached_items[inst.prefab]
	
	if container ~= nil then
		return self:CalculateFinalPerishValues(base_inst, inst, container)
	end
	
	return self:CalculateFinalPerishValues(base_inst, inst, ThePlayer)
end

-- ##################################################
-- Dapperness
-- ##################################################

function InfoFetcher:GetDappernessValue(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	return base_inst.components.equippable.dapperness * 60
end

-- ##################################################
-- Fueled
-- ##################################################

function InfoFetcher:GetFuelValue(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	local maxfuel = base_inst.components.fueled.maxfuel
	local percentused = inst.replica.inventoryitem.classified.percentused:value() / 100
	
	local remaining_time = maxfuel * percentused
	
	if inst.prefab == "torch" then
		if TheWorld.state.israining then 
			remaining_time = remaining_time / (1 + TUNING.TORCH_RAIN_RATE * TheWorld.state.precipitationrate)
		end
	end
	
	local fueltype = base_inst.components.fueled.fueltype
	
	return remaining_time, fueltype
end

-- ##################################################
-- Edible
-- ##################################################

function InfoFetcher:CanEat(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	local foodtype = base_inst.components.edible.foodtype
	
	if foodtype == FOODTYPE.GEARS then
		if ThePlayer:HasTag("GEARS_eater") then return true else return false end
	elseif foodtype == FOODTYPE.WOOD then
		if ThePlayer:HasTag("WOOD_eater") then return true else return false end
	elseif foodtype == FOODTYPE.ELEMENTAL then
		if ThePlayer:HasTag("ELEMENTAL_eater") then return true else return false end
	elseif foodtype == FOODTYPE.HORRIBLE then
		if ThePlayer:HasTag("HORRIBLE_eater") then return true else return false end
	elseif foodtype == FOODTYPE.BURNT then
		if ThePlayer:HasTag("BURNT_eater") then return true else return false end
	elseif foodtype == FOODTYPE.RAW then
		if ThePlayer:HasTag("RAW_eater") then return true else return false end
	elseif foodtype == FOODTYPE.ROUGHAGE then
		if ThePlayer:HasTag("ROUGHAGE_eater") then return true else return false end
	end
	
	return true
end

StrongStomachEaters =
{
	webber = true
}

IgnoreSpoilageEaters =
{
	wx78 = true
}

PickyEaters =
{
	wickerbottom = true
}

NonDegradingFood =
{
	ice = true
}

function InfoFetcher:CanEatMonster()
	if StrongStomachEaters[ThePlayer.prefab] then
		return true
	end
end

function InfoFetcher:IgnoresSpoilage()
	if IgnoreSpoilageEaters[ThePlayer.prefab] then
		return true
	end
end

function InfoFetcher:IsPickyEater()
	if PickyEaters[ThePlayer.prefab] then
		return true
	end
end

function InfoFetcher:IsNonDegradingFood(base_inst)
	if NonDegradingFood[base_inst.prefab] then
		return true
	end
end

local FOODSTATES = {FRESH = 1, STALE = 2, SPOILED = 3}

function InfoFetcher:GetEdibleValues(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	local hunger = base_inst.components.edible.hunger
	local sanity = base_inst.components.edible.sanity
	local health = base_inst.components.edible.health
	
	local freshness = self:GetPerishFreshness(inst)
	local state = nil
	
	if freshness >= .5 then
        state = FOODSTATES.FRESH
    elseif freshness > .2 then
        state = FOODSTATES.STALE
    else
		state = FOODSTATES.SPOILED
    end
	
	if self:CanEatMonster() and inst:HasTag("monstermeat") then
		if health < 0 then health = 0 end
		if sanity < 0 then sanity = 0 end
	end
	
	-- Hunger
	if not(self:IsNonDegradingFood(base_inst) or hunger < 0 or self:IgnoresSpoilage()) then
		if state == FOODSTATES.STALE then
			hunger = hunger * (self:IsPickyEater() and TUNING.WICKERBOTTOM_STALE_FOOD_HUNGER or TUNING.STALE_FOOD_HUNGER)
		elseif state == FOODSTATES.SPOILED then
			hunger = hunger * (self:IsPickyEater() and TUNING.WICKERBOTTOM_SPOILED_FOOD_HUNGER or TUNING.SPOILED_FOOD_HUNGER)
		end
	end
	
	-- Sanity
	if not(self:IsNonDegradingFood(base_inst) or sanity < 0 or self:IgnoresSpoilage()) then
		if state == FOODSTATES.STALE then
			sanity = 0
		elseif state == FOODSTATES.SPOILED then
			sanity = -TUNING.SANITY_SMALL
		end
	end
	
	-- Health
	if not(self:IsNonDegradingFood(base_inst) or health < 0 or self:IgnoresSpoilage()) then
		if state == FOODSTATES.STALE then
			health = health * (self:IsPickyEater() and TUNING.WICKERBOTTOM_STALE_FOOD_HEALTH or TUNING.STALE_FOOD_HEALTH)
		elseif state == FOODSTATES.SPOILED then
			health = health * (self:IsPickyEater() and TUNING.WICKERBOTTOM_SPOILED_FOOD_HEALTH or TUNING.SPOILED_FOOD_HEALTH)
		end
	end
	
	
	return hunger, sanity, health
end

-- ##################################################
-- Damage
-- ##################################################

function InfoFetcher:GetPlayerDamageModifier()
	if ThePlayer.prefab == "wendy" then
		return TUNING.WENDY_DAMAGE_MULT
	elseif ThePlayer.prefab == "wathgrithr" then
		return TUNING.WATHGRITHR_DAMAGE_MULT
	elseif ThePlayer.prefab == "wolfgang" then
		local percent = ThePlayer.replica.hunger:GetPercent()
		local hunger = ThePlayer.replica.hunger:GetCurrent()
		local damage_mult = TUNING.WOLFGANG_ATTACKMULT_NORMAL
		
		if ThePlayer.iteminfo.form == MOD_ITEMINFO.WOLFGANG_FORMS.MIGHTY then
			local mighty_start = (TUNING.WOLFGANG_START_MIGHTY_THRESH/TUNING.WOLFGANG_HUNGER)   
			local mighty_percent = math.max(0, (percent - mighty_start) / (1 - mighty_start))
			damage_mult = easing.linear(mighty_percent, TUNING.WOLFGANG_ATTACKMULT_MIGHTY_MIN, TUNING.WOLFGANG_ATTACKMULT_MIGHTY_MAX - TUNING.WOLFGANG_ATTACKMULT_MIGHTY_MIN, 1)
		elseif ThePlayer.iteminfo.form == MOD_ITEMINFO.WOLFGANG_FORMS.WIMPY then
			local wimpy_start = (TUNING.WOLFGANG_START_WIMPY_THRESH/TUNING.WOLFGANG_HUNGER) 
			local wimpy_percent = math.min(1, percent/wimpy_start )
			damage_mult = easing.linear(wimpy_percent, TUNING.WOLFGANG_ATTACKMULT_WIMPY_MIN, TUNING.WOLFGANG_ATTACKMULT_WIMPY_MAX - TUNING.WOLFGANG_ATTACKMULT_WIMPY_MIN, 1) 
		end

		return damage_mult
	elseif ThePlayer.prefab == "wes" then
		return 0.75
	else
		return 1
	end
end

function InfoFetcher:GetWeaponDamage(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	local damage = 0

	if inst.prefab ~= "hambat" then
		 -- damage = base_inst.components.weapon.damage

		-- [10/08/2020] Thanks to Grandpa Scout for pointing out that damage could be a function and using pcall
		 if type(base_inst.components.weapon.damage) == "function" then
			local ran, val = pcall(base_inst.components.weapon.damage, base_inst, ThePlayer)

			if ran  then
				damage = val
			else
				damage = "???"
			end
		else
			damage = base_inst.components.weapon.damage
		end
	else
		damage = TUNING.HAMBAT_DAMAGE * self:GetPerishFreshness(inst)
        damage = Remap(damage, 0, TUNING.HAMBAT_DAMAGE, TUNING.HAMBAT_MIN_DAMAGE_MODIFIER * TUNING.HAMBAT_DAMAGE, TUNING.HAMBAT_DAMAGE)
	end
	
	if damage ~= "???" then 
		local damagemult = self:GetPlayerDamageModifier()
		damage = damage * damagemult
	end
	
	return damage
end

-- ##################################################
-- FiniteUses
-- ##################################################

function InfoFetcher:GetFiniteUses(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	local consumption_per_use = 1
	for k,v in pairs(base_inst.components.finiteuses.consumption) do
		consumption_per_use = v
		break
	end

	local maxuses = base_inst.components.finiteuses.total / consumption_per_use
	local usesleft = inst.replica.inventoryitem.classified.percentused:value() / 100 * maxuses
	
	return usesleft, maxuses
end

-- ##################################################
-- Armor
-- ##################################################

function InfoFetcher:GetArmorValues(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	local absorb_percent = base_inst.components.armor.absorb_percent
	local hp = base_inst.components.armor.maxcondition  * inst.replica.inventoryitem.classified.percentused:value() / 100
	
	return absorb_percent, hp
end

-- ##################################################
-- Insulation
-- ##################################################

function InfoFetcher:GetInsulationValues(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	local insulation = base_inst.components.insulator.insulation
	
	local insulation_type = base_inst.components.insulator.type
	
	return insulation, insulation_type
end

-- ##################################################
-- Waterproofer
-- ##################################################

function InfoFetcher:GetWaterproofValue(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	return base_inst.components.waterproofer.effectiveness
end

-- ##################################################
-- Healer
-- ##################################################

function InfoFetcher:GetHealerValue(inst)
	local base_inst = self.cached_items[inst.prefab]
	
	return base_inst.components.healer.health
end

return InfoFetcher