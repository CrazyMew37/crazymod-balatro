
SMODS.Joker{ --Kris
    key = "kris",
    config = {
        extra = {
            KrisChips = 12.14,
            KrisMult = 245,
            odds = 100
        }
    },
    loc_txt = {
        ['name'] = 'Kris',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '{C:green}#3# in #4#{} chance for',
            [3] = '{X:blue,C:white}X#2#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_kris') 
        return {vars = {card.ability.extra.KrisChips, card.ability.extra.KrisMult, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    chips = card.ability.extra.KrisChips
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_4255104b', 1, card.ability.extra.odds, 'j_crazymod_kris', false) then
                            SMODS.calculate_effect({x_chips = card.ability.extra.KrisMult}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}