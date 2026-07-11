
SMODS.Joker{ --Pot of Gold
    key = "potofgold",
    config = {
        extra = {
            PotMoney = 4
        }
    },
    loc_txt = {
        ['name'] = 'Pot of Gold',
        ['text'] = {
            [1] = 'Gain an additional {C:money}+$#1#{} from cards',
            [2] = 'with a {C:attention}Rainbow Seal{} held in hand at',
            [3] = 'the end of the round.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 11
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
        
        return {vars = {card.ability.extra.PotMoney}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.end_of_round  then
            if context.other_card.seal == "Crazymod_rainbowseal" then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.PotMoney
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.PotMoney), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}