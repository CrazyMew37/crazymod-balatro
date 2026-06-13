
SMODS.Back {
    key = 'sailor_deck',
    pos = { x = 4, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Sailor Deck',
        text = {
            [1] = 'Begin with a random',
            [2] = '{C:gold}Sailor Moon{} Joker'
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
                    local new_joker = SMODS.add_card({ set = 'crazymod_crazymod_sailormoon' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}