
SMODS.Voucher {
    key = 'ms_paint',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            item_rate0 = 3
        } 
    },
    loc_txt = {
        name = 'MS Paint',
        text = {
            [1] = '{C:inactive}Paint Colors{} can appear',
            [2] = 'in the {C:attention}shop{}.'
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
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.paint_color_rate = 3               
                    return true
                end
            }))
        }
    end
}