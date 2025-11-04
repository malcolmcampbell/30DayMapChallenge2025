# 30 Day Map challenge 2025. # Copyright Malcolm Campbell 2025
# Day 2 - Lines
# Copyright Malcolm Campbell, November 2025
pacman::p_load(osmdata, sf, tmap, tidyverse, giscoR) 
# VERSION 1 - OSM
# GLA file from #https://gis-tfl.opendata.arcgis.com/datasets/greater-london-authority-gla/about
# saved to github for ease of use!
GLA <- st_read("https://raw.githubusercontent.com/malcolmcampbell/30DayMapChallenge2025/refs/heads/main/data/GLA.geojson")
# railway lines from OSM
rails <- getbb("Greater London, U.K.")%>%
  opq()%>%
  add_osm_feature(key = "railway", 
                  value = c("rail", "subway")) %>%
  osmdata_sf()
# just the railways
RAIL <- rails$osm_lines

# map it # just the lines
  tm_shape(RAIL)+tm_lines(col="#773dbd", lwd=2) 

# production map
tmap_mode("plot")
LINEGREY <- 
  tm_shape(GLA)+ tm_fill(fill="grey20", lwd=1.75, fill_alpha=0.25) +
  tm_shape(GLA)+ tm_borders("black", lwd=3, fill_alpha=0.1) +
  tm_shape(RAIL)+tm_lines(col="#773dbd", lwd=0.65) +
 
  tm_title (text="Day 2: Greater London Railway Lines, U.K.") +
  tm_credits(text ="Created by Malcolm Makes Maps \n Source: OSM © OpenStreetMap contributors",position = tm_pos_out("center", "bottom")) +
  
  tm_scalebar(position = tm_pos_out("center", "bottom")) 
LINEGREY
tmap_save(LINEGREY, "Day2_30DMC.png", width = 2200, height = 2200, dpi = 300)
# interactive map
tmap_mode("view")
LINEGREY
#END