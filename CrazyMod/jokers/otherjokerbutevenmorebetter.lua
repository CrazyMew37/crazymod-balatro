
SMODS.Joker{ --Other Joker but Even More Better
    key = "otherjokerbutevenmorebetter",
    config = {
        extra = {
            JymboMult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Other Joker but Even More Better',
        ['text'] = {
            [1] = '{X:chips,C:money}^#1#{} Chips',
            [2] = '{s:0.75,C:inactive}\"I\'m Jymbo! I\'m not{}',
            [3] = '{s:0.75,C:inactive}related to anyone!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.JymboMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.JymboMult
            }
        end
    end
}