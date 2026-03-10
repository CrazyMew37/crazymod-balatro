
SMODS.Joker{ --Joker but Better
    key = "jokerbutbetter",
    config = {
        extra = {
            JamboMult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Joker but Better',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult',
            [2] = '{s:0.75,C:inactive}\"I\'m Jimbo\'s silly{}',
            [3] = '{s:0.75,C:inactive}niece, Jambo!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.JamboMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.JamboMult
            }
        end
    end
}