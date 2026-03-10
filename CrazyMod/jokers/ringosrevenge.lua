
SMODS.Joker{ --Ringos Revenge
    key = "ringosrevenge",
    config = {
        extra = {
            RingoAngryMult = 0.25
        }
    },
    loc_txt = {
        ['name'] = 'Ringos Revenge',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult if your deck',
            [2] = 'contains any cards with',
            [3] = '{C:red}Red Seals{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.RingoAngryMult}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if playing_card.seal == "Red" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("crazymod_Ringo_Solved_It")
                        
                        return true
                    end,
                }))
                return {
                    Xmult = card.ability.extra.RingoAngryMult
                }
            end
        end
    end
}