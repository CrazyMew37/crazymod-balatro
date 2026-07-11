
SMODS.Joker{ --Dark Aero
    key = "darkaero",
    config = {
        extra = {
            FrutigerMult = 0.25
        }
    },
    loc_txt = {
        ['name'] = 'Dark Aero',
        ['text'] = {
            [1] = 'Scored {C:spades}Spades{} and {C:clubs}Clubs{}',
            [2] = 'with a {C:green}Frutiger Seal{} {C:attention}permamently{}',
            [3] = 'gain {X:blue,C:white}X#1#{} Chips when scored.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
            if (context.other_card.seal == "Crazymod_frutigerseal") and ((context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs"))) then
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + card.ability.extra.FrutigerMult
                return {
                    extra = { message = "Upgrade!", colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}