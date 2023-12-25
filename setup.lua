local util = require("data-util")

BZ_CE_Recipes = {}
function bz_ce_add_recipe(name, extra)
    if not util.contains(BZ_CE_Recipes, name) then
        table.insert(BZ_CE_Recipes, name)
    end
end

