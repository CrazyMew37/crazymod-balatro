
SMODS.Joker{ --Apple Core
    key = "applecore",
    config = {
        extra = {
            CoreChips = 0.16,
            chips0 = 0.16,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Apple Core',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '{C:green}#2# in #3#{} Chance to grow',
            [3] = 'a {C:attention}Honeycrisp{} in its place',
            [4] = 'at the end of the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_Food"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_applecore') 
        return {vars = {card.ability.extra.CoreChips, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 0.16
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d17dbcbd', 1, card.ability.extra.odds, 'j_crazymod_applecore', false) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            card:juice_up(0.3, 0.5)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "summon_golden", colour = G.C.BLUE})
                            G.GAME.pool_flags.crazymod_summon_golden = true
                            return true
                        end
                    }))
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_crazymod_honeycrisp' })
                                if joker_card then
                                    
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Planted!", colour = G.C.BLUE})
                        end
                        return true
                    end}, card)
                    SMODS.calculate_effect({func = function()
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
                    end}, card)
                end
            end
        end
    end
}