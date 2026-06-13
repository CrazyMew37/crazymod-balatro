
SMODS.Joker{ --Rush Hour
    key = "rushhour",
    config = {
        extra = {
            ante_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Rush Hour',
        ['text'] = {
            [1] = 'Sell this card to',
            [2] = 'gain {C:attention}+1{} Ante'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                
                func = function()
                    
                    local mod = 1
                    ease_ante(mod)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                            return true
                        end,
                    }))
                    return true
                end,
                message = "Ante +" .. 1
            }
        end
    end
}