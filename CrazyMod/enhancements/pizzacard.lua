
SMODS.Enhancement {
    key = 'pizzacard',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            LowChance = 1,
            HighChance = 3,
            xchips0 = 3,
            odds = 3
        }
    },
    loc_txt = {
        name = 'Pizza Card',
        text = {
            [1] = '{X:blue,C:white}X3{} Chips',
            [2] = '{C:green}1 in 3{} chance to',
            [3] = 'eat {s:0.85}(destroy){} card'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.LowChance, card.ability.extra.HighChance}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            return {
                x_chips = 3
                ,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'group_0_1bfccaaf', 1, card.ability.extra.odds, 'j_crazymod_pizzacard', false) then
                        context.other_card.should_destroy = true
                        card.should_destroy = true
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Eaten!", colour = G.C.RED})
                    end
                    return true
                end
            }
        end
    end
}