# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# day 19: # 19-11-2025 	Projections 	(GIS Day) 
# Focus entirely on map projections. 
# Choose an unusual or misunderstood projection to highlight a theme, 
# or visualize distortion. (See xkcd.com/977)

# disclaimer: (up)cycle from previous year(s)

setwd("C:/Users/mhc57/OneDrive - University of Canterbury/Research/Map30DMC_2025/30DayMapChallenge2025/")

pacman::p_load(sf, rnaturalearth, giscoR, tidyverse, ggthemes) 
#####################################
WRLD <- ne_countries(scale = "large", type="countries", returnclass = "sf")  
# Set colors
HOMEMAP <- WRLD %>%
  filter(., iso_a3 =="GBR"|iso_a3 =="IRL"|iso_a3 =="CAN"|iso_a3 =="NZL")
CAN <- WRLD %>%
  filter(., iso_a3 =="CAN")
BI <- WRLD %>%
  filter(., iso_a3 =="GBR"|iso_a3 =="IRL")
NZL <- WRLD %>%
  filter(., iso_a3 =="NZL")
# WRLD "HOME" MAP #changed to "small" from "large" to save memory
WRLD <- ne_countries(scale = "small", type="countries", returnclass = "sf") 
############################################################
ggplot(WRLD) + geom_sf() + 
  ggtitle("Day 19: Projections: WGS 84") +
  geom_sf(data=WRLD, fill="#34A853", linewidth=0.25) +
  theme_wsj() +
  theme(legend.position='none') 
ggsave(filename="Day19_proj_WGS84.png", dpi=300, width=22, height=22, units="cm")
# cool projections!!
WRLD_robin <- WRLD %>% st_transform(., "+proj=robin")
ggplot(WRLD_robin) + geom_sf() +
ggtitle("Day 19: Projections: Robin") +
  geom_sf(fill="#34A853") +
  theme_wsj() +
  theme(legend.position='none')
ggsave(filename="Day19_proj_robin.png", dpi=300, width=22, height=22, units="cm")
# sphere - featuring NZ
WRLD_round <- WRLD %>% st_transform(., "+proj=ortho +lat_0=-60 +lon_0=-180")
ggplot(WRLD_round) + geom_sf() +
ggtitle("Day 19: Projections: Orthographic") +
  geom_sf(fill="#34A853") +
  theme_wsj() +
  theme(legend.position='none')
ggsave(filename="Day19_proj_ortho.png", dpi=300, width=22, height=22, units="cm")

#Winkel triple projection   
WRLD_GP <- WRLD %>% st_transform(., crs= "+proj=cea +lon_0=0 +x_0=0 +y_0=0 +lat_ts=45 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")

ggplot(WRLD_GP) + geom_sf() +
  ggtitle("Day 19: Projections: Gall-Peters") +
  geom_sf(fill="#34A853") +
  theme_wsj() +
  theme(legend.position='none')
ggsave(filename="Day19_proj_GP.png", dpi=300, width=22, height=22, units="cm")  

#van der Grinten IV
WRLD_vdg4 <- WRLD %>% st_transform(., crs= "+proj=vandg4")
ggplot(WRLD_vdg4) + geom_sf() +
ggtitle("Day 19: Projections: \nvan der Grinten 4") +
geom_sf(fill="#34A853") +
theme_wsj() +
theme(legend.position='none')
ggsave(filename="Day19_proj_VDG4.png", dpi=300, width=22, height=22, units="cm")                                

# https://github.com/cspersonal/peirce-quincuncial-projection/tree/master

WRLD_PQ <- st_read("./data/quincunx/peirce_world.shp")
HOMEMAPPQ <- WRLD_PQ %>%
  filter(., iso3 =="GBR"|iso3 =="IRL"|iso3 =="CAN"|iso3 =="NZL")
ggplot(WRLD_PQ) + geom_sf(col="grey") + 
  ggtitle("Day 19: Projections: \npeirce-quincuncial Home(lands)") +
  geom_sf(data=HOMEMAPPQ, aes(fill="#34A853")) +
  theme_wsj() +
  theme(legend.position='none') 
ggsave(filename="Day19_proj_PQ_home.png", dpi=300, width=22, height=22, units="cm") 


ggplot(WRLD_PQ) + geom_sf() +
  ggtitle("Day 19: Projections: \npeirce-quincuncial") +
  geom_sf(fill="#50C878") +
  theme_wsj() +
  theme(legend.position='none')                               +
  annotate(geom = "text", x = 0.5, y = -2.5, label = "Peirce Quincunx Projection from Github \n source:https://tinyurl.com/ycyjwra3", 
           fontface = "italic", color = "grey22", size = 3.5)
ggsave(filename="Day19_proj_PQ.png", dpi=300, width=22, height=22, units="cm")   
#END