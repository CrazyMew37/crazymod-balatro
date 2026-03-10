
SMODS.Back {
    key = 'ace_mage_deck',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            remove_starting_cards_count0 = 52,
            add_starting_cards_count0 = 1,
            add_starting_cards_count = 1,
            add_starting_cards_count2 = 1,
            add_starting_cards_count3 = 1,
            booster_slots0 = 1,
            hand_size0 = 4
        },
        remove_faces = true,
    },
    loc_txt = {
        name = 'Ace Mage Deck',
        text = {
            [1] = 'Begin with only {C:attention}4{} Aces',
            [2] = 'Start with only {C:red}1{}',
            [3] = 'Booster Pack Slot',
            [4] = 'Rerolls cost {C:money}$2{} Less',
            [5] = '{C:attention}4{} Hand Size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i=#G.deck.cards, 1, -1 do
                    G.deck.cards[i]:remove()
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'A'
                    local _suit = 'Spades'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'A'
                    local _suit = 'Hearts'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'A'
                    local _suit = 'Diamonds'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'A'
                    local _suit = 'Clubs'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - 2
                    G.GAME.current_round.reroll_cost = math.max(0,
                    G.GAME.current_round.reroll_cost - 2)
                    return true
                end
            }))
            ,
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        local current_booster_slots = (G.GAME.modifiers.extra_boosters or 0)
                        local target_booster_slots = 1
                        local difference = target_booster_slots - current_booster_slots
                        SMODS.change_booster_limit(difference)
                        return true
                    end
                })),
                colour = G.C.WHITE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            
                            local current_hand_size = (G.hand.config.card_limit or 0)
                            local target_hand_size = 4
                            local difference = target_hand_size - current_hand_size
                            G.hand:change_size(difference)
                            return true
                        end
                    })),
                    colour = G.C.WHITE
                }
            }
        }
    end
}