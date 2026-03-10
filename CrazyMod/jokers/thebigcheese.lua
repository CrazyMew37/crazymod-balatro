
SMODS.Joker{ --The Big Cheese
    key = "thebigcheese",
    config = {
        extra = {
            BigCheeseChips = 0,
            BigCheeseGain = 3
        }
    },
    loc_txt = {
        ['name'] = 'The Big Cheese',
        ['text'] = {
            [1] = 'Gains {C:blue}+#2#{} Chips for every',
            [2] = 'played {C:attention}Face Card{}',
            [3] = '(Currently {C:blue}+#1#{} Chips)',
            [4] = '{s:0.75,C:inactive}\"I\'m the boss.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.BigCheeseChips, card.ability.extra.BigCheeseGain}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                card.ability.extra.BigCheeseChips = (card.ability.extra.BigCheeseChips) + card.ability.extra.BigCheeseGain
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.BigCheeseChips
            }
        end
    end
}