
SMODS.Back {
    key = 'splattered_deck',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            hand_size0 = 1
        },
    },
    loc_txt = {
        name = 'Splattered Deck',
        text = {
            [1] = 'Create a {C:inactive}Paint Color{}',
            [2] = 'every blind',
            [3] = '{C:attention}+1{} Consumable Slot',
            [4] = '{C:red}-1{} Hand Size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'paint_color', 
                        })
                        return true
                    end
                }))
            end
        end
    end,
    apply = function(self, back)
        G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots + 1
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(-1)
                    return true
                end
            }))
        }
    end
}