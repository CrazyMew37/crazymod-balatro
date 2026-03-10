
SMODS.Joker{ --Freddy Fazbear
    key = "freddyfazbear",
    config = {
        extra = {
            FreddyMult = 4,
            FreddyDecrease = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Freddy Fazbear',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult',
            [2] = 'Decreases by {X:mult,C:white}X#2#{} Mult each hand',
            [3] = '{C:red}Self destructs{} when this card',
            [4] = 'reaches {X:mult,C:white}X1{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FreddyMult, card.ability.extra.FreddyDecrease}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local FreddyMult_value = card.ability.extra.FreddyMult
            card.ability.extra.FreddyMult = math.max(0, (card.ability.extra.FreddyMult) - card.ability.extra.FreddyDecrease)
            return {
                Xmult = FreddyMult_value
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.FreddyMult or 0)) <= to_big(1) then
                return {
                    func = function()
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}