# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 8 - Urban 	(World Urbanism Day) Map the built environment: 
# dense street networks, highrises, urban sprawl, city infrastructure, 
# or population density within a metro area.
pacman::p_load(sf, tmap) 

# Auckland - Building Layer
unzip ("C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/AKL-lds-nz-building-outlines-SHP.zip", 
       exdir = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/AKL/")
BUILDING <- st_read(dsn = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/AKL/nz-building-outlines.shp")         
AKL <- tm_shape(BUILDING) +tm_polygons(fill="#BC13FE", lwd=0.025) + tm_layout(bg.color = "grey10")
#AKL
tmap_save(tm=AKL, filename="C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/Day8_Urban_AKL.png", height = 12, width = 12, dpi=300)

# as needed
rm(list=ls())

###################################################################
# Wellington Building Layer
unzip ("C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/WLG-lds-nz-building-outlines-SHP.zip", 
       exdir = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/WLG/")
BUILDING <- st_read(dsn = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/WLG/nz-building-outlines.shp")         
tmap_mode("plot")
WLG <- tm_shape(BUILDING) +tm_polygons(fill="#ff073a", lwd=0.025) + tm_layout(bg.color = "grey10")
#WLG
tmap_save(tm=WLG, filename="C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/Day8_Urban_WLG.png", height = 12, width = 12, dpi=300)

# as needed
rm(list=ls())
######################################################################
# Christchurch Building Layer
unzip ("C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/CHC-lds-nz-building-outlines-SHP.zip", 
       exdir = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/CHC/")
BUILDING <- st_read(dsn = "C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/data/CHC/nz-building-outlines.shp")         
#tmap
CHC <- tm_shape(BUILDING) +tm_polygons(fill="#39ff14", lwd=0.025) + tm_layout(bg.color = "grey10")
#cHC
tmap_save(tm=CHC, filename="C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30Day_2025_backup/Day8_Urban_CHC.png", height = 12, width = 12, dpi=300)
#END