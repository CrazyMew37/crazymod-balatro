
SMODS.Consumable {
    key = 'renpyconverter',
    set = 'Spectral',
    pos = { x = 8, y = 0 },
    config = { 
        extra = {
            odds = 12   
        } 
    },
    loc_txt = {
        name = 'RenPy Converter',
        text = {
            [1] = '{C:green}#1# in #2#{} chance to create a',
            [2] = '{C:green}Doki Doki Literature Club{} Joker',
            [3] = '{C:inactive}(Must have Room){}'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_crazymod_renpyconverter')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if SMODS.pseudorandom_probability(card, 'group_0_150fa98d', 1, card.ability.extra.odds, 'j_crazymod_renpyconverter', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'crazymod_crazymod_ddlc' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}