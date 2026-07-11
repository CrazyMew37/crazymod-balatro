
SMODS.Joker{ --Octo Zombie
    key = "octozombie",
    config = {
        extra = {
            OctoMult = 0,
            OctoGain = 8
        }
    },
    loc_txt = {
        ['name'] = 'Octo Zombie',
        ['text'] = {
            [1] = 'Stores {C:red}+#2#{} Mult if a hand is',
            [2] = 'played {C:attention}without{} an {C:attention}8{}. {C:attention}Only{} triggers',
            [3] = 'when a hand {C:attention}with{} an {C:attention}8{} is played.',
            [4] = 'Mult {C:attention}resets{} to {C:red}0{} when triggered.',
            [5] = '{C:inactive}(Currently {}{C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.OctoMult, card.ability.extra.OctoGain}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 8 then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                card.ability.extra.OctoMult = (card.ability.extra.OctoMult) + card.ability.extra.OctoGain
                return {
                    message = "Mult Up!"
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 8 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                local OctoMult_value = card.ability.extra.OctoMult
                card.ability.extra.OctoMult = 0
                return {
                    mult = OctoMult_value,
                    extra = {
                        message = "Reset!",
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}