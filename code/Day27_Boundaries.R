# 30 Day Map challenge 2025. # Copyright Malcolm Campbell, November 2025
# Day 27. Boundaries 	
# Map lines of division—political, physical, ecological, or conceptual. 
# Explore the meaning and impact of a dividing line, real or perceived.

# UKRAINE - originally designed Feb 2025. Amended Nov. 2025.
pacman::p_load(ggplot2, ggthemes, rnaturalearth, giscoR, tidyverse, sf ,tmap)

Ukraine <- ne_countries(type = "countries", country = "Ukraine", scale = "large", returnclass = "sf")

UKR_EU <-
  gisco_get_countries(resolution = "03", country = "UKR") |>
  mutate(res = "03M")

CRIMEA <- ne_states(country="RUSSIA")
CRIMEA <- CRIMEA |>
  filter(name=="Crimea")
UKRAINE_LOWER <- ne_states(country="UKRAINE")
UKRAINE_LOWER$name
UKRAINE_LOWER <- UKRAINE_LOWER |>
  filter(name=="Donets'k" | name=="Luhans'k" | name=="Zaporizhzhya" |  name=="Kherson")

UKRAINE_LEFT <- UKRAINE_LOWER |>
  filter(name!="Donets'k" | name!="Luhans'k" | name!="Zaporizhzhya" |  name!="Kherson")

#map it
ggplot() + geom_sf(data=Ukraine, fill="#0057B7", colour=alpha("grey50", 0.5)) +
  #
  theme(plot.background = element_rect(fill = "#FFDD00"),
                panel.background = element_rect(fill = "#FFDD00"),
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                axis.text.x = element_blank(),
                axis.text.y = element_blank(),
                axis.title.x = element_blank(),
                axis.title.y = element_blank(),
                axis.ticks.x = element_blank(),
                axis.ticks.y = element_blank(),
                panel.border = element_blank(),
                plot.margin = margin(0,0,0,0),
                axis.ticks.length = unit(0, "pt"),
                axis.line = element_blank()) 
ggsave(filename="Day27_boundaries_UKRAINE.png", dpi=300, width=30, height=30, units="cm")                                
# amended
ggplot() + 
  geom_sf(data=UKR_EU, fill="grey70", colour=NA) +
  geom_sf(data=Ukraine, fill="#0057B7", colour=NA) +
  geom_sf(data=UKRAINE_LOWER, fill="grey70", colour=NA) +
  theme(plot.background = element_rect(fill = "#FFDD00"),
        panel.background = element_rect(fill = "#FFDD00"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.border = element_blank(),
        plot.margin = margin(0,0,0,0),
        axis.ticks.length = unit(0, "pt"),
        axis.line = element_blank()) 
ggsave(filename="Day27_UKRAINE_b.png", dpi=300, width=30, height=30, units="cm") 
#
ggplot() + 
  geom_sf(data=UKRAINE_LEFT, fill="#4887D4", colour=NA) +
  geom_sf(data=CRIMEA, fill="#4887D4", colour=NA) +
  theme(plot.background = element_rect(fill = "#FFDD00"),
        panel.background = element_rect(fill = "#FFDD00"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.border = element_blank(),
        plot.margin = margin(0,0,0,0),
        axis.ticks.length = unit(0, "pt"),
        axis.line = element_blank())  +
  annotate("text", x = 37, y = 47.5, label = "?",
           color    = "black",
           size     = 15, fontface = "bold")
ggsave(filename="Day27_UKRAINE_boundaries_MISSING.png",bg = "#FFDD00", dpi=300, width=30, height=30, units="cm") 
#
############################################################
# BORDERS
NI <- ne_states(country="United Kingdom", returnclass = "sf", geounit = "Northern Ireland")
plot(st_geometry(NI))
NI <- st_union(NI)
UK <- ne_countries(country="United Kingdom", returnclass = "sf", scale=10)
IRL <- ne_countries(country="Ireland", returnclass = "sf", scale=10)
plot(st_geometry(IRL))
plot(st_geometry(UK))

ggplot() +
  geom_sf(data = UK, fill="#004225", colour="grey70") +
  geom_sf(data = IRL, fill="#009A44", colour="grey70") +
  geom_sf(data = NI, fill="#23297a", colour="grey10") +
  ggtitle("Day 27: Borders") +
  theme_tufte() +
  theme(legend.position='none')
ggsave(filename="Day27_borders_british_isles.png", dpi=300, width=22, height=22, units="cm")
#end