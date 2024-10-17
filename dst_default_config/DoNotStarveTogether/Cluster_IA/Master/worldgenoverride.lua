--Change whatever settings you want to on your world here, follow the commented out lines to see what possible settings you can have per shard! Some things you should know: 
--Make sure that the spellings match exactly what the commented out lines say, do not forget quotation marks! 
--Make sure each entry has a comma after it, follow the syntax below! If any commas or quotation marks are missing, your worldgenoverride.lua will not work/load! 
--The entries under WORLD SETTINGS can be changed after the world has been generated already, but the entries under WORLD GENERATION cannot be! Check twice before you generate your world!
--The commented out world seed entry is specifically for use with the API Gem Core mod (which lets you generate worlds with world seeds!) Just add your world seed number desired to it, no quotation marks required! 
--If you made it all the way to the end, thank you for reading! Have a cookie 🍪
return {
	override_enabled = true,	
	settings_preset = "SURVIVAL_TOGETHER", 		-- "SURVIVAL_TOGETHER", "MOD_MISSING", "SURVIVAL_TOGETHER_CLASSIC", "SURVIVAL_DEFAULT_PLUS", "COMPLETE_DARKNESS", "DST_CAVE", "DST_CAVE_PLUS"
	worldgen_preset = "SURVIVAL_TOGETHER", 		-- "SURVIVAL_TOGETHER", "MOD_MISSING", "SURVIVAL_TOGETHER_CLASSIC", "SURVIVAL_DEFAULT_PLUS", "COMPLETE_DARKNESS", "DST_CAVE", "DST_CAVE_PLUS"
	overrides={
---------------------------WORLD SETTINGS (CAN BE CHANGED POST WORLDGEN AND AFFECT WORLD)---------------------------
	-- GLOBAL
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

	-- EVENTS
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

	-- SURVIVORS
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
	hounds="default",						-- Hound Attacks: 				"never", "rare", "default", "often", "always"
	winterhounds="default",					-- Ice Hound Waves: 			"never", "default"
	summerhounds="default",					-- Fire Hound Waves: 			"never", "default"
	petrification="default", 				-- Forest Petrification:		"none", "few", "default", "many", "always"
	frograin="default",						-- Frog Rain: 					"never", "rare", "default", "often", "always"
	alternatehunt="default",				-- Hunt Surprises: 				"never", "rare", "default", "often", "always"
	hunt="default",							-- Hunts: 						"never", "rare", "default", "often", "always"
	lightning="default",					-- Lightning: 					"never", "rare", "default", "often", "always"
	meteorshowers="default",				-- Meteor Frequency: 			"never", "rare", "default", "often", "always"
	weather="default",						-- Rain:						"never", "rare", "default", "often", "always"
	rifts_frequency="default",				-- Wild Rift Frequency:			"never", "rare", "default", "often", "always"
	rifts_enabled="default",				-- Wild Rifts Enabled: 			"default", "always", "never"	
	wildfires="default",					-- Wildfires: 					"never", "rare", "default", "often", "always"

	-- RESOURCE REGROWTH
   	regrowth="default",						-- Regrowth Multiplier: 		"never", "veryslow", "slow", "default", "fast", "veryfast"
	basicresource_regrowth="none",			-- Basic Resources: 			"always", "none" 
	deciduoustree_regrowth="default",		-- Birchnut Trees: 				"never", "veryslow", "slow", "default", "fast", "veryfast"
	cactus_regrowth="default",				-- Cacti: 						"never", "veryslow", "slow", "default", "fast", "veryfast"
	carrots_regrowth="default",				-- Carrots: 					"never", "veryslow", "slow", "default", "fast", "veryfast"
	evergreen_regrowth="default",			-- Evergreens:					"never", "veryslow", "slow", "default", "fast", "veryfast"
	flowers_regrowth="default",				-- Flowers:						"never", "veryslow", "slow", "default", "fast", "veryfast"
	moon_tree_regrowth="default",			-- Lune Trees: 					"never", "veryslow", "slow", "default", "fast", "veryfast"
	palmconetree_regrowth="default",		-- Palmcone Tree: 				"never", "veryslow", "slow", "default", "fast", "veryfast"
	reeds_regrowth="default",				-- Reeds: 						"never", "veryslow", "slow", "default", "fast", "veryfast"
	saltstack_regrowth="default",			-- Salt Formations:				"never", "veryslow", "slow", "default", "fast", "veryfast"
	twiggytrees_regrowth="default",			-- Twiggy Trees:				"never", "veryslow", "slow", "default", "fast", "veryfast"
	
	-- UNNATURAL PORTAL RESOURCES
	bananabush_portalrate="default",		-- Banana Bushes: 				"never", "rare", "default", "often", "always"
	lightcrab_portalrate="default",			-- Crustashines: 				"never", "rare", "default", "often", "always"
	monkeytail_portalrate="default",		-- Monkeytails:					"never", "rare", "default", "often", "always"
	palmcone_seed_portalrate="default",		-- Palmcone Sprouts:			"never", "rare", "default", "often", "always"
	portal_spawnrate="default",				-- Portal Activity: 			"never", "rare", "default", "often", "always"
	powder_monkey_portalrate="default",		-- Powder Monkeys:				"never", "rare", "default", "often", "always"

	-- CREATURES (SPAWN RATES)
	bees="default",							-- Bees: 						"never", "rare", "default", "often", "always"
	birds="default",						-- Birds: 						"never", "rare", "default", "often", "always"
	bunnymen_setting="default",				-- Bunnymen: 					"never", "rare", "default", "often", "always"
	butterfly="default",					-- Butterflies: 				"never", "rare", "default", "often", "always"
	catcoons="default",						-- Catcoons: 					"never", "rare", "default", "often", "always"
	gnarwail="default",						-- Gnarwails: 					"never", "rare", "default", "often", "always"
	perd="default",							-- Gobblers:					"never", "rare", "default", "often", "always"
	grassgekkos="default",					-- Grass Gekko Morphing: 		"never", "rare", "default", "often", "always"
	moles="default",						-- Moles: 						"never", "rare", "default", "often", "always"
	penguins="default",						-- Pengulls: 					"never", "rare", "default", "often", "always"
	pigs="default",							-- Pigs:						"never", "rare", "default", "often", "always"
	rabbits="default",						-- Rabbits:						"never", "rare", "default", "often", "always"
	fishschools="default",					-- Schools of Fish: 			"never", "rare", "default", "often", "always"
	wobsters="default",						-- Wobsters: 					"never", "rare", "default", "often", "always"

	-- HOSTILE CREATURES (SPAWN RATES)
   	bats_setting="default",					-- Bats:						"never", "rare", "default", "often", "always"
	cookiecutters="default",				-- Cookie Cutters:				"never", "rare", "default", "often", "always"
	frogs="default",						-- Frogs: 						"never", "rare", "default", "often", "always"
	mutated_hounds="default",				-- Horror Hounds: 				"never", "default"
	houndmound="default",					-- Hounds: 						"never", "rare", "default", "often", "always"
	wasps="default",						-- Killer Bees:					"never", "rare", "default", "often", "always"
	lureplants="default",					-- Lureplants: 					"never", "rare", "default", "often", "always"
	walrus="default",						-- MacTusk: 					"never", "rare", "default", "often", "always"
	merm="default",							-- Merms:						"never", "rare", "default", "often", "always"
	pirateraids="default",					-- Moon Quay Pirates: 			"never", "rare", "default", "often", "always"
	penguins_moon="default",				-- Moonrock Pengulls: 			"never", "default"
	mosquitos="default",					-- Mosquitos:					"never", "rare", "default", "often", "always"
	sharks="default",						-- Sharks:						"never", "rare", "default", "often", "always"
	moon_spiders="default",					-- Shattered Spiders:			"never", "rare", "default", "often", "always"
	squid="default",						-- Skittersquids: 				"never", "rare", "default", "often", "always"
	spider_warriors="default",				-- Spider Warriors: 			"never", "default"
	spiders="default",						-- Spiders:						"never", "rare", "default", "often", "always"

	-- GIANTS (SPAWN RATES)
	antliontribute="default",				-- Antlion Tribute: 			"never", "rare", "default", "often", "always"
	bearger="default",						-- Bearger: 					"never", "rare", "default", "often", "always"
	beequeen="default",						-- Bee Queen: 					"never", "rare", "default", "often", "always"
	crabking="default",						-- Crabking: 					"never", "rare", "default", "often", "always"
	deerclops="default",					-- Deerclops:					"never", "rare", "default", "often", "always"
	dragonfly="default",					-- Dragonfly: 					"never", "rare", "default", "often", "always"
	eyeofterror="default",					-- Eye of Terror: 				"never", "rare", "default", "often", "always"
	klaus="default",						-- Klaus: 						"never", "rare", "default", "often", "always"
	fruitfly="default",						-- Lord of the Fruit Flies:		"never", "rare", "default", "often", "always"
	malbatross="default",					-- Malbatross: 					"never", "rare", "default", "often", "always"
	goosemoose="default",					-- Meese/Geese:					"never", "rare", "default", "often", "always"
	deciduousmonster="default",				-- Poison Birchnut Trees:		"never", "rare", "default", "often", "always"
	spiderqueen="default",					-- Spider Queen:				"never", "rare", "default", "often", "always"
	liefs="default",						-- Treeguards: 					"never", "rare", "default", "often", "always"

---------------------------WORLD GENERATION (CANNOT BE CHANGED POST WORLDGEN AND AFFECT WORLD)---------------------------    
	-- GLOBAL
	season_start="default",					-- Starting Season: 			"default", "winter", "spring", "summer", "autumn|spring", "winter|summer", "autumn|winter|spring|summer"

	-- WORLD
	task_set="default",						-- Biomes: 						"default", "cave_default", "quagmire_taskset", "classic", "lavaarena_taskset"
	start_location="default",				-- Spawn Area: 					"lavaarena", "plus", "darkness", "quagmire_startlocation", "caves", "default"
	world_size="default",					-- World Size:					"small", "medium", "default", "huge"
	branching="default",					-- Branches: 					"never", "least", "default", "most", "random"
	loop="default",							-- Loops:						"never", "default", "always"
	roads="default",						-- Roads: 						"never", "default"
	touchstone="default",					-- Touch Stones:				"never", "rare", "uncommon", "default", "often", "mostly", "always"
	boons="default",						-- Failed Survivors: 			"never", "rare", "uncommon", "default", "often", "mostly", "always"
	prefabswaps_start="default",			-- Starting Resource Variety: 	"classic", "default", "highly random"
	moon_fissure="default",					-- Celestial Fissures: 			"never", "rare", "uncommon", "default", "often", "mostly", "always"
	stageplays="default",					-- Stage Plays:					"never","default"
	terrariumchest="default",				-- Terrarium:					"never", "default"

	-- RESOURCES (QUANTITY GENERATED)
	moon_starfish="default",				-- Anenemies:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moon_bullkelp="default",				-- Beached Bull Kelp:			"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	berrybush="default",					-- Berry Bushes:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	rock="default",							-- Boulders:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	ocean_bullkelp="default",				-- Bull Kelp: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	cactus="default",						-- Cacti: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	carrot="default",						-- Carrots:						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	flint="often",							-- Flint: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	flowers="default",						-- Flowers, Evil Flowers:		"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	grass="default",						-- Grass: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moon_hotspring="default",				-- Hot Springs:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moon_rock="default",					-- Lunar Rocks:					"never", "rare", "uncommon", "default", "often", "mostly", "always"	, "insane"
	moon_sapling="default",					-- Lunar Saplings;				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moon_tree="default",					-- Lune Trees: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	meteorspawner="default",				-- Meteor Fields:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	rock_ice="default",						-- Mini Glaciers:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	mushroom="default",						-- Mushrooms:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	palmconetree="default",					-- Palmcone Tree:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	ponds="default",						-- Ponds:						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	reeds="default",						-- Reeds:						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	sapling="default",						-- Saplings:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	ocean_seastack="ocean_default",			-- Sea Stacks:					"ocean_never", "ocean_rare", "ocean_uncommon", "ocean_default", "ocean_often", "ocean_mostly", "ocean_always", "ocean_insane"
	marshbush="default",					-- Spiky Bushes:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moon_berrybush="default",				-- Stone Fruit Bushes:			"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	trees="default",						-- Trees (All):					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	tumbleweed="default",					-- Tumbleweeds:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"

	-- CREATURES AND SPAWNERS (QUANTITY GENERATED)
	bees_setting="default",					-- Bee Hives: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	beefalo="default",						-- Beefalos: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	buzzard="default",						-- Buzzards: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moon_carrot="default",					-- Carrats: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	catcoon="default",						-- Hollow Stump:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moles_setting="default",				-- Mole Burrows: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	pigs_setting="default",					-- Pig Houses: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	rabbits_setting="default",				-- Rabbit Holes: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	moon_fruitdragon="default",				-- Saladmander: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	ocean_shoal="default",					-- Shoals: 						"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	lightninggoat="default",				-- Volt Goats: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	ocean_wobsterden="default",				-- Wobster Mounds:				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"

	-- HOSTILE CREATURES/SPAWNERS (QUANTITY GENERATED)
	chess="default",						-- Clockworks: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	hound_mounds="default",					-- Hound Mounds: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	angrybees="default",					-- Killer Bee Hives: 			"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	merms="default",						-- Leaky Shack: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	walrus_setting="default",				-- MacTusk Camps: 				"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	ocean_waterplant="ocean_default",		-- Sea Weeds: 					"ocean_never", "ocean_rare", "ocean_uncommon", "ocean_default", "ocean_often", "ocean_mostly", "ocean_always", "ocean_insane"
	moon_spider="default",					-- Shattered Spider Holes:		"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	spiders_setting="default",				-- Spider Dens:					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	tallbirds="default",					-- Tallbirds: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
	tentacles="default",					-- Tentacles: 					"never", "rare", "uncommon", "default", "often", "mostly", "always", "insane"
       
	-- MISC
	--worldseed=,                     	        -- world seed #
	},
}
