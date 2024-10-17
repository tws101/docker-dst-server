--Change whatever settings you want to on your world here, follow the commented out lines to see what possible settings you can have per shard! Some things you should know: 
--Make sure that the spellings match exactly what the commented out lines say, do not forget quotation marks! 
--Make sure each entry has a comma after it, follow the syntax below! If any commas or quotation marks are missing, your worldgenoverride.lua will not work/load! 
--The entries under WORLD SETTINGS can be changed after the world has been generated already, but the entries under WORLD GENERATION cannot be! Check twice before you generate your world!
--The commented out world seed entry is specifically for use with the API Gem Core mod (which lets you generate worlds with world seeds!) Just add your world seed number desired to it, no quotation marks required! 
--If you made it all the way to the end, thank you for reading! Have a cookie 🍪
return {
	override_enabled = true,	
	settings_preset = "DST_CAVE", 			-- "SURVIVAL_TOGETHER", "MOD_MISSING", "SURVIVAL_TOGETHER_CLASSIC", "SURVIVAL_DEFAULT_PLUS", "COMPLETE_DARKNESS", "DST_CAVE", "DST_CAVE_PLUS"
	worldgen_preset = "DST_CAVE", 			-- "SURVIVAL_TOGETHER", "MOD_MISSING", "SURVIVAL_TOGETHER_CLASSIC", "SURVIVAL_DEFAULT_PLUS", "COMPLETE_DARKNESS", "DST_CAVE", "DST_CAVE_PLUS"
	overrides={
---------------------------WORLD SETTINGS (CAN BE CHANGED POST WORLDGEN AND AFFECT WORLD)---------------------------
-- *** IS REPEATED IN CASE YOU ARE HOSTING CAVES ONLY + SOME SETTINGS NEED TO BE SET FOR BOTH SHARDS, OR CAN BE DIFFERENT BETWEEN MASTER AND CAVES
	-- GLOBAL***
	specialevent= "default",				-- Events: 						"none", "default"
	autumn="default",						-- Autumn: 						"noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
	winter="default",						-- Winter: 						"noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
	spring="default",						-- Spring: 						"noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
	summer="default",						-- Summer: 						"noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
	day="default",							-- Day Type: 					"default", "longday", "longdusk", "longnight", "noday", "nodusk", "nonight", "onlyday", "onlydusk", "onlynight"
	spawnmode="fixed",						-- Spawn Mode: 					"fixed","scatter"
	ghostenabled="always",					-- Survivor Death: 				"always","none"
	portalresurection="none",				-- Revive at Florid Postern:	"always","none"
	ghostsanitydrain="always",				-- Ghost Sanity Drain:			"always","none"
	resettime="default",					-- Death Reset Timer:			"none","slow","default","fast","always"
	beefaloheat="default",					-- Beefalo Mating Frequency:	"never", "rare", "default", "often", "always"
	krampus="default",						-- Krampii: 					"never", "rare", "default", "often", "always"

	-- EVENTS***
	crow_carnival="default",				-- Midsummer Cawnival: 			"default", "enabled"
	hallowed_nights="default",				-- Hallowed Nights:				"default", "enabled"
	winters_feast="default",				-- Winter's Feast:				"default", "enabled"
	year_of_the_gobbler="default",			-- Year of the Gobbler:			"default", "enabled"
	year_of_the_varg="default", 			-- Year of the Varg: 			"default", "enabled"
	year_of_the_pig="default",				-- Year of the Pig King: 		"default", "enabled"
	year_of_the_carrat="default",			-- Year of the Carrat: 			"default", "enabled"
	year_of_the_beefalo="default",			-- Year of the Beefalo: 		"default", "enabled"
	year_of_the_catcoon="default",			-- Year of the Catcoon: 		"default", "enabled"
	year_of_the_bunnyman="default",			-- Year of the Bunnyman: 		"default", "enabled"

	-- SURVIVORS***
	extrastartingitems="default",			-- Extra Starting Resources: 	"0", "5", "default", "15", "20", "none"
	seasonalstartingitems="default",		-- Seasonal Starting Items: 	"none", "default",
	spawnprotection="default",				-- Griefer Spawn Protection:	"none", "default", "always"
	dropeverythingondespawn="default",		-- Drop Items on Disconnect: 	"default", "always",
	healthpenalty="always",					-- Max Health Penalty:			"always","none"
	lessdamagetaken="none",					-- Damage Taken: 				"always","none","more"
	temperaturedamage="default",			-- Temperature Damage:			"default","nonlethal"
	hunger="default",						-- Hunger Damage: 				"default","nonlethal"
	darkness="default",						-- Darkness Damage: 			"default","nonlethal"
	shadowcreatures="default",				-- Sanity Monsters: 			"never", "rare", "default", "often", "always"
	brightmarecreatures="default",			-- Enlightenment Monsters: 		"never", "rare", "default", "often", "always"

	-- WORLD
	atriumgate="default",					-- Ancient Gateway: 			"veryslow", "slow", "default", "fast", "veryfast"
	wormattacks="default",					-- Cave Worm Attacks:			"never", "rare", "default", "often", "always"
	earthquakes="default", 					-- Earthquakes:					"never", "rare", "default", "often", "always"
	weather="default",						-- Rain: 						"never", "rare", "default", "often", "always"
	rifts_frequency_cave="default",			-- Wild Rift Frequency: 		"never", "rare", "default", "often", "always"
	rifts_enabled_cave="default",			-- Wild Rifts Enabled:			"default", "always", "never"

	-- RESOURCE REGROWTH
	regrowth="default",						-- Regrowth Multiplier: 		"never", "veryslow", "slow", "default", "fast", "veryfast"
	flower_cave_regrowth="default",			-- Light Flower:				"never", "veryslow", "slow", "default", "fast", "veryfast"
	lightflier_flower_regrowth="default",	-- Lightbug Flower:				"never", "veryslow", "slow", "default", "fast", "veryfast"
	mushtree_moon_regrowth="default",		-- Lunar Mushtrees:				"never", "veryslow", "slow", "default", "fast", "veryfast"
	mushtree_regrowth="default",			-- Mushroom Trees:				"never", "veryslow", "slow", "default", "fast", "veryfast"

	-- CREATURES (SPAWN RATES)
	lightfliers="default",					-- Bulbous Lightbugs: 			"never", "rare", "default", "often", "always"
	bunnymen="default", 					-- Bunnymen: 					"never", "rare", "default", "often", "always"
	dustmoths="default",					-- Dust Moths:					"never", "rare", "default", "often", "always"
	grassgekkos="default",					-- Grass Gekko Morphing: 		"never", "rare", "default", "often", "always"
	moles_setting="default",				-- Moles:						"never", "rare", "default", "often", "always"
	mushgnome="default",					-- Mush Gnomes:					"never", "rare", "default", "often", "always"
	pigs_setting="default",					-- Pigs:						"never", "rare", "default", "often", "always"	
	rocky="default", 						-- Rock Lobsters: 				"never", "rare", "default", "often", "always"
	slurtles="default", 					-- Slurtles:					"never", "rare", "default", "often", "always"
	snurtles="default",						-- Snurtles:					"never", "rare", "default", "often", "always"
	monkey="default", 						-- Splumonkeys:					"never", "rare", "default", "often", "always"
	
	-- HOSTILE CREATURES (SPAWN RATES)
	bats_setting="default",					-- Bats:						"never", "rare", "default", "often", "always"
	spider_hider="default",					-- Cave Spiders:				"never", "rare", "default", "often", "always"
	spider_dropper="default",				-- Dangling Depth Dwellers:		"never", "rare", "default", "often", "always"
	merms="default",						-- Merms:						"never", "rare", "default", "often", "always"
	molebats="default",						-- Naked Mole Bats:				"never", "rare", "default", "often", "always"
	nightmarecreatures="default",			-- Ruins Nightmares:			"never", "rare", "default", "often", "always"
	spider_warriors="default",				-- Spider Warriors:				"never", "default"
	spiders="default",						-- Spiders:						"never", "rare", "default", "often", "always"
	spider_spitter="default",				-- Spitter Spiders: 			"never", "rare", "default", "often", "always"

	-- GIANTS (SPAWN RATES)
	fruitfly="default",						-- Lord of the Fruit Flies: 	"never", "rare", "default", "often", "always"
	daywalker="default",					-- Nightmare Werepig: 			"never", "rare", "default", "often", "always"
	spiderqueen="default",					-- Spider Queen:				"never", "rare", "default", "often", "always"
	toadstool="default",					-- Toadstool:					"never", "rare", "default", "often", "always"
	liefs="default",						-- Treeguards:					"never", "rare", "default", "often", "always"
	
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

	-- MISC
	--worldseed=,                     	        -- world seed #
	},
}
