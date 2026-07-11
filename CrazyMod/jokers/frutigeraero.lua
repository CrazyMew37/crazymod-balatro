
SMODS.Joker{ --Frutiger Aero
    key = "frutigeraero",
    config = {
        extra = {
            AeroChips = 0,
            AeroGain = 5
        }
    },
    loc_txt = {
        ['name'] = 'Frutiger Aero',
        ['text'] = {
            [1] = 'Gains {C:blue}+#2#{} Chips when a card with',
            [2] = 'a {C:green}Frutiger Seal{} is held in hand',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.AeroChips, card.ability.extra.AeroGain}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.AeroChips
            }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card.seal == "Crazymod_frutigerseal" then
                return {
                    func = function()
                        card.ability.extra.AeroChips = (card.ability.extra.AeroChips) + card.ability.extra.AeroGain
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
    end
}