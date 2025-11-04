# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 4 - Data: my data
# Mapping Personal MOVEMENT data
# Professor Malcolm Campbell 
# mGeoHealth Moves IMAGE COVER - adapted from August 2021
pacman::p_load(tidyverse, leaflet, leaflet.providers, geojsonio, sf, tmap) 

m <- leaflet() %>% setView(lng = 172.6, lat = -43.5, zoom = 11)
m %>% addTiles()
m %>% addProviderTiles("CartoDB.DarkMatterNoLabels")

#tighter ZOOM
m <- leaflet() %>% setView(lng = 172.6, lat = -43.5, zoom = 12)
m %>% addTiles()
m %>% addProviderTiles("CartoDB.DarkMatterNoLabels")

# CHOOSE YOUR COLOUR!
colvar <- "purple"
colvar <- "green"
colvar <- "yellow"

# PRIVATE DATA LOADED - NOT TO SHARE
setwd("C:/Users/mhc57/OneDrive - University of Canterbury/Research/mGeoHealth/geojson/geojson/monthly/activities/")
# geojson activity data
AC2016 <- geojson_read("activities.geojson")

m |> 
  addProviderTiles("CartoDB.DarkMatterNoLabels") |>
  addGeoJSON(AC2016, weight = 0.5, color = colvar, fill = FALSE) 
#END
