
SMODS.Voucher {
    key = 'krita',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            item_rate0 = 9
        } 
    },
    loc_txt = {
        name = 'Krita',
        text = {
            [1] = '{C:inactive}Paint Colors{} appear {C:attention}3X{}',
            [2] = 'more often in the {C:attention}shop{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'ms_paint'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.paint_color_rate = 9               
                    return true
                end
            }))
        }
    end
}