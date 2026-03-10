
SMODS.Joker{ --Monika
    key = "monika",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Monika',
        ['text'] = {
            [1] = '{C:red}Deletes{} every card held in hand',
            [2] = 'Creates a {C:attention}Poem Card{} in the',
            [3] = 'deleted card\'s place'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_ddlc"] = true },
    soul_pos = {
        x = 8,
        y = 7
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            context.other_card.should_destroy = true
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_crazymod_poemcard
            }, G.discard, true, false, nil, true)
            
            
            
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            base_card.playing_card = G.playing_card
            table.insert(G.playing_cards, base_card)
            
            G.E_MANAGER:add_event(Event({
                func = function() 
                    G.hand:emplace(base_card)
                    base_card:start_materialize()
                    return true
                end
            }))
            return {
                message = "Added Card to Hand!",
                extra = {
                    message = "Destroyed!",
                    colour = G.C.RED
                }
            }
        end
    end
}