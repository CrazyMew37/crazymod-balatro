
SMODS.Joker{ --Vacant Joker
    key = "vacantjoker",
    config = {
        extra = {
            VacantSlots = 1
        }
    },
    loc_txt = {
        ['name'] = 'Vacant Joker',
        ['text'] = {
            [1] = '{C:attention}+1{} Joker Slot',
            [2] = '{s:0.75,C:inactive}\"This Joker had to call{}',
            [3] = '{s:0.75,C:inactive}in sick today. We apologize{}',
            [4] = '{s:0.75,C:inactive}for the inconvenience.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.VacantSlots}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.VacantSlots
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.VacantSlots
    end
}