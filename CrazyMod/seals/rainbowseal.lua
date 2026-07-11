
SMODS.Seal {
    key = 'rainbowseal',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            odds = 2
        }
    },
    badge_colour = HEX('cccccc'),
    loc_txt = {
        name = 'Rainbow Seal',
        label = 'Rainbow Seal',
        text = {
            [1] = '{C:green}1 in 2{} chance to create a',
            [2] = '{C:inactive}Paint Color{} when {C:attention}held in hand{}',
            [3] = 'at the end of a round',
            [4] = '{C:inactive}(Must have room){}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "whoosh", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            if SMODS.pseudorandom_probability(card, 'group_0_3cd80e54', 1, card.ability.seal.extra.odds, 'j_crazymod_rainbowseal', false) then
                SMODS.calculate_effect({
                    func = function()
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'paint_color', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Paint Color Made!", colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    }