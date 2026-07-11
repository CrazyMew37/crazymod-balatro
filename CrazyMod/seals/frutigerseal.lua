
SMODS.Seal {
    key = 'frutigerseal',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            FrutigerChips = 2
        }
    },
    badge_colour = HEX('66cc00'),
    loc_txt = {
        name = 'Frutiger Seal',
        label = 'Frutiger Seal',
        text = {
            [1] = '{X:blue,C:white}X2{} Chips when',
            [2] = 'held in hand'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "foil1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.seal.extra.FrutigerChips}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                x_chips = card.ability.seal.extra.FrutigerChips
            }
        end
    end
}