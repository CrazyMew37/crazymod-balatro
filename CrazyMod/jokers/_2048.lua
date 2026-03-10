
SMODS.Joker{ --2048
    key = "_2048",
    config = {
        extra = {
            CheeseMult = 2048
        }
    },
    loc_txt = {
        ['name'] = '2048',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult',
            [2] = 'Mult is divided by {C:attention}2{} after each hand',
            [3] = '{C:red}Self destructs{} when it goes below {C:red}1{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_food"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.CheeseMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local CheeseMult_value = card.ability.extra.CheeseMult
            card.ability.extra.CheeseMult = (card.ability.extra.CheeseMult) / 2
            return {
                mult = CheeseMult_value,
                extra = {
                    message = "Value Down!",
                    colour = G.C.MULT
                }
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.CheeseMult or 0)) < to_big(1) then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Extinct!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}