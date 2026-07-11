
SMODS.Seal {
    key = 'musicalseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            chips0_min = NaN,
            chips0_max = 128
        }
    },
    badge_colour = HEX('00cccc'),
    loc_txt = {
        name = 'Musical Seal',
        label = 'Musical Seal',
        text = {
            [1] = 'Scores a random {C:attention}Bonus{} amount',
            [2] = 'of Chips between {C:blue}8{} to {C:blue}128{}',
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
                chips = pseudorandom('RANGE:8|128', 8, 128)
            }
        end
    end
}