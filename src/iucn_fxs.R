# IUCN api query funcitons

library(rredlist)
library(here)


source(here("src/directories.R"))


api_file <- file.path(iucn_dir, "api_key", "api_token.txt")
api_key <- scan(api_file, what = 'character')

version <- rl_version(key=api_key)
version <-  "2021-3" #set the version


