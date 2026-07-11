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
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/otherjoker.lua"))()
    assert(SMODS.load_file("jokers/jokerbutbetter.lua"))()
    assert(SMODS.load_file("jokers/jokerbutevenmorebetter.lua"))()
    assert(SMODS.load_file("jokers/otherjokerbutbetter.lua"))()
    assert(SMODS.load_file("jokers/otherjokerbutevenmorebetter.lua"))()
    assert(SMODS.load_file("jokers/otherotherjoker.lua"))()
    assert(SMODS.load_file("jokers/vacantjoker.lua"))()
    assert(SMODS.load_file("jokers/pixeljoker.lua"))()
    assert(SMODS.load_file("jokers/rekoj.lua"))()
    assert(SMODS.load_file("jokers/j.lua"))()
    assert(SMODS.load_file("jokers/grossmichel.lua"))()
    assert(SMODS.load_file("jokers/flhorban920.lua"))()
    assert(SMODS.load_file("jokers/bananaslamma.lua"))()
    assert(SMODS.load_file("jokers/applecore.lua"))()
    assert(SMODS.load_file("jokers/honeycrisp.lua"))()
    assert(SMODS.load_file("jokers/grannysmith.lua"))()
    assert(SMODS.load_file("jokers/goldendelicious.lua"))()
    assert(SMODS.load_file("jokers/enchantedgoldenapple.lua"))()
    assert(SMODS.load_file("jokers/andouapple.lua"))()
    assert(SMODS.load_file("jokers/plastictangerine.lua"))()
    assert(SMODS.load_file("jokers/pizzabox.lua"))()
    assert(SMODS.load_file("jokers/pineapplepizza.lua"))()
    assert(SMODS.load_file("jokers/pizzaface.lua"))()
    assert(SMODS.load_file("jokers/amore.lua"))()
    assert(SMODS.load_file("jokers/dominos.lua"))()
    assert(SMODS.load_file("jokers/pizzacrust.lua"))()
    assert(SMODS.load_file("jokers/thirtyminutesoritsfree.lua"))()
    assert(SMODS.load_file("jokers/bonniesfacepizza.lua"))()
    assert(SMODS.load_file("jokers/chuckecheese.lua"))()
    assert(SMODS.load_file("jokers/outpizzathehut.lua"))()
    assert(SMODS.load_file("jokers/ethan.lua"))()
    assert(SMODS.load_file("jokers/kris.lua"))()
    assert(SMODS.load_file("jokers/lyra.lua"))()
    assert(SMODS.load_file("jokers/silver.lua"))()
    assert(SMODS.load_file("jokers/thebigcheese.lua"))()
    assert(SMODS.load_file("jokers/lastbreath.lua"))()
    assert(SMODS.load_file("jokers/opoc.lua"))()
    assert(SMODS.load_file("jokers/freddyfazbear.lua"))()
    assert(SMODS.load_file("jokers/funtimefoxy.lua"))()
    assert(SMODS.load_file("jokers/squidwardtentacles.lua"))()
    assert(SMODS.load_file("jokers/cutawaygag.lua"))()
    assert(SMODS.load_file("jokers/revengeofringo.lua"))()
    assert(SMODS.load_file("jokers/maliceofmaguro.lua"))()
    assert(SMODS.load_file("jokers/resentmentofrisukuma.lua"))()
    assert(SMODS.load_file("jokers/entanglementofecolo.lua"))()
    assert(SMODS.load_file("jokers/gachacapsule.lua"))()
    assert(SMODS.load_file("jokers/toilet.lua"))()
    assert(SMODS.load_file("jokers/chaostheory.lua"))()
    assert(SMODS.load_file("jokers/happymeal.lua"))()
    assert(SMODS.load_file("jokers/mathematicalhandboost.lua"))()
    assert(SMODS.load_file("jokers/grilledcheese.lua"))()
    assert(SMODS.load_file("jokers/_2048.lua"))()
    assert(SMODS.load_file("jokers/emerald.lua"))()
    assert(SMODS.load_file("jokers/rushhour.lua"))()
    assert(SMODS.load_file("jokers/mms.lua"))()
    assert(SMODS.load_file("jokers/sailormoon.lua"))()
    assert(SMODS.load_file("jokers/sailormercury.lua"))()
    assert(SMODS.load_file("jokers/sailormars.lua"))()
    assert(SMODS.load_file("jokers/sailorjupiter.lua"))()
    assert(SMODS.load_file("jokers/sailorvenus.lua"))()
    assert(SMODS.load_file("jokers/sailorchibimoon.lua"))()
    assert(SMODS.load_file("jokers/sailorpluto.lua"))()
    assert(SMODS.load_file("jokers/sailoruranus.lua"))()
    assert(SMODS.load_file("jokers/sailorneptune.lua"))()
    assert(SMODS.load_file("jokers/sailorsaturn.lua"))()
    assert(SMODS.load_file("jokers/tuxedomask.lua"))()
    assert(SMODS.load_file("jokers/lunaandartemis.lua"))()
    assert(SMODS.load_file("jokers/pokemonrgby.lua"))()
    assert(SMODS.load_file("jokers/canvas.lua"))()
    assert(SMODS.load_file("jokers/rivertrio.lua"))()
    assert(SMODS.load_file("jokers/tertiarycolors.lua"))()
    assert(SMODS.load_file("jokers/tux.lua"))()
    assert(SMODS.load_file("jokers/macintosh.lua"))()
    assert(SMODS.load_file("jokers/bliss.lua"))()
    assert(SMODS.load_file("jokers/pierrot.lua"))()
    assert(SMODS.load_file("jokers/hatsunemiku.lua"))()
    assert(SMODS.load_file("jokers/kagaminelen.lua"))()
    assert(SMODS.load_file("jokers/kagaminerin.lua"))()
    assert(SMODS.load_file("jokers/megurineluka.lua"))()
    assert(SMODS.load_file("jokers/meiko.lua"))()
    assert(SMODS.load_file("jokers/kaito.lua"))()
    assert(SMODS.load_file("jokers/gumi.lua"))()
    assert(SMODS.load_file("jokers/camuigackpo.lua"))()
    assert(SMODS.load_file("jokers/akitaneru.lua"))()
    assert(SMODS.load_file("jokers/kasaneteto.lua"))()
    assert(SMODS.load_file("jokers/monika.lua"))()
    assert(SMODS.load_file("jokers/sayori.lua"))()
    assert(SMODS.load_file("jokers/yuri.lua"))()
    assert(SMODS.load_file("jokers/natsuki.lua"))()
    assert(SMODS.load_file("jokers/mc.lua"))()
    assert(SMODS.load_file("jokers/royalalchemy.lua"))()
    assert(SMODS.load_file("jokers/blackcat.lua"))()
    assert(SMODS.load_file("jokers/whitecat.lua"))()
    assert(SMODS.load_file("jokers/graycat.lua"))()
    assert(SMODS.load_file("jokers/pyramidscheme.lua"))()
    assert(SMODS.load_file("jokers/crazydave.lua"))()
    assert(SMODS.load_file("jokers/repeater.lua"))()
    assert(SMODS.load_file("jokers/octozombie.lua"))()
    assert(SMODS.load_file("jokers/chicken.lua"))()
    assert(SMODS.load_file("jokers/chickenwrangler.lua"))()
    assert(SMODS.load_file("jokers/frutigeraero.lua"))()
    assert(SMODS.load_file("jokers/frutigeraurora.lua"))()
    assert(SMODS.load_file("jokers/dorfic.lua"))()
    assert(SMODS.load_file("jokers/darkaero.lua"))()
    assert(SMODS.load_file("jokers/frutigermetro.lua"))()
    assert(SMODS.load_file("jokers/unicorn.lua"))()
    assert(SMODS.load_file("jokers/potofgold.lua"))()
    assert(SMODS.load_file("jokers/indigo.lua"))()
    assert(SMODS.load_file("jokers/prideflag.lua"))()
    assert(SMODS.load_file("jokers/paintspill.lua"))()
    assert(SMODS.load_file("jokers/mooncheese.lua"))()
    assert(SMODS.load_file("jokers/lunarflag.lua"))()
    assert(SMODS.load_file("jokers/moonstick.lua"))()
    assert(SMODS.load_file("jokers/bluemoon.lua"))()
    assert(SMODS.load_file("jokers/eclipse.lua"))()
    assert(SMODS.load_file("jokers/bemeebeth.lua"))()
    assert(SMODS.load_file("jokers/asteroid.lua"))()
    assert(SMODS.load_file("jokers/miyakoakiyama.lua"))()
    assert(SMODS.load_file("jokers/heirtothethrone.lua"))()
    assert(SMODS.load_file("jokers/blackjack.lua"))()
    assert(SMODS.load_file("jokers/spesashworth.lua"))()
    assert(SMODS.load_file("jokers/hezlyahonen.lua"))()
    assert(SMODS.load_file("jokers/dianaaddison.lua"))()
    assert(SMODS.load_file("jokers/cloveracker.lua"))()
    assert(SMODS.load_file("jokers/thewinbuttonthejokertoendalljokers.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/thedough.lua"))()
    assert(SMODS.load_file("consumables/thepen.lua"))()
    assert(SMODS.load_file("consumables/theleek.lua"))()
    assert(SMODS.load_file("consumables/crystaltokyo.lua"))()
    assert(SMODS.load_file("consumables/homework.lua"))()
    assert(SMODS.load_file("consumables/Synth.lua"))()
    assert(SMODS.load_file("consumables/microphone.lua"))()
    assert(SMODS.load_file("consumables/vista.lua"))()
    assert(SMODS.load_file("consumables/prism.lua"))()
    assert(SMODS.load_file("consumables/crescent.lua"))()
    assert(SMODS.load_file("consumables/insanity.lua"))()
    assert(SMODS.load_file("consumables/renpyconverter.lua"))()
    assert(SMODS.load_file("consumables/red.lua"))()
    assert(SMODS.load_file("consumables/orange.lua"))()
    assert(SMODS.load_file("consumables/yellow.lua"))()
    assert(SMODS.load_file("consumables/lime.lua"))()
    assert(SMODS.load_file("consumables/green.lua"))()
    assert(SMODS.load_file("consumables/emerald.lua"))()
    assert(SMODS.load_file("consumables/cyan.lua"))()
    assert(SMODS.load_file("consumables/azure.lua"))()
    assert(SMODS.load_file("consumables/blue.lua"))()
    assert(SMODS.load_file("consumables/purple.lua"))()
    assert(SMODS.load_file("consumables/magenta.lua"))()
    assert(SMODS.load_file("consumables/rose.lua"))()
    assert(SMODS.load_file("consumables/maroon.lua"))()
    assert(SMODS.load_file("consumables/olive.lua"))()
    assert(SMODS.load_file("consumables/forest.lua"))()
    assert(SMODS.load_file("consumables/teal.lua"))()
    assert(SMODS.load_file("consumables/navy.lua"))()
    assert(SMODS.load_file("consumables/mauve.lua"))()
    assert(SMODS.load_file("consumables/salmon.lua"))()
    assert(SMODS.load_file("consumables/cream.lua"))()
    assert(SMODS.load_file("consumables/mint.lua"))()
    assert(SMODS.load_file("consumables/sky.lua"))()
    assert(SMODS.load_file("consumables/periwinkle.lua"))()
    assert(SMODS.load_file("consumables/pink.lua"))()
    assert(SMODS.load_file("consumables/black.lua"))()
    assert(SMODS.load_file("consumables/gray.lua"))()
    assert(SMODS.load_file("consumables/white.lua"))()
    assert(SMODS.load_file("consumables/brown.lua"))()
end
--load the sets
assert(SMODS.load_file("consumables/sets.lua"))()
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/pizzacard.lua"))()
    assert(SMODS.load_file("enhancements/poemcard.lua"))()
end

-- load the seals
if true then
    assert(SMODS.load_file("seals/appleseal.lua"))()
    assert(SMODS.load_file("seals/musicalseal.lua"))()
    assert(SMODS.load_file("seals/holdseal.lua"))()
    assert(SMODS.load_file("seals/rainbowseal.lua"))()
    assert(SMODS.load_file("seals/lunarseal.lua"))()
    assert(SMODS.load_file("seals/frutigerseal.lua"))()
end

-- load the vouchers
if true then
    assert(SMODS.load_file("vouchers/ms_paint.lua"))()
    assert(SMODS.load_file("vouchers/krita.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/cliche_deck.lua"))()
    assert(SMODS.load_file("decks/literature_deck.lua"))()
    assert(SMODS.load_file("decks/greasy_deck.lua"))()
    assert(SMODS.load_file("decks/ace_mage_deck.lua"))()
    assert(SMODS.load_file("decks/sailor_deck.lua"))()
    assert(SMODS.load_file("decks/splattered_deck.lua"))()
    assert(SMODS.load_file("decks/sound_deck.lua"))()
    assert(SMODS.load_file("decks/kitty_deck.lua"))()
    assert(SMODS.load_file("decks/apple_deck.lua"))()
    assert(SMODS.load_file("decks/joke_deck.lua"))()
end



assert(SMODS.load_file("rarities.lua"))()


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
--load sounds
assert(SMODS.load_file("sounds.lua"))()
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
        ["j_crazymod_grilledcheese"] = true,
        ["j_crazymod__2048"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_jokers",
    cards = {
        ["j_crazymod_otherjoker"] = true,
        ["j_crazymod_jokerbutbetter"] = true,
        ["j_crazymod_jokerbutevenmorebetter"] = true,
        ["j_crazymod_otherjokerbutbetter"] = true,
        ["j_crazymod_otherjokerbutevenmorebetter"] = true,
        ["j_crazymod_otherotherjoker"] = true,
        ["j_crazymod_vacantjoker"] = true,
        ["j_crazymod_pixeljoker"] = true,
        ["j_crazymod_rekoj"] = true,
        ["j_crazymod_j"] = true,
        ["j_crazymod_grossmichel"] = true,
        ["j_crazymod_flhorban920"] = true,
        ["j_crazymod_bananaslamma"] = true,
        ["j_crazymod_applecore"] = true,
        ["j_crazymod_honeycrisp"] = true,
        ["j_crazymod_grannysmith"] = true,
        ["j_crazymod_goldendelicious"] = true,
        ["j_crazymod_enchantedgoldenapple"] = true,
        ["j_crazymod_andouapple"] = true,
        ["j_crazymod_plastictangerine"] = true,
        ["j_crazymod_pizzabox"] = true,
        ["j_crazymod_pineapplepizza"] = true,
        ["j_crazymod_pizzaface"] = true,
        ["j_crazymod_amore"] = true,
        ["j_crazymod_dominos"] = true,
        ["j_crazymod_pizzacrust"] = true,
        ["j_crazymod_thirtyminutesoritsfree"] = true,
        ["j_crazymod_bonniesfacepizza"] = true,
        ["j_crazymod_chuckecheese"] = true,
        ["j_crazymod_outpizzathehut"] = true,
        ["j_crazymod_ethan"] = true,
        ["j_crazymod_kris"] = true,
        ["j_crazymod_lyra"] = true,
        ["j_crazymod_silver"] = true,
        ["j_crazymod_thebigcheese"] = true,
        ["j_crazymod_lastbreath"] = true,
        ["j_crazymod_opoc"] = true,
        ["j_crazymod_freddyfazbear"] = true,
        ["j_crazymod_funtimefoxy"] = true,
        ["j_crazymod_squidwardtentacles"] = true,
        ["j_crazymod_cutawaygag"] = true,
        ["j_crazymod_revengeofringo"] = true,
        ["j_crazymod_maliceofmaguro"] = true,
        ["j_crazymod_resentmentofrisukuma"] = true,
        ["j_crazymod_entanglementofecolo"] = true,
        ["j_crazymod_gachacapsule"] = true,
        ["j_crazymod_toilet"] = true,
        ["j_crazymod_chaostheory"] = true,
        ["j_crazymod_happymeal"] = true,
        ["j_crazymod_mathematicalhandboost"] = true,
        ["j_crazymod_grilledcheese"] = true,
        ["j_crazymod__2048"] = true,
        ["j_crazymod_emerald"] = true,
        ["j_crazymod_rushhour"] = true,
        ["j_crazymod_mms"] = true,
        ["j_crazymod_sailormoon"] = true,
        ["j_crazymod_sailormercury"] = true,
        ["j_crazymod_sailormars"] = true,
        ["j_crazymod_sailorjupiter"] = true,
        ["j_crazymod_sailorvenus"] = true,
        ["j_crazymod_sailorchibimoon"] = true,
        ["j_crazymod_sailorpluto"] = true,
        ["j_crazymod_sailoruranus"] = true,
        ["j_crazymod_sailorneptune"] = true,
        ["j_crazymod_sailorsaturn"] = true,
        ["j_crazymod_tuxedomask"] = true,
        ["j_crazymod_lunaandartemis"] = true,
        ["j_crazymod_pokemonrgby"] = true,
        ["j_crazymod_canvas"] = true,
        ["j_crazymod_rivertrio"] = true,
        ["j_crazymod_tertiarycolors"] = true,
        ["j_crazymod_tux"] = true,
        ["j_crazymod_macintosh"] = true,
        ["j_crazymod_bliss"] = true,
        ["j_crazymod_pierrot"] = true,
        ["j_crazymod_hatsunemiku"] = true,
        ["j_crazymod_kagaminelen"] = true,
        ["j_crazymod_kagaminerin"] = true,
        ["j_crazymod_megurineluka"] = true,
        ["j_crazymod_meiko"] = true,
        ["j_crazymod_kaito"] = true,
        ["j_crazymod_gumi"] = true,
        ["j_crazymod_camuigackpo"] = true,
        ["j_crazymod_akitaneru"] = true,
        ["j_crazymod_kasaneteto"] = true,
        ["j_crazymod_monika"] = true,
        ["j_crazymod_sayori"] = true,
        ["j_crazymod_yuri"] = true,
        ["j_crazymod_natsuki"] = true,
        ["j_crazymod_mc"] = true,
        ["j_crazymod_royalalchemy"] = true,
        ["j_crazymod_blackcat"] = true,
        ["j_crazymod_whitecat"] = true,
        ["j_crazymod_graycat"] = true,
        ["j_crazymod_pyramidscheme"] = true,
        ["j_crazymod_crazydave"] = true,
        ["j_crazymod_repeater"] = true,
        ["j_crazymod_octozombie"] = true,
        ["j_crazymod_chicken"] = true,
        ["j_crazymod_chickenwrangler"] = true,
        ["j_crazymod_frutigeraero"] = true,
        ["j_crazymod_frutigeraurora"] = true,
        ["j_crazymod_dorfic"] = true,
        ["j_crazymod_darkaero"] = true,
        ["j_crazymod_frutigermetro"] = true,
        ["j_crazymod_unicorn"] = true,
        ["j_crazymod_potofgold"] = true,
        ["j_crazymod_indigo"] = true,
        ["j_crazymod_prideflag"] = true,
        ["j_crazymod_paintspill"] = true,
        ["j_crazymod_mooncheese"] = true,
        ["j_crazymod_lunarflag"] = true,
        ["j_crazymod_moonstick"] = true,
        ["j_crazymod_bluemoon"] = true,
        ["j_crazymod_eclipse"] = true,
        ["j_crazymod_bemeebeth"] = true,
        ["j_crazymod_asteroid"] = true,
        ["j_crazymod_miyakoakiyama"] = true,
        ["j_crazymod_heirtothethrone"] = true,
        ["j_crazymod_blackjack"] = true,
        ["j_crazymod_spesashworth"] = true,
        ["j_crazymod_hezlyahonen"] = true,
        ["j_crazymod_dianaaddison"] = true,
        ["j_crazymod_cloveracker"] = true,
        ["j_crazymod_thewinbuttonthejokertoendalljokers"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_cliche_deck_jokers",
    cards = {
        ["j_crazymod_otherjoker"] = true,
        ["j_crazymod_jokerbutbetter"] = true,
        ["j_crazymod_jokerbutevenmorebetter"] = true,
        ["j_crazymod_otherjokerbutbetter"] = true,
        ["j_crazymod_otherjokerbutevenmorebetter"] = true,
        ["j_crazymod_otherotherjoker"] = true,
        ["j_crazymod_vacantjoker"] = true,
        ["j_crazymod_pixeljoker"] = true,
        ["j_crazymod_rekoj"] = true,
        ["j_crazymod_j"] = true,
        ["j_crazymod_grossmichel"] = true,
        ["j_crazymod_flhorban920"] = true,
        ["j_crazymod_applecore"] = true,
        ["j_crazymod_honeycrisp"] = true,
        ["j_crazymod_grannysmith"] = true,
        ["j_crazymod_goldendelicious"] = true,
        ["j_crazymod_andouapple"] = true,
        ["j_crazymod_plastictangerine"] = true,
        ["j_crazymod_pizzabox"] = true,
        ["j_crazymod_pineapplepizza"] = true,
        ["j_crazymod_pizzaface"] = true,
        ["j_crazymod_amore"] = true,
        ["j_crazymod_dominos"] = true,
        ["j_crazymod_pizzacrust"] = true,
        ["j_crazymod_thirtyminutesoritsfree"] = true,
        ["j_crazymod_bonniesfacepizza"] = true,
        ["j_crazymod_chuckecheese"] = true,
        ["j_crazymod_ethan"] = true,
        ["j_crazymod_kris"] = true,
        ["j_crazymod_lyra"] = true,
        ["j_crazymod_silver"] = true,
        ["j_crazymod_thebigcheese"] = true,
        ["j_crazymod_lastbreath"] = true,
        ["j_crazymod_freddyfazbear"] = true,
        ["j_crazymod_funtimefoxy"] = true,
        ["j_crazymod_squidwardtentacles"] = true,
        ["j_crazymod_cutawaygag"] = true,
        ["j_crazymod_revengeofringo"] = true,
        ["j_crazymod_maliceofmaguro"] = true,
        ["j_crazymod_resentmentofrisukuma"] = true,
        ["j_crazymod_gachacapsule"] = true,
        ["j_crazymod_toilet"] = true,
        ["j_crazymod_chaostheory"] = true,
        ["j_crazymod_happymeal"] = true,
        ["j_crazymod_mathematicalhandboost"] = true,
        ["j_crazymod_grilledcheese"] = true,
        ["j_crazymod__2048"] = true,
        ["j_crazymod_emerald"] = true,
        ["j_crazymod_rushhour"] = true,
        ["j_crazymod_mms"] = true,
        ["j_crazymod_sailormoon"] = true,
        ["j_crazymod_sailormercury"] = true,
        ["j_crazymod_sailormars"] = true,
        ["j_crazymod_sailorjupiter"] = true,
        ["j_crazymod_sailorvenus"] = true,
        ["j_crazymod_sailorchibimoon"] = true,
        ["j_crazymod_sailorpluto"] = true,
        ["j_crazymod_sailoruranus"] = true,
        ["j_crazymod_sailorneptune"] = true,
        ["j_crazymod_sailorsaturn"] = true,
        ["j_crazymod_tuxedomask"] = true,
        ["j_crazymod_lunaandartemis"] = true,
        ["j_crazymod_pokemonrgby"] = true,
        ["j_crazymod_canvas"] = true,
        ["j_crazymod_tertiarycolors"] = true,
        ["j_crazymod_tux"] = true,
        ["j_crazymod_macintosh"] = true,
        ["j_crazymod_bliss"] = true,
        ["j_crazymod_hatsunemiku"] = true,
        ["j_crazymod_kagaminelen"] = true,
        ["j_crazymod_kagaminerin"] = true,
        ["j_crazymod_megurineluka"] = true,
        ["j_crazymod_meiko"] = true,
        ["j_crazymod_kaito"] = true,
        ["j_crazymod_gumi"] = true,
        ["j_crazymod_camuigackpo"] = true,
        ["j_crazymod_akitaneru"] = true,
        ["j_crazymod_kasaneteto"] = true,
        ["j_crazymod_crazydave"] = true,
        ["j_crazymod_repeater"] = true,
        ["j_crazymod_octozombie"] = true,
        ["j_crazymod_chicken"] = true,
        ["j_crazymod_chickenwrangler"] = true,
        ["j_crazymod_frutigeraero"] = true,
        ["j_crazymod_frutigeraurora"] = true,
        ["j_crazymod_dorfic"] = true,
        ["j_crazymod_darkaero"] = true,
        ["j_crazymod_frutigermetro"] = true,
        ["j_crazymod_unicorn"] = true,
        ["j_crazymod_potofgold"] = true,
        ["j_crazymod_indigo"] = true,
        ["j_crazymod_prideflag"] = true,
        ["j_crazymod_paintspill"] = true,
        ["j_crazymod_mooncheese"] = true,
        ["j_crazymod_lunarflag"] = true,
        ["j_crazymod_moonstick"] = true,
        ["j_crazymod_bluemoon"] = true,
        ["j_crazymod_eclipse"] = true,
        ["j_crazymod_bemeebeth"] = true,
        ["j_crazymod_asteroid"] = true,
        ["j_crazymod_miyakoakiyama"] = true,
        ["j_crazymod_heirtothethrone"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_Food",
    cards = {
        ["j_crazymod_grossmichel"] = true,
        ["j_crazymod_flhorban920"] = true,
        ["j_crazymod_bananaslamma"] = true,
        ["j_crazymod_applecore"] = true,
        ["j_crazymod_honeycrisp"] = true,
        ["j_crazymod_grannysmith"] = true,
        ["j_crazymod_goldendelicious"] = true,
        ["j_crazymod_enchantedgoldenapple"] = true,
        ["j_crazymod_andouapple"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_pizza_jokers",
    cards = {
        ["j_crazymod_pizzabox"] = true,
        ["j_crazymod_pineapplepizza"] = true,
        ["j_crazymod_pizzaface"] = true,
        ["j_crazymod_amore"] = true,
        ["j_crazymod_dominos"] = true,
        ["j_crazymod_pizzacrust"] = true,
        ["j_crazymod_thirtyminutesoritsfree"] = true,
        ["j_crazymod_bonniesfacepizza"] = true,
        ["j_crazymod_chuckecheese"] = true,
        ["j_crazymod_outpizzathehut"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_sailormoon",
    cards = {
        ["j_crazymod_sailormoon"] = true,
        ["j_crazymod_sailormercury"] = true,
        ["j_crazymod_sailormars"] = true,
        ["j_crazymod_sailorjupiter"] = true,
        ["j_crazymod_sailorvenus"] = true,
        ["j_crazymod_sailorchibimoon"] = true,
        ["j_crazymod_sailorpluto"] = true,
        ["j_crazymod_sailoruranus"] = true,
        ["j_crazymod_sailorneptune"] = true,
        ["j_crazymod_sailorsaturn"] = true,
        ["j_crazymod_tuxedomask"] = true,
        ["j_crazymod_lunaandartemis"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_vocaloid",
    cards = {
        ["j_crazymod_hatsunemiku"] = true,
        ["j_crazymod_kagaminelen"] = true,
        ["j_crazymod_kagaminerin"] = true,
        ["j_crazymod_megurineluka"] = true,
        ["j_crazymod_meiko"] = true,
        ["j_crazymod_kaito"] = true,
        ["j_crazymod_gumi"] = true,
        ["j_crazymod_camuigackpo"] = true,
        ["j_crazymod_akitaneru"] = true,
        ["j_crazymod_kasaneteto"] = true
    },
})

SMODS.ObjectType({
    key = "crazymod_crazymod_ddlc",
    cards = {
        ["j_crazymod_monika"] = true,
        ["j_crazymod_sayori"] = true,
        ["j_crazymod_yuri"] = true,
        ["j_crazymod_natsuki"] = true,
        ["j_crazymod_mc"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end