
SMODS.Joker{ --BeMeebEth
    key = "bemeebeth",
    config = {
        extra = {
            BeMeebEthMult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'BeMeebEth',
        ['text'] = {
            [1] = '{X:mult,C:money}^#1#{} Mult if played hand',
            [2] = 'contains a {C:attention}Five of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.BeMeebEthMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Five of a Kind"]) then
                return {
                    e_mult = card.ability.extra.BeMeebEthMult
                }
            end
        end
    end
}