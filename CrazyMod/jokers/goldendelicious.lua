
SMODS.Joker{ --Golden Delicious
    key = "goldendelicious",
    config = {
        extra = {
            AppleExpo = 1.48,
            odds = 4000
        }
    },
    loc_txt = {
        ['name'] = 'Golden Delicious',
        ['text'] = {
            [1] = '{X:chips,C:money}^#1#{} Chips',
            [2] = '{C:green}#2# in #3#{} chance for Ringo',
            [3] = 'Ando to eat this card at',
            [4] = 'the end of the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_Food"] = true, ["crazymod_cliche_deck_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.crazymod_summon_golden
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_goldendelicious') 
        return {vars = {card.ability.extra.AppleExpo, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_chips = card.ability.extra.AppleExpo
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_97175d71', 1, card.ability.extra.odds, 'j_crazymod_goldendelicious', false) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("crazymod_Ringo_Solved_It")
                            
                            return true
                        end,
                    }))
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Algorithms!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}