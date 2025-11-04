# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 1 - points
# library(tidyverse, leaflet, htmlwidgets)
pacman::p_load(tidyverse, leaflet, htmlwidgets, tmap, mapgl, sf) 
# load data
# data from inside Airbnb (THANKS!!!) for sydney
SYD <- read_csv("https://data.insideairbnb.com/australia/nsw/sydney/2025-06-10/visualisations/listings.csv")
glimpse(SYD)
# map it!
m <- leaflet()  %>% 
  setView(lng = median(SYD$longitude), lat = median(SYD$latitude), zoom = 11) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addCircles(data=SYD, col="red", opacity = 0.15, stroke = TRUE, fill=TRUE, radius=0.01)%>% 
  addMiniMap(tiles = providers$CartoDB.Positron, toggleDisplay = TRUE) 
m
saveWidget(m, file = "./maps/SYD_airbnb_map.html")

########################################################################

# sf version
SYD_sf <- st_as_sf(SYD, coords = c("longitude", "latitude"), crs = st_crs(4326))
# ensure on plotting / not "view" mode
tmap_mode("plot")
points <- tm_shape(SYD_sf) + 
  tm_layout(bg.color = "seagreen") +
  tm_dots(fill="yellow", size=0.001, popup.vars=c("price")) +
  tm_title_out (text="Day 1: Points: Airbnb, Sydney, Australia", title.size=.8) +
  tm_scalebar(position = tm_pos_out("center", "bottom")) +
  tm_credits(text ="Created by Malcolm Makes Maps \n Source: insideairbnb",
             position = tm_pos_out("center", "bottom")) 
points
tmap_save(tm=points, filename="./maps/DAY1points30DMC.png", dpi=300, width=2200, height=2200)
##############################################################################

#ggplot2 version
ggplot() + 
  geom_sf(data = SYD_sf, fill = "yellow", alpha = 0.2) +
  theme_void()

##############################################################################

#MapGL version
SYD_map <- mapboxgl(center = c(151.2057, -33.8727), zoom=9)
SYD_map
# bonus #flyto - the opera house
mapboxgl(center = c(151.2153, -33.8568)) |> 
  fly_to(
    center = c(151.2153, -33.8568),
    zoom = 16.5,
    pitch = 75,
    bearing = 200  )
#END