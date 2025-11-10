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
