# READ ME!

This is the repository for Cottrell et al <reference>. This paper examines environmental trade-offs from the transition from fish- to plant-dominant feeds for Atlantic salmon (_Salmo salar_) and explores how changes to where ingredients are sourced can compound or mitigate these trade-offs.


Please read this file before trying to reproduce the output from this research project. Below you will find information on the publication associated with this repository, contact information for the lead author, and a description of the repository structure with each section explained.

## Link to associated publication

Not yet available

## Contact

Please direct any correspondence to Richard Cottrell at [richardstuart.cottrell\@utas.edu.au](mailto:richardstuart.cottrell@utas.edu.au)

## Reproducibility
We strongly advocate for open and reproducible science. The code in this repository enables a user to recreate the results outlined in the above publication. There are a a few important points to know/adhere to for the code to run smoothly:

- The code must be run as an R project - the code within relies on relative file paths from the project home folder.
- The large data folder must be downloaded and stored inside your local copy of this repository - there are large data inputs needed for this code which cannot be stored on github. Please ensure you follow the instructions for obtaining this data folder in the 'scripts' section below.
- Once the R project is cloned and the large data folder is in place, analyses can be replicated using just two master scripts in the home folder. The first just requires confirming and saving your preference for the allocation method used throughout the analyses and running the second runs all scripts necessary to generate the results.

However, if you encounter a problem with running this code, please contact Richard Cottrell at the email above to resolve.

## Repository structure

This respoitory is organised into **2 master scripts** (all that is needed to run the analyses) and five main folders  : 

- scripts - each step in the analysis is outlined by inidvidual scripts. These can be independently run if desired.
- src - this folder holds scripts which are used to source different functions throughout the analysis.
- data - the data folder holds all data inputs for, and data products from the analysis
- figures - contains the figures (main and supplementary) from the analysis. Check here for results after running analysis.
- explore - this folder holds the results from exploratory analysis and can be ignored.

### Master scripts

| Script | Description       |
|:-------|:------------------|  
| 1_choose_allocation_method| This is the first step before running the analyses. We estimate raw material demand from aquaculture diets and environmental pressures from production of their ingredients using allocation approaches - economic (default), mass, or energetic. |
| 2_run_project_scripts | Running this script runs all the individual project scripts and outputs results into the figures folder for one step reproducibility.|


### 'scripts' folder

The scripts folder contains all code necessary to generate the results attached to the publication listed above. However, replication of results can be most easily completed through '2_run_project_scripts' in the project home folder.

For individual running, all scripts are numbered by the order in which they should be run. **Note:** 00_tidying_data cannot be run unless the user is a member of the Sustainable Aquafeeds Project and has access to the Research Data Storage facility. Raw data is tidied in this script and products are saved to the project folders.

| Script                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|:---------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00_tidying_data                              | **DO NOT RUN ** This script can only be used by anyone with access to the UTAS Sustainable Aquafeeds Project's Research Data Storage (RDSI) resource. It is not required to replicate the analyses but manipulates external data and saves the tidied versions in the project    |
| 01_global_ingredient_demand.Rmd              | Calculates the gross ingredient demand for salmon based on the ingredient compositions of different diets, country-specific FCRs and production volumes    |
| 02_crop_raw_materials_demand.Rmd             | Isolates raw materials that support crop-based aquafeed ingredients and synthesises with production data from FAO and MAPSPAM, yield conversion factors from FAO, and price data from TBC. Economic allocation approaches are used to avoid double counting crop biomass  |
| 03_spatial_fish_demand_allocation.Rmd | Based on the spatial patterns in fisheries catch, the representation of different species in different areas, and their fishmeal and oil yields , this script assigns feed fish demand from aquaculture feeds to grid cells with FAO major fishing areas |
| 04_crop_source_country_rasters.Rmd           | Generates rasters for the source countries to crop for existing spatial resources for crop mapping |
| 05_spatial_crop_demand_allocation.Rmd        |  Allocates crop demand to grid cells based on World Resources Institute's Spatial Allocation Model |
| 06_distribute_ingredient_processing.Rmd      | Assigns biomass to ingredient processing locations for marine and agricultural ingredients |
| 07_ingredient_processing_pressures.Rmd |  Joins environmental pressures data from ingredient processing to ingredient biomass in processing locations    |
| 08_fish_disturbance_pressures.Rmd |  Calculated fisheries disturbance for a region through the primary production required for forage fish (and trimmings species) divided by net primary productivity per cell, multiplied by a cell's area |
| 09_fish_ghg_pressures.Rmd | Joins greenhouse gas emissions data from Parker et al to species and gear types used in forage fisheries and in catch for trimmings  |
| 10_fish_nutrient_pressures.Rmd | Calculates nutrient pollution from fisheries (assumed to be negligible and set at zero) |
| 11_fish_water_extraction_pressures.Rmd | Calculates the water consumption pressures from fisheries (assumed to be negligible and set at zero)   |
| 12_crop_disturbance_pressures.Rmd   | Joins land use data from Agrifootprint for crops to biomass in each cell |
| 13_crop_ghg_pressures.Rmd | Joins greenhouse gas emissions from Agrifooprint for crops to biomass in each cell  |
| 14_crop_nutrient_pressures.Rmd | Joins nutrient pressures (N and P) from Agrifootprint for crops to biomass in each cell  |
| 15_crop_water_extraction_pressures.Rmd | Joins water consumption pressures (blue water) from Agrifootprint for crops in each cell |
| 16a-d_rescaling_disturbance.Rmd | Reprojects pressure data to Molleweide, calculates the maximum possible pressure across both feeds (takes to highest possible per ingredient), and rescales each cell to the proprotion of maximum pressure each could represent. Original script was split into four to reduce memory use | 
| 17_ingredient_permutations.Rmd | Sets up data frame of unique combinations of ingredient sourcing |
| 18_mapping_CPI.Rmd | Maps the CPI for each feed scenario for 3 combinations as an example of the CPI calculations  |
| 19_CPI_permutations.Rmd | Iterations the CPI calculations based on the ingredients permutations dataframe created in script 17 |
| 20_visualisation.Rmd | Creates the plots for the analysis. Contains some calculations based on the data plotted |
| 21_calculations.Rmd | Most calculations for the manuscript are conducted here |
| 22_diet_concept_plot.Rmd | code to create the diet composition used in the cpnceptual figure |


### 'src' folder

Contains two reference scripts "directories.R" and "functions.R" which hold regularly used directory file paths and functions respectively. These are sourced within individual markdown scripts when needed.

### 'data' folder

The data folder is divided into a number of subfolders, each with their own subdirectories. The main dubdirectories within the data folder are listed below.

| Folder | Description|
|:---------|:------------|
| raw_data | This folder contains a number of sources of raw data needed for the analysis. This often not the raw product per se, it may be tidied, but it is not a data product |
| tidy_data | This folder contains a number of data products that have been produced from analyses regarding allocation, dietary scenarios, raw material and ingredient demand, and figure icons among others |
| spatial | This folders holds the files that underpin the majority of the final analyses including data on marine primary productivity, locations of ports, inividual country rasters, and the layers used for final analysis in the fish-dominant and plant-dominant diets (labelled marine_diet, plant_diet). In these latter folders, layers are divided in the production layers ('production' folder), intermediate layers ('int' folder, including pressure data per km2 for raw material production), processing layers ('processing' folder holding the locations and pressure per km2 for processing activities) and pressures (the rescaled pressure layers for each ingredient).Files are labelled for each ingredient, pressure, location, and allocation method. |
| large_data | This folder is designed to hold data that is not able to be held in this github repository. Please contact author Rich Cottrell (richardstuart.cottrell@utas.edu.au) for a private Dropbox link to this folder. All data in the large_data folder should be placed unmodified in the following file path convention within the cloned or forked project: "your_file_path_to_the_project_folder/feed_pressure_mapping/data/large_data", or, using the here library, here("data/large_data").

### 'figures' folder

The folder holds all figues produced from the code and is the location where reproduced results will be located.

### 'explore' folder

The explore folder has been used to view outputs (data and figures) that are not finalised. These are unessential for anyone wanting to reproduce this study.
