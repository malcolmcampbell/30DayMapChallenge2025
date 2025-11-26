# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day18
# Out of this world 	Map something non-Earth: a fantasy realm, an exoplanet, 
# the Moon, Mars, deep space, or a purely conceptual place (e.g., a mental map).
pacman::p_load(htmltools, tidyverse, tmap, sf) 

################################################################################
gaz <- read_csv("https://gazetteer.linz.govt.nz/gaz.csv")
NZgazette_sf <- st_as_sf(gaz, coords = c("crd_longitude", "crd_latitude"), crs = 4167)

NZgazette_sf <- NZgazette_sf |>
  # filter(grepl('Sun |Moon |Mercury |Venus |Mars |Jupiter |Saturn |Uranus |Neptune ', name)) |>
  filter(grepl('Moon ', name)) |>
 # filter(land_district=="Canterbury") |>
  filter(status=="Official Assigned") |>
  drop_na(land_district)

tmap_mode("plot")
tmap_mode("view")
MOONMAP <-  
  tm_shape(NZgazette_sf) + tm_dots(col="red") + 
  tm_text("name", shadow=T, auto.placement = T)+
  tm_legend(text.size=1,title.size=1.2,position=c("left","top")) + 
  tm_layout(main.title="'Out of this World', N.Z.") +
  tm_credits(text = "Source: LINZ \n Land Information New Zealand \n
             Created by Prof Malcolm Campbell",
             position=c("left","top")) 
MOONMAP
############################################################################
# leaflet version
NZgazette_sf_wgs84 <- st_transform (NZgazette_sf, crs=4326 )
# Map Red of Canterbury
leaflet() |>
  addProviderTiles("Esri.OceanBasemap") |>
  addMiniMap() |>
  addLabelOnlyMarkers(data = NZgazette_sf_wgs84, 
                      label = ~htmlEscape(name),
                      labelOptions = labelOptions(noHide = T, direction = "bottom",
                                                  style = list(
                                                    "color" = "#7296AB",
                                                    "font-family" = "serif",
                                                    "font-style" = "bold",
                                                    "box-shadow" = "7px 3px rgba(0,0,0,0.5)",
                                                    "font-size" = "18px",
                                                    "border-color" = "rgba(0,0,0,0.5)"
                                                  )))
#END
