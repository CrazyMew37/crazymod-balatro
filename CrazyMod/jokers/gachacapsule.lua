
SMODS.Joker{ --Gacha Capsule
    key = "gachacapsule",
    config = {
        extra = {
            GachaPlus = 77,
            GachaMult = 77,
            GachaPower = 7.7,
            odds = 7,
            odds2 = 49,
            odds3 = 343
        }
    },
    loc_txt = {
        ['name'] = 'Gacha Capsule',
        ['text'] = {
            [1] = '{C:green}#4# in #5#{} chance for {C:tarot}+#1#{} Chips and Mult',
            [2] = '{C:green}#6# in #7#{} chance for {X:tarot,C:white}X#2#{} Chips and Mult',
            [3] = '{C:green}#8# in #9#{} chance for {X:tarot,C:money}^#3#{} Chips and Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_crazymod_gachacapsule')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_crazymod_gachacapsule')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_crazymod_gachacapsule')
        return {vars = {card.ability.extra.GachaPlus, card.ability.extra.GachaMult, card.ability.extra.GachaPower, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_624dbb1d', 1, card.ability.extra.odds, 'j_crazymod_gachacapsule', false) then
                    SMODS.calculate_effect({chips = card.ability.extra.GachaPlus}, card)
                    SMODS.calculate_effect({mult = card.ability.extra.GachaPlus}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_ee5ae8a2', 1, card.ability.extra.odds2, 'j_crazymod_gachacapsule', false) then
                    SMODS.calculate_effect({x_chips = card.ability.extra.GachaMult}, card)
                    SMODS.calculate_effect({Xmult = card.ability.extra.GachaMult}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_f90390da', 1, card.ability.extra.odds3, 'j_crazymod_gachacapsule', false) then
                    SMODS.calculate_effect({e_chips = card.ability.extra.GachaPower}, card)
                    SMODS.calculate_effect({e_mult = card.ability.extra.GachaPower}, card)
                end
            end
        end
    end
}