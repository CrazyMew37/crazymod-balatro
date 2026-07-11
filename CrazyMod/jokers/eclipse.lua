
SMODS.Joker{ --Eclipse
    key = "eclipse",
    config = {
        extra = {
            EclipseMult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Eclipse',
        ['text'] = {
            [1] = 'Every scored card with a Lunar Seal',
            [2] = 'gives {X:tarot,C:white}X#1#{} Chips and Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.EclipseMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Crazymod_lunarseal" then
                return {
                    x_chips = card.ability.extra.EclipseMult,
                    extra = {
                        Xmult = card.ability.extra.EclipseMult
                    }
                }
            end
        end
    end
}