
SMODS.Consumable {
    key = 'blue',
    set = 'paint_color',
    pos = { x = 7, y = 1 },
    config = { 
        extra = {
            hands0 = 1   
        } 
    },
    loc_txt = {
        name = 'Blue',
        text = {
            [1] = 'Create a temporary {C:blue}Hand{}'
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
        if G.GAME.blind.in_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (G.GAME.blind.in_blind)
    end
}