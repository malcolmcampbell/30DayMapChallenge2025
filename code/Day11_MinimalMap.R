# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Minimal map 	
# Challenge yourself to use the fewest possible elements 
# (color, line weight, labels) while keeping the map clear, 
# useful, and informative.

# load required libraries
pacman::p_load(osmdata, tmap, sf) 

#######################################################################
place <- c("Christchurch, New Zealand")
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
  tm_shape(mainstreets$osm_lines)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(motorway$osm_lines)+tm_lines(col="grey80", lwd=2) +
  tm_layout (bg.color = "#FF3131", outer.bg=F, frame = F) 
MINIMALMAP
tmap_save(MINIMALMAP, 
          filename = "Day11_MINIMALMAP_CHCH.png", 
          height = 12, width = 12, dpi=300)


# now the circle!
center_point <- st_point(c(172.63, -43.5333)) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 10000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)


MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#FF3131", outer.bg=F, frame = F) 
MINIMALCIRCLEMAP

tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day11_MINIMALCIRCLEMAP_CHCH.png", 
          height = 12, width = 12, dpi=300)


#######################################################################
place <- c("Timaru, New Zealand")
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


# now the circle!
center_point <- st_point(c(171.2373, -44.3904)) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 3000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)


MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#106600", outer.bg=F, frame = F) 
MINIMALCIRCLEMAP
#save
tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day11_MINIMALCIRCLEMAP_TIMARU.png", 
          height = 12, width = 12, dpi=300)

#######################################################################
place <- c("Oamaru, New Zealand")
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

# now the circle!
center_point <- st_point(c(170.9714, -45.0966)) |> st_sfc(crs = 4326)
circle_buffer <- st_buffer(center_point, dist = 4000) # 10KM
clipped_smallstreets <- st_intersection(smallstreets$osm_lines, circle_buffer)
clipped_mainstreets <- st_intersection(mainstreets$osm_lines, circle_buffer)
clipped_motorway <- st_intersection(motorway$osm_lines, circle_buffer)


MINIMALCIRCLEMAP <- 
  tm_shape(clipped_smallstreets)+tm_lines(col="grey85", lwd=0.5) +
  tm_shape(clipped_mainstreets)+tm_lines(col="grey90", lwd=1.5) +
  tm_shape(clipped_motorway)+tm_lines(col="grey95", lwd=2) +
  tm_layout (bg.color = "#bc13fe", outer.bg=F, frame = F) 
MINIMALCIRCLEMAP
#save
tmap_save(MINIMALCIRCLEMAP, 
          filename = "Day11_MINIMALCIRCLEMAP_OAMARU.png", 
          height = 12, width = 12, dpi=300)
#END