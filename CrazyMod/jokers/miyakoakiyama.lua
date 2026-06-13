
SMODS.Joker{ --Miyako Akiyama
    key = "miyakoakiyama",
    config = {
        extra = {
            MiyakoMult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Miyako Akiyama',
        ['text'] = {
            [1] = '{X:tarot,C:white}X#1#{} Mult and Chips',
            [2] = '{C:red}Self-destructs{} if a',
            [3] = 'hand containing a',
            [4] = '{C:attention}Pair{} is played.',
            [5] = '{s:0.75,C:inactive}(She really hates people{}',
            [6] = '{s:0.75,C:inactive}making fun of her tails.){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 10
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
    pools = { ["crazymod_crazymod_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MiyakoMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not (next(context.poker_hands["Pair"])) then
                return {
                    x_chips = card.ability.extra.MiyakoMult,
                    extra = {
                        Xmult = card.ability.extra.MiyakoMult
                    }
                }
            elseif next(context.poker_hands["Pair"]) then
                local target_joker = card
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "How rude!", colour = G.C.RED})
                end
            end
        end
    end
}