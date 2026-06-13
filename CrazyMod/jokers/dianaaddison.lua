
SMODS.Joker{ --Diana Addison
    key = "dianaaddison",
    config = {
        extra = {
            AceMult = 1.11,
            hypermult_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Diana Addison',
        ['text'] = {
            [1] = 'Played {C:diamonds}Ace of Diamonds{} score {X:mult,C:edition}^^1.11{} Mult',
            [2] = '{C:inactive,s:0.75}\"One of the meaner Ace Mages. She may come off as{}',
            [3] = '{C:inactive,s:0.75}rough, but she simply takes her job very seriously.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
            if (context.other_card:get_id() == 14 and context.other_card:is_suit("Diamonds")) then
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