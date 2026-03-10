
SMODS.Joker{ --Bad Apple
    key = "badapple",
    config = {
        extra = {
            AppleChips = 120
        }
    },
    loc_txt = {
        ['name'] = 'Bad Apple',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = 'Gives every scored card',
            [3] = 'an {C:red}Apple Seal{}',
            [4] = '{s:0.5,C:inactive}(I don\'t even like Touhou but the reference is funny ig){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_Food"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.AppleChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.AppleChips
            }
        end
        if context.individual and context.cardarea == G.play  then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    scored_card:set_seal("crazymod_appleseal", true)
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
    end
}