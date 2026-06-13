
SMODS.Booster {
    key = 'palette_pack',
    loc_txt = {
        name = "Palette Pack",
        text = {
            [1] = 'Pick {C:attention}1{} of {C:attention}3{} {C:inactive}Paint Colors{} to keep.'
        },
        group_name = "k_palette_packs"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'Paint Color',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            4.85,
            0.15
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('crazymod_palette_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 2 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 3 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 4 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 5 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 6 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 7 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 8 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 9 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 10 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        elseif selected_index == 11 then
            return {
                set = "rare_paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palette_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffffff"))
        ease_background_colour({ new_colour = HEX('ffffff'), special_colour = HEX("996600"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'palettepack2',
    loc_txt = {
        name = "Palette Pack",
        text = {
            [1] = 'Pick {C:attention}1{} of {C:attention}3{} {C:inactive}Paint Colors{} to keep.'
        },
        group_name = "k_palette_packs"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    kind = 'Paint Color',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            4.85,
            0.15
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('crazymod_palettepack2_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 2 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 3 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 4 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 5 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 6 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 7 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 8 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 9 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 10 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        elseif selected_index == 11 then
            return {
                set = "rare_paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_palettepack2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffffff"))
        ease_background_colour({ new_colour = HEX('ffffff'), special_colour = HEX("996600"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'jumbo_palette_pack',
    loc_txt = {
        name = "Jumbo Palette Pack",
        text = {
            [1] = 'Pick {C:attention}1{} of {C:attention}5{} {C:inactive}Paint Colors{} to keep.'
        },
        group_name = "k_palette_packs"
    },
    config = { extra = 5, choose = 1 },
    cost = 6,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    kind = 'Paint Color',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            4.85,
            0.15
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('crazymod_jumbo_palette_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 2 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 3 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 4 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 5 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 6 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 7 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 8 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 9 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 10 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        elseif selected_index == 11 then
            return {
                set = "rare_paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_jumbo_palette_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffffff"))
        ease_background_colour({ new_colour = HEX('ffffff'), special_colour = HEX("996600"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'mega_palette_pack',
    loc_txt = {
        name = "Mega Palette Pack",
        text = {
            [1] = 'Pick {C:attention}2{} of {C:attention}5{} {C:inactive}Paint Colors{} to keep.'
        },
        group_name = "k_palette_packs"
    },
    config = { extra = 5, choose = 2 },
    cost = 8,
    weight = 0.25,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    kind = 'Paint Color',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            5,
            4.85,
            0.15
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('crazymod_mega_palette_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 2 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 3 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 4 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 5 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 6 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 7 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 8 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 9 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 10 then
            return {
                set = "paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        elseif selected_index == 11 then
            return {
                set = "rare_paint_color",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "crazymod_mega_palette_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffffff"))
        ease_background_colour({ new_colour = HEX('ffffff'), special_colour = HEX("996600"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
