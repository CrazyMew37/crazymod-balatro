
SMODS.Joker{ --Gacha Capsule
    key = "gachacapsule",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Gacha Capsule',
        ['text'] = {
            [1] = '{C:green}1 in 7{} chance for {C:tarot}+77{} Chips and Mult',
            [2] = '{C:green}1 in 49{} chance for {X:tarot,C:white}X77{} Chips and Mult',
            [3] = '{C:green}1 in 343{} chance for {X:enhanced,C:white}^7.7{} Chips and Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true }
}