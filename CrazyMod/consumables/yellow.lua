
SMODS.Consumable {
    key = 'yellow',
    set = 'paint_color',
    pos = { x = 1, y = 1 },
    config = { 
        extra = {
            dollars0 = 1.5   
        } 
    },
    loc_txt = {
        name = 'Yellow',
        text = {
            [1] = 'Create {C:attention}50%{} of your',
            [2] = 'current money',
            [3] = '{C:inactive}(Max of $50){}'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars * 1.5
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "X"..tostring(1.5).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}