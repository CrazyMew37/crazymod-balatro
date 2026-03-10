
SMODS.Joker{ --Pyramid Scheme
    key = "pyramidscheme",
    config = {
        extra = {
            PyramidMoney = 3,
            PyramidMult = 1.15
        }
    },
    loc_txt = {
        ['name'] = 'Pyramid Scheme',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} at the end',
            [2] = 'of the round',
            [3] = 'Payout goes up by',
            [4] = '{X:money,C:white}X#2#{} for every trigger'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    soul_pos = {
        x = 2,
        y = 9
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.PyramidMoney, card.ability.extra.PyramidMult}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            local PyramidMoney_value = card.ability.extra.PyramidMoney
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + PyramidMoney_value
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(PyramidMoney_value), colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.PyramidMoney = (card.ability.extra.PyramidMoney) * card.ability.extra.PyramidMult
                        return true
                    end,
                    colour = G.C.MULT
                }
            }
        end
    end
}