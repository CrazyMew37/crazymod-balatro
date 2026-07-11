
SMODS.Joker{ --Sailor Moon
    key = "sailormoon",
    config = {
        extra = {
            SailorSlots = 1,
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Sailor Moon',
        ['text'] = {
            [1] = 'Level up {C:attention}Full House{}',
            [2] = 'every round',
            [3] = '{C:red}-#1#{} Shop Slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_sailormoon"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SailorSlots}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            local target_hand = "Full House"
            level_up_hand(card, target_hand, true, 1)
            return {
                message = localize('k_level_up_ex')
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.extra.SailorSlots)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(card.ability.extra.SailorSlots)
    end
}