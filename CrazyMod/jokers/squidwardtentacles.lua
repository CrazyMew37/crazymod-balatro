
SMODS.Joker{ --Squidward Tentacles
    key = "squidwardtentacles",
    config = {
        extra = {
            SquidwardChips = 35,
            SquidwardMult = 6
        }
    },
    loc_txt = {
        ['name'] = 'Squidward Tentacles',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult if played',
            [2] = 'hand does {C:red}not{} contain a {C:attention}Pair{}',
            [3] = '{C:gold,s:0.5}\"And what could be better than serving up smiles?\"{}',
            [4] = '{C:planet,s:0.5}\"Being Dead.\"{}'
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
        
        return {vars = {card.ability.extra.SquidwardChips, card.ability.extra.SquidwardMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not (next(context.poker_hands["Pair"])) then
                return {
                    chips = card.ability.extra.SquidwardChips,
                    extra = {
                        mult = card.ability.extra.SquidwardMult
                    }
                }
            end
        end
    end
}