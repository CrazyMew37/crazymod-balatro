
SMODS.Consumable {
    key = 'black',
    set = 'paint_color',
    pos = { x = 3, y = 3 },
    loc_txt = {
        name = 'Black',
        text = {
            [1] = 'Create a {C:attention}Negative Card{}'
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
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local new_card_params = { set = "Base" }
                    if _rank then new_card_params.rank = _rank end
                    if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition('e_negative', true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
        end
    end,
    can_use = function(self, card)
        return (G.GAME.blind.in_blind)
    end
}