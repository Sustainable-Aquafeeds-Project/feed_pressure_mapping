# IUCN api query funcitons

library(rredlist)
library(here)


source(here("src/directories.R"))


api_file <- file.path(iucn_dir, "api_key", "api_token.txt")
api_key <- scan(api_file, what = 'character')

version <- rl_version(key=api_key)
version <-  "2021-3" #set the version


get_spp_api <- function(this_page){
  spplist_url <- sprintf("https://apiv3.iucnredlist.org/api/v3/species/page/%s?token=%s", this_page,  api_key)
  jsonlite::fromJSON(spplist_url) %>% .$result
}


get_habitat_api <- function(this_spp_id){
  message(paste("processing taxonid #", this_spp_id))
  hablist_url <- sprintf("https://apiv3.iucnredlist.org/api/v3/habitats/species/id/%s?token=%s", this_spp_id,  api_key)
  bind_cols(jsonlite::fromJSON(hablist_url))
  
}