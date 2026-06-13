
SMODS.Joker{ --Crazy Dave
    key = "crazydave",
    config = {
        extra = {
            odds = 100
        }
    },
    loc_txt = {
        ['name'] = 'Crazy Dave',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to create a {C:money}Crazy Joker{}',
            [2] = 'at the start of a {C:attention}Boss Blind{}',
            [3] = '{s:0.75,C:inactive}\"Why did I break your game? Because I\'m CRAAAAAZY!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_crazydave') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                if SMODS.pseudorandom_probability(card, 'group_0_d123615d', 1, card.ability.extra.odds, 'j_crazymod_crazydave', false) then
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'crazymod_crazy' })
                                if joker_card then
                                    
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}