
SMODS.Joker{ --Entanglement of Ecolo
    key = "entanglementofecolo",
    config = {
        extra = {
            EcoloSlots = 77
        }
    },
    loc_txt = {
        ['name'] = 'Entanglement of Ecolo',
        ['text'] = {
            [1] = '{C:attention}+#1#{} Joker Slots',
            [2] = '{C:dark_edition}\"Wahaha!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 37,
    rarity = "crazymod_crazy",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    soul_pos = {
        x = 6,
        y = 4
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.EcoloSlots}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 77
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 77
    end
}