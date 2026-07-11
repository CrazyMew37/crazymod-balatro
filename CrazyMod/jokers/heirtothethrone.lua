
SMODS.Joker{ --Heir to the Throne
    key = "heirtothethrone",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Heir to the Throne',
        ['text'] = {
            [1] = 'If played hand is a {C:attention}Straight Flush{},',
            [2] = 'then this card creates a {C:attention}negative{}',
            [3] = '{C:spectral}The Soul{} and {C:red}self-destructs{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    soul_pos = {
        x = 2,
        y = 13
    },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight Flush"]) then
                for i = 1, 1 do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            end
                            
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral', edition = 'e_negative', key = 'c_soul'})                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
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
                return {
                    message = created_consumable and localize('k_plus_spectral') or nil
                }
            end
        end
    end
}