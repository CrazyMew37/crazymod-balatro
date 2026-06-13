
SMODS.Joker{ --Canvas
    key = "canvas",
    config = {
        extra = {
            CanvasChips = 1,
            CanvasGain = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Canvas',
        ['text'] = {
            [1] = 'This joker gains {X:blue,C:white}X0.1{} Chips',
            [2] = 'every time a {C:inactive}Paint Color{} is used',
            [3] = '{C:inactive}(Currently{} {X:blue,C:white}X1{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.CanvasChips, card.ability.extra.CanvasGain}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.CanvasChips
            }
        end
        if context.using_consumeable  then
            if (context.consumeable and (context.consumeable.ability.set == 'color' or context.consumeable.ability.set == 'paint_color') or context.consumeable and (context.consumeable.ability.set == 'paint_color' or context.consumeable.ability.set == 'rare_paint_color') and context.consumeable.config.center.key == 'c_crazymod_brown') then
            end
        end
    end
}