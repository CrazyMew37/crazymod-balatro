
SMODS.Joker{ --Plastic Tangerine
    key = "plastictangerine",
    config = {
        extra = {
            TangerineMoney = 6,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Plastic Tangerine',
        ['text'] = {
            [1] = 'Earn {C:money}#1#${} at the end of',
            [2] = 'the round',
            [3] = '{C:green}#2# in #3#{} chance to not',
            [4] = 'get destroyed at the end',
            [5] = 'of the round (But not',
            [6] = 'give you any money :/)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_plastictangerine') 
        return {vars = {card.ability.extra.TangerineMoney, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.TangerineMoney
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.TangerineMoney), colour = G.C.MONEY})
                        return true
                    end
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_42c3c1b4', 1, card.ability.extra.odds, 'j_crazymod_plastictangerine', false) then
                            SMODS.calculate_effect({
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = G.GAME.dollars - card.ability.extra.TangerineMoney
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Nope!", colour = G.C.MONEY})
                                    return true
                                end}, card)
                            end
                            return true
                        end
                    }
                end
            end
        end
    }