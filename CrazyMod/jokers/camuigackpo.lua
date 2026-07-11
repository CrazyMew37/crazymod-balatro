
SMODS.Joker{ --Camui Gackpo
    key = "camuigackpo",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Camui Gackpo',
        ['text'] = {
            [1] = 'Scored Cards {C:attention}without{} a',
            [2] = '{C:planet}Musical Seal{} or a {C:red}Hold Seal{}',
            [3] = 'have a {C:green}#1# in #2#{} chance',
            [4] = 'of being {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_vocaloid"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'j_crazymod_camuigackpo') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (not (context.other_card.seal == "Crazymod_musicalseal")) and (not (context.other_card.seal == "Crazymod_holdseal")) then
                if SMODS.pseudorandom_probability(card, 'group_0_8a4b47ab', 2, card.ability.extra.odds, 'j_crazymod_camuigackpo', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}