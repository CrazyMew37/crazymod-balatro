
SMODS.Joker{ --Unicorn
    key = "unicorn",
    config = {
        extra = {
            UnicornChips = 10
        }
    },
    loc_txt = {
        ['name'] = 'Unicorn',
        ['text'] = {
            [1] = '{C:purple}+#1#{} Chips and Mult for every',
            [2] = 'Scored Card with a {C:inactive}Rainbow Seal{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        
        return {vars = {card.ability.extra.UnicornChips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Crazymod_rainbowseal" then
                return {
                    chips = card.ability.extra.UnicornChips,
                    extra = {
                        mult = card.ability.extra.UnicornChips
                    }
                }
            end
        end
    end
}