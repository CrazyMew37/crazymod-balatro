
SMODS.Joker{ --River Trio
    key = "rivertrio",
    config = {
        extra = {
            BinaDiscards = 0.25,
            MarcHands = 0.25,
            EmilyJokerSlots = 0.25,
            PaintWeight = 16
        }
    },
    loc_txt = {
        ['name'] = 'River Trio',
        ['text'] = {
            [1] = '{C:blue}+#2#{} Hands when using {C:blue}Blue{}',
            [2] = '{C:red}+#1#{} Discards when using {C:red}Red{}',
            [3] = '{C:attention}+#3#{} Joker Slots when using {C:green}Green{}',
            [4] = 'Create a Negative {C:red}Red{}, {C:blue}Blue{}, and',
            [5] = '{C:green}Green{} every {C:attention}Boss Blind{}',
            [6] = '{s:0.75,C:inactive}\"A Trio of Sirens (From left to right, Bina, Emily, and{}',
            [7] = '{s:0.75,C:inactive}Marc). They know how to make a colorful splash!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 37,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 6
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
        
        return {vars = {card.ability.extra.BinaDiscards, card.ability.extra.MarcHands, card.ability.extra.EmilyJokerSlots, card.ability.extra.PaintWeight}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'color' or context.consumeable.ability.set == 'paint_color') and context.consumeable.config.center.key == 'c_crazymod_red' then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.BinaDiscards).." Discards", colour = G.C.GREEN})
                        
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.BinaDiscards
                        ease_discard(card.ability.extra.BinaDiscards)
                        
                        return true
                    end
                }
            elseif context.consumeable and (context.consumeable.ability.set == 'color' or context.consumeable.ability.set == 'paint_color') and context.consumeable.config.center.key == 'c_crazymod_blue' then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.MarcHands).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.MarcHands
                        ease_hands_played(card.ability.extra.MarcHands)
                        
                        return true
                    end
                }
            elseif context.consumeable and (context.consumeable.ability.set == 'color' or context.consumeable.ability.set == 'paint_color') and context.consumeable.config.center.key == 'c_crazymod_green' then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.EmilyJokerSlots).." Joker Slot", colour = G.C.DARK_EDITION})
                        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.EmilyJokerSlots
                        return true
                    end
                }
            end
        end
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'paint_color', edition = 'e_negative', key = 'c_crazymod_red'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            for i = 1, 1 do
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                        end
                                        
                                        play_sound('timpani')
                                        SMODS.add_card({ set = 'paint_color', edition = 'e_negative', key = 'c_crazymod_green'})                            
                                        card:juice_up(0.3, 0.5)
                                        return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                            end
                            return true
                        end,
                        colour = G.C.PURPLE,
                        extra = {
                            func = function()
                                
                                for i = 1, 1 do
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.4,
                                        func = function()
                                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                            end
                                            
                                            play_sound('timpani')
                                            SMODS.add_card({ set = 'paint_color', edition = 'e_negative', key = 'c_crazymod_blue'})                            
                                            card:juice_up(0.3, 0.5)
                                            return true
                                        end
                                    }))
                                end
                                delay(0.6)
                                
                                if created_consumable then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                                end
                                return true
                            end,
                            colour = G.C.PURPLE
                        }
                    }
                }
            end
        end
    end
}