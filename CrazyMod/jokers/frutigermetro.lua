
SMODS.Joker{ --Frutiger Metro
    key = "frutigermetro",
    config = {
        extra = {
            FrutigerMoney = 4
        }
    },
    loc_txt = {
        ['name'] = 'Frutiger Metro',
        ['text'] = {
            [1] = 'Cards held in hand with a',
            [2] = 'Frutiger Seal earn {C:money}+$#1#{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FrutigerMoney}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card.seal == "Crazymod_frutigerseal" then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.FrutigerMoney
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.FrutigerMoney), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}