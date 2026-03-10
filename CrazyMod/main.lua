SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {52,35,36,53,54,55,89,58,65,34,28,22,6,4,33,26,25,20,5,62,59,57,61,3,18,60,85,9,13,56,21,41,44,80,83,87,51,23,82,16,42,66,24,86,12,30,45,27,1,19,73,72,71,70,78,69,75,77,74,76,88,43,63,11,67,31,37,38,47,48,39,29,10,2,40,49,79,90,50,46,68,8,64,15,7,81,32,17,14,84}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {32,34,33,6,12,30,13,26,25,21,36,14,11,8,7,1,3,24,15,27,16,20,9,31,19,17,28,5,18,29,22,23,2,10,35,4}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {1,2}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local sealIndexList = {1,2}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local voucherIndexList = {2,1}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {2,5,3,1,6,4}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "crazymod_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true,
        ["j_crazymod__2048"] = true,
        ["j_crazymod_grilledcheese"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_jokers",
    cards = {
        ["j_crazymod__2048"] = true,
        ["j_crazymod_akitaneru"] = true,
        ["j_crazymod_amore"] = true,
        ["j_crazymod_applecore"] = true,
        ["j_crazymod_badapple"] = true,
        ["j_crazymod_bananaslamma"] = true,
        ["j_crazymod_bemeebeth"] = true,
        ["j_crazymod_blackcat"] = true,
        ["j_crazymod_bonniesfacepizza"] = true,
        ["j_crazymod_camuigackpo"] = true,
        ["j_crazymod_canvas"] = true,
        ["j_crazymod_chaostheory"] = true,
        ["j_crazymod_chuckecheese"] = true,
        ["j_crazymod_cloveracker"] = true,
        ["j_crazymod_crazydave"] = true,
        ["j_crazymod_cutawaygag"] = true,
        ["j_crazymod_dianaaddison"] = true,
        ["j_crazymod_dominos"] = true,
        ["j_crazymod_emerald"] = true,
        ["j_crazymod_enchantedgoldenapple"] = true,
        ["j_crazymod_ethan"] = true,
        ["j_crazymod_flhorban920"] = true,
        ["j_crazymod_freddyfazbear"] = true,
        ["j_crazymod_gachacapsule"] = true,
        ["j_crazymod_goldendelicious"] = true,
        ["j_crazymod_grannysmith"] = true,
        ["j_crazymod_grilledcheese"] = true,
        ["j_crazymod_grossmichel"] = true,
        ["j_crazymod_gumi"] = true,
        ["j_crazymod_happymeal"] = true,
        ["j_crazymod_hatsunemiku"] = true,
        ["j_crazymod_hezlyahonen"] = true,
        ["j_crazymod_honeycrisp"] = true,
        ["j_crazymod_j"] = true,
        ["j_crazymod_jokerbutbetter"] = true,
        ["j_crazymod_jokerbutevenmorebetter"] = true,
        ["j_crazymod_kagaminelen"] = true,
        ["j_crazymod_kagaminerin"] = true,
        ["j_crazymod_kaito"] = true,
        ["j_crazymod_kasaneteto"] = true,
        ["j_crazymod_kris"] = true,
        ["j_crazymod_lastbreath"] = true,
        ["j_crazymod_lunaandartemis"] = true,
        ["j_crazymod_lyra"] = true,
        ["j_crazymod_mathematicalhandboost"] = true,
        ["j_crazymod_mc"] = true,
        ["j_crazymod_megurineluka"] = true,
        ["j_crazymod_meiko"] = true,
        ["j_crazymod_monika"] = true,
        ["j_crazymod_natsuki"] = true,
        ["j_crazymod_opoc"] = true,
        ["j_crazymod_otherjoker"] = true,
        ["j_crazymod_otherjokerbutbetter"] = true,
        ["j_crazymod_otherjokerbutevenmorebetter"] = true,
        ["j_crazymod_otherotherjoker"] = true,
        ["j_crazymod_outpizzathehut"] = true,
        ["j_crazymod_pineapplepizza"] = true,
        ["j_crazymod_pixeljoker"] = true,
        ["j_crazymod_pizzabox"] = true,
        ["j_crazymod_pizzacrust"] = true,
        ["j_crazymod_pizzaface"] = true,
        ["j_crazymod_plastictangerine"] = true,
        ["j_crazymod_pokemonrgby"] = true,
        ["j_crazymod_pyramidscheme"] = true,
        ["j_crazymod_rekoj"] = true,
        ["j_crazymod_ringosrevenge"] = true,
        ["j_crazymod_rivertrio"] = true,
        ["j_crazymod_royalalchemy"] = true,
        ["j_crazymod_sailorchibimoon"] = true,
        ["j_crazymod_sailorjupiter"] = true,
        ["j_crazymod_sailormars"] = true,
        ["j_crazymod_sailormercury"] = true,
        ["j_crazymod_sailormoon"] = true,
        ["j_crazymod_sailorneptune"] = true,
        ["j_crazymod_sailorpluto"] = true,
        ["j_crazymod_sailorsaturn"] = true,
        ["j_crazymod_sailoruranus"] = true,
        ["j_crazymod_sailorvenus"] = true,
        ["j_crazymod_sayori"] = true,
        ["j_crazymod_silver"] = true,
        ["j_crazymod_spesashworth"] = true,
        ["j_crazymod_squidwardtentacles"] = true,
        ["j_crazymod_thebigcheese"] = true,
        ["j_crazymod_thewinbuttonthejokertoendalljokers"] = true,
        ["j_crazymod_thirtyminutesoritsfree"] = true,
        ["j_crazymod_toilet"] = true,
        ["j_crazymod_trafficmanager"] = true,
        ["j_crazymod_tuxedomask"] = true,
        ["j_crazymod_vacantjoker"] = true,
        ["j_crazymod_yuri"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_cliche_deck_jokers",
    cards = {
        ["j_crazymod__2048"] = true,
        ["j_crazymod_akitaneru"] = true,
        ["j_crazymod_amore"] = true,
        ["j_crazymod_applecore"] = true,
        ["j_crazymod_badapple"] = true,
        ["j_crazymod_bemeebeth"] = true,
        ["j_crazymod_bonniesfacepizza"] = true,
        ["j_crazymod_camuigackpo"] = true,
        ["j_crazymod_canvas"] = true,
        ["j_crazymod_chaostheory"] = true,
        ["j_crazymod_chuckecheese"] = true,
        ["j_crazymod_crazydave"] = true,
        ["j_crazymod_cutawaygag"] = true,
        ["j_crazymod_dominos"] = true,
        ["j_crazymod_emerald"] = true,
        ["j_crazymod_ethan"] = true,
        ["j_crazymod_flhorban920"] = true,
        ["j_crazymod_freddyfazbear"] = true,
        ["j_crazymod_gachacapsule"] = true,
        ["j_crazymod_goldendelicious"] = true,
        ["j_crazymod_grannysmith"] = true,
        ["j_crazymod_grilledcheese"] = true,
        ["j_crazymod_grossmichel"] = true,
        ["j_crazymod_gumi"] = true,
        ["j_crazymod_happymeal"] = true,
        ["j_crazymod_hatsunemiku"] = true,
        ["j_crazymod_honeycrisp"] = true,
        ["j_crazymod_j"] = true,
        ["j_crazymod_jokerbutbetter"] = true,
        ["j_crazymod_jokerbutevenmorebetter"] = true,
        ["j_crazymod_kagaminelen"] = true,
        ["j_crazymod_kagaminerin"] = true,
        ["j_crazymod_kaito"] = true,
        ["j_crazymod_kasaneteto"] = true,
        ["j_crazymod_kris"] = true,
        ["j_crazymod_lastbreath"] = true,
        ["j_crazymod_lunaandartemis"] = true,
        ["j_crazymod_lyra"] = true,
        ["j_crazymod_mathematicalhandboost"] = true,
        ["j_crazymod_megurineluka"] = true,
        ["j_crazymod_meiko"] = true,
        ["j_crazymod_otherjoker"] = true,
        ["j_crazymod_otherjokerbutbetter"] = true,
        ["j_crazymod_otherjokerbutevenmorebetter"] = true,
        ["j_crazymod_otherotherjoker"] = true,
        ["j_crazymod_pineapplepizza"] = true,
        ["j_crazymod_pixeljoker"] = true,
        ["j_crazymod_pizzabox"] = true,
        ["j_crazymod_pizzacrust"] = true,
        ["j_crazymod_pizzaface"] = true,
        ["j_crazymod_plastictangerine"] = true,
        ["j_crazymod_pokemonrgby"] = true,
        ["j_crazymod_rekoj"] = true,
        ["j_crazymod_ringosrevenge"] = true,
        ["j_crazymod_sailorchibimoon"] = true,
        ["j_crazymod_sailorjupiter"] = true,
        ["j_crazymod_sailormars"] = true,
        ["j_crazymod_sailormercury"] = true,
        ["j_crazymod_sailormoon"] = true,
        ["j_crazymod_sailorneptune"] = true,
        ["j_crazymod_sailorpluto"] = true,
        ["j_crazymod_sailorsaturn"] = true,
        ["j_crazymod_sailoruranus"] = true,
        ["j_crazymod_sailorvenus"] = true,
        ["j_crazymod_silver"] = true,
        ["j_crazymod_squidwardtentacles"] = true,
        ["j_crazymod_thebigcheese"] = true,
        ["j_crazymod_thirtyminutesoritsfree"] = true,
        ["j_crazymod_toilet"] = true,
        ["j_crazymod_trafficmanager"] = true,
        ["j_crazymod_tuxedomask"] = true,
        ["j_crazymod_vacantjoker"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_vocaloid",
    cards = {
        ["j_crazymod_akitaneru"] = true,
        ["j_crazymod_camuigackpo"] = true,
        ["j_crazymod_gumi"] = true,
        ["j_crazymod_hatsunemiku"] = true,
        ["j_crazymod_kagaminelen"] = true,
        ["j_crazymod_kagaminerin"] = true,
        ["j_crazymod_kaito"] = true,
        ["j_crazymod_kasaneteto"] = true,
        ["j_crazymod_megurineluka"] = true,
        ["j_crazymod_meiko"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_pizza_jokers",
    cards = {
        ["j_crazymod_amore"] = true,
        ["j_crazymod_bonniesfacepizza"] = true,
        ["j_crazymod_chuckecheese"] = true,
        ["j_crazymod_dominos"] = true,
        ["j_crazymod_outpizzathehut"] = true,
        ["j_crazymod_pineapplepizza"] = true,
        ["j_crazymod_pizzabox"] = true,
        ["j_crazymod_pizzacrust"] = true,
        ["j_crazymod_pizzaface"] = true,
        ["j_crazymod_thirtyminutesoritsfree"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_Food",
    cards = {
        ["j_crazymod_applecore"] = true,
        ["j_crazymod_badapple"] = true,
        ["j_crazymod_bananaslamma"] = true,
        ["j_crazymod_enchantedgoldenapple"] = true,
        ["j_crazymod_flhorban920"] = true,
        ["j_crazymod_goldendelicious"] = true,
        ["j_crazymod_grannysmith"] = true,
        ["j_crazymod_grossmichel"] = true,
        ["j_crazymod_honeycrisp"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_sailormoon",
    cards = {
        ["j_crazymod_lunaandartemis"] = true,
        ["j_crazymod_sailorchibimoon"] = true,
        ["j_crazymod_sailorjupiter"] = true,
        ["j_crazymod_sailormars"] = true,
        ["j_crazymod_sailormercury"] = true,
        ["j_crazymod_sailormoon"] = true,
        ["j_crazymod_sailorneptune"] = true,
        ["j_crazymod_sailorpluto"] = true,
        ["j_crazymod_sailorsaturn"] = true,
        ["j_crazymod_sailoruranus"] = true,
        ["j_crazymod_sailorvenus"] = true,
        ["j_crazymod_tuxedomask"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_ddlc",
    cards = {
        ["j_crazymod_mc"] = true,
        ["j_crazymod_monika"] = true,
        ["j_crazymod_natsuki"] = true,
        ["j_crazymod_sayori"] = true,
        ["j_crazymod_yuri"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end