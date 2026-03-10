
SMODS.Joker{ --rekoJ
    key = "rekoj",
    config = {
        extra = {
            rekoJMult = 4
        }
    },
    loc_txt = {
        ['name'] = 'rekoJ',
        ['text'] = {
            [1] = 'tulM {C:red}#1#+{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
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
        
        return {vars = {card.ability.extra.rekoJMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.rekoJMult,
                extra = {
                    swap = true,
                    colour = G.C.CHIPS
                }
            }
        end
    end
}