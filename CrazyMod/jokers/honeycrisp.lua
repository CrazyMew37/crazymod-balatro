
SMODS.Joker{ --Honeycrisp
    key = "honeycrisp",
    config = {
        extra = {
            AppleChips = 160,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Honeycrisp',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '{C:green}#2# in #3#{} chance for Ringo',
            [3] = 'Ando to eat this card at',
            [4] = 'the end of the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_Food"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_honeycrisp') 
        return {vars = {card.ability.extra.AppleChips, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.AppleChips
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4bb19a56', 1, card.ability.extra.odds, 'j_crazymod_honeycrisp', false) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            card:juice_up(0.3, 0.5)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "summon_smith", colour = G.C.BLUE})
                            G.GAME.pool_flags.crazymod_summon_smith = true
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("crazymod_Ringo_Solved_It")
                            
                            return true
                        end,
                    }))
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Sine!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}