
SMODS.Joker{ --Thirty Minutes or its Free
    key = "thirtyminutesoritsfree",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Thirty Minutes or its Free',
        ['text'] = {
            [1] = 'When a {C:attention}Pizza Card{} is',
            [2] = 'destroyed, {C:green}#1# in #2#{} chance',
            [3] = 'to create another',
            [4] = '{C:inactive,s:0.75}Hey Pizza!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_pizza_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_thirtyminutesoritsfree') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if SMODS.get_enhancements(removed_card)["m_crazymod_pizzacard"] == true then
                        return true
                    end
                end
                return false
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_a9eaf0b1', 1, card.ability.extra.odds, 'j_crazymod_thirtyminutesoritsfree', false) then
                    SMODS.calculate_effect({func = function()
                        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                        local base_card = create_playing_card({
                            front = card_front,
                            center = G.P_CENTERS.m_crazymod_pizzacard
                        }, G.discard, true, false, nil, true)
                        
                        
                        
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        base_card.playing_card = G.playing_card
                        table.insert(G.playing_cards, base_card)
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.hand:emplace(base_card)
                                base_card:start_materialize()
                                SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                                return true
                            end
                        }))
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card to Hand!", colour = G.C.GREEN})
                end
            end
        end
    end
}