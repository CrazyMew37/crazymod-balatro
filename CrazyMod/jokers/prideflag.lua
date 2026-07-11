
SMODS.Joker{ --Pride Flag
    key = "prideflag",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Pride Flag',
        ['text'] = {
            [1] = 'If played hand does {C:red}not{}',
            [2] = 'contain a {C:attention}Straight{}, then each',
            [3] = 'scored card has a {C:green}#1# in #2#{}',
            [4] = 'chance to gain a {C:inactive}Rainbow Seal{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 12
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_prideflag') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (next(context.poker_hands["Straight"])) then
                if SMODS.pseudorandom_probability(card, 'group_0_410f0d44', 1, card.ability.extra.odds, 'j_crazymod_prideflag', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("crazymod_rainbowseal", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}