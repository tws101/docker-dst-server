local CacheItem = Class(function(self, inst)
	if not inst then return end

	self.prefab = inst.prefab
	self.components = {}
	
	
	if inst.components.equippable then
		self.components.equippable = {}
		
		if inst.components.equippable.dapperness and inst.components.equippable.dapperness ~= 0 then
			self.components.equippable.dapperness = inst.components.equippable.dapperness
		end
	end
	
	if inst.components.perishable then
		self.components.perishable = {}
		self.components.perishable.perishtime = inst.components.perishable.perishtime
	end
	
	if inst.components.insulator then
		self.components.insulator = {}
		self.components.insulator.insulation = inst.components.insulator.insulation
		
		if inst.components.insulator.type == SEASONS.WINTER then
			self.components.insulator.type = "winter"
		else
			self.components.insulator.type = "summer"
		end
	end
	
	if inst.components.waterproofer then
		self.components.waterproofer = {}
		self.components.waterproofer.effectiveness = inst.components.waterproofer:GetEffectiveness()
	end

	
	if inst.components.finiteuses then
		self.components.finiteuses = {}
		
		local consumption_per_use = 1
		for k,v in pairs(inst.components.finiteuses.consumption) do
			consumption_per_use = v
			break
		end

		local maxuses = inst.components.finiteuses.total / consumption_per_use
		
		self.components.finiteuses.consumption = inst.components.finiteuses.consumption
		self.components.finiteuses.total = inst.components.finiteuses.total
		self.components.finiteuses.maxuses = maxuses
	end
	
	if inst.components.weapon then
		self.components.weapon = {}
		self.components.weapon.damage = inst.components.weapon.damage
	end
	
	if inst.components.fueled then
		self.components.fueled = {}
		self.components.fueled.maxfuel = inst.components.fueled.maxfuel
		
		
		if inst.components.fueled.fueltype == FUELTYPE.USAGE then
			self.components.fueled.fueltype = "wearable"
		else
			self.components.fueled.fueltype = "light"
		end
	end
	
	if inst.components.armor then
		self.components.armor = {}
		self.components.armor.absorb_percent = inst.components.armor.absorb_percent
		self.components.armor.maxcondition = inst.components.armor.maxcondition
	end
	
	if inst.components.healer then
		self.components.healer = {}
		self.components.healer.health = inst.components.healer.health
	end
	
	if inst.components.edible then
		self.components.edible = {}
		self.components.edible.foodtype = inst.components.edible.foodtype
		self.components.edible.hunger = inst.components.edible.hungervalue
		self.components.edible.sanity = inst.components.edible.sanityvalue
		self.components.edible.health = inst.components.edible.healthvalue
	end
end)

return CacheItem