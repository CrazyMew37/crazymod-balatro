
SMODS.Seal {
    key = 'lunarseal',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            odds = 4
        }
    },
    badge_colour = HEX('cccc66'),
    loc_txt = {
        name = 'Lunar Seal',
        label = 'Lunar Seal',
        text = {
            [1] = '{C:green}1 in 4{} chance to create a',
            [2] = '{C:spectral}Spectral Card{} when scored',
            [3] = '{C:inactive}(Must have room){}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "coin1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_4795b8cc', 1, card.ability.seal.extra.odds, 'j_crazymod_lunarseal', false) then
                SMODS.calculate_effect({
                    func = function()
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                        end
                        return true
                    end}, card)
                end
            end
        end
    }