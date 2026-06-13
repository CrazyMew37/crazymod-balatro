
SMODS.Joker{ --Akita Neru
    key = "akitaneru",
    config = {
        extra = {
            NeruRetriggers = 3
        }
    },
    loc_txt = {
        ['name'] = 'Akita Neru',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} every scoring card',
            [2] = 'with a {C:planet}Musical Seal{} {C:attention}#1#{} Times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_crazymod_vocaloid"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.NeruRetriggers}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card.seal == "Crazymod_musicalseal" then
                return {
                    repetitions = card.ability.extra.NeruRetriggers,
                    message = "Again!"
                }
            end
        end
    end
}