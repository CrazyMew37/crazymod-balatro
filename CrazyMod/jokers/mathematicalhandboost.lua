
SMODS.Joker{ --Mathematical Hand Boost
    key = "mathematicalhandboost",
    config = {
        extra = {
            chips0 = 5,
            mult0 = 1,
            chips = 10,
            mult = 2,
            chips2 = 15,
            mult2 = 3,
            chips3 = 30,
            mult3 = 6,
            chips4 = 35,
            mult4 = 6,
            chips5 = 35,
            mult5 = 7,
            chips6 = 35,
            mult6 = 8,
            chips7 = 65,
            mult7 = 12,
            chips8 = 80,
            mult8 = 16,
            chips9 = 110,
            mult9 = 20,
            chips10 = 115,
            mult10 = 24,
            chips11 = 150,
            mult11 = 28
        }
    },
    loc_txt = {
        ['name'] = 'Mathematical Hand Boost',
        ['text'] = {
            [1] = 'Give Chips and Mult depending on the {C:attention}rarity{} of your hand, based',
            [2] = 'on the number of combinations in a 7-card Texas Hold em\' Hand',
            [3] = '{s:0.8,C:inactive}(Equation is on the card, High Card, Pair, & Secret Hands are execptions){}',
            [4] = 'The following Chips and Mult are:',
            [5] = 'High Card: {C:blue}+5{}, {C:red}+1{}; Pair: {C:blue}+10{}, {C:red}+2{}; Two Pair: {C:blue}+15{}, {C:red}+3{}; 3OAK: {C:blue}+30{}, {C:red}+6{};',
            [6] = 'Straight: {C:blue}+35{}, {C:red}+6{}; Flush: {C:blue}+35{}, {C:red}+7{}; F. House: {C:blue}+35{}, {C:red}+8{}; 40AK: {C:blue}+65{}, {C:red}+12{};',
            [7] = 'S. Flush: {C:blue}+80{}, {C:red}+16{}; 5OAK: {C:blue}+110{}, {C:red}+20{}, Fl. House: {C:blue}+115{}, {C:red}+24{}, Fl. 5: {C:blue}+150{}, {C:red}+28{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                return {
                    chips = 5,
                    extra = {
                        mult = 1
                    }
                }
            elseif context.scoring_name == "Pair" then
                return {
                    chips = 10,
                    extra = {
                        mult = 2
                    }
                }
            elseif context.scoring_name == "Two Pair" then
                return {
                    chips = 15,
                    extra = {
                        mult = 3
                    }
                }
            elseif context.scoring_name == "Three of a Kind" then
                return {
                    chips = 30,
                    extra = {
                        mult = 6
                    }
                }
            elseif context.scoring_name == "Straight" then
                return {
                    chips = 35,
                    extra = {
                        mult = 6
                    }
                }
            elseif context.scoring_name == "Flush" then
                return {
                    chips = 35,
                    extra = {
                        mult = 7
                    }
                }
            elseif context.scoring_name == "Full House" then
                return {
                    chips = 35,
                    extra = {
                        mult = 8
                    }
                }
            elseif context.scoring_name == "Four of a Kind" then
                return {
                    chips = 65,
                    extra = {
                        mult = 12
                    }
                }
            elseif context.scoring_name == "Straight Flush" then
                return {
                    chips = 80,
                    extra = {
                        mult = 16
                    }
                }
            elseif context.scoring_name == "Five of a Kind" then
                return {
                    chips = 110,
                    extra = {
                        mult = 20
                    }
                }
            elseif context.scoring_name == "Flush House" then
                return {
                    chips = 115,
                    extra = {
                        mult = 24
                    }
                }
            elseif context.scoring_name == "Flush Five" then
                return {
                    chips = 150,
                    extra = {
                        mult = 28
                    }
                }
            end
        end
    end
}