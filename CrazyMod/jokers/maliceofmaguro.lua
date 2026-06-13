
SMODS.Joker{ --Malice of Maguro
    key = "maliceofmaguro",
    config = {
        extra = {
            MaguroChips = 0.2
        }
    },
    loc_txt = {
        ['name'] = 'Malice of Maguro',
        ['text'] = {
            [1] = '{X:blue,C:white}X#1#{} Chips if your deck',
            [2] = 'contains any cards with',
            [3] = '{C:purple}Purple Seals{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "crazymod_garbage",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MaguroChips}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if playing_card.seal == "Purple" then
                        count = count + 1
                    end
                end
                return to_big(count) > to_big(1)
            end)() then
                return {
                    x_chips = card.ability.extra.MaguroChips
                }
            end
        end
    end
}