
SMODS.Joker{ --Kagamine Rin
    key = "kagaminerin",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Kagamine Rin',
        ['text'] = {
            [1] = 'If played hand contains a',
            [2] = '{C:attention}Two Pair{}, then give the',
            [3] = '{C:attention}first{} and {C:attention}third{} card a',
            [4] = '{C:planet}Musical Seal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_vocaloid"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((next(context.poker_hands["Two Pair"]) and context.other_card == context.scoring_hand[1])) and ((next(context.poker_hands["Two Pair"]) and context.other_card == context.scoring_hand[3])) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("crazymod_musicalseal", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}