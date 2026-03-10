
SMODS.Back {
    key = 'greasy_deck',
    pos = { x = 2, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Greasy Deck',
        text = {
            [1] = 'Face Cards are {C:attention}Pizza{}',
            [2] = 'Creates {C:tarot}The Dough{}',
            [3] = 'after beating a',
            [4] = '{C:attention}Boss Blind{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            for i = 1, 1 do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        end
                        
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', edition = 'e_negative', key = 'c_crazymod_thedough'
                        })
                        return true
                    end
                }))
            end
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 11 then
                        v:set_ability('m_crazymod_pizzacard')
                    end
                    if v:get_id() == 11 then
                        v:set_ability('m_crazymod_pizzacard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 12 then
                        v:set_ability('m_crazymod_pizzacard')
                    end
                    if v:get_id() == 12 then
                        v:set_ability('m_crazymod_pizzacard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 13 then
                        v:set_ability('m_crazymod_pizzacard')
                    end
                    if v:get_id() == 13 then
                        v:set_ability('m_crazymod_pizzacard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}