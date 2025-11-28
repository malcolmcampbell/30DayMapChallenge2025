# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 28: Black.
# (Black Friday) Interpret the theme of Black. The map can be purely monochromatic, 
# represent absence/darkness (e.g., light pollution), or relate to themes of consumption.
pacman::p_load(blackmarbler, sf, terra, tidyterra, ggplot2, ggthemes, geodata)
# Vignette is here https://worldbank.github.io/blackmarbler/#installation
bearer <- get_nasa_token(username = "USER@SOMETHING.COM", password = "PASSWORD HERE")

IRL_sf <- gadm(country = "IRL", level=1, path = tempdir()) 
GBR_sf <- gadm(country = "GBR", level=1, path = tempdir()) 
BI_sf <- terra::union(GBR_sf, IRL_sf)
#### Data 2024
r_annual <- bm_raster(roi_sf = BI_sf, product_id = "VNP46A4", 
                      date = "2024-12-12", bearer = bearer)
###########################################################
#### Prep data
r_annual <- r_annual |> terra::mask(BI_sf)
  
## Distribution is skewed using log as advised in vignetter
r_annual[] <- log(r_annual[] + 1)

#######################################################
# using ggplot2 to map file.
##### Map
ggplot() +
    geom_spatraster(data = r_annual) +
    scale_fill_gradient2(low = "grey5", mid = "yellow", high = "firebrick",
                         midpoint = 5, na.value = "transparent") +
    labs(title = "Day 28: Black: Nighttime Lights, British Isles, December 2024") +
    theme_tufte() + 
   theme(legend.position = "none", 
         panel.background = element_rect(fill = "aliceblue"))
ggsave(filename="./maps/Day28_British_isles_NIGHT.png", dpi=300, width=22, height=22, units="cm")
#########################################################
NZL_sf <- gadm(country = "NZL", level=0, path = tempdir()) 
#### Data 2024
r_annual <- bm_raster(roi_sf = NZL_sf, product_id = "VNP46A4",
                       date = "2024-12-12", bearer = bearer)
###########################################################
#### Prep data
r_annual <- r_annual |> terra::mask(NZL_sf)
# Distribution is skewed using log as advised in vignette
r_annual[] <- log(r_annual[] + 1)
#######################################################
# using ggplot2 to map file.
##### Map
ggplot() +
   geom_spatraster(data = r_annual) +
   scale_fill_gradient2(low = "grey5", mid = "yellow", high = "firebrick",
                        midpoint = 3, na.value = "transparent") +
   labs(title = "Day 28: Black: Nighttime Lights, New Zealand, December 2024") +
   theme_tufte() + 
   theme(legend.position = "none", 
         panel.background = element_rect(fill = "aliceblue"))
ggsave(filename="./maps/Day28_NZ_NIGHT.png", dpi=300, width=22, height=22, units="cm")

#########################################################
CAN_sf <- gadm(country = "CAN", level=0, path = tempdir()) 
#### Data 2024
r_annual <- bm_raster(roi_sf = CAN_sf, product_id = "VNP46A4",
                      date = "2024-12-12", bearer = bearer)
###########################################################
#### Prep data
r_annual <- r_annual |> terra::mask(CAN_sf)
# Distribution is skewed using log as advised in vignette
r_annual[] <- log(r_annual[] + 1)
#######################################################
# using ggplot2 to map file.
##### Map
ggplot() +
  geom_spatraster(data = r_annual) +
  scale_fill_gradient2(low = "grey5", mid = "yellow", high = "firebrick",
                       midpoint = 3, na.value = "transparent") +
  labs(title = "Day 28: Black: Nighttime Lights, Canada, December 2024") +
  theme_tufte() + 
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "aliceblue"))
ggsave(filename="./maps/Day28_Canada_NIGHT.png", dpi=300, width=22, height=22, units="cm")
#end