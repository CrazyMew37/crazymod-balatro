
SMODS.Joker{ --Toilet
    key = "toilet",
    config = {
        extra = {
            ToiletMult = 0,
            ToiletGain = 2,
            odds = 5,
            odds2 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Toilet',
        ['text'] = {
            [1] = 'Gains {C:red}+#2#{} Mult for every played {C:attention}Flush{}',
            [2] = 'Fixed {C:green}1 in 5{} chance to get clogged',
            [3] = '{C:inactive}(Do Nothing){}',
            [4] = '(Currently {C:red}+#1#{} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 4, card.ability.extra.odds, 'j_crazymod_toilet')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 4, card.ability.extra.odds2, 'j_crazymod_toilet')
        return {vars = {card.ability.extra.ToiletMult, card.ability.extra.ToiletGain, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Flush" then
                if SMODS.pseudorandom_probability(card, 'group_0_bd48424c', 4, card.ability.extra.odds, 'j_crazymod_toilet', true) then
                    card.ability.extra.ToiletMult = (card.ability.extra.ToiletMult) + card.ability.extra.ToiletGain
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("crazymod_Toilet")
                            
                            return true
                        end,
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Upgrade!", colour = G.C.GREEN})
                end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_a7fcf399', 4, card.ability.extra.odds, 'j_crazymod_toilet', true) then
                    SMODS.calculate_effect({mult = card.ability.extra.ToiletMult}, card)
                end
            end
        end
    end
}