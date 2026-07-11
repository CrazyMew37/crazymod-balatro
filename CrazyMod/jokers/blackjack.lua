
SMODS.Joker{ --Blackjack
    key = "blackjack",
    config = {
        extra = {
            set_probability0 = 1000000,
            set_probability = 1
        }
    },
    loc_txt = {
        ['name'] = 'Blackjack',
        ['text'] = {
            [1] = '{C:attention}Guarantees{} all {C:green}probabilities{}.',
            [2] = '(Ex. {C:green}1 in 1000{} becomes {C:green}1000000 in 1{}.)',
            [3] = '{C:inactive,s:0.75}(The enemy of the Ace Mages and their Kingdoms.{}',
            [4] = '{C:inactive,s:0.75} He wants nothing but pure chaos.){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true },
    soul_pos = {
        x = 4,
        y = 13
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.fix_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = 1000000
            denominator = 1
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}