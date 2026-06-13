
SMODS.Joker{ --KAITO
    key = "kaito",
    config = {
        extra = {
            KAITOChips = 1.28
        }
    },
    loc_txt = {
        ['name'] = 'KAITO',
        ['text'] = {
            [1] = 'Scored cards with a',
            [2] = '{C:planet}Musical Seal{} score an',
            [3] = 'additional {X:blue,C:white}X#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_vocaloid"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.KAITOChips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Crazymod_musicalseal" then
                return {
                    x_chips = card.ability.extra.KAITOChips
                }
            end
        end
    end
}