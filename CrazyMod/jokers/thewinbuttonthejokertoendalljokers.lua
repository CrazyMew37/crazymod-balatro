
SMODS.Joker{ --The Win Button (The Joker to End All Jokers)
key = "thewinbuttonthejokertoendalljokers",
config = {
    extra = {
        blind_size0 = -37
    }
},
loc_txt = {
    ['name'] = 'The Win Button (The Joker to End All Jokers)',
    ['text'] = {
        [1] = '{C:dark_edition}The Ultimate Joker.{}',
        [2] = '{C:dark_edition}Automatically beats the{}',
        [3] = '{C:dark_edition}game for you!{}',
        [4] = '{C:red,s:0.75}(For the love of god DON\'T USE IT){}',
        [5] = '{C:red,s:0.75}(You will ruin the fun FOREVER!){}'
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
cost = 373737,
rarity = "crazymod_the_craziest_joker",
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,
unlocked = true,
discovered = true,
atlas = 'CustomJokers',
pools = { ["crazymod_crazymod_jokers"] = true },
soul_pos = {
    x = 1,
    y = 11
},
in_pool = function(self, args)
    return (
        not args 
        or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
        or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
    )
    and true
end,

set_ability = function(self, card, initial)
    card:set_eternal(true)
    card:set_edition("e_negative", true)
end,

calculate = function(self, card, context)
    if context.setting_blind  then
        return {
            
            func = function()
                if G.GAME.blind.in_blind then
                    
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(-37).." Blind Size", colour = G.C.GREEN})
                    G.GAME.blind.chips = -37
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.HUD_blind:recalculate()
                    return true
                end
            end
        }
    end
    if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
        G.E_MANAGER:add_event(Event({
            blocking = false,
            func = function()
                if G.STATE == G.STATES.SELECTING_HAND then
                    G.GAME.chips = G.GAME.blind.chips
                    G.STATE = G.STATES.HAND_PLAYED
                    G.STATE_COMPLETE = true
                    end_round()
                    return true
                end
            end
        }))
        return {
            message = "Win!"
        }
    end
end
}