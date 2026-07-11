
SMODS.Seal {
    key = 'appleseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xchips0 = 0.453741592338
        }
    },
    badge_colour = HEX('cc0033'),
    loc_txt = {
        name = 'Apple Seal',
        label = 'Apple Seal',
        text = {
            [1] = 'Gives Chip Mult equal to',
            [2] = '{X:blue,C:white}(9-sqrt(7))/(5+cbrt(730)){}',
            [3] = '',
            [4] = '{C:inactive,s:1.5}ALGORITHMS!{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "crazymod_Ringo_Solved_It", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("crazymod_Ringo_Solved_It")
                    
                    return true
                end,
            }))
            return {
                x_chips = 0.453741592338
            }
        end
    end
}