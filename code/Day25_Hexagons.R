# 30 Day Map challenge 2025. # copyright Malcolm Campbell, November 2025
# Day 25. Hexagons. Challenge Classic: 
# Use hexagonal binning (hexbins) or a 
# hexagonal grid system to visualize your data. 
# Celebrate this beautiful and efficient tessellation!
pacman::p_load(sf, tmap, tidyverse, giscoR, readxl, stringi) 
# edited data from:
# https://www.stats.govt.nz/information-releases/national-and-subnational-period-life-tables-2022-2024/
# TALB versions
TALB_LE <- read_excel("./data/TA_LE_2022_24.xlsx", sheet="TALB_LE_2022_24")
# transform to ascii from macron
# Convert the string to ASCII, removing macrons and other diacritics
TALB_LE$TALB_Ascii <- stri_trans_general(str = TALB_LE$`Territorial authority`, id = "Latin-ASCII")
# source
# https://datafinder.stats.govt.nz/layer/95676-territorial-authority-local-board-talb-hexagon-cartogram/
# cartogram in hexagons
TALB_hex <- st_read("./data/territorial-authority-local-board-talb-hexagon-cartogram.gpkg")
glimpse(TALB_hex)
st_crs(TALB_hex)
# JOIN LE to TALB hexagon
TALB_hex_LE <- left_join(TALB_hex, TALB_LE, by=c('TALB2013_V1_00_NAME'='TALB_Ascii'))
TALB_hex_LE  <- st_transform(TALB_hex_LE , crs=2193)
#Final Map - Male LE 2022-24
HEX_MLE <- tm_shape(TALB_hex_LE) +
  tm_polygons(fill = "Male2022-24", 
              fill.scale = tm_scale_continuous(values = "tableau.classic_orange_blue"),
              fill.legend = tm_legend("Years")) +
    tm_title(text="Male Life Expectancy, 2022-24") +
  tm_credits(text ="Source: StatsNZ & Koordinates\nCreated by Prof M. Campbell") +
  tm_options(frame = FALSE, bg.color = "aliceblue")
HEX_MLE
tmap_save(HEX_MLE, filename = "Day25Hexagons_MaleLE.png", dpi=300, width=2200, height=2200)

HEX_FLE <- tm_shape(TALB_hex_LE) +
  tm_polygons(fill = "Female2022-24", 
              fill.scale = tm_scale_continuous(values = "tableau.classic_orange_blue"),
              fill.legend = tm_legend("Years")) +
  tm_title(text="Female Life Expectancy, 2022-24") +
  tm_credits(text ="Source: StatsNZ & Koordinates\nCreated by Prof M. Campbell") +
  tm_options(frame = FALSE, bg.color = "aliceblue")
HEX_FLE
tmap_save(HEX_FLE, filename = "Day25Hexagons_FemaleLE.png", dpi=300, width=2200, height=2200)

HEX_MFLE <-   tm_shape(TALB_hex_LE) +
  tm_polygons(fill = "F_MGap2022-24", 
              fill.scale = tm_scale_continuous(values = "tableau.classic_orange_blue"),
              fill.legend = tm_legend("Years")) +
  tm_title(text="Female - Male Life Expectancy, 2022-24") +
  tm_credits(text ="Source: StatsNZ & Koordinates\nCreated by Prof M. Campbell") +
  tm_options(frame = FALSE, bg.color = "aliceblue")
HEX_MFLE
tmap_save(HEX_MFLE, filename = "Day25Hexagons_MFgapLE.png", dpi=300, width=2200, height=2200)


HEXacro <- tm_shape(TALB_hex_LE ) +
  tm_fill() +
  tm_title(text="Territorial Authority & Local Board") +
  tm_text("TALB_Acronym", size = 0.50, fontface = "bold") +
  tm_options(frame = FALSE, bg.color = "aliceblue")
HEXacro
tmap_save(HEXacro, filename = "Day25HexagonsACRONYMS.png", dpi=300, width=2200, height=2200)
# 4 in 1
HEX4in1 <- tmap_arrange(HEX_MLE, HEX_FLE, HEX_MFLE, HEXacro, ncol=2)
HEX4in1
tmap_save(HEX4in1, filename = "Day25HEX4in1.png", 
          dpi=400, width=4400, height=4400)
# END