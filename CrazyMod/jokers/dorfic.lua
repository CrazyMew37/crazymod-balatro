
SMODS.Joker{ --DORfic
    key = "dorfic",
    config = {
        extra = {
            FrutigerMult = 0.25
        }
    },
    loc_txt = {
        ['name'] = 'DORfic',
        ['text'] = {
            [1] = 'Scored {C:diamonds}Diamonds{} and {C:hearts}Hearts{}',
            [2] = 'with a {C:green}Frutiger Seal{} {C:attention}permamently{}',
            [3] = 'gain {X:red,C:white}X#1#{} Mult when scored.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FrutigerMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card.seal == "Crazymod_frutigerseal") and ((context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds"))) then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.FrutigerMult
                return {
                    extra = { message = "Upgrade!", colour = G.C.MULT }, card = card
                }
            end
        end
    end
}