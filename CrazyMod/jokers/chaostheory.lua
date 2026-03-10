
SMODS.Joker{ --Chaos Theory
    key = "chaostheory",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Chaos Theory',
        ['text'] = {
            [1] = '{s:0.75,C:dark_edition}(Ayo an Unused Joker){}',
            [2] = 'If a hand contains at least {C:attention}5{}',
            [3] = 'scoring Cards, every scored card',
            [4] = 'gains a random {C:attention}Enhancement{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
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
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big(#context.scoring_hand) >= to_big(5) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        scored_card:set_ability(random_enhancement)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}