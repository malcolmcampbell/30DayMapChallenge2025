# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 12: Map from 2125 	How will maps look 100 years from now? 
# Create a speculative map of what might be (or what you hope will be).
pacman::p_load(rnaturalearth, ggplot2, ggthemes, tidyverse) 

#####################################
# WORLD "2125" MAP
WORLD <- ne_countries(scale = "large", type="countries", returnclass = "sf")
# Set countries
# https://en.wikipedia.org/wiki/CANZUK
CANZUK_Alliance <- WORLD %>%
  filter(., iso_a3 =="GBR"|iso_a3 =="AUS"|iso_a3 =="CAN"|iso_a3 =="NZL")
############################################################
ggplot(WRLD) + geom_sf() + 
  ggtitle("Day 12: Map from 2125, The CANZUK Alliance") +
  geom_sf(data=CANZUK_Alliance, aes(fill="#50C878")) +
  theme_economist() +
  theme(legend.position='none') 
ggsave(filename="Day12_CANZUK_2125.png", dpi=300, width=22, height=22, units="cm")
# cool projections!!
WORLD_robin <- WORLD %>% st_transform(., "+proj=robin")
ggplot(WORLD_robin) + geom_sf() +
  ggtitle("Day 13: 10 Minute Map, The CANZUK Alliance") +
  geom_sf(data=CANZUK_Alliance, aes(fill="#50C878")) +
  theme_economist() +
  theme(legend.position='none')
ggsave(filename="Day13_10minmap_CANZUK.png", dpi=300, width=22, height=22, units="cm")
#END