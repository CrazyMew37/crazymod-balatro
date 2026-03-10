
SMODS.Joker{ --GUMI
    key = "gumi",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'GUMI',
        ['text'] = {
            [1] = '{C:attention}All{} scored cards are given a',
            [2] = '{C:planet}Musical Seal,{} but their {C:attention}Suit{}, {C:attention}Rank{},',
            [3] = 'and {C:attention}Enhancement{} are randomized'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
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
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                    scored_card:set_ability(G.P_CENTERS.c_base)
                    scored_card:set_seal("crazymod_musicalseal", true)
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
    end
}