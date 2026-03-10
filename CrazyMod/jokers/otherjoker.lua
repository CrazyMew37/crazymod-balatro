
SMODS.Joker{ --Other Joker
    key = "otherjoker",
    config = {
        extra = {
            JumboChips = 30
        }
    },
    loc_txt = {
        ['name'] = 'Other Joker',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '{s:0.75,C:inactive}\"I\'m Jimbo\'s CRAZY{}',
            [3] = '{s:0.75,C:inactive}fourth cousin, Jumbo!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.JumboChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.JimbuChips
            }
        end
    end
}