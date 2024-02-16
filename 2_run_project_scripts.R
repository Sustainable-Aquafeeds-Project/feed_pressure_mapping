
## Master script - feed_pressure_mapping.proj - Github project for Cottrell et al 2024 - "TBC" 


# This script runs all relevant scripts embedded in this project. First you should select the allocation method desired in the analysis in 1_select_allocation_method.R in the project home repository.
# 
# To run all code  successfully, you need to ensure you have cloned or forked the associated repository from GitHub (https://github.com/Sustainable-Aquafeeds-Project/feed_pressure_mapping) and that you have downloaded the following folders and files from <insert url> while maintaining the file paths as suggested. 
# 
# - 'raw_data' folder (must be saved as 'feed_pressure_mapping/data/raw_data' or the equivalent based on the naming of your repository)
# -  embodied_fish_per_cell.csv (should be saved as 'feed_pressure_mapping/data/tidy_data/demand/embodied_fish_per_cell.csv')
# 
# This folder and these files were too big to push to Github and so must be downloaded and stored within your github repository named as "raw_data" i.e., feed_pressure_mapping/data/raw_data. This nomenclature is needed if the code is to run without issue as this folder is used extensively throughout. The scripts contained in this repository were intended to be run with an RProject rather than run individually, and depend on file paths that assume this.
# 
# Once your repository is ready, please run the chunk below to run all scripts. Or you can run each script by opening each one independently from the scripts folder. 
# All scripts need to be run in order as later scripts depend on outputs generated earlier.

##############To run all script - hightlight the code below and select 'Run' from the top-right hand corner (or select code below and run using Command/Ctrl + Enter)################

# RUN THE PROJECT CODE

library(tidyverse)
library(here)


#Function to run the rmarkdowns without output
source_rmd = \(file, ...) {
  tmp_file = tempfile(fileext=".R")
  on.exit(unlink(tmp_file), add = TRUE)
  knitr::purl(file, output=tmp_file)
  source(file = tmp_file, ...)}

#Isolate analysis scripts
analysis_markdowns <- 
  list.files(here("scripts"), pattern = ".Rmd", full.names = TRUE)[!grepl("00_tidying_data.Rmd|21_calculations.Rmd|22_diet_concept_plot.Rmd", list.files(here("scripts"), pattern = ".Rmd", full.names = TRUE))]


#Run all scripts
map(analysis_markdowns, source_rmd)
