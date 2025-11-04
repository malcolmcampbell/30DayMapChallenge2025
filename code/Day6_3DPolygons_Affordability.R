# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 3 - Polygons
# creating an affordability MEASURE
# using Labour Cost Index to increase wages
# to inflate CENSUS2023 data
# source: https://www.stats.govt.nz/information-releases/labour-market-statistics-march-2024-quarter/#:~:text=In%20the%20year%20to%20the%20March%202024,ordinary%20time%20hourly%20earnings%20increased%20to%20$40.96.
# 2024Q1 up 4.1 percent = 1.04
# source: https://www.stats.govt.nz/information-releases/labour-market-statistics-march-2025-quarter/#:~:text=all%20salary%20and%20wage%20rates%20(including%20overtime),hourly%20earnings%20increased%20to%20$42.79%20from%20$40.96.
# Year to the March 2025 Q: salary & wage rates (incl OT) increased 2.9 percent = 1.029
# 2023 Median household Income: $97,000
# variety of measures HERE 
# https://www.hud.govt.nz/stats-and-insights/change-in-housing-affordability-indicators/other-ways-to-measure-housing-affordability#tabset
pacman::p_load(sf, tmap, tidyverse)
#read in GEOPAKCAGE with DATA - SLIMMED precreated version
SA2_HH_2023_income <- st_read("./SA2_HH_2023_income.gpkg")

# clipping, removing 0 sized geographies
SA2_HH_2023_income <- SA2_HH_2023_income |>
  # getting rid of coastal and inlets (if desired)
  filter(LAND_AREA_SQ_KM>0) |>
  filter(AREA_SQ_KM>0) |>
  filter(Shape_Length>0)

# map it!
tm_shape(SA2_HH_2023_income) + tm_polygons()
# what variables are present?
names(SA2_HH_2023_income)
# clean up NAs
SA2_HH_2023_income <- SA2_HH_2023_income %>%
  mutate(
    across(HHtotal:MedianWeeklyRent,
           ~case_when(. == -999 ~ NA,
                      . == -998 ~ NA,
                      . == -997 ~ NA,
                      . != -999 ~ .)))

SA2_HH_2023_income <- SA2_HH_2023_income |>
  mutate ( MedianEstHHInc2024 =  MedianHHInc *1.04 ) |>
  mutate ( MedianEstHHInc2025 =  MedianEstHHInc2024 * 1.029 ) |>
  mutate ( MedianEstAffordability2025 = MedianEstHHInc2025 * 3 )|>
  mutate ( NZEstHHMedian2025 = MedianEstHHInc2025 * 6 )

# Map it!
tmap_mode("plot")
#
HHAfford <-
  tm_shape(SA2_HH_2023_income)+ tm_fill(fill="grey20", lwd=1.75, fill_alpha=0.25) +
  tm_shape(GLA)+ tm_borders("black", lwd=3, fill_alpha=0.1) +
  tm_shape(RAIL)+tm_lines(col="#773dbd", lwd=0.65) +
  
  tm_title (text="") +
  tm_credits(text ="Created by Malcolm Makes Maps \n Source: OSM © OpenStreetMap contributors",position = tm_pos_out("center", "bottom")) +
  
  tm_scalebar(position = tm_pos_out("center", "bottom")) 



tm_shape(SA2_HH_2023_income) +
  tm_polygons(
    fill = "MedianEstHHInc2025",
    fill.scale = tm_scale_continuous(values = "-orange_blue_diverging"),
    fill.legend = tm_legend(title="Median Household Income \n Estimate, 2025 ($)"),
    col = NULL) + 
  tm_title("Day 3: Polygons. Housing Affordability; Median Household income Multiples ($)") +
  tm_scalebar() +
  tm_credits("Created by Malcolm Makes Maps \n Source: NZ Census, MHUD, StatsNZ")

# mapgl 3d?




LINEGREY
tmap_save(LINEGREY, "Day2_30DMC.png", width = 2200, height = 2200, dpi = 300)
#END