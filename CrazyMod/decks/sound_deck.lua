
SMODS.Back {
    key = 'sound_deck',
    pos = { x = 6, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 5
        },
        remove_faces = true,
    },
    loc_txt = {
        name = 'Sound Deck',
        text = {
            [1] = 'Every Card has a',
            [2] = '{C:planet}Musical Seal{}',
            [3] = 'Begin with no {C:attention}Face{}',
            [4] = '{C:attention}Cards{} or {C:attention}Aces{}',
            [5] = '{X:attention,C:white}X5{} Blind Requirement'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    for i=#G.playing_cards, 1, -1 do
                        if G.playing_cards[i]:get_id() == 14 then
                            G.playing_cards[i]:remove()
                        end
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    v:set_seal("crazymod_musicalseal", true, true)
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 5
                return true
            end
        }))
    end
}