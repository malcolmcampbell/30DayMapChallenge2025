# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 13
# Start the timer! The maximum allowed time to design and produce this map is 10 minutes. 
# Focus on speed, simplicity, and core communication.
pacman::p_load(rnaturalearth, ggplot2, ggthemes, tidyverse, beepr, sf) 

#####################################
# WORLD "2125" MAP
start <- Sys.time()
WORLD <- ne_countries(scale = "large", type="countries", returnclass = "sf")
# Set countries
# https://en.wikipedia.org/wiki/CANZUK
CANZUKI_Alliance <- WORLD |>
  filter(iso_a3 =="GBR"|iso_a3 =="AUS"| iso_a3 =="CAN"|iso_a3 =="NZL"|iso_a3 =="IRL" )
############################################################
ggplot(WORLD) + geom_sf() + 
  ggtitle("Day 13: 10 Minute Map, The CANZUKI Alliance") +
  geom_sf(data=CANZUKI_Alliance, aes(fill="#50C878")) +
  theme_economist() +
  theme(legend.position='none') 
ggsave(filename="Day13_CANZUKI_a.png", dpi=300, width=22, height=22, units="cm")
# cool projections!!
WORLD_robin <- WORLD %>% st_transform(., "+proj=robin")
ggplot(WORLD_robin) + geom_sf() +
  ggtitle("Day 13: 10 Minute Map, The CANZUKI Alliance") +
  geom_sf(data=CANZUKI_Alliance, aes(fill="#50C878")) +
  theme_economist() +
  theme(legend.position='none')
ggsave(filename="Day13_10minmap_CANZUKI.png", dpi=300, width=22, height=22, units="cm")
end <- Sys.time()
end - start
beep(sound = 3)
#END