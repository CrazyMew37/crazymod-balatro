
SMODS.Joker{ --Grilled Cheese
    key = "grilledcheese",
    config = {
        extra = {
            CheeseChips = 16384
        }
    },
    loc_txt = {
        ['name'] = 'Grilled Cheese',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chip(s)',
            [2] = 'Chips are divided by {C:attention}2{} after each hand',
            [3] = '{C:red}Self destructs{} when it goes below {C:blue}1{} Chip',
            [4] = '{s:0.75,C:inactive}Nothing beats a good sandwich and chips.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_food"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.CheeseChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local CheeseChips_value = card.ability.extra.CheeseChips
            card.ability.extra.CheeseChips = (card.ability.extra.CheeseChips) / 2
            return {
                chips = CheeseChips_value,
                extra = {
                    message = "Value Down!",
                    colour = G.C.MULT
                }
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.CheeseChips or 0)) < to_big(1) then
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