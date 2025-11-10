# Customise by changing the text below to 
# your PLACE (e.g. city/town + Country)
place <- c("Belfast, United Kingdom")
#
motorway <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("motorway", "motorway_link", "trunk")) %>%
  osmdata_sf()
motorway
#
mainstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", value = c("primary", "primary_link")) %>%
  osmdata_sf()
mainstreets
#
smallstreets <- getbb(place)%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street", "unclassified", "service", "footway"
                  )) %>%
  osmdata_sf()

# map it
tmap_mode("plot")
MINIMALMAP <- 
  tm_shape(smallstreets$osm_lines)+tm_lines(col="white", lwd=0.5) +
  tm_shape(mainstreets$osm_lines)+tm_lines(col="grey80", lwd=1.5) +
  tm_shape(motorway$osm_lines)+tm_lines(col="grey90", lwd=2) +
  tm_layout (bg.color = "#02066f", outer.bg=F, frame = F) 
MINIMALMAP
tmap_save(MINIMALMAP, 
          filename = "Day11_MINIMALMAP_BELFAST.png", 
          height = 12, width = 12, dpi=300)

# now the circle!
center_point <- st_point(c(-5.9301, 54.5973)) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 5700)
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)


MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey90", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey80", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey90", lwd=2) +
  tm_layout (bg.color = "#02066f", outer.bg=F, frame = F) 
MINIMALCIRCLEMAP

tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day11_MINIMALCIRCLEMAP_BELFAST.png", 
          height = 12, width = 12, dpi=300)
