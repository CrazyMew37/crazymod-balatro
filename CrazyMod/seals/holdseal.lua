
SMODS.Seal {
    key = 'holdseal',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            mult0_min = NaN,
            mult0_max = 32
        }
    },
    badge_colour = HEX('cc0066'),
    loc_txt = {
        name = 'Hold Seal',
        label = 'Hold Seal',
        text = {
            [1] = 'Scores a random {C:attention}Bonus{} amount',
            [2] = 'of Mult between {C:red}2{} to {C:red}32{}',
            [3] = 'upon scoring'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "chips1", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = pseudorandom('RANGE:2|32', 2, 32)
            }
        end
    end
}