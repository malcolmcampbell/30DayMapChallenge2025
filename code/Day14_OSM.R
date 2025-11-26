# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 14: Data challenge: OpenStreetMap 	Use OpenStreetMap (OSM) data as your primary source. 
# Map your favorite feature, contribute back to the project, or style the map in an interesting way.

# load required libraries
pacman::p_load(osmdata, tmap, sf, tmaptools) 

# Customise by changing the text below to 
# your PLACE (e.g. city/town + Country)
place <- c("Belfast, United Kingdom")
#
motorway <- getbb(place) |>
  opq() |> add_osm_feature(key = "highway", value = c("motorway", "motorway_link", "trunk")) |> 
  osmdata_sf()
#
mainstreets <- getbb(place) |>
  opq() |> add_osm_feature(key = "highway", value = c("primary", "primary_link")) |>  
  osmdata_sf()
#
smallstreets <- getbb(place) |> opq() |> add_osm_feature(key = "highway", 
  value = c("residential", "living_street", "unclassified", "service", "footway")) |> 
  osmdata_sf()

# now the circle!
CP <-geocode_OSM("Belfast, United Kingdom")
center_point <- st_point(c(CP$coords[1], CP$coords[2])) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 7000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)

MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#004225", outer.bg=F, frame = F) +
  tm_credits(position=c("left","bottom"),
             text ="Created by Prof Malcolm Campbell \n Source: OSM © OpenStreetMap contributors") 

MINIMALCIRCLEMAP

tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day14_OSM_Belfast.png", 
          height = 12, width = 12, dpi=400)
rm(list=ls())
###############################################################################

#CAPITAL(s) - could be made into a LOOP!!
#  use PASTE for file names and other titles.

################################################################################
# 30 Day Map challenge 2024. # Copyright Malcolm Campbell November 2024
# Day 20 - OpenStreetMap
# Use OpenStreetMap data to create something. 
#OpenStreetMap offers rich, editable data from roads to buildings and beyond. 
#The goal is to showcase the power of this community-driven dataset. 🗺️📍
pacman::p_load(osmdata, tmap) 
# ADD your Place BELOW
place <- c("Wellington, New Zealand")
#
motorway <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("motorway", "motorway_link", "trunk")) %>%
  osmdata_sf()
motorway
#
mainstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("primary", "primary_link")) %>%
  osmdata_sf()
mainstreets
#
smallstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street", "unclassified", "service", "footway"
                  )) %>%
  osmdata_sf()
# map it
# now the circle!
CP <-geocode_OSM(place)
center_point <- st_point(c(CP$coords[1], CP$coords[2])) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 7000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)

MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#002366", outer.bg=F, frame = F) +
  tm_credits(position=c("left","bottom"),
             text ="Created by Prof Malcolm Campbell \n Source: OSM © OpenStreetMap contributors") 

MINIMALCIRCLEMAP

tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day14_OSM_Wellington.png", 
          height = 12, width = 12, dpi=400)
rm(list=ls())
##############################################################
# CAPITAL 2
place <- c("Ottawa, Canada")
#
motorway <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("motorway", "motorway_link", "trunk")) %>%
  osmdata_sf()
motorway
tm_shape(motorway$osm_lines)+tm_lines()
mainstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("primary", "primary_link")) %>%
  osmdata_sf()
mainstreets
tm_shape(mainstreets$osm_lines)+tm_lines()

smallstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street", "unclassified", "service", "footway"
                  )) %>%
  osmdata_sf()
# map it
# now the circle!
CP <-geocode_OSM(place)
center_point <- st_point(c(CP$coords[1], CP$coords[2])) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 7000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)

MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#FF0000", outer.bg=F, frame = F) +
  tm_credits(position=c("left","bottom"),
             text ="Created by Prof Malcolm Campbell \n Source: OSM © OpenStreetMap contributors") 

MINIMALCIRCLEMAP

tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day14_OSM_Ottawa.png", 
          height = 12, width = 12, dpi=400)
rm(list=ls())

###############################################################################
############### CAPITAL 3
place <- c("Dublin, Ireland")
#
motorway <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("motorway", "motorway_link", "trunk")) %>%
  osmdata_sf()
motorway
tm_shape(motorway$osm_lines)+tm_lines()
mainstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("primary", "primary_link", "secondary", 
                                             "seconary_link")) %>%
  osmdata_sf()
mainstreets
tm_shape(mainstreets$osm_lines)+tm_lines()

smallstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street", "unclassified", "service", "footway"
                  )) %>%
  osmdata_sf()
# map it
CP <-geocode_OSM(place)
center_point <- st_point(c(CP$coords[1], CP$coords[2])) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 7000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)

MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#FF8200", outer.bg=F, frame = F) +
  tm_credits(position=c("left","bottom"),
             text ="Created by Prof Malcolm Campbell \n Source: OSM © OpenStreetMap contributors") 

MINIMALCIRCLEMAP

tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day14_OSM_Dublin.png", 
          height = 12, width = 12, dpi=400)
rm(list=ls())

############### CAPITAL 4
place <- c("Westminster, UK")
#
motorway <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("motorway", "motorway_link", "trunk")) %>%
  osmdata_sf()
motorway
tm_shape(motorway$osm_lines)+tm_lines()
mainstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("primary", "primary_link")) %>%
  osmdata_sf()
mainstreets
tm_shape(mainstreets$osm_lines)+tm_lines()

smallstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street", "unclassified", "service", "footway"
                  )) %>%
  osmdata_sf()
#


CP <-geocode_OSM(place)
center_point <- st_point(c(CP$coords[1], CP$coords[2])) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 7000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)

MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#004225", outer.bg=F, frame = F) +
  tm_credits(position=c("left","bottom"),
             text ="Created by Prof Malcolm Campbell \n Source: OSM © OpenStreetMap contributors") 

MINIMALCIRCLEMAP

tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day14_OSM_Westminster.png", 
          height = 12, width = 12, dpi=400)
rm(list=ls())
#END
