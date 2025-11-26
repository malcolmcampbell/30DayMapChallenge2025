# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Using Day 22 Data challenge: Natural Earth to make Day 23	
# Use the Natural Earth dataset as your primary source for a visually 
# stunning small-scale world or continent map.
# Process 	Show how you make a map. This could be a tutorial, 
# a step-by-step graphic, a blog post, a video, 
# or a screenshot of your work environment. 
# Combine it with a map from another day!

pacman::p_load(rnaturalearth, sf, tmap, tidyverse)

UK <- ne_states(country="United Kingdom", returnclass = "sf")

tm_shape(UK) + tm_polygons()
tm_shape(UK) + tm_borders()
tm_shape(UK) + tm_fill()

unique(UK$region)

UK <- UK |>
  mutate ( DIVIDE = case_when(
    region =="South East" ~ "South",
    region =="East" ~ "South",
    region =="South West" ~ "South",
    region =="Greater London" ~ "South",
    TRUE ~ "North" )) # Default category - for the other 12

NS_palette <- c("South" ="dodgerblue2", North="firebrick")


NSmap <-
  tm_shape(UK) +
  tm_polygons("DIVIDE",
              fill.scale = tm_scale(values = NS_palette),
              col=NULL, fill.legend = tm_legend_hide())+
  tm_title(text="North-South Divide", size = 1.5,
           frame=F, fontface = "bold", fontfamily = "mono",
           color = "white", bg = TRUE, bg.color = "black", 
           position = tm_pos_out("center", "top", pos.h = "center") )+
  tm_layout(bg.color = "aliceblue", Frame=F)  +
  tm_credits(text ="Created by Prof. Malcolm Campbell \nData: rnaturalearth boundaries",
             position = tm_pos_out("center", "bottom", pos.h = "center"),
             size=0.75, fontface = "bold", fontfamily = "mono",
             color = "white", bg = TRUE, bg.color = "black", ) +
  tmap_options(component.autoscale = FALSE)
NSmap

tmap_save(NSmap, filename = "./maps/Day22_NS.png", height = 12, width = 12, dpi=400)


# END