
SMODS.Joker{ --Cutaway Gag
    key = "cutawaygag",
    config = {
        extra = {
            PeterChips = 50,
            PeterMult = 6
        }
    },
    loc_txt = {
        ['name'] = 'Cutaway Gag',
        ['text'] = {
            [1] = '{C:inactive,s:0.75}\"Aw gee, Lois, this is worse than the{}',
            [2] = '{C:inactive,s:0.75}time I was a Joker in Balatro.\"{}',
            [3] = '\"{C:blue}#1#{} Chips and {C:red}#2#{} Mult if',
            [4] = 'you aren\'t {C:attention}Straight{}.\"'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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
        
        return {vars = {card.ability.extra.PeterChips, card.ability.extra.PeterMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not (next(context.poker_hands["Straight"])) then
                return {
                    chips = card.ability.extra.PeterChips,
                    extra = {
                        mult = card.ability.extra.PeterMult
                    }
                }
            end
        end
    end
}