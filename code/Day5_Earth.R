# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 5 Earth 	Classical Elements ¼: Focus on the tangible and grounded. 
# Map landforms, geology, soil, agriculture, elevation, or 
# anything solid beneath your feet.
# Professor Malcolm Campbell 

pacman::p_load(rayshader)

# install.packages("devtools")
devtools::install_github("h-a-graham/rayvista", dependencies=TRUE)

Mlat <- 54.7480
Mlong <- -6.7367

maunga <- plot_3d_vista(lat = Mlat, long = Mlong)

render_label(heightmap= maunga, text='Ko Slieve Gallion te maunga: 528 m', lat = Mlat,
             long=Mlong, extent = attr(maunga, 'extent'),altitude=600,
             clear_previous = T, zscale = 2)

render_compass() 

render_scalebar(limits=c(
  round(dim(maunga)[2]*attr(maunga, 'resolution')/1000,1)),
  label_unit = 'km')

render_snapshot(clear=TRUE)

# https://maoridictionary.co.nz/search?&keywords=maunga

# depth effect
maunga_depth <- plot_3d_vista(lat = Mlat, long = Mlong, zscale=4, phi=20)
render_depth(focus=0.4, focallength = 16, clear=TRUE)

# high quality version
maunga_HQ <- plot_3d_vista(lat=Mlat, long=Mlong, zscale=5, zoom=0.75,
                          overlay_detail=14, theta=90, windowsize =1200, 
                          phi=25)
render_highquality(lightdirection = 120, clear=TRUE)

# BONUS - MOUNT COOK
Mlat <- -43.5950
Mlong<- 170.1418
# high quality version
maunga_HQ <- plot_3d_vista(lat=Mlat, long=Mlong, zscale=5, zoom=0.75,
                           overlay_detail=14, theta=90, windowsize =1200, 
                           phi=25)
render_highquality(lightdirection = 120, clear=TRUE)

# OSM version
MtCookNZ <- plot_3d_vista(lat=-43.5950, long=170.1418, 
                           radius=5000, overlay_detail = 15,
                           elevation_detail=14, zscale=5, 
                           img_provider = 'OpenStreetMap', # change this
                           cache_dir = 'testing',theta=25, phi=25, zoom=0.5,
                           windowsize =1200, solid=T, background='grey20')

render_highquality(lightdirection = c(60, 120, 240),
                   lightaltitude=c(90, 25, 12),
                   lightintensity=c(100, 500, 450),
                   lightcolor = c("white", "#FF9956", "#FF79E7"),
                   clear=TRUE)
#END