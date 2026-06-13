
SMODS.Joker{ --Happy Meal
    key = "happymeal",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Happy Meal',
        ['text'] = {
            [1] = 'Add {C:attention}2{} random Cards to your',
            [2] = 'deck at the start of every round',
            [3] = 'and {C:attention}draw{} them to your hand',
            [4] = '{s:0.75,C:inactive}(You got a Mega Standard Pack as the toy){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            return {
                func = function()
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    base_card.playing_card = G.playing_card
                    table.insert(G.playing_cards, base_card)
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:emplace(base_card)
                            base_card:start_materialize()
                            SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                            return true
                        end
                    }))
                end,
                message = "Added Card to Hand!",
                extra = {
                    func = function()
                        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                        local base_card = create_playing_card({
                            front = card_front,
                            center = G.P_CENTERS.c_base
                        }, G.discard, true, false, nil, true)
                        
                        
                        
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        base_card.playing_card = G.playing_card
                        table.insert(G.playing_cards, base_card)
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.hand:emplace(base_card)
                                base_card:start_materialize()
                                SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                                return true
                            end
                        }))
                    end,
                    message = "Added Card to Hand!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}