
SMODS.Joker{ --Pizza Crust
    key = "pizzacrust",
    config = {
        extra = {
            DominoMult = 6
        }
    },
    loc_txt = {
        ['name'] = 'Pizza Crust',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} when a',
            [2] = '{C:attention}Pizza Card{} is destroyed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_pizza_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.DominoMult}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if SMODS.get_enhancements(removed_card)["m_crazymod_pizzacard"] == true then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.DominoMult
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.DominoMult), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}