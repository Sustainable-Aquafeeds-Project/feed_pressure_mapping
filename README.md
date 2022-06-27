# feed_pressure_mapping

This is the repository for Cottrell et al ' ' looking at the role of ingredient sourcing vs diet composition for the total cumulative pressures from aquafeed diets.

Link to publication: Not yet available

Please direct any correspondence to Richard Cottrell at richardstuart.cottrell@utas.edu.au


## Repository structure

### scripts

The scripts folder contains all code necessary to generate the results attached to the publication listed above. 

All scripts are numbered by the order in which they should be run. **Note:** 01_tidying_data does not need to be run unless the user wishes to rerun the conversion from downloaded data format (e.g. wide format, unjoined data) to create the the tidied raw data available through the raw_data file within the project. Otherwise, scripts 02_... onwards can be run enitirely using the pre tidied raw data in the raw_data file. The raw_data file is not available through cloning or forking the project due to the size of datasets that are incompatible with Github storage. The raw_data file can be downloaded from the associated Github Large File Storage found here: <ENTER LINK OR DOI>.



| Script            | Description                                                                                              |
|:------------------|:------------------------------------------------------------------------------------------------------|
| 01_tidying_data   | This script is used for tidying all data products used in the project                                 |
| 02_global_ingredient_demand.Rmd | Calculates the gross ingredient demand for salmon based on the ingredient compositions of different diets (applied globally not country specific), country-specific FCRs and production volumes |
| 03_crop_raw_materials_demand.Rmd | Isolates raw materials that support crop-based aquafeed ingredients and synthesises with production data from FAO and MAPSPAM, yield conversion factors from FAO, and price data from TBC. Economic allocation approaches are used to avoid double counting crop biomass |



### src


### data


### figures


### explore


