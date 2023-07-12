# feed_pressure_mapping

This is the repository for Cottrell et al ' ' looking at the role of ingredient sourcing vs diet composition for the total cumulative pressures from aquafeed diets. This readMe file should be read before trying to reproduce the output from this research project. Below you will find information on the publication associated with this repository, contact information for the lead author, and a description of the repository structure with each section explained.

## Link to associated publication

Not yet available

## Contact

Please direct any correspondence to Richard Cottrell at [richardstuart.cottrell\@utas.edu.au](mailto:richardstuart.cottrell@utas.edu.au){.email}

## Repository structure

This respoitory is organised into six main folders: 'scripts', 'src', 'data', 'figures', 'explore', 'doc'. The contents of each are explained below.

### scripts

The scripts folder contains all code necessary to generate the results attached to the publication listed above.

All scripts are numbered by the order in which they should be run. **Note:** 01_tidying_data does not need to be run unless the user wishes to rerun the conversion from downloaded data format (e.g. wide format, unjoined data) to create the the tidied raw data available through the raw_data file within the project. Otherwise, scripts 02\_... onwards can be run enitirely using the pre tidied raw data in the raw_data file. The raw_data file is not available through cloning or forking the project due to the size of datasets that are incompatible with Github storage. The raw_data file can be downloaded from the associated Github Large File Storage found here: <ENTER LINK OR DOI>.

| Script                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|:---------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00_tidying_data                              | This script is used for tidying all data products used in the project                                                                                                                                                                                                                                                                                                                                                                        |
| 01_global_ingredient_demand.Rmd              | Calculates the gross ingredient demand for salmon based on the ingredient compositions of different diets, country-specific FCRs and production volumes                                                                                                                                                                                                                                                                                      |
| 02_crop_raw_materials_demand.Rmd             | Isolates raw materials that support crop-based aquafeed ingredients and synthesises with production data from FAO and MAPSPAM, yield conversion factors from FAO, and price data from TBC. Economic allocation approaches are used to avoid double counting crop biomass                                                                                                                                                                     |
| 03_spatial_forage_fish_demand_allocation.Rmd | Uses economic allocation conversion data from Kok et al 2021 to calculate the embodided fish required to meet forage fish demand from plant and fish based feeds over 3 different source areas - the North Atlantic, East Pacfic, and all other areas combined (dictated by productivity). This script applies this allocation spatially due to differences in how FMFO converts to embodied fish biomass depending on the species harvested |
| 04_crop_source_country_rasters.Rmd           | Generates rasters for the source countries to multiply against the mapspam layers                                                                                                                                                                                                                                                                                                                                                            |
| 05_spatial_crop_demand_allocation.Rmd        |                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 06_forage_fish_disturbance_pressures         | Creates a disturbance metric based on two facets - benthic destruction and biomass removal. Benthic destruction is a function of the effort spent by bottom trawlers catch forage fish species, calculated by harmonising global fishing watch data on effort with that of spatialised catch in forage fish species. Biomass removal is a function of catch normalised by the productivity in the supporting waters.                         |

### src

### data

### figures

### explore

### doc
