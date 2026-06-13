
SMODS.Joker{ --Royal Alchemy
    key = "royalalchemy",
    config = {
        extra = {
            WaterChips = 2,
            FireMult = 2,
            AirHands = 0.04,
            EarthDiscards = 0.04,
            AetherHandSize = 0.2
        }
    },
    loc_txt = {
        ['name'] = 'Royal Alchemy',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X#1#{} Mult for every scored {C:clubs}Clubs{}',
            [2] = 'Gives {X:blue,C:white}X#2#{} Chips for every scored {C:hearts}Hearts{}',
            [3] = 'Gives {C:blue}+#3#{} Hands for every scored {C:spades}Spades{}',
            [4] = 'Gives {C:red}+#4#{} Discards for every scored {C:diamonds}Diamonds{}',
            [5] = 'Gives {C:attention}+#5#{} Hand Size {s:0.66}(Plus the four above effects){} for every scored {C:attention}Wild Card{}',
            [6] = 'Adds a {C:attention}Wild Card{} to the deck at the start of every round',
            [7] = '{C:inactive,s:0.75}\"This is the symbol of the Royal Elements, a powerful quintet of queenly figures. It{}',
            [8] = '{C:inactive,s:0.75}represents that of the five elements and the Philosopher\'s Stone{}.\"'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    soul_pos = {
        x = 3,
        y = 9
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.WaterChips, card.ability.extra.FireMult, card.ability.extra.AirHands, card.ability.extra.EarthDiscards, card.ability.extra.AetherHandSize}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Hearts") and not (SMODS.get_enhancements(context.other_card)["m_wild"] == true)) then
                return {
                    x_chips = card.ability.extra.WaterChips
                }
            elseif (context.other_card:is_suit("Clubs") and not (SMODS.get_enhancements(context.other_card)["m_wild"] == true)) then
                return {
                    Xmult = card.ability.extra.FireMult
                }
            elseif (context.other_card:is_suit("Spades") and not (SMODS.get_enhancements(context.other_card)["m_wild"] == true)) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.AirHands).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.AirHands
                        ease_hands_played(card.ability.extra.AirHands)
                        
                        return true
                    end
                }
            elseif (context.other_card:is_suit("Diamonds") and not (SMODS.get_enhancements(context.other_card)["m_wild"] == true)) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.EarthDiscards).." Discards", colour = G.C.GREEN})
                        
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.EarthDiscards
                        ease_discard(card.ability.extra.EarthDiscards)
                        
                        return true
                    end
                }
            elseif SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    x_chips = card.ability.extra.WaterChips,
                    extra = {
                        Xmult = card.ability.extra.FireMult,
                        extra = {
                            
                            func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.AirHands).." Hands", colour = G.C.GREEN})
                                
                                G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.AirHands
                                ease_hands_played(card.ability.extra.AirHands)
                                
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                
                                func = function()
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.EarthDiscards).." Discards", colour = G.C.GREEN})
                                    
                                    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.EarthDiscards
                                    ease_discard(card.ability.extra.EarthDiscards)
                                    
                                    return true
                                end,
                                colour = G.C.GREEN,
                                extra = {
                                    
                                    func = function()
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.AetherHandSize).." Hand Limit", colour = G.C.BLUE})
                                        
                                        G.hand:change_size(card.ability.extra.AetherHandSize)
                                        return true
                                    end,
                                    colour = G.C.WHITE
                                }
                            }
                        }
                    }
                }
            end
        end
        if context.setting_blind  then
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_wild
            }, G.discard, true, false, nil, true)
            
            
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    base_card:start_materialize()
                    G.play:emplace(base_card)
                    return true
                end
            }))
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                end,
                message = "Added Card!"
            }
        end
    end
}