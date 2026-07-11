
SMODS.Joker{ --M&Ms
    key = "mms",
    config = {
        extra = {
            MandMMult = 15,
            MandMChips = 90
        }
    },
    loc_txt = {
        ['name'] = 'M&Ms',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult is played',
            [2] = 'hand is a {C:attention}Pair{}',
            [3] = '{C:blue}+#2#{} Chips if played',
            [4] = 'hand is {C:red}not{} a {C:attention}Pair{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MandMMult, card.ability.extra.MandMChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Pair" then
                return {
                    mult = card.ability.extra.MandMMult
                }
            elseif not (next(context.poker_hands["Pair"])) then
                return {
                    chips = card.ability.extra.MandMChips
                }
            end
        end
    end
}