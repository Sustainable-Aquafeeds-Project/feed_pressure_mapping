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


#from casey

get_from_api <- function(url, param, api_key, delay, verbose = FALSE) {
  
  i <- 1; tries <- 5; success <- FALSE
  
  while(i <= tries & success == FALSE) {
    if(verbose) {
      message('try #', i)
    }
    Sys.sleep(delay * i) ### be kind to the API server? later attempts wait longer
    api_info <- fromJSON(sprintf(url, param, api_key)) 
    if (class(api_info) != 'try-error') {
      success <- TRUE
    } else {
      warning(sprintf('try #%s: class(api_info) = %s\n', i, class(api_info)))
    }
    if(verbose) {
      message('... successful? ', success)
    }
    i <- i + 1
  }
  
  if (class(api_info) == 'try-error') { ### multi tries and still try-error
    api_return <- data.frame(param_id  = param,
                             api_error = 'try-error after multiple attempts')
  } else if (class(api_info$result) != 'data.frame') { ### result isn't data frame for some reason
    api_return <- data.frame(param_id  = param,
                             api_error = paste('non data.frame output: ', 
                                               class(api_info$result), 
                                               ' length = ', length(api_info$result)))
  } else if (length(api_info$result) == 0) { ### result is empty
    api_return <- data.frame(param_id  = param,
                             api_error = 'zero length data.frame')
  } else {
    api_return <- api_info %>%
      data.frame(stringsAsFactors = FALSE)
  }
  
  return(api_return)
}

mc_get_from_api <- function(url, param_vec, api_key, 
                            cores = NULL, delay = 0.5, 
                            .id = NULL,
                            verbose = FALSE) {
  
  if(is.null(cores)) {
    numcores <- ifelse(Sys.info()[['nodename']] == 'mazu', 12, parallel::detectCores()/2)
  } else { 
    numcores <- cores
  }
  out_list <- parallel::mclapply(param_vec, 
                                 function(x) {
                                   get_from_api(url, x, api_key, delay, verbose)
                                 },
                                 mc.cores   = numcores,
                                 mc.cleanup = TRUE) 
  
  if(any(sapply(out_list, class) != 'data.frame')) {
    error_list <- out_list[sapply(out_list, class) != 'data.frame']
    if(verbose) {
      message('List items are not data frame: ', paste(sapply(error_list, class), collapse = '; '))
      message('might be causing the bind_rows() error; returning the raw list instead')
    }
    return(out_list)
  }
  
  out_df <- out_list %>%
    setNames(param_vec) %>%
    bind_rows(.id = 'param')
  out_df <- out_df %>%
    setNames(names(.) %>%
               str_replace('result.', ''))
  return(out_df)
}





