
SMODS.Joker{ --Out Pizza the Hut
    key = "outpizzathehut",
    config = {
        extra = {
            PizzaHutChips = 3
        }
    },
    loc_txt = {
        ['name'] = 'Out Pizza the Hut',
        ['text'] = {
            [1] = 'Scored {C:attention}Pizza Cards{} gain',
            [2] = 'an additional {X:chips,C:money}^#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 37,
    rarity = "crazymod_crazy",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_pizza_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.PizzaHutChips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_crazymod_pizzacard"] == true then
                return {
                    e_chips = card.ability.extra.PizzaHutChips
                }
            end
        end
    end
}