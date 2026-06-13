
SMODS.Joker{ --Emerald
    key = "emerald",
    config = {
        extra = {
            EmeraldMult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Emerald',
        ['text'] = {
            [1] = 'Sell this card to',
            [2] = '{C:attention}double{} your money'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.EmeraldMult}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * card.ability.extra.EmeraldMult
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.EmeraldMult), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}