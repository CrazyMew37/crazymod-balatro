SMODS.Rarity {
    key = "crazy",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('cc9933'),
    loc_txt = {
        name = "Crazy"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "the_craziest_joker",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "The Craziest Joker"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "garbage",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.05,
    badge_colour = HEX('22ccbb'),
    loc_txt = {
        name = "Garbage"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}