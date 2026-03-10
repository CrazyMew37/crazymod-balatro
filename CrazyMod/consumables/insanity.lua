
SMODS.Consumable {
    key = 'insanity',
    set = 'Spectral',
    pos = { x = 6, y = 0 },
    config = { 
        extra = {
            odds = 37,
            odds2 = 370   
        } 
    },
    loc_txt = {
        name = 'Insanity',
        text = {
            [1] = '{C:green}1 in 37{} chance to create a {C:money}Crazy Card{}',
            [2] = '{C:dark_edition}1 in 370 chance to create The Win Button{}'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    soul_pos = {
        x = 7,
        y = 0
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        if SMODS.pseudorandom_probability(card, 'group_0_196d796d', 1, card.ability.extra.odds, 'j_crazymod_insanity', true) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'crazymod_crazy' })
                    if new_joker then
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            
        end
        if SMODS.pseudorandom_probability(card, 'group_1_ae9f028f', 1, card.ability.extra.odds2, 'j_crazymod_insanity', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'crazymod_the_craziest_joker' })
                    if new_joker then
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