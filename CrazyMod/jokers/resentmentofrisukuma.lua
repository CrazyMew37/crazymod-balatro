
SMODS.Joker{ --Resentment of Risukuma
    key = "resentmentofrisukuma",
    config = {
        extra = {
            RisukumaMoney = 0.2
        }
    },
    loc_txt = {
        ['name'] = 'Resentment of Risukuma',
        ['text'] = {
            [1] = '{X:money,C:white}X#1#{} Money at the end of',
            [2] = 'the round if your deck',
            [3] = 'contains any cards with',
            [4] = '{C:gold}Gold Seals{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "crazymod_garbage",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.RisukumaMoney}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if playing_card.seal == "Gold" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars * card.ability.extra.RisukumaMoney
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.RisukumaMoney), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}