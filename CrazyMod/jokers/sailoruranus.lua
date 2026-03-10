
SMODS.Joker{ --Sailor Uranus
    key = "sailoruranus",
    config = {
        extra = {
            SailorChips = -30,
            SailorMult = -3,
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Sailor Uranus',
        ['text'] = {
            [1] = 'Level up {C:attention}Two Pair{}',
            [2] = 'every round',
            [3] = '{C:blue}#1#{} Chips, {C:red}#2#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_sailormoon"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SailorChips, card.ability.extra.SailorMult}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            local target_hand = "Two Pair"
            level_up_hand(card, target_hand, true, 1)
            return {
                message = localize('k_level_up_ex')
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.SailorChips,
                extra = {
                    mult = card.ability.extra.SailorMult
                }
            }
        end
    end
}