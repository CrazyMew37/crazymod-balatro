
SMODS.Joker{ --Pixel Joker
    key = "pixeljoker",
    config = {
        extra = {
            pixelchip = 1
        }
    },
    loc_txt = {
        ['name'] = 'Pixel Joker',
        ['text'] = {
            [1] = '{s:100,C:blue}+#1# {}{s:10}Chip{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.pixelchip}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.pixelchip
            }
        end
    end
}