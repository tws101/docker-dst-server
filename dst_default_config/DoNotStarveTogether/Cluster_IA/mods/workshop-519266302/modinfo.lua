name = "Season Starting Items"
description = "Players will be given items (such as grass, twigs, flint, etc) when first join a server no mater which season and special equipments to survive when it's spring, summer or winter."
author = "[BSy]Jupiter"
version = "1.0.2"

forumthread = ""

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true

api_version =  10

all_clients_require_mod = false
client_only_mod = false

----------------------
-- General settings --
----------------------

configuration_options =
{
	{
		name = "is_season_items",
		label = "Give Season Items",
		hover = "",
		options =	{
						{description = "Yes", data = 1, hover = ""},
						{description = "No", data = 0, hover = ""},
					},
		default = 1,
	},
	{
		name = "food_give",
		label = "Give Foods",
		hover = "Give food when summer and winter.",
		options =	{
						{description = "No", data = 0, hover = ""},
						{description = "1", data = 1, hover = ""},
						{description = "2", data = 2, hover = ""},
						{description = "3", data = 3, hover = ""},
						{description = "4", data = 4, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "6", data = 6, hover = ""},
						{description = "7", data = 7, hover = ""},
					},
		default = 4,
	},
	{
		name = "num_goldnugget",
		label = "Give Gold Nugget",
		hover = "",
		options =	{
						{description = "No", data = 0, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "15", data = 15, hover = ""},
						{description = "20", data = 20, hover = ""},
					},
		default = 5,
	},
	{
		name = "num_flint",
		label = "Give Flint",
		hover = "",
		options =	{
						{description = "No", data = 0, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "15", data = 15, hover = ""},
						{description = "20", data = 20, hover = ""},
						{description = "25", data = 25, hover = ""},
						{description = "30", data = 30, hover = ""},
						{description = "35", data = 35, hover = ""},
						{description = "40", data = 40, hover = ""},
					},
		default = 20,
	},
	{
		name = "num_rocks",
		label = "Give Rocks",
		hover = "",
		options =	{
						{description = "No", data = 0, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "15", data = 15, hover = ""},
						{description = "20", data = 20, hover = ""},
						{description = "25", data = 25, hover = ""},
						{description = "30", data = 30, hover = ""},
						{description = "35", data = 35, hover = ""},
						{description = "40", data = 40, hover = ""},
					},
		default = 20,
	},
	{
		name = "num_log",
		label = "Give Log",
		hover = "",
		options =	{
						{description = "No", data = 0, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "15", data = 15, hover = ""},
						{description = "20", data = 20, hover = ""},
						{description = "25", data = 25, hover = ""},
						{description = "30", data = 30, hover = ""},
						{description = "35", data = 35, hover = ""},
						{description = "40", data = 40, hover = ""},
					},
		default = 20,
	},
	{
		name = "num_cutgrass",
		label = "Give Grass",
		hover = "",
		options =	{
						{description = "No", data = 0, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "15", data = 15, hover = ""},
						{description = "20", data = 20, hover = ""},
						{description = "25", data = 25, hover = ""},
						{description = "30", data = 30, hover = ""},
						{description = "35", data = 35, hover = ""},
						{description = "40", data = 40, hover = ""},
					},
		default = 20,
	},
	{
		name = "num_twigs",
		label = "Give Twigs",
		hover = "",
		options =	{
						{description = "No", data = 0, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "15", data = 15, hover = ""},
						{description = "20", data = 20, hover = ""},
						{description = "25", data = 25, hover = ""},
						{description = "30", data = 30, hover = ""},
						{description = "35", data = 35, hover = ""},
						{description = "40", data = 40, hover = ""},
					},
		default = 20,
	},
}