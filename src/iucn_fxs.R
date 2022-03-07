# IUCN api query funcitons

library(rredlist)
library(here)


source(here("src/directories.R"))


api_file <- file.path(iucn_dir, "api_key", "api_token.txt")
api_key <- scan(api_file, what = 'character')

#api_version <- rl_version(key=api_key)
api_version <-  "2021-3" #set the version


get_spp_api <- function(this_page){
  spplist_url <- sprintf("https://apiv3.iucnredlist.org/api/v3/species/page/%s?token=%s", this_page,  api_key)
  jsonlite::fromJSON(spplist_url) %>% .$result
}


get_habitat_api <- function(this_spp_id){
  message(paste("processing taxonid #", this_spp_id))
  hablist_url <- sprintf("https://apiv3.iucnredlist.org/api/v3/habitats/species/id/%s?token=%s", this_spp_id,  api_key)
  this_result <-jsonlite::fromJSON(hablist_url)
  return(tibble(this_result %>% .$result) %>% mutate(spp_id = this_result %>% .$id))
}


get_threat_api <- function(this_spp_id){
  message(paste("processing taxonid #", this_spp_id))
  threat_url <- sprintf("https://apiv3.iucnredlist.org/api/v3/threats/species/id/%s?token=%s", this_spp_id,  api_key)
  this_result <- jsonlite::fromJSON(threat_url) %>% data.frame(stringsAsFactors = FALSE)
  return(this_result)
  
}




get_threat_api_casey <- function(this_spp_id){
  
  message(paste("processing taxonid #", this_spp_id))
  
  i <- 1; tries <- 5; success <- FALSE; delay=0.5; verbose=TRUE
  
  while(i <= tries & success == FALSE) {
    if(verbose) {
      message('try #', i)
    }
    
    Sys.sleep(delay * i) #add delay for later tries
    
    threat_url <- sprintf("https://apiv3.iucnredlist.org/api/v3/threats/species/id/%s?token=%s", this_spp_id,  api_key)
    
    this_result <-jsonlite::fromJSON(threat_url)
    
    if (class(this_result) != 'try-error') {
      success <- TRUE
    } else {
      warning(sprintf('try #%s: class(this_result) = %s\n', i, class(this_result)))
    }
    if(verbose) {
      message('... successful? ', success)
    }
    i <- i + 1
  }
  if (class(this_result) == 'try-error') { ### multi tries and still try-error
    api_return <- data.frame(spp_id  = this_spp_id,
                             api_error = 'try-error after multiple attempts')
  } else if (class(this_result$result) != 'data.frame') { ### result isn't data frame for some reason
    api_return <- data.frame(spp_id  = this_spp_id,
                             api_error = paste('non data.frame output: ', 
                                               class(this_result$result), 
                                               ' length = ', length(this_result$result)))
  } else if (length(this_result$result) == 0) { ### result is empty
    api_return <- data.frame(spp_id  = this_spp_id,
                             api_error = 'zero length data.frame')
  } else {
    api_return <- this_result %>%
      data.frame(stringsAsFactors = FALSE)
  }  
    
  return(api_return)
}







