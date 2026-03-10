
SMODS.Joker{ --Sayori
    key = "sayori",
    config = {
        extra = {
            SayoriChips = 1.25,
            SayoriMult = 1.49
        }
    },
    loc_txt = {
        ['name'] = 'Sayori',
        ['text'] = {
            [1] = '{X:enhanced,C:white}^#1#{} Chips and {X:enhanced,C:white}^#2#{} Mult when',
            [2] = 'scoring a {C:attention}Poem Card{}',
            [3] = '{C:red}Destroys{} the {C:attention}Poem Card{} after scoring',
            [4] = 'Create a {C:attention}Poem Card{} and draw to hand',
            [5] = 'every {C:attention}Boss Blind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        x = 0,
        y = 8
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SayoriChips, card.ability.extra.SayoriMult}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_crazymod_poemcard"] == true then
                context.other_card.should_destroy = true
                return {
                    e_chips = card.ability.extra.SayoriChips,
                    extra = {
                        e_mult = card.ability.extra.SayoriMult,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                    }
                }
            end
        end
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
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
                                SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                                return true
                            end
                        }))
                    end,
                    message = "Added Card to Hand!"
                }
            end
        end
    end
}