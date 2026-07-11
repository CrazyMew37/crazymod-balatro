
SMODS.Consumable {
    key = 'teal',
    set = 'paint_color',
    pos = { x = 8, y = 2 },
    loc_txt = {
        name = 'Teal',
        text = {
            [1] = 'Create {C:attention}2{} Negative',
            [2] = '{C:enhanced}Spectral Cards{}'
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
        for i = 1, 2 do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    end
                    
                    
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Spectral', edition = 'e_negative', })                            
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
        
        if created_consumable then
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
        end
        return true
    end,
    can_use = function(self, card)
        return true
    end
}