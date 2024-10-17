--There are two functions that will install mods, ServerModSetup and ServerModCollectionSetup. Put the calls to the functions in this file and they will be executed on boot.

--ServerModSetup takes a string of a specific mod's Workshop id. It will download and install the mod to your mod directory on boot.
	--The Workshop id can be found at the end of the url to the mod's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=350811795
	--ServerModSetup("350811795")

--ServerModCollectionSetup takes a string of a specific mod's Workshop id. It will download all the mods in the collection and install them to the mod directory on boot.
	--The Workshop id can be found at the end of the url to the collection's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=379114180
	--ServerModCollectionSetup("1985178092")

--#It's good practice to name your mods here, so you're not confused down the line to what they are if you need to alter/remove them! Make sure the mod/collection IDs exist and publicly viewable in the Steam workshop if they don't show in game! 
--#[API] Gem Core(Now with World Seeds!)
ServerModSetup("1378549454")

--#Island Adventures
ServerModSetup("1467214795")

--#Your Collection Here (You can make your own collections! To see how, go here (after logging into Steam) https://steamcommunity.com/workshop/editcollection/?appid=322330 ) Delete the -- at the front of the entry to enable it!
--ServerModCollectionSetup("##########")
