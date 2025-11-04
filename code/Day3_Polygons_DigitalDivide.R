# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 3 - Polygons
# Mapping Census SA2 data on DETERMINANTS - adapted from MoH work Jan 2025
# Professor Malcolm Campbell / Principal Academic Advisor, MoH
pacman::p_load(sf, tmap, tmaptools, readxl, tidyverse, RColorBrewer, ggplot2, cowplot)

Part4_HI <- st_read("C:/Users/mhc57/OneDrive - University of Canterbury/Research/PAA_MoH/Part_4_HI/Part_4_HI.gpkg")
# Map it!
tmap_mode("plot")
#
########################################################
# Internet
tmap_mode("plot")

#
DigitalDivideMap <- tm_shape (Part4_HI) + 
  tm_polygons(
    fill = "InternetProp",
    fill.scale = tm_scale_intervals(n=10, style="quantile", 
                                    values = "-orange_blue_diverging"),
    fill.legend = tm_legend("Internet Access (%)"),
    col = "grey20") +
  tm_layout(legend.position = c("left", "top")) +
  tm_title("Households with Internet Access, SA2, 2023") +
  tm_title("Auckland", size = 0.8, 
           position = c("right", "top")) +
  tm_inset(bb("Auckland, New Zealand"), 
           position = c("right", "top"), frame.color = "firebrick", frame=T) +
  tm_title("Wellington", size = 0.8, 
           position = c("right", "center")) +
  tm_inset(bb("Wellington"), 
           position = c("right", "center"), frame.color = "dodgerblue", frame=T) +
  tm_title("Christchurch", size = 0.8, 
           position = c("right", "bottom")) +
  tm_inset(bb("Christchurch, New Zealand"), 
           position = c("right", "bottom"), frame.color = "seagreen", frame=T) +
  
  tm_credits(text ="Prof. M. Campbell \n Data: NZCensus2023",position = c("bottom", "center"))
DigitalDivideMap  


# Save the map to a file
tmap_save(DigitalDivideMap, dpi=400,  height = 297, width = 210,
          units="mm",
          filename = "DigitalDivideMap.png")

# Internet
tmap_mode("view")

#
DigitalDivideMap <- tm_shape (Part4_HI) + 
  tm_polygons(
    fill = "InternetProp",
    fill.scale = tm_scale_intervals(n=10, style="quantile", 
                                    values = "-orange_blue_diverging"),
    fill.legend = tm_legend("Internet Access (%)"),
    col = "grey20")
DigitalDivideMap
#END