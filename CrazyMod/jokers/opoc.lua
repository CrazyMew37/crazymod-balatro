
SMODS.Joker{ --OP OC
    key = "opoc",
    config = {
        extra = {
            AriaChips = 3.7
        }
    },
    loc_txt = {
        ['name'] = 'OP OC',
        ['text'] = {
            [1] = '{X:enhanced,C:white}^#1#{} Chips and Mult',
            [2] = '{s:0.75,C:inactive}\"Mary Sue? I barely know you!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
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
    pools = { ["crazymod_crazymod_jokers"] = true },
    soul_pos = {
        x = 7,
        y = 3
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.AriaChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_chips = card.ability.extra.AriaChips,
                extra = {
                    e_mult = card.ability.extra.AriaChips,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}