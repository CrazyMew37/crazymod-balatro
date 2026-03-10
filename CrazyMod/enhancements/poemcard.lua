
SMODS.Enhancement {
    key = 'poemcard',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            PoemChips = 1.05,
            PoemMult = 1.07,
            PoemMoney = 1.05
        }
    },
    loc_txt = {
        name = 'Poem Card',
        text = {
            [1] = '{X:enhanced,C:white}^1.05{} Chips, {X:enhanced,C:white}^1.07{} Mult,',
            [2] = 'and {X:money,C:white}x1.05{} Money when scored',
            [3] = '{s:0.75,C:inactive}Is this card useful?{}',
            [4] = '{s:0.75,C:inactive}Is this card not worth your time?{}',
            [5] = '{s:0.75,C:inactive}You should go find out.{}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 2.5,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.PoemChips, card.ability.extra.PoemMult, card.ability.extra.PoemMoney}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                e_chips = card.ability.extra.PoemChips,
                extra = {
                    e_mult = card.ability.extra.PoemMult,
                    colour = G.C.DARK_EDITION,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars * card.ability.extra.PoemMoney
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.PoemMoney), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            }
        end
    end
}