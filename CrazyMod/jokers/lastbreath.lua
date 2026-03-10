
SMODS.Joker{ --Last Breath
    key = "lastbreath",
    config = {
        extra = {
            hands0 = 1,
            discards0 = 1,
            hand_size0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Last Breath',
        ['text'] = {
            [1] = 'Prevents Death if Chips scored',
            [2] = 'are at least {C:attention}33%{} of required Chips',
            [3] = 'Lose {C:blue}-1{} Hand, {C:red}-1{} Discard, and',
            [4] = '{C:attention}-1{} Hand Size when this card',
            [5] = 'is triggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if to_big(G.GAME.chips / G.GAME.blind.chips) >= to_big(0.33) then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hands", colour = G.C.RED})
                            
                            G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
                            ease_hands_played(-1)
                            
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            
                            func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Discards", colour = G.C.RED})
                                
                                G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
                                ease_discard(-1)
                                
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                
                                func = function()
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                                    
                                    G.hand:change_size(-1)
                                    return true
                                end,
                                colour = G.C.WHITE,
                                extra = {
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
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                        end
                                        return true
                                    end,
                                    colour = G.C.RED
                                }
                            }
                        }
                    }
                }
            end
        end
    end
}