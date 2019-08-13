if minetest.global_exists("armor") and minetest.global_exists("more_monoids") then
    armor:register_armor("titanium:sam_titanium", {
        description = "Night Vision Goggles",
        inventory_image = "sam_titanium.png",
        texture = "goggles_texture",
        preview = "goggles_preview",
        armor_groups = {fleshy=0},
        groups = {
            armor_head = 1,
            armor_use = 0,
            armor_heal = 0,
            armor_water = 0,
            armor_fire = 0,
            physics_speed = 0,
            physics_gravity = 0,
            physics_jump = 0,
        },
        damage_groups = {},

        on_equip = function(player, index, stack)
            more_monoids.sunlight_monoid:add_change(player, 1, "titanium:goggles")
        end,
        on_unequip = function(player, index, stack)
            more_monoids.sunlight_monoid:del_change(player, "titanium:goggles")
        end,
    })

    minetest.register_craft({
        output = "titanium:sam_titanium",
        recipe = {
            {"titanium:titanium_plate", "terumet:block_tglassglow",     "titanium:titanium_plate"},
            {"titanium:glass",          "titanium:titanium_plate",      "titanium:glass"},
            {"titanium:titanium_plate", "terumet:item_batt_therm_full", "titanium:titanium_plate"},
        }
    })

    -- terumet.register_repairable_item

else
    minetest.register_craftitem("titanium:sam_titanium", {
        description = "Night Vision Goggles",
        inventory_image = "sam_titanium.png",
        wield_image = "sam_titanium.png",
    })
end

