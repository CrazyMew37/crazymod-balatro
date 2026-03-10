
SMODS.Joker{ --Ethan
    key = "ethan",
    config = {
        extra = {
            EthanMoney = 1,
            EthanLucky = 250,
            odds = 155
        }
    },
    loc_txt = {
        ['name'] = 'Ethan',
        ['text'] = {
            [1] = '{C:money}+$#1#{} for every played {C:attention}2{}',
            [2] = '{C:green}#3# in #4#{} chance for',
            [3] = '{C:money}+$#2#{} every hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_ethan') 
        return {vars = {card.ability.extra.EthanMoney, card.ability.extra.EthanLucky, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_677dd4c4', 1, card.ability.extra.odds, 'j_crazymod_ethan', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + card.ability.extra.EthanLucky
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.EthanLucky), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
            if context.individual and context.cardarea == G.play  then
                if context.other_card:get_id() == 2 then
                    return {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + card.ability.extra.EthanMoney
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.EthanMoney), colour = G.C.MONEY})
                            return true
                        end
                    }
                end
            end
        end
    }