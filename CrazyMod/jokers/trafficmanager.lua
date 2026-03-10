
SMODS.Joker{ --Traffic Manager
    key = "trafficmanager",
    config = {
        extra = {
            TrafficManagerMult = 2,
            TrafficManagerPunish = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Traffic Manager',
        ['text'] = {
            [1] = '{X:tarot,C:white}X#1#{} Chips and Mult if',
            [2] = 'played hand contains a',
            [3] = '{C:attention}#3#{} card',
            [4] = '{X:tarot,C:white}X#2#{} Chips and Mult if',
            [5] = 'played hand does not contain',
            [6] = 'a {C:attention}#3#{} Card',
            [7] = '{C:inactive}(Suit changes every hand){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
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
    pools = { ["crazymod_crazymod_jokers"] = true, ["crazymod_cliche_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.TrafficManagerMult, card.ability.extra.TrafficManagerPunish, localize((G.GAME.current_round.TrafficManagerSuit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.TrafficManagerSuit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.TrafficManagerSuit_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit(G.GAME.current_round.TrafficManagerSuit_card.suit) then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                if G.playing_cards then
                    local valid_TrafficManagerSuit_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_TrafficManagerSuit_cards[#valid_TrafficManagerSuit_cards + 1] = v
                        end
                    end
                    if valid_TrafficManagerSuit_cards[1] then
                        local TrafficManagerSuit_card = pseudorandom_element(valid_TrafficManagerSuit_cards, pseudoseed('TrafficManagerSuit' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.TrafficManagerSuit_card.suit = TrafficManagerSuit_card.base.suit
                    end
                end
                return {
                    x_chips = card.ability.extra.TrafficManagerMult,
                    extra = {
                        Xmult = card.ability.extra.TrafficManagerMult
                    }
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit(G.GAME.current_round.TrafficManagerSuit_card.suit) then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                if G.playing_cards then
                    local valid_TrafficManagerSuit_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_TrafficManagerSuit_cards[#valid_TrafficManagerSuit_cards + 1] = v
                        end
                    end
                    if valid_TrafficManagerSuit_cards[1] then
                        local TrafficManagerSuit_card = pseudorandom_element(valid_TrafficManagerSuit_cards, pseudoseed('TrafficManagerSuit' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.TrafficManagerSuit_card.suit = TrafficManagerSuit_card.base.suit
                    end
                end
                return {
                    x_chips = card.ability.extra.TrafficManagerPunish,
                    extra = {
                        Xmult = card.ability.extra.TrafficManagerPunish
                    }
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            if G.playing_cards then
                local valid_TrafficManagerSuit_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_suit(v) then
                        valid_TrafficManagerSuit_cards[#valid_TrafficManagerSuit_cards + 1] = v
                    end
                end
                if valid_TrafficManagerSuit_cards[1] then
                    local TrafficManagerSuit_card = pseudorandom_element(valid_TrafficManagerSuit_cards, pseudoseed('TrafficManagerSuit' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.TrafficManagerSuit_card.suit = TrafficManagerSuit_card.base.suit
                end
            end
        end
    end
}