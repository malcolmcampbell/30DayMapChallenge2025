# 30 Day Map challenge 2025. # Copyright Malcolm Campbell, November 2025
# Day 29. Raster. Challenge Classic: Map using raster data. 
#Focus on satellite imagery, elevation models (DEMs), land cover, or pixel-based art.

#LCBD - Canterbury
LCDB <- 
  read_sf("X:/Data/Datasets/Processed_data/2.NZ/Landcover/lris-lcdb-v50-land-cover-database-version-50-mainland-new-zealand-SHP/lcdb-v50-land-cover-database-version-50-mainland-new-zeal.shp")
glimpse(LCDB)

River18 <- LCDB %>% filter (Name_2018=="River")
rm(LCDB)

TA <- 
  read_sf("P:/DROPBOX/Research/Census2018Shape/kx-territorial-authority-2018-clipped-generalised-SHP/territorial-authority-2018-clipped-generalised.shp")

CANTERBURY <- TA %>% filter (TA2018_V_1=="Ashburton District")
rm(TA)

# C:\Users\mhc57\OneDrive - University of Canterbury\Research\Map30DMC_2025\30DayMapChallenge2025\data
setwd("C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30DMC_2025/30DayMapChallenge2025/")

# elevation
# adapted from https://rspatialdata.github.io/elevation.html
library(ggplot2)
library(raster)
library(elevatr)
# install.packages("remotes")
remotes::install_github("wmgeolab/rgeoboundaries")
library(rgeoboundaries)
library(sf)
library(viridis)

IRL <- geoboundaries("Ireland")


southislandNZ <- st_read("./data/SOUTH.gpkg")

elevation_data_SINZ <- get_elev_raster(locations = southislandNZ, z = 5, 
                                       clip = "locations")
elevation_data_SINZ <- as.data.frame(elevation_data_SINZ, xy = TRUE)
colnames(elevation_data_SINZ)[3] <- "elevation"

# remove rows of data frame with one or more NA's,using complete.cases
elevation_data_SINZ <- elevation_data_SINZ[complete.cases(elevation_data_SINZ), ]

ggplot() +
  geom_raster(data = elevation_data_SINZ, aes(x = x, y = y, fill = elevation)) +
  geom_sf(data = IRL, color = "white", fill = NA) +
  coord_sf() +
  scale_fill_viridis_c() +
  labs(title = "South Island of Aotearoa New Zealand", 
       x = "Longitude", y = "Latitude", 
       fill = "Elevation (m)",
       caption = "Source: with help from https://rspatialdata.github.io/elevation.html")

p <- ggplot() +
  geom_raster(data = elevation_data_SINZ, aes(x = x, y = y, fill = elevation)) +
  geom_sf(data = IRL, color = "red", fill = NA) +
  coord_sf() +
  scale_fill_gradientn(colours = colorspace::diverge_hcl(7)) +
  labs(title = "South Island of Aotearoa New Zealand", 
       x = "Longitude", y = "Latitude", 
       fill = "Elevation (m)",
       caption = "Source: with help from https://rspatialdata.github.io/elevation.html")
p
ggsave(filename="elevation_south_island.png", plot=p, dpi=400)
#END