

#projections

equal_area_gp_proj <- "+proj=cea +lon_0=0 +lat_ts=45 +x_0=0 +y_0=0 +ellps=WGS84 +units=m +no_defs"

equal_area_moll_projstring <- "+proj=moll +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"

equal_area_moll_esri <- "ESRI:54009"


#base rasters
base_raster <- raster()
values(base_raster) <- 1:ncell(base_raster)
base_raster_ea <- projectRaster(base_raster, crs = equal_area_gp_proj)
res(base_raster_ea) <- 10000
values(base_raster_ea) <- 1:ncell(base_raster_ea) 

