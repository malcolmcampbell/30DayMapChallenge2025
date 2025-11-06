# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 6 Dimensions 	Map beyond 2D. Visualize data using 3D models, 
#extrusions (building heights), 
#depth, time (as a dimension), or an unconventional multivariate approach.
pacman::p_load(mapgl, tmaptools)

NZCities <- c("Auckland, New Zealand", 
              "Wellington, New Zealand", 
              # add your own place there with city and country?
              "Christchurch, New Zealand")
NZCitiesDF <- geocode_OSM(NZCities)
################################################################################
# AUCKLAND
maplibre(
  style = maptiler_style("basic"),
  center = c(NZCitiesDF [1,3], NZCitiesDF [1,2]),
  zoom = 15.5,
  pitch = 65,
  bearing = 20
) |>
  add_vector_source(
    id = "openmaptiles",
    url = paste0("https://api.maptiler.com/tiles/v3/tiles.json?key=",
                 Sys.getenv("MAPTILER_API_KEY"))
  ) |>
  add_fill_extrusion_layer(
    id = "3d-buildings",
    source = 'openmaptiles',
    source_layer = 'building',
    fill_extrusion_color = interpolate(
      column = 'render_height',
      values = c(0, 200, 400),
      stops = c('lightgray', 'royalblue', 'lightblue')
    ),
    fill_extrusion_height = list(
      'interpolate',
      list('linear'),
      list('zoom'),
      15,
      0,
      16,
      list('get', 'render_height')
    )
  )
###############################################################################
# WELLINGTON
maplibre(
  style = maptiler_style("basic"),
  center = c(NZCitiesDF [2,3], NZCitiesDF [2,2]),
  zoom = 15.5,
  pitch = 75,
  bearing = 320
) |>
  add_vector_source(
    id = "openmaptiles",
    url = paste0("https://api.maptiler.com/tiles/v3/tiles.json?key=",
                 Sys.getenv("MAPTILER_API_KEY"))
  ) |>
  add_fill_extrusion_layer(
    id = "3d-buildings",
    source = 'openmaptiles',
    source_layer = 'building',
    fill_extrusion_color = interpolate(
      column = 'render_height',
      values = c(0, 200, 400),
      stops = c('lightgray', 'royalblue', 'lightblue')
    ),
    fill_extrusion_height = list(
      'interpolate',
      list('linear'),
      list('zoom'),
      15,
      0,
      16,
      list('get', 'render_height')
    )
  )
###############################################################################
# CHRISTCHURCH
maplibre(
  style = maptiler_style("basic"),
  center = c(NZCitiesDF [3,3], NZCitiesDF [3,2]),
  zoom = 15.5,
  pitch = 75,
  bearing = 180
) |>
  add_vector_source(
    id = "openmaptiles",
    url = paste0("https://api.maptiler.com/tiles/v3/tiles.json?key=",
                 Sys.getenv("MAPTILER_API_KEY"))
  ) |>
  add_fill_extrusion_layer(
    id = "3d-buildings",
    source = 'openmaptiles',
    source_layer = 'building',
    fill_extrusion_color = interpolate(
      column = 'render_height',
      values = c(0, 200, 400),
      stops = c('lightgray', 'royalblue', 'lightblue')
    ),
    fill_extrusion_height = list(
      'interpolate',
      list('linear'),
      list('zoom'),
      15,
      0,
      16,
      list('get', 'render_height')
    )
  )

############################################################################
# other exmaples
##############################################################################
# CHOOSE YOUR OWN ADVENTURE
Cities <- c("London, United Kingdom",
            # add your own place there with city and country?
              "Dublin, Ireland", 
            "Belfast, United Kingdom",
              "Toronto, Canada",
            "Montreal, Canada")
CitiesDF <- geocode_OSM(Cities)
CitiesDF
###############################################################################
# PLACE - replace 1,3 and 1,2 with row of DF you will use
# e.g. CitiesDF [1,3], CitiesDF [1,2] OR CitiesDF [2,3], CitiesDF [2,2] OR
# CitiesDF [3,3], CitiesDF [3,2]  OR CitiesDF [4,3], CitiesDF [4,2]
maplibre(style = maptiler_style("basic"),center = c(CitiesDF [5,3], CitiesDF [5,2]),
  zoom = 16,   pitch = 85,   bearing = 180) |>
  add_vector_source(id = "openmaptiles",
    url = paste0("https://api.maptiler.com/tiles/v3/tiles.json?key=",
                 Sys.getenv("MAPTILER_API_KEY"))  ) |>
  add_fill_extrusion_layer(    id = "3d-buildings",
    source = 'openmaptiles',    source_layer = 'building',    fill_extrusion_color = interpolate(
      column = 'render_height',      values = c(0, 200, 400),   stops = c('lightblue', 'dodgerblue', 'blue')
    ),
    fill_extrusion_height = list(      'interpolate',      list('linear'),      list('zoom'),      15,
      0,      16,      list('get', 'render_height')    )  )
#END