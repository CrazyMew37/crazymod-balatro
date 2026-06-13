
SMODS.Joker{ --Gray Cat
    key = "graycat",
    config = {
        extra = {
            GrayCatMult = 1.18,
            GrayCatHands = 9
        }
    },
    loc_txt = {
        ['name'] = 'Gray Cat',
        ['text'] = {
            [1] = '{C:purple}+#2#{} Hands and Discards',
            [2] = '{X:purple,C:white}^#1#{} Chips and Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 37,
    rarity = "crazymod_crazy",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.GrayCatMult, card.ability.extra.GrayCatHands}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_chips = card.ability.extra.GrayCatMult,
                extra = {
                    e_mult = card.ability.extra.GrayCatMult,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.GrayCatHands
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.GrayCatHands
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.GrayCatHands
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.GrayCatHands
    end
}