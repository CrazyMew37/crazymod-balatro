
SMODS.Joker{ --Pineapple Pizza
    key = "pineapplepizza",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pineapple Pizza',
        ['text'] = {
            [1] = 'Create a {C:attention}Pizza Card{} with',
            [2] = 'an {C:red}Apple Seal{} every hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_pizza_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_crazymod_pizzacard
            }, G.discard, true, false, nil, true)
            
            base_card:set_seal("crazymod_appleseal", true)
            
            
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local new_card = copy_card(base_card, nil, nil, G.playing_card)
            
            new_card:add_to_deck()
            
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            G.deck:emplace(new_card)
            table.insert(G.playing_cards, new_card)
            
            base_card:remove()
            
            G.E_MANAGER:add_event(Event({
                func = function() 
                    new_card:start_materialize()
                    return true
                end
            }))
            return {
                message = "Added Card!"
            }
        end
    end
}