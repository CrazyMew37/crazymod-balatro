
SMODS.Joker{ --Asteroid
    key = "asteroid",
    config = {
        extra = {
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Asteroid',
        ['text'] = {
            [1] = 'Level up a {C:attention}random{}',
            [2] = '{C:attention}Poker Hand{} every round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            local available_hands = {}
            for hand, value in pairs(G.GAME.hands) do
                if value.visible and value.level >= to_big(1) then
                    table.insert(available_hands, hand)
                end
            end
            local target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
            level_up_hand(card, target_hand, true, 1)
            return {
                message = "Upgrade!"
            }
        end
    end
}