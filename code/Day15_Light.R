# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 15: Fire 	Classical Elements ¾: 
# Focus on energy, light, or transformation. Map heat, wildfires, energy consumption, 
# # # population density at night, # # # 
# or volcanic activity.
pacman::p_load(sf, tmap, rnaturalearth, tidyverse) 

#####################################
# WORLD "2125" MAP
WORLD <- ne_countries(scale = "large", type="countries", returnclass = "sf")
# Set countries
US <- WORLD %>%
  filter(., iso_a3 =="USA")

# source: https://koordinates.com/layer/10893-us-historic-fire-perimeters/
unzip ("C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/kx-us-historic-fire-perimeters-GPKG.zip",
       exdir = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/FIRE/")
FIRES <- st_read(dsn = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/FIRE/us-historic-fire-perimeters.gpkg")         
FIRE <- tm_shape(FIRES) +
  tm_polygons(fill="firebrick1") + 
  tm_layout(bg.color = "grey10")+
  tm_title("Day 15: US Historic Fire Perimeters") +
  tm_shape(US) +tm_borders(col="white")
  
#Save it
tmap_save(tm=FIRE, filename="./maps/Day15_Light_fire.png", 
          height = 12, width = 12, dpi=300) 
#end