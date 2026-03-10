
SMODS.Joker{ --J
    key = "j",
    config = {
        extra = {
            JNumber = 4
        }
    },
    loc_txt = {
        ['name'] = 'J',
        ['text'] = {
            [1] = '+#1#'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
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
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.JNumber}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(card.ability.extra.JNumber)
            end
            return {
                mult = card.ability.extra.JNumber,
                extra = {
                    chips = card.ability.extra.JNumber,
                    colour = G.C.CHIPS,
                    extra = {
                        
                        func = function()
                            if G.GAME.blind.in_blind then
                                
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.JNumber).." Blind Size", colour = G.C.GREEN})
                                G.GAME.blind.chips = G.GAME.blind.chips + card.ability.extra.JNumber
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            message = "+"..tostring(card.ability.extra.JNumber).." Cards Drawn",
                            colour = G.C.BLUE
                        }
                    }
                }
            }
        end
    end
}