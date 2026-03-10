
SMODS.Joker{ --Lyra
    key = "lyra",
    config = {
        extra = {
            LyraMult = 9.12,
            LyraLucky = 249,
            odds = 183
        }
    },
    loc_txt = {
        ['name'] = 'Lyra',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult',
            [2] = '{C:green}#3# in #4#{} chance for',
            [3] = '{X:red,C:white}X#2#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_lyra') 
        return {vars = {card.ability.extra.LyraMult, card.ability.extra.LyraLucky, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.LyraMult
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_677dd4c4', 1, card.ability.extra.odds, 'j_crazymod_lyra', false) then
                            SMODS.calculate_effect({Xmult = card.ability.extra.LyraLucky}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}