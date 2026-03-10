
SMODS.Joker{ --Dominos
    key = "dominos",
    config = {
        extra = {
            DominoMult = 1.2,
            DominoGain = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Dominos',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult whenever a',
            [2] = '{C:attention}Pizza Card{} scores',
            [3] = 'Gains {X:red,C:white}X#2#{} Mult whenever',
            [4] = 'a {C:attention}Pizza Card{} is destroyed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_pizza_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.DominoMult, card.ability.extra.DominoGain}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_crazymod_pizzacard"] == true then
                return {
                    Xmult = card.ability.extra.DominoMult
                }
            end
        end
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
                        card.ability.extra.DominoMult = (card.ability.extra.DominoMult) + card.ability.extra.DominoGain
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
    end
}