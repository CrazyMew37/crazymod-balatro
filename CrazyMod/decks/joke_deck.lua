
SMODS.Back {
    key = 'joke_deck',
    pos = { x = 5, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Joke Deck',
        text = {
            [1] = 'Begin with {C:dark_edition}The Win Button{}',
            [2] = 'See how patient you are to',
            [3] = 'reach {C:attention}Ante 1000{}!'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_crazymod_thewinbuttonthejokertoendalljokers' })
                    if new_joker then
                        new_joker:set_edition("e_negative", true)
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.GAME.win_ante = 1000
    end
}