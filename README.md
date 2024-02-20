# READ ME!

This is the repository for Cottrell et al <reference>. This paper examines environmental trade-offs from the transition from fish- to plant-dominant feeds for Atlantic salmon (_Salmo salar_) and explores how changes to where ingredients are sourced can compound or mitigate these trade-offs.


Please read this file before trying to reproduce the output from this research project. Below you will find information on the publication associated with this repository, contact information for the lead author, and a description of the repository structure with each section explained.

## Link to associated publication

Not yet available

## Contact

Please direct any correspondence to Richard Cottrell at [richardstuart.cottrell\@utas.edu.au](mailto:richardstuart.cottrell@utas.edu.au){.email}

## Reproducibility
We strongly advocate for open and reproducible science. The code in this repository enables a user to recreate the results outlined in the above publication. There are a a few important points to know/adhere to for the code to run smoothly:

- The code must be run as an R project - the code within relies on relative file paths from the project home folder.
- The large data folder must be downloaded and stored inside your local copy of this repository - there are large data inputs needed for this code which cannot be stored on github. Please ensure you follow the instructions for obtaining this data folder in the 'scripts' section below.
- Once the R project is cloned and the large data folder is in place, analyses can be replicated using just two master scripts in the home folder. The first just requires confirming and saving your preference for the allocation method used throughout the analyses and running the second runs all scripts necessary to generate the results.


## Repository structure

This respoitory is organised into 2 master scripts (**all that is needed to run the analyses**) and six main folders: 

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

The scripts folder contains all code necessary to generate the results attached to the publication listed above.

All scripts are numbered by the order in which they should be run. **Note:** 01_tidying_data does not need to be run unless the user wishes to rerun the conversion from downloaded data format (e.g. wide format, unjoined data) to create the the tidied raw data available through the raw_data file within the project. Otherwise, scripts 02\_... onwards can be run enitirely using the pre tidied raw data in the raw_data file. The raw_data file is not available through cloning or forking the project due to the size of datasets that are incompatible with Github storage. The raw_data file can be downloaded from the associated Github Large File Storage found here: <ENTER LINK OR DOI>.

| Script                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|:---------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00_tidying_data                              | **DO NOT RUN ** This script can only be used by anyone with access to the UTAS Sustainable Aquafeeds Project's Research Data Storage (RDSI) resource. It is not required to replicate the analyses but manipulates external data and saves the tidied versions in the project    |
| 01_global_ingredient_demand.Rmd              | Calculates the gross ingredient demand for salmon based on the ingredient compositions of different diets, country-specific FCRs and production volumes    |
| 02_crop_raw_materials_demand.Rmd             | Isolates raw materials that support crop-based aquafeed ingredients and synthesises with production data from FAO and MAPSPAM, yield conversion factors from FAO, and price data from TBC. Economic allocation approaches are used to avoid double counting crop biomass  |
| 03_spatial_fish_demand_allocation.Rmd | Based on the spatial patterns in fisheries catch, the representation of different species in different areas, and their fishmeal and oil yields , this script assigns feed fish demand from aquaculture feeds to grid cells with FAO major fishing areas |
| 04_crop_source_country_rasters.Rmd           | Generates rasters for the source countries to crop for existing spatial resources for crop mapping |
| 05_spatial_crop_demand_allocation.Rmd        |  Allocates crop demand to grid cells based on World Resources Institute's Spatial Allocation Model |
| 06_distribute_ingredient_processing.Rmd      | Assigns ingredient processing locations for marine and agricultural ingredients |
| 07_ingredient_processing_pressures.Rmd |       |
| 08_fish_disturbance_pressures.Rmd | |
| 09_fish_ghg_pressures.Rmd |   |
| 10_fish_nutrient_pressures.Rmd | |
| 11_fish_water_extraction_pressures.Rmd |   |
| 12_crop_disturbance_pressures.Rmd   |   |
| 13_crop_ghg_pressures.Rmd |   |

### src

### data

### figures

### explore

### doc
