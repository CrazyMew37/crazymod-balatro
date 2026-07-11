
SMODS.Joker{ --Chicken
    key = "chicken",
    config = {
        extra = {
            ChickenChips = 40
        }
    },
    loc_txt = {
        ['name'] = 'Chicken',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '',
            [3] = '{C:inactive,s:2.5}\"BAWK!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ChickenChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.ChickenChips
            }
        end
    end
}