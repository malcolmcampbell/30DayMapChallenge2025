# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 17
# Challenge Classic: Experimentation is key! Create your map using a software, 
# language, library, or technique you have never used before..
pacman::p_load(gridmappr, tidyverse, beepr, sf) 
# https://www.roger-beecham.com/gridmappr/articles/use-gridmaps.html
# article explaining the concepts

TA_2025 <- st_read("C:/Users/mhc57/OneDrive - University of Canterbury/Research/statsnz-territorial-authority-2025-clipped-GPKG/territorial-authority-2025-clipped.gpkg")

#TA_LE_2022_24.csv
#source: https://www.stats.govt.nz/information-releases/national-and-subnational-period-life-tables-2022-2024/

join to 


https://github.com/rogerbeecham/gridmappr

# install.packages("devtools")
devtools::install_github("rogerbeecham/gridmappr")

#
# Create df of point locations.
pts <- france_deps |> st_drop_geometry() |>
  select(area_name = name, x, y)

# Create gridmap layout.
solution <- points_to_grid(pts, n_row=10, n_col=10, compactness = .6)

# Create gridmap layout,.
solution <- points_to_grid(pts, n_row=12, n_col=12, compactness = .6)

# Spacers to separate Corsica from mainland.
spacers <- list(
  c(1, 11), c(2, 11), c(3, 11), c(2,10), c(1,10)
)
# Point centroids for real départements.
pts <- france_deps |>
  st_drop_geometry() |>
  select(area_name = name, x = x, y = y)

solution <- points_to_grid(pts, 13, 12, .6, spacers)
