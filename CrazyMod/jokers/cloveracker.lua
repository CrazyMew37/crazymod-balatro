
SMODS.Joker{ --Clover Acker
    key = "cloveracker",
    config = {
        extra = {
            AceMult = 1.11,
            hypermult_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Clover Acker',
        ['text'] = {
            [1] = 'Played {C:clubs}Ace of Clubs{} score {X:mult,C:edition}^^1.11{} Mult',
            [2] = '{C:inactive,s:0.75}\"This witch is known to be very sweet. Despite her job{}',
            [3] = '{C:inactive,s:0.75}as her kingdom\'s Ace Mage, she\'s not fond of fighting.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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