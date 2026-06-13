
SMODS.Joker{ --Other Joker but Better
    key = "otherjokerbutbetter",
    config = {
        extra = {
            JemboMult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Other Joker but Better',
        ['text'] = {
            [1] = '{X:chips,C:white}X#1#{} Chips',
            [2] = '{s:0.75,C:inactive}\"I\'m Jumbo\'s wacky{}',
            [3] = '{s:0.75,C:inactive}twin sister, Jembo!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        return {vars = {card.ability.extra.JemboMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.JemboMult
            }
        end
    end
}