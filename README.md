# feed_pressure_mapping

| Script            | Function                                                                                              |
|:------------------|:------------------------------------------------------------------------------------------------------|
| 01_tidying_data   | This script is used for tidying all data products used in the project                                 |
| 02_global_ingredient_demand.Rmd | Calculates the gross ingredient demand for salmon based on the ingredient compositions of different diets (applied globally not country specific), country-specific FCRs and production volumes |
| 03_crop_raw_materials_demand.Rmd | Isolates raw materials that support crop-based aquafeed ingredients and synthesises with production data from FAO and MAPSPAM, yield conversion factors from FAO, and price data from TBC. Economic allocation approaches are used to avoid double counting crop biomass |