



These two sections are for individual nutrients

First for Nitrogen
```{r}
# marine_diet_N <- list.files(here("data/spatial/marine_diet/int"), pattern = "_N_", full.names = TRUE)
# marine_diet_N <- marine_diet_N[!grepl("forage_fish|_gp", marine_diet_N)]
# 
# plant_diet_N <- list.files(here("data/spatial/plant_diet/int"), pattern = "_N_", full.names = TRUE)
# plant_diet_N <- plant_diet_N[!grepl("forage_fish|_gp", plant_diet_N)]
# 
# 
# 
# #REPROJECT PER KM2 DATA TO GALL PETERS EQUAL AREA FOR TOTAL PRESSURES
# 
# this_file <- marine_diet_N[[1]]
# 
# 
# # Marine diets
#   
# map(.x = marine_diet_N, .f = \(this_file){
#     
#     base <- tools::file_path_sans_ext(basename(this_file))  
#     
#      this_country <- if_else(grepl("EPC|NAT|OTH", base), true = str_extract(base, "EPC|NAT|OTH"), false = str_sub(base, start = nchar(base)-2, end = nchar(base)))
#     
#     this_allocation_method <- str_extract(base, "ge_allocation|mass_allocation")
#     
#     this_ingredient <- str_extract(base, "[^_]+")
#     
#     saveName <- sprintf(here("data/spatial/marine_diet/int/%s_N_gp_%s_%s.tif"), this_ingredient, this_allocation_method, this_country)
#     
#     if(!file.exists(saveName)){
#       
#       message("Processing ", basename(saveName))
#       
#       this_rast <- rast(this_file)
#       
#       this_reprojected_rast <- project(this_rast, gall_peters)
#       
#       this_adj_reproj_rast <- this_reprojected_rast*cellSize(this_reprojected_rast, unit = "km") #multiply up the footprints from per km2 to total based on cellsize
#       names(this_adj_reproj_rast) <- "N_eq"
# 
#       writeRaster(x = this_adj_reproj_rast, filename = saveName, overwrite = TRUE)
#       
#       return(this_adj_reproj_rast)
#     }
#   })
# 
# 
# 
# #Plant diets
# 
# this_file <- plant_diet_N[[1]]
# 
#   
# map(.x = plant_diet_N, .f = \(this_file){
#     
#     base <- tools::file_path_sans_ext(basename(this_file))  
#     
#    this_country <- if_else(grepl("EPC|NAT|OTH", base), true = str_extract(base, "EPC|NAT|OTH"), false = str_sub(base, start = nchar(base)-2, end = nchar(base)))
#     
#     this_allocation_method <- str_extract(base, "ge_allocation|mass_allocation")
#     this_ingredient <- str_extract(base, "[^_]+")
#     
#     saveName <- sprintf(here("data/spatial/plant_diet/int/%s_N_gp_%s_%s.tif"), this_ingredient, this_allocation_method, this_country)
#     
#     if(!file.exists(saveName)){
#       
#       message("processing ", basename(saveName))
#       
#       this_rast <- rast(this_file)
#       
#       this_reprojected_rast <- project(this_rast, gall_peters)
#       
#       this_adj_reproj_rast <- this_reprojected_rast*cellSize(this_reprojected_rast, unit = "km") #multiply up the footprints from per km2 to total based on cellsize
#       
#       names(this_adj_reproj_rast) <- "N_eq"
#       
#       writeRaster(x = this_adj_reproj_rast, filename = saveName, overwrite = TRUE)
#       
#       return(this_adj_reproj_rast)
#     }
#   })
# 
# 
# #RESCALE NITROGEN DATA BY PROP OF MAXIMUM GLOBAL NITROGEN ACROSS DIETS
# 
# 
# #NOW FIND THE MAXIMUM TOTAL SCORES FOR NITOGREN INCLUDING ALL INGREDIENTS FOR EACH DIET AND ALLOCATION METHOD - THIS WILL BE USED TO GET A GIVEN CELLS' PROPORTIONAL CONTRIBUTION
# 
# # First need to find maximum scores each ingredient (i.e. which origin yields the greatest)
# # Then need to rescale using the maximum plausible nitrogen for each diet as the denominator
# 
# 
# 
# ## Marine diets
# 
# 
# md_reprojected_rasters_N <- list.files(path = here("data/spatial/marine_diet/int"), pattern = "N_gp", full=TRUE)
# 
# md_ingredients_list <- 
#   readRDS(here("data/tidy_data/demand/total_ingredient_demand.rds")) |> filter(diet=="marine_diet" & total_ingredient_demand>0) |> mutate(ingredients = sub(pattern="-wild", replacement="", ingredients)) |> arrange(ingredients) |> group_by(ingredients) |> group_split()
# 
# 
# #test function
# this_df <- md_ingredients_list[[1]]
# 
# 
# 
# maximum_N_scores_md <-  
#   
#   map_df(md_ingredients_list, .f = \(this_df){
#   
#   this_ingredient <- paste0(this_df$ingredients |> unique(),"_")
#   
#   these_ingredient_rasters_ge <- md_reprojected_rasters_N[grepl(this_ingredient, md_reprojected_rasters_N) & grepl("ge_allocation", md_reprojected_rasters_N)]
#   
#   these_ingredient_rasters_mass <- md_reprojected_rasters_N[grepl(this_ingredient, md_reprojected_rasters_N) & grepl("mass_allocation", md_reprojected_rasters_N)]
#   
#   max_N_ge <- these_ingredient_rasters_ge |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   max_N_mass <- these_ingredient_rasters_mass |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   
#   this_adj_df <- bind_cols(this_df, max_N_ge = max_N_ge, max_N_mass= max_N_mass)
#   
#   
# })
# 
# #get maximum marine diet disturbance scores for each allocation method
# max_md_N_ge <- maximum_N_scores_md |> pull(max_N_ge) |> sum()
# max_md_N_mass <- maximum_N_scores_md |> pull(max_N_mass) |> sum()
# 
# 
# 
# 
# #Plant diets
# 
# pd_reprojected_rasters_N <- list.files(path = here("data/spatial/plant_diet/int"), pattern = "N_gp", full=TRUE)
# 
# 
# pd_ingredients_list <- 
#   readRDS(here("data/tidy_data/demand/total_ingredient_demand.rds")) |> filter(diet=="plant_diet" & total_ingredient_demand>0) |> mutate(ingredients = sub(pattern="-wild", replacement="", ingredients)) |> arrange(ingredients) |> group_by(ingredients) |> group_split()
# 
# this_df <- pd_ingredients_list[[1]]
# 
# maximum_N_scores_pd <-  
#   
#   map_df(pd_ingredients_list, .f = \(this_df){
#   
#   this_ingredient <- paste0(this_df$ingredients |> unique(),"_")
#   
#   these_ingredient_rasters_ge <- pd_reprojected_rasters_N[grepl(this_ingredient, pd_reprojected_rasters_N) & grepl("ge_allocation", pd_reprojected_rasters_N)]
#   
#   these_ingredient_rasters_mass <- pd_reprojected_rasters_N[grepl(this_ingredient, pd_reprojected_rasters_N) & grepl("mass_allocation", pd_reprojected_rasters_N)]
#   
#   max_N_ge <- these_ingredient_rasters_ge |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   max_N_mass <- these_ingredient_rasters_mass |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   
#   this_adj_df <- bind_cols(this_df, max_N_ge = max_N_ge, max_N_mass= max_N_mass)
#   
#   
# })
# 
# #get maximum N scores for each allocation method
# max_pd_N_ge <- maximum_N_scores_pd |> pull(max_N_ge) |> sum()
# max_pd_N_mass <- maximum_N_scores_pd |> pull(max_N_mass) |> sum()
# 
# 
# max_total_N_ge <- max(max_md_N_ge,max_pd_N_ge)
# max_total_N_mass <- max(max_md_N_mass,max_pd_N_mass)
# 
# 
# 
# 
# ##rescale all rasters by the proportion each cell represents of total possible nitrogen pollution for each diet globally (for both energy and mass allocation, this is marine_diet)
# 
# #marine diets
# 
# this_file <- md_reprojected_rasters_N[[1]]
# 
# map(.x= md_reprojected_rasters_N, .f = \(this_file){
#   
#   this_rast <- rast(this_file)
#   
#   this_basename <- str_replace(basename(this_file), pattern = "_gp", replacement = "")
#   
#   this_allocation_method <- str_extract(string = this_basename, pattern = "ge_allocation|mass_allocation")
#   
#   saveName <- sprintf(here("data/spatial/marine_diet/pressures/%s"), this_basename)
#   
#   if(!file.exists(saveName)){
#     
#      message("Processing", "'", this_basename, "'")
#     
#     if(this_allocation_method=="ge_allocation"){
#         
#         this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_N_ge, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#         
#         
#       } else { 
#         
#          this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_N_mass, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#     }
#   }
#   
# })
# 
# 
# 
# #plant diets _ Nitrogen
# 
# map(.x= pd_reprojected_rasters_N, .f = \(this_file){
#   
#   this_rast <- rast(this_file)
#   
#   this_basename <- str_replace(basename(this_file), pattern = "_gp", replacement = "")
#   
#   this_allocation_method <- str_extract(string = this_basename, pattern = "ge_allocation|mass_allocation")
#   
#   saveName <- sprintf(here("data/spatial/plant_diet/pressures/%s"), this_basename)
#   
#   if(!file.exists(saveName)){
#     
#     message("Processing", "'", this_basename, "'")
#     
#    if(this_allocation_method=="ge_allocation"){
#         
#         this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_N_ge, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#         
#         
#       } else { 
#         
#          this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_N_mass, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#       
#     }
#     
#   }
#   
# })
```


Repeat for phosphorus

```{r}
# Phosphorus
# marine_diet_P <- list.files(here("data/spatial/marine_diet/int"), pattern = "_P_", full.names = TRUE)
# marine_diet_P <- marine_diet_P[!grepl("forage_fish|_gp", marine_diet_P)]
# 
# plant_diet_P <- list.files(here("data/spatial/plant_diet/int"), pattern = "_P_", full.names = TRUE)
# plant_diet_P <- plant_diet_P[!grepl("forage_fish|_gp", plant_diet_P)]
# 
# 
# 
# #REPROJECT PER KM2 DATA TO GALL PETERS EQUAL AREA FOR TOTAL PRESSURES
# 
# this_file <- marine_diet_P[[1]]
# 
# 
# # Marine diets
#   
# map(.x = marine_diet_P, .f = \(this_file){
#     
#     base <- tools::file_path_sans_ext(basename(this_file))  
#     
#     this_country <- if_else(grepl("EPC|NAT|OTH", base), true = str_extract(base, "EPC|NAT|OTH"), false = str_sub(base, start = nchar(base)-2, end = nchar(base)))
#     
#     this_allocation_method <- str_extract(base, "ge_allocation|mass_allocation")
#     
#     this_ingredient <- str_extract(base, "[^_]+")
#     
#     saveName <- sprintf(here("data/spatial/marine_diet/int/%s_P_gp_%s_%s.tif"), this_ingredient, this_allocation_method, this_country)
#     
#     if(!file.exists(saveName)){
#       
#       message("Processing ", basename(saveName))
#       
#       this_rast <- rast(this_file)
#       
#       this_reprojected_rast <- project(this_rast, gall_peters)
#       
#       this_adj_reproj_rast <- this_reprojected_rast*cellSize(this_reprojected_rast, unit = "km") #multiply up the footprints from per km2 to total based on cellsize
#       names(this_adj_reproj_rast) <- "P_eq"
# 
#       writeRaster(x = this_adj_reproj_rast, filename = saveName, overwrite = TRUE)
#       
#       return(this_adj_reproj_rast)
#     }
#   })
# 
# 
# 
# #Plant diets
# 
# this_file <- plant_diet_P[[1]]
# 
#   
# map(.x = plant_diet_P, .f = \(this_file){
#     
#     base <- tools::file_path_sans_ext(basename(this_file))  
#     
#     this_country <- if_else(grepl("EPC|NAT|OTH", base), true = str_extract(base, "EPC|NAT|OTH"), false = str_sub(base, start = nchar(base)-2, end = nchar(base)))
#     
#     this_allocation_method <- str_extract(base, "ge_allocation|mass_allocation")
#     
#     this_ingredient <- str_extract(base, "[^_]+")
#     
#     saveName <- sprintf(here("data/spatial/plant_diet/int/%s_P_gp_%s_%s.tif"), this_ingredient, this_allocation_method, this_country)
#     
#     if(!file.exists(saveName)){
#       
#       message("processing ", basename(saveName))
#       
#       this_rast <- rast(this_file)
#       
#       this_reprojected_rast <- project(this_rast, gall_peters)
#       
#       this_adj_reproj_rast <- this_reprojected_rast*cellSize(this_reprojected_rast, unit = "km") #multiply up the footprints from per km2 to total based on cellsize
#       
#       names(this_adj_reproj_rast) <- "P_eq"
#       
#       writeRaster(x = this_adj_reproj_rast, filename = saveName, overwrite = TRUE)
#       
#       return(this_adj_reproj_rast)
#     }
#   })
# 
# 
# 
# 
# #RESCALE PHOSPHORUS DATA BY PROP OF MAXIMUM GLOBAL PHOSPHOROUS ACROSS DIETS
# 
# 
# #NOW FIND THE MAXIMUM TOTAL SCORES FOR PHOSPHOROUS INCLUDING ALL INGREDIENTS FOR EACH DIET AND ALLOCATION METHOD - THIS WILL BE USED TO GET A GIVEN CELLS' PROPORTIONAL CONTRIBUTION
# 
# # First need to find maximum scores each ingredient (i.e. which origin yields the greatest)
# # Then need to rescale using the maximum plausible disturbance for each diet as the denominator
# 
# 
# 
# ## Marine diets
# 
# 
# md_reprojected_rasters_P <- list.files(path = here("data/spatial/marine_diet/int"), pattern = "P_gp", full=TRUE)
# 
# md_ingredients_list <- 
#   readRDS(here("data/tidy_data/demand/total_ingredient_demand.rds")) |> filter(diet=="marine_diet" & total_ingredient_demand>0) |> mutate(ingredients = sub(pattern="-wild", replacement="", ingredients)) |> arrange(ingredients) |> group_by(ingredients) |> group_split()
# 
# this_df <- md_ingredients_list[[1]]
# 
# 
# 
# maximum_P_scores_md <-  
#   
#   map_df(md_ingredients_list, .f = \(this_df){
#   
#   this_ingredient <- paste0(this_df$ingredients |> unique(),"_")
#   
#   these_ingredient_rasters_ge <- md_reprojected_rasters_P[grepl(this_ingredient, md_reprojected_rasters_P) & grepl("ge_allocation", md_reprojected_rasters_P)]
#   
#   these_ingredient_rasters_mass <- md_reprojected_rasters_P[grepl(this_ingredient, md_reprojected_rasters_P) & grepl("mass_allocation", md_reprojected_rasters_P)]
#   
#   max_P_ge <- these_ingredient_rasters_ge |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   max_P_mass <- these_ingredient_rasters_mass |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   
#   this_adj_df <- bind_cols(this_df, max_P_ge = max_P_ge, max_P_mass= max_P_mass)
#   
#   
# })
# 
# #get maximum marine diet disturbance scores for each allocation method
# max_md_P_ge <- maximum_P_scores_md |> pull(max_P_ge) |> sum()
# max_md_P_mass <- maximum_P_scores_md |> pull(max_P_mass) |> sum()
# 
# 
# 
# 
# #Plant diets
# 
# pd_reprojected_rasters_P <- list.files(path = here("data/spatial/plant_diet/int"), pattern = "P_gp", full=TRUE)
# 
# 
# pd_ingredients_list <- 
#   readRDS(here("data/tidy_data/demand/total_ingredient_demand.rds")) |> filter(diet=="plant_diet" & total_ingredient_demand>0) |> mutate(ingredients = sub(pattern="-wild", replacement="", ingredients)) |> arrange(ingredients) |> group_by(ingredients) |> group_split()
# 
# this_df <- pd_ingredients_list[[1]]
# 
# maximum_P_scores_pd <-  
#   
#   map_df(pd_ingredients_list, .f = \(this_df){
#   
#   this_ingredient <- paste0(this_df$ingredients |> unique(),"_")
#   
#   these_ingredient_rasters_ge <- pd_reprojected_rasters_P[grepl(this_ingredient, pd_reprojected_rasters_P) & grepl("ge_allocation", pd_reprojected_rasters_P)]
#   
#   these_ingredient_rasters_mass <- pd_reprojected_rasters_P[grepl(this_ingredient, pd_reprojected_rasters_P) & grepl("mass_allocation", pd_reprojected_rasters_P)]
#   
#   max_P_ge <- these_ingredient_rasters_ge |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   max_P_mass <- these_ingredient_rasters_mass |> map(rast) |> map(no_na_values) |> map(sum) |> unlist() |> max()
#   
#   this_adj_df <- bind_cols(this_df, max_P_ge = max_P_ge, max_P_mass= max_P_mass)
#   
#   
# })
# 
# #get maximum N scores for each allocation method
# max_pd_P_ge <- maximum_P_scores_pd |> pull(max_P_ge) |> sum()
# max_pd_P_mass <- maximum_P_scores_pd |> pull(max_P_mass) |> sum()
# 
# 
# max_total_P_ge <- max(max_md_P_ge,max_pd_P_ge)
# max_total_P_mass <- max(max_md_P_mass,max_pd_P_mass)
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# # Now rescale pressure by the total plausible phosphorus pollution value 
# 
# #marine diets - Phosphorus
# 
# #this_file <- marine_diet_P[[1]]
# 
# map(.x= md_reprojected_rasters_P, .f = \(this_file){
#   
#   this_rast <- rast(this_file)
#   
#   this_basename <- str_replace(basename(this_file), pattern = "_gp", replacement = "")
#   
#   this_allocation_method <- str_extract(this_basename, "ge_allocation|mass_allocation")
#   
#   saveName <- sprintf(here("data/spatial/marine_diet/pressures/%s"), this_basename)
#   
#   if(!file.exists(saveName)){
#     
#      message("Processing", "'", this_basename, "'")
#     
#     if(this_allocation_method=="ge_allocation"){
#         
#         this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_P_ge, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#         
#         
#       } else { 
#         
#          this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_P_mass, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#       
#     }
#     
#     
#    
#   }
#   
# })
# 
# 
# 
# #plant diets - Phosphorus
# 
# map(.x= pd_reprojected_rasters_P, .f = \(this_file){
#   
#   this_rast <- rast(this_file)
#   
#   this_basename <- str_replace(basename(this_file), pattern = "_gp", replacement = "")
#   
#   this_allocation_method <- str_extract(this_basename, "ge_allocation|mass_allocation")
#   
#   saveName <- sprintf(here("data/spatial/plant_diet/pressures/%s"), this_basename)
#   
#   if(!file.exists(saveName)){
#     
#      message("Processing", "'", this_basename, "'")
#     
#     if(this_allocation_method=="ge_allocation"){
#         
#         this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_P_ge, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#         
#         
#       } else { 
#         
#          this_rescaled_rast <-  app(x = this_rast, fun = \(this_cell){
#           if_else(this_cell>0, true = this_cell/max_total_P_mass, false = 0)})
#         
#         names(this_rescaled_rast) <- tools::file_path_sans_ext(this_basename)
#       
#         writeRaster(x = this_rescaled_rast, filename = saveName, overwrite=TRUE)
#       
#         return(this_rescaled_rast)
#       
#     }
#     
#   }
#   
# })
# 




```
