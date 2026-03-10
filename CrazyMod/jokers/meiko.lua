
SMODS.Joker{ --MEIKO
    key = "meiko",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'MEIKO',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to',
            [2] = 'give each card held in',
            [3] = 'hand a {C:planet}Musical Seal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 7
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
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_vocaloid"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_meiko') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a71287af', 1, card.ability.extra.odds, 'j_crazymod_meiko', false) then
                    SMODS.calculate_effect({func = function()
                        context.other_card:set_seal("crazymod_musicalseal", true)
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                end
            end
        end
    end
}