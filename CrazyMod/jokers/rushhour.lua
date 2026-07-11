
SMODS.Joker{ --Rush Hour
    key = "rushhour",
    config = {
        extra = {
            ante_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Rush Hour',
        ['text'] = {
            [1] = 'Sell this card to',
            [2] = 'gain {C:attention}+1{} Ante',
            [3] = '{C:red}Self-destructs{} at the',
            [4] = 'end of the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                
                func = function()
                    
                    local mod = 1
                    ease_ante(mod)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                            return true
                        end,
                    }))
                    return true
                end,
                message = "Vroom vroom!"
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    local target_joker = card
                    
                    if target_joker then
                        if target_joker.ability.eternal then
                            target_joker.ability.eternal = nil
                        end
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Crash!", colour = G.C.RED})
                    end
                    return true
                end
            }
        end
    end
}