require("setup")

if mods["bzcarbon"] then bz_ce_add_recipe("carbon-black") end
if mods["bztin"] then
    bz_ce_add_recipe("bronze-plate")
    bz_ce_add_recipe("tinned-cable")
end
if mods["dark-matter-replicators-18"] then
    local eff_data = {}

    for i, recipe in pairs(BZ_CE_Recipes) do
        -- add remaining recipes with direct items to find the icons
        if data.raw.recipe[recipe] and not eff_data[recipe] then
            local research_level = 1
            for tech, tbl in pairs(data.raw.technology) do
                for _, effect in pairs(tbl.effects or {}) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        recipe then
                        research_level = math.min(#tbl.unit.ingredients, 6)
                    end
                end
            end
            eff_data[recipe] = research_level
        end
    end
    local repl_per_research_level = {
        "ore", "shape", "alloy", "device4", "device5"
    }
    for recipe, research_level in pairs(eff_data) do
            log("Adding " .. recipe .. " to dark matter replicators")
            repltech_recipe(recipe, repl_per_research_level[research_level] or
                                "device5")
    end
end
