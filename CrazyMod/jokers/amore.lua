
SMODS.Joker{ --Amore
    key = "amore",
    config = {
        extra = {
            xchips0 = 3,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Amore',
        ['text'] = {
            [1] = '{C:clubs}Clubs{} are considered as',
            [2] = '{C:attention}Pizza Cards{}',
            [3] = '{C:attention}Pizza Cards{} are converted',
            [4] = 'into {C:clubs}Clubs{} when scored',
            [5] = '{s:0.75,C:inactive}(The former effect will not{}',
            [6] = '{s:0.75,C:inactive}affect other Pizza-themed Jokers){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_pizza_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_crazymod_pizzacard"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_crazymod_pizzacard\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_amore') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:is_suit("Clubs") and not (SMODS.get_enhancements(context.other_card)["m_crazymod_pizzacard"] == true)) then
                return {
                    x_chips = 3
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_9914af36', 1, card.ability.extra.odds, 'j_crazymod_amore', false) then
                            context.other_card.should_destroy = true
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Eaten!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            elseif (not (context.other_card:is_suit("Clubs")) and SMODS.get_enhancements(context.other_card)["m_crazymod_pizzacard"] == true) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Clubs", nil))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}