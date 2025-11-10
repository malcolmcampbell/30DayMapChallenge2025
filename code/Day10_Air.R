# 30 Day Map challenge 2025. # Copyright Malcolm Campbell, November 2025
# Day 10 - Classical Elements 2/4: Focus on the atmosphere. 
# Map weather, wind patterns, air traffic, pollution, or airborne transmission (e.g., pollen, sound).
pacman::p_load(sf, tmap, tmaptools, readxl, tidyverse)

CA <- 
  st_read("C:/Users/mhc57/OneDrive - University of Canterbury/Research/mGeoHealth/Advan_Canada/CAN_DA_2021/lda_000b21a_e.shp")
# map if needed
# tm_shape(CA) + tm_polygons(fill="PRUID")

CA <- CA |>
  filter (PRUID==59)

load("C:/Users/mhc57/OneDrive - University of Canterbury/Research/mGeoHealth/DA_CanOSSEM_2023_WFS.RData")
ls()
# see the data
glimpse(DA_CanOSSEM_WFS)
# summary of the dates (max, min)
summary(DA_CanOSSEM_WFS$DATE)

# Extract full month name
DA_CanOSSEM_WFS <- DA_CanOSSEM_WFS |>
  mutate(MONTH = month(DATE, label = TRUE, abbr = FALSE)) |>  
  mutate(NMONTH = month(DATE)) 

# only JAN
DA_CanOSSEM_WFS <- DA_CanOSSEM_WFS |>
  filter(DATE=="2023-01-01" | DATE=="2023-02-01" | DATE=="2023-03-01" |
  DATE=="2023-04-01" | DATE=="2023-05-01" | DATE=="2023-05-01" |
  DATE=="2023-06-01" | DATE=="2023-07-01" | DATE=="2023-08-01" |
  DATE=="2023-09-01" | DATE=="2023-10-01" | DATE=="2023-11-01" | DATE=="2023-12-01")

CA_AIR <- left_join(CA, DA_CanOSSEM_WFS, by=join_by(DAUID == DAUID))
#
rm(CA, DA_CanOSSEM_WFS)

################################################################################
# Map it! - try animations
tmap_mode("plot")
#
AIR <-
  tm_shape(CA_AIR)+ tm_fill(fill="DA_PM2.5", lwd=1.75, fill_alpha=0.5) +
  tm_title (text="") +
  tm_credits(text =
               "Created by Malcolm Makes Maps \n Source: Statistics Canada | Statistique Canada and CanOSSEM",
             position = tm_pos_out("center", "bottom")) +
  tm_scalebar(position = tm_pos_out("center", "bottom")) +
  tm_facets(by="NMONTH")
AIR

AIR +
  tm_animate(by = "NMONTH")

##########################################################################
#END