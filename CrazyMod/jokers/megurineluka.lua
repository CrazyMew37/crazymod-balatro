
SMODS.Joker{ --Megurine Luka
    key = "megurineluka",
    config = {
        extra = {
            LukaMult = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Megurine Luka',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult for every card with',
            [2] = 'a {C:planet}Musical Seal{} held in hand',
            [3] = '{s:0.5,C:purple}(Have I seen this ability before? ★){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
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
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_vocaloid"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.LukaMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card.seal == "Crazymod_musicalseal" then
                return {
                    Xmult = card.ability.extra.LukaMult
                }
            end
        end
    end
}