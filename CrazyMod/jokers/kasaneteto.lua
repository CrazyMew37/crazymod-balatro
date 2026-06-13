
SMODS.Joker{ --Kasane Teto
    key = "kasaneteto",
    config = {
        extra = {
            TetoMult = 1.15
        }
    },
    loc_txt = {
        ['name'] = 'Kasane Teto',
        ['text'] = {
            [1] = 'Cards with a {C:planet}Musical Seal{}',
            [2] = 'give an additonal {X:mult,C:money}^#1#{}',
            [3] = 'Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_vocaloid"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.TetoMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Crazymod_musicalseal" then
                return {
                    e_mult = card.ability.extra.TetoMult
                }
            end
        end
    end
}