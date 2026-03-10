
SMODS.Joker{ --MC
    key = "mc",
    config = {
        extra = {
            MCMult = 2,
            MCGain = 0.5,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'MC',
        ['text'] = {
            [1] = '{s:0.75,C:dark_edition}(Art by GyleToTheRescue on DeviantArt){}',
            [2] = '{X:tarot,C:white}X#1#{} Chips and Mult',
            [3] = 'Gains {X:tarot,C:white}X#2#{} Chips and Mult for',
            [4] = 'every scored Poem Card',
            [5] = '{C:green}1 in 10{} chance to convert a',
            [6] = 'played card into a {C:attention}Poem Card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 8
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
        x = 6,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_mc') 
        return {vars = {card.ability.extra.MCMult, card.ability.extra.MCGain, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_crazymod_poemcard"] == true then
                card.ability.extra.MCMult = (card.ability.extra.MCMult) + card.ability.extra.MCGain
                return {
                    message = "Upgrade!"
                }
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_4ac83788', 1, card.ability.extra.odds, 'j_crazymod_mc', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_crazymod_poemcard)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.MCMult,
                extra = {
                    Xmult = card.ability.extra.MCGain
                }
            }
        end
    end
}