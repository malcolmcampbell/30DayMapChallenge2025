# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 7 - Accessibility
#Accessibility 	
#Map how people (or things) get around. Visualize travel time, barriers, 
#inclusive design, public transport reach, or create a map that is itself highly 
#accessible to all users.

# Mapping Accessibility Surface(s) by time.
# https://www.mapbox.com/insights/isochrones
# Adapted from https://walker-data.com/posts/time-aware-isochrones/ and sources 
# Professor Malcolm Campbell
# Attribution-Non Commercial-ShareAlike  # CC BY-NC-SA 
pacman::p_load(mapboxapi, mapgl, leaflet, mapview)
# If you dont already go to https://mapbox.co and set up an API / token. The `mb_access_token()` 
# function sets the access token for all subsequent Mapbox API calls in 
# both the mapboxapi and mapgl packages.
# mb_access_token ("copy and paste the API token TEXT HERE between the speech marks") - BUT DONT SHARE PUBLICALLY!!

# geocode to an SF object using mapbox
#
# note - will not work without API setup
#
RVH <- mb_geocode("Royal Victoria Hospital, 274 Grosvenor Road, Belfast, BT12 6BA", 
                  output = "sf") # adds the geocoded coords to an SF object

# Generate isochrones for middle of the night where there is the least traffic
# #3AM
# formatted as `YYYY-MM-DDTHH:MM
iso_night <- mb_isochrone(
  RVH,  depart_at = "2025-09-01T03:00"
)

# For rush hour (9am or 5pm)
iso_rush <- mb_isochrone(
  RVH,  depart_at = "2025-09-01T17:00"
)

# then using the mapgl to visualise the rush hour
rush_map <-  mapboxgl(bounds = iso_night) |> 
  # note: using iso_night so compare works better
  add_fill_layer(
    "rush",
    source = iso_rush,
    fill_color = match_expr(
      column = "time",
      values = c(5, 10, 15),
      stops = c("lightblue", "blue", "darkblue")
    ),
    fill_opacity = 0.35  ) |>
  add_markers( data = RVH  )
rush_map
# then using the mapgl to visualise the 3AM night map
night_map <-  mapboxgl(bounds = iso_night) |>
  add_fill_layer(
    "night",
    source = iso_night,
    fill_color = match_expr(
      column = "time",
      values = c(5, 10, 15),
      stops = c("lightgreen", "green", "darkgreen")    ),
    fill_opacity = 0.35  ) |>
  add_markers( data = RVH  )
night_map


compare(rush_map, night_map, swiper_color = "grey30") |>
  add_legend(  "Royal Victoria Hospital, 5PM vs. 3AM",
    values = c("5 minutes (Day)", "10 minutes (Day)", "15 minutes (Day)", 
               "5 minutes (Night)", "10 minutes (Night)", "15 minutes (Night)"),
    colors = c("lightblue", "blue", "darkblue", 
               "lightgreen", "green", "darkgreen"),
    patch_shape = iso_night[1,],
    type = "categorical",
    style = legend_style(background_opacity = 0.7)  )

##############################################################################
# MIDDLEMORE
# geocode to an SF object using mapbox
# note - wont work without API setup
MIDDLEMORE <- mb_geocode("Middlemore Hospital, Hospital Road, Ōtāhuhu, Auckland", 
                         output = "sf") # adds the geocoded coords to an SF object

# Generate isochrones for middle of the night where there is the least traffic
# #3AM
# formatted as `YYYY-MM-DDTHH:MM
iso_night <- mb_isochrone(
  MIDDLEMORE,  depart_at = "2025-09-01T03:00"
)

# For rush hour (9am or 5pm)
iso_rush <- mb_isochrone(
  MIDDLEMORE,  depart_at = "2025-09-01T17:00"
)

# then using the mapgl to visualise the rush hour
rush_map <-  mapboxgl(bounds = iso_night) |> 
  # note: using iso_night so compare works better
  add_fill_layer(
    "rush",
    source = iso_rush,
    fill_color = match_expr(
      column = "time",
      values = c(5, 10, 15),
      stops = c("lightblue", "blue", "darkblue")
    ),
    fill_opacity = 0.35  ) |>
  add_markers( data = MIDDLEMORE  )
rush_map
# then using the mapgl to visualise the 3AM night map
night_map <-  mapboxgl(bounds = iso_night) |>
  add_fill_layer(
    "night",
    source = iso_night,
    fill_color = match_expr(
      column = "time",
      values = c(5, 10, 15),
      stops = c("lightgreen", "green", "darkgreen") ),
    fill_opacity = 0.35  ) |>
  add_markers( data = MIDDLEMORE  )
night_map


compare(rush_map, night_map, swiper_color = "grey30") |>
  add_legend(
    "Middlemore (5PM vs. 3AM) Accessibility",
    values = c("5 minutes", "10 minutes", "15 minutes"),
    colors = c("lightblue", "blue", "darkblue"),
    patch_shape = iso_night[1,],
    type = "categorical",
    style = legend_style(background_opacity = 0.7)
  )
##########################################################################
#END