# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 21: Icons 	
# Create a map where icons, pictograms, or custom symbols are the main focus. 
# Use them to highlight points of interest or replace traditional cartographic features.
pacman::p_load(sf, leaflet, tidyverse) 
setwd("C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30DMC_2025/30DayMapChallenge2025/")
#wellconnected STUFF HERE
COMMUNITY <- st_read("./data/wellconnectedNZ/Community groups.kml")
FOOD <- st_read("./data/wellconnectedNZ/Food and drink.kml")
########################################
# setting up a custom ICON 
#Possible values are "red", "darkred", "lightred", 
#"orange", "beige", "green", "darkgreen", "lightgreen", 
#"blue", "darkblue", "lightblue", "purple", "darkpurple", 
#"pink", "cadetblue", "white", "gray", "lightgray", "black"
COMM <- awesomeIcons(
  icon = "users",
  library = "fa",
  markerColor = 'purple')
FOODS <- awesomeIcons(
  icon = "cutlery",
  library = "fa",
  markerColor = 'darkred')
#########################################################

leaflet() |>
  addProviderTiles("Stadia.AlidadeSmoothDark") |>
  addAwesomeMarkers(data=COMMUNITY,  icon = COMM) |>
  addAwesomeMarkers(data=FOOD,  icon = FOODS) 
