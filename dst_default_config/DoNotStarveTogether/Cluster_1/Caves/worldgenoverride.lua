KLEI     1 return {
	override_enabled = true,
	worldgen_preset = "DST_CAVE",
	settings_preset = "DST_CAVE",
	overrides = {
		---------------------------WORLD GENERATION---------------------------
		-- GLOBAL***
		season_start="default",
	
		-- WORLD
		task_set="cave_default",				-- Biomes: 						"classic", "default", "cave_default"
		start_location="caves",					-- Spawn Area:					"caves", "default", "plus", "darkness"
		world_size="default",					-- World Size:					"small", "medium", "default", "huge"
		branching="default",					-- Branches: 					"never", "least", "default", "most", "random"
		loop="default",							-- Loops:						"never", "default", "always"
		touchstone="default",					-- Touch Stones:				"never", "rare", "uncommon", "default", "often", "mostly", "always"
		boons="default",						-- Failed Survivors: 			"never", "rare", "uncommon", "default", "often", "mostly", "always"
		cavelight="default", 					-- Sinkhole Lights:				"never", "veryslow", "slow", "default", "fast", "veryfast"
		prefabswaps_start="default",			-- Starting Resource Variety: 	"classic", "default", "highly random"
	
		-- RESOURCES (QUANTITY GENERATED)
		banana="default", 						-- Bananas: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		berrybush="default",					-- Berry Bushes: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		rock="default",							-- Boulders: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		fern="default", 						-- Cave Ferns:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		flint="often",							-- Flint: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		wormlights="default", 					-- Glow Berries:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		grass="default",						-- Grass: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		lichen="default", 						-- Lichen: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		flower_cave="default", 					-- Light Flowers:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		mushtree="default", 					-- Mushroom Trees: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		mushroom="default",						-- Mushrooms:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		cave_ponds="default", 					-- Ponds: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		reeds="default",						-- Reeds: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		sapling="default",						-- Saplings: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		marshbush="default",					-- Spiky Bushes:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		trees="default",						-- Trees (All)					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		
		-- CREATURES/SPAWNERS (QUANTITY GENERATED)
		bunnymen_setting="default",				-- Rabbit Hutches: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		rocky_setting="default",				-- Rock Lobsters:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		slurper="default", 						-- Slurpers: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		slurtles_setting="default",				-- Slurtle Mounds: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		monkey_setting="default",				-- Splumonkey Pods: 			"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	
		-- HOSTILE CREATURES/SPAWNER (QUANTITY GENERATED)
		bats="default", 						-- Bats: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		worms="default", 						-- Cave Worms:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		chess="default",						-- Clockworks: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		fissure="default", 						-- Nightmare Fissures: 			"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		spiders_setting="default",				-- Spider Dens:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		cave_spiders="default", 				-- Spilagmites: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
		tentacles="default",					-- Tentacles: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	},
}
