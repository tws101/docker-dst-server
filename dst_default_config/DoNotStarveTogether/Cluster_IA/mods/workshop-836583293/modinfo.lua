-- This information tells other players more about the mod
name = "Item Info"
description = "Displays items' values & more! v0.52"
author = "Ryuu"
version = "0.53"

icon_atlas = "item_info.xml"
icon = "item_info.tex"

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
-- Example:
-- http://forums.kleientertainment.com/showthread.php?19505-Modders-Your-new-friend-at-Klei!
-- becomes
-- 19505-Modders-Your-new-friend-at-Klei!
forumthread = "25059-Download-Sample-Mods"

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version_dst = 10

priority = 100

-- Only compatible with DST
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true


--This lets clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = true

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {""}

MarginValues = {}
for i=1, 101 do
	MarginValues[i] = {description = "" .. ((i - 1)) * 10, data = ((i - 1) * 10)}
end

ScaleValues = {}
for i=1, 15 do
	ScaleValues[i] = {description = "" .. (i/10), data = (i/10)}
end

configuration_options =
{
	{
		name = "INFO_SCALE",
		label = "Info scale",
		hover = "Sets the tooltips' info scale",
		options =	ScaleValues,
		default = 0.8,
	},
	{
		name = "TIME_FORMAT",
		label = "Time format",
		hover = "Set the display time format",
		options =	{
						{description = "Hours", data = 0},
						{description = "Days", data = 1},
					},
		default = 0,
	},
	{
		name = "PERISHABLE",
		label = "Perish info",
		hover = "Set the way you want to see the stale and perish timer",
		options =	{
						{description = "Perish only", data = 0},
						{description = "Stale>perish", data = 1},
						{description = "Both", data = 2},
					},
		default = 2,
	},
	{
		name = "SHOW_INFO_HANDS",
		label = "Show hands",
		hover = "Set to Yes if you want to see your hands equipped item info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "SHOW_INFO_BODY",
		label = "Show body",
		hover = "Set to Yes if you want to see your body equipped item info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "SHOW_INFO_HEAD",
		label = "Show head",
		hover = "Set to Yes if you want to see your head equipped item info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "EQUIP_SCALE",
		label = "Equipped scale",
		hover = "Sets the equipped item info scale. This doesn't affects the tooltips",
		options =	ScaleValues,
		default = 0.5,
	},
	{
		name = "SHOW_PREFABNAME",
		label = "Prefab name",
		hover = "Set to Yes if you want to display the item's prefab",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "SHOW_BACKGROUND",
		label = "Show background",
		hover = "Set to Yes if you want to see a background behind your equipped item's info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "HORIZONTAL_MARGIN",
		label = "Bottom Margin",
		hover = "Set the equip info bottom margin",
		options =	MarginValues,
		default = 100,
	},
	{
		name = "VERTICAL_MARGIN",
		label = "Right Margin",
		hover = "Set the equip info right margin",
		options =	MarginValues,
		default = 100,
	},
}