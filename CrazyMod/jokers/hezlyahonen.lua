
SMODS.Joker{ --Hezly Ahonen
    key = "hezlyahonen",
    config = {
        extra = {
            AceMult = 1.11,
            hypermult_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hezly Ahonen',
        ['text'] = {
            [1] = 'Played {C:hearts}Ace of Hearts{} score {X:enhanced,C:edition}^^1.11{} Mult',
            [2] = '{C:inactive,s:0.75}\"A rather lax mage. She\'s known to be quite flirty,{}',
            [3] = '{C:inactive,s:0.75}much to the dismay of her partners.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 9
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
            if (context.other_card:get_id() == 14 and context.other_card:is_suit("Hearts")) then
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