local OnPlayerSpawn = function(src, player)
    player.prev_OnNewSpawn = player.OnNewSpawn
    player.OnNewSpawn = function()
   
        local start_items = {}
        
        --for season starting items
        if GetModConfigData("is_season_items") == 1 then
            --for spring
            if GLOBAL.TheWorld.state.isspring or (GLOBAL.TheWorld.state.iswinter and GLOBAL.TheWorld.state.remainingdaysinseason < 3) then
                table.insert(start_items, "umbrella")
            end
            --for summer
            if GLOBAL.TheWorld.state.issummer or (GLOBAL.TheWorld.state.isspring and GLOBAL.TheWorld.state.remainingdaysinseason < 3) then
                table.insert(start_items, "heatrock")
                table.insert(start_items, "watermelonhat")
                for i = 1, GetModConfigData("food_give") do table.insert(start_items, "meatballs") end
            end
            --for winter
            if GLOBAL.TheWorld.state.iswinter or (GLOBAL.TheWorld.state.isautumn and GLOBAL.TheWorld.state.remainingdaysinseason < 3) then
    			table.insert(start_items, "heatrock")
                table.insert(start_items, "earmuffshat")
                for i = 1, GetModConfigData("food_give") do table.insert(start_items, "meatballs") end
            end
        end

        --for all season
        for i = 1, GetModConfigData("num_goldnugget") do table.insert(start_items, "goldnugget") end
        for i = 1, GetModConfigData("num_flint") do table.insert(start_items, "flint") end
        for i = 1, GetModConfigData("num_rocks") do table.insert(start_items, "rocks") end
        for i = 1, GetModConfigData("num_log") do table.insert(start_items, "log") end
        for i = 1, GetModConfigData("num_cutgrass") do table.insert(start_items, "cutgrass") end
        for i = 1, GetModConfigData("num_twigs") do table.insert(start_items, "twigs") end

        for k,v in pairs(start_items) do
            local item = GLOBAL.SpawnPrefab(v)
            
            player.components.inventory:GiveItem(item)
        end   
         
        if player.prev_OnNewSpawn ~= nil then
            player:prev_OnNewSpawn()
            player.prev_OnNewSpawn = nil
        end
    end
end


local function ListenForPlayers(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:ListenForEvent("ms_playerspawn", OnPlayerSpawn)
    end
end

AddPrefabPostInit("world", ListenForPlayers)