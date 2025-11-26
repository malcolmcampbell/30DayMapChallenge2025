# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 20: Water 	Classical Elements 4/4: Focus on the fluid. 
# Map hydrology, oceans, currents, water accessibility, sea level rise, 
# precipitation, or anything aquatic.

# VIGNETTE
# https://mikkovihtakari.github.io/ggOceanMaps/articles/ggOceanMaps.html

pacman::p_load(ggOceanMaps, ggspatial) 
# simple basemaps of oceans 
basemap(limits = c(-10, 2, 50, 60.5))

# Antarctica
p <- basemap(limits = -60, projection.grid = TRUE, grid.col = "firebrick", bathy.style = "rcb")
p
ggsave(filename="./maps/Day20_water_ANTA.png", dpi=300, width=22, height=22, units="cm")   

# British Isles
p <- basemap(limits = c(-10, 2, 50, 60.5), bathymetry = TRUE)
p
p <- basemap(limits = c(-10, 2, 50, 60.5), bathymetry = TRUE, bathy.style = "rcb")
p
ggsave(filename="./maps/Day20_water_BritishIsles.png", dpi=300, width=22, height=22, units="cm")   

# Zealandia
p <- basemap(limits = c(155, 180, -25, -55), bathymetry = TRUE, bathy.style = "rcb")
p
ggsave(filename="./maps/Day20_water_Zealandia.png", dpi=300, width=22, height=22, units="cm")   

# END