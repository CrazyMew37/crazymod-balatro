
SMODS.Joker{ --Chuck E. Cheese
    key = "chuckecheese",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Chuck E. Cheese',
        ['text'] = {
            [1] = 'If a played hand contains',
            [2] = 'a {C:attention}Pizza Card{}, every scored',
            [3] = 'card\'s rank gets {C:attention}randomized{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    assert(SMODS.change_base(scored_card, nil, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
    end
}