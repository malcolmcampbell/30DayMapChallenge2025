# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 16: Cell 	Map something composed of small, discrete units or networks. 
# This could be a geographic cell (raster, tessellation), 
# a cellular network, or a biological/social process (e.g., disease spread).
pacman::p_load(sf, tmap, rnaturalearth, tidyverse, RColorBrewer) 

#####################################
# cellphone access map, by household
CELL <- st_read("./data/CELL.gpkg")

STYLECOL <- "#23305D" #Pukepoto Dark Blue #23305D
TEXTCOL <- "#4AAEB0" #Kikorangi  Blue #4AAEB0

caption_text  <- 
  c("Created by Prof Malcolm Campbell, \nPrincipal Academic Advisor, \nEvidence and Analytics, \nSource: NZ Census 2023, \n Amended by MalcolmMakesMaps")

KY  <- "#F7D346" #Kōwhai Yellow #F7D346
KY <- "lightyellow"
palrev <- c(KY , brewer.pal(9, "Greens"))
palrev

######################################################
# CellPhone
#STATIC - non/loop
tmap_mode("plot")
CellPhone_highlightmap <- tm_shape (CELL) + 
  tm_polygons (fill="CellphoneProp",
               fill.scale = tm_scale_intervals(n = 10, style = "quantile", values = palrev),
               col_alpha = 0.2) +
  tm_borders(col="grey50", col_alpha = 0.25, lwd=0.0005) +
  tm_credits (text = caption_text, col = STYLECOL) +
  tm_title (text="Access to Cellphone or mobile phone, % of Households, 2023", color = STYLECOL) + 
  tm_check_fix()

print(CellPhone_highlightmap)

# Save the map to a file
tmap_save(CellPhone_highlightmap, 
          dpi=400, height = 297, width = 210, units="mm",
          filename = "Day16_CellPhone.png")
#end