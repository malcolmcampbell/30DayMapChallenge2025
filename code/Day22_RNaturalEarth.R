# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 22 Data challenge: Natural Earth 	
# Use the Natural Earth dataset as your primary source for a visually 
# stunning small-scale world or continent map.

# NOTE: you may need the command below to install {RNaturalEarthHiRes}
# install.packages("rnaturalearthhires", repos = "http://packages.ropensci.org", type = "source")
pacman::p_load(rnaturalearth, rnaturalearthdata, rnaturalearthhires, 
               sf, tmap, tmaptools)
UK <- ne_countries(country="United Kingdom", 
                   returnclass = "sf", 
                   scale=10)
plot(st_geometry(UK))

IRL <- ne_countries(country="Ireland", 
                    returnclass = "sf", 
                    scale=10)
plot(st_geometry(IRL))


# using the st_union command to join geographic units together
NI <- ne_states(geounit = "Northern Ireland", returnclass = "sf")
NI_union <- st_union(NI)
NI_union <- st_make_valid(NI_union)

SCOT <- ne_states(geounit = "SCOTLAND", returnclass = "sf")
SCOT_union <- st_union(SCOT)
SCOT_union <- st_make_valid(SCOT_union)

ENG <- ne_states(geounit = "England", returnclass = "sf")
ENG_union <- st_union (ENG)
ENG_union <- st_make_valid(ENG_union)

WALES <- ne_states(geounit = "Wales", returnclass = "sf")
WALES_union <- st_union (WALES)
WALES_union <- st_make_valid(WALES_union)

EandW_union <- st_union(WALES_union, ENG_union)
EandW_union <- st_make_valid(EandW_union)


IRELAND <- st_union(IRL, NI_union)
GINB <- st_union(IRELAND, SCOT_union)



# using the tmap library we can map things using the following commands.
# 1.) tm_shape (then enter the shape in the brackets here)
# 2.) tm_polygons () - which fills the polygons
# fill (the fill color), 
# col (the border color), 
# lwd (line width), 
# lty (line type), 
# fill_alpha (fill color alpha transparency) and 
# col_alpha (border color alpha transparency).
tm_shape(GINB) + tm_borders()
tm_shape(GINB) + tm_fill()
tm_shape(GINB) + tm_polygons()

GINB_map <-
tm_shape(GINB) +
  tm_fill(fill = "seagreen", col_alpha = 0.3, col="purple", lwd=3.5)+
  tm_shape(EandW_union) + 
  tm_fill(fill="lightgray") +
  tm_title(text="The Federation of Great \nIreland & Northern Britain")+
  tm_credits("Referendum results of 23 June 2016", 
             position="left", size=0.75) +
  tm_layout(frame=F) +
  tm_compass(position=c("left","bottom")) +
  tm_scalebar(position=c("left","bottom")) 
GINB_map
tmap_save(GINB_map, "Day22_RNAturalEarth_GINB.png")
######################################################
# adding the "capitals"
# first, a vector of the places
# then, using the geocode_OSM command
# finally, turn it into a Simple Features (sf) object using st_as_sf
capitals <- c("Dublin", "Belfast", "Edinburgh")
capitals <- geocode_OSM(capitals)
capital <- st_as_sf(capitals, coords=c("lon", "lat"), crs=4326)

# Plus Capitals - using the tm_dots command
GINB_map_capitals <-
tm_shape(GINB) +
  tm_fill(fill = "seagreen", col_alpha = 0.3, col="purple", lwd=3.5)+
  tm_shape(EandW_union) + 
  tm_fill(fill="lightgray") +
  tm_title(text="The Federation of Great \nIreland & Northern Britain")+
  tm_credits("MalcolmMakesMaps", 
             position="left", size=0.75) +
  tm_layout(frame=F) +
  tm_compass(position=c("left","bottom")) +
  tm_scalebar(position=c("left","bottom")) +
  tm_shape(capital) + 
  tm_dots(fill="red", size=0.4, hover="query") + 
  tm_text("query", size=0.75, xmod=-1.5, ymod=-.5) +
  tm_logo(file="https://github.com/malcolmcampbell/30DayMapChallenge2025/blob/6a34bcdfd63a7bbc4868149896657c7b7feee915/data/homemadeflag.png", 
          position=c("left","top"), height=5)
GINB_map_capitals

tmap_save(GINB_map_capitals, "Day22_RNAturalEarth_GINB_capitals.png")

# finding a (wonky) centroid value
Cap <- st_centroid(GINB)
Cap$Title <- c("Capital?")

GINBcaptial <- 
  GINB_map <-
  tm_shape(GINB) +
  tm_fill(fill = "seagreen", col_alpha = 0.3, col="purple", lwd=3.5)+
  tm_shape(EandW_union) + 
  tm_fill(fill="lightgray") +
  tm_title(text="The Federation of Great \nIreland & Northern Britain")+
  tm_credits("MalcolmMakesMaps", position="left", size=0.75) +
  tm_layout(frame=F) +
  tm_compass(position=c("left","bottom")) +
  tm_scalebar(position=c("left","bottom")) +
  tm_shape(capital) + 
  tm_dots(fill="firebrick", size=0.4, hover="query") + 
  tm_text("query", size=0.75, xmod=-1.5, ymod=-.5) +
  tm_logo(file="https://github.com/malcolmcampbell/30DayMapChallenge2025/blob/6a34bcdfd63a7bbc4868149896657c7b7feee915/data/homemadeflag.png", 
          position=c("left","top"), height=5) +
  tm_shape(Cap) + tm_dots(fill="blue", size=0.4, shape=15) + 
  tm_text("Title", col="blue", size=0.75, xmod=-1.5, ymod=-.85) 
GINBcaptial

tmap_save(GINBcaptial, "Day22_GINBcaptial.png")

################################
#
# EASTER EGG : UK northsouth
#
################################


###############################
# NORTH SOUTH DIVIDE
UK <- ne_states(country="United Kingdom", returnclass = "sf")
unique(UK$region)
#[1] "Northern Ireland"           "West Wales and the Valleys" "North West"                
#[4] "West Midlands"              "South West"                 "Eastern"                   
#[7] "North East"                 "South Western"              "Yorkshire and the Humber"  
#[10] "East Midlands"              "East"                       "South East"                
#[13] "East Wales"                 "Highlands and Islands"      "North Eastern"             
#[16] "Greater London"            

# Set colors
SOUTH <- UK %>%
  filter(., region =="South East"|
           region =="East"|
           region =="South West"|
           region =="Greater London")
UK <- UK |>
mutate ( DIVIDE = case_when(
    region =="South East" ~ "South",
    region =="East" ~ "South",
    region =="South West" ~ "South",
    region =="Greater London" ~ "South",
    TRUE ~ "North" )) # Default category for any unmatched values 
# Quick check
# Define a custom palette for the NS
NS_palette <- c("North" ="dodgerblue2", South="firebrick")
NS <-
tm_shape(UK) +
  tm_polygons("DIVIDE",
              fill.scale = tm_scale(values = NS_palette),
              col=NULL, fill.legend = tm_legend_hide())+
  tm_title(text="North-South Divide", size = 2.5,
           frame=F, fontface = "bold", fontfamily = "mono",
           color = "white", bg = TRUE, bg.color = "black", 
           position = tm_pos_out("center", "top", pos.h = "center") )+
  tm_layout(bg.color = "aliceblue", Frame=F)  +
  tm_credits(text ="Created by Prof. Malcolm Campbell \nData: rnaturalearth boundaries",
             position = tm_pos_out("center", "bottom", pos.h = "center"),
             size=1.5, fontface = "bold", fontfamily = "mono",
             color = "white", bg = TRUE, bg.color = "black", ) 
NS
tmap_save(NS, filename = "Day22_NS.png", height = 12, width = 12, dpi=400)
# END