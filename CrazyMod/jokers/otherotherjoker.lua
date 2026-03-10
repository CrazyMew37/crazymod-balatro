
SMODS.Joker{ --Other Other Joker
    key = "otherotherjoker",
    config = {
        extra = {
            JwmboMult = 1.02,
            hyperchips_arrows0 = 2,
            hypermult_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Other Other Joker',
        ['text'] = {
            [1] = '{X:enhanced,C:edition}^^#1#{} Chips and Mult if',
            [2] = 'hand does {C:attention}not{} contain',
            [3] = 'a {C:attention}Pair{}',
            [4] = '{s:0.75,C:inactive}\"I\'m Jwmbo. I hate being Jolly.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
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
        
        return {vars = {card.ability.extra.JwmboMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not (next(context.poker_hands["Pair"])) then
                return {
                    hyperchips = {
                        2,
                        card.ability.extra.JwmboMult
                    },
                    extra = {
                        hypermult = {
                            2,
                            card.ability.extra.JwmboMult
                        },
                        colour = G.C.DARK_EDITION
                    }
                }
            end
        end
    end
}