
SMODS.Joker{ --Joker but Even More Better
    key = "jokerbutevenmorebetter",
    config = {
        extra = {
            JomboMult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Joker but Even More Better',
        ['text'] = {
            [1] = '{X:mult,C:money}^#1#{} Mult',
            [2] = '{s:0.75,C:inactive}\"I\'m Jimbo\'s weird{}',
            [3] = '{s:0.75,C:inactive}great uncle, Jombo!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        
        return {vars = {card.ability.extra.JomboMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_chips = card.ability.extra.JomboMult
            }
        end
    end
}