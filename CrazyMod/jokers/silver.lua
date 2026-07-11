
SMODS.Joker{ --Silver
    key = "silver",
    config = {
        extra = {
            SilverSlots = 1,
            SilverIncrease = 2,
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'Silver',
        ['text'] = {
            [1] = '{C:attention}+#1#{} Shop Slot(s)',
            [2] = '{C:green}#3# in #4#{} chance to gain',
            [3] = '{C:attention}+#2#{} Shop Slots at the',
            [4] = 'end of every round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_silver') 
        return {vars = {card.ability.extra.SilverSlots, card.ability.extra.SilverIncrease, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fa3cac7d', 1, card.ability.extra.odds, 'j_crazymod_silver', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.SilverSlots = (card.ability.extra.SilverSlots) + card.ability.extra.SilverIncrease
                        return true
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Upgrade!", colour = G.C.GREEN})
                end
            end
        end
        if context.starting_shop  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.SilverSlots).." Shop Slots", colour = G.C.BLUE})
                    
                    change_shop_size(card.ability.extra.SilverSlots)
                    return true
                end
            }
        end
        if context.ending_shop  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.SilverSlots).." Shop Slots", colour = G.C.BLUE})
                    
                    change_shop_size(-card.ability.extra.SilverSlots)
                    return true
                end
            }
        end
    end
}