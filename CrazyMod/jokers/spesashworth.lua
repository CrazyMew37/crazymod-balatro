
SMODS.Joker{ --Spes Ashworth
    key = "spesashworth",
    config = {
        extra = {
            AceMult = 1.11,
            hypermult_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Spes Ashworth',
        ['text'] = {
            [1] = 'Played {C:spades}Ace of Spades{} score {X:mult,C:edition}^^1.11{} Mult',
            [2] = '{C:inactive,s:0.75}\"The leader of the Ace Mages. She might be an anxious{}',
            [3] = '{C:inactive,s:0.75}mess, but her magic skills are unmatched in Casina.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 37,
    rarity = "crazymod_crazy",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.AceMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 and context.other_card:is_suit("Spades")) then
                return {
                    hypermult = {
                        2,
                        card.ability.extra.AceMult
                    }
                }
            end
        end
    end
}