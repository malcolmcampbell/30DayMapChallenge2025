# 30 Day Map challenge 2025. # Copyright Malcolm Campbell, November 2025
# Day 10 - Classical Elements 2/4: Focus on the atmosphere. 
# Map weather, wind patterns, air traffic, pollution, or airborne transmission (e.g., pollen, sound).
pacman::p_load(tidyverse, tmap, sf, mapgl)

Airports <- read_csv("./data/AirportsCapacityCut.csv")
glimpse(Airports)
# some basic geocoding
# geocode to lat/lon
Airport_locations <- geocode_OSM(Airports$Fullname)

Airports$lat <- Airport_locations$lat
Airports$lon <- Airport_locations$lon

Airports <- st_as_sf(Airports, coords = c("lon", "lat"), crs = st_crs(4326))
################################################################################
# Map it! - try animations
tmap_mode("view")
#
AIR <-
  tm_shape(Airports) + tm_dots() +
  tm_credits(text =
               "Created by Malcolm Makes Maps \n Source: https://www.bbc.com/news/articles/cj410k00yw8o",
             position = tm_pos_out("center", "bottom")) +
  tm_scalebar(position = tm_pos_out("center", "bottom")) 
AIR

##############################################################################
# Mapgl version
mapboxgl(style = mapbox_style("light"),
         bounds = Airports) %>%
  add_circle_layer(
    id = "n",
    source = Airports,
    circle_color = "red" ,
    circle_radius = 5,
    circle_stroke_color = "#ffffff",
    circle_stroke_width = 2,
    circle_opacity = 0.75,
    tooltip = "Airport", 
    hover_options = list(circle_radius = 15,
                         circle_color = "yellow")
  ) 
#END