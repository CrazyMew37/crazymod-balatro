
SMODS.Joker{ --Bliss
    key = "bliss",
    config = {
        extra = {
            BlissMult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Bliss',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult if played hand is a',
            [2] = '{C:attention}Pair{} and the {C:attention}rank{} of the',
            [3] = 'scoring cards is {C:attention}5{} or less.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.BlissMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "Pair") and ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 5 then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                return {
                    Xmult = card.ability.extra.BlissMult
                }
            elseif (context.scoring_name == "Pair") and ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 4 then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                return {
                    Xmult = card.ability.extra.BlissMult
                }
            elseif (context.scoring_name == "Pair") and ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 3 then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                return {
                    Xmult = card.ability.extra.BlissMult
                }
            elseif (context.scoring_name == "Pair") and ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 2 then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                return {
                    Xmult = card.ability.extra.BlissMult
                }
            elseif (context.scoring_name == "Pair") and ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                return {
                    Xmult = card.ability.extra.BlissMult
                }
            end
        end
    end
}