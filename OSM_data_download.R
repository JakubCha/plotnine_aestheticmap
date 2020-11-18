library(osmdata)
library(sf)
library(ggplot2)

setwd("N:\\Nauka\\BigData")

bbx <- getbb("Warsaw, Poland")

available_tags("highway")
available_tags("railway")

highways <- bbx %>% opq() %>% 
  add_osm_feature(key = "highway",
                  value = c("motorway", "trunk",
                            "primary", "secondary",
                            "tertiary","motorway_link",
                            "trunk_link","primary_link",
                            "secondary_link",
                            "tertiary_link")) %>%
  osmdata_sf()



streets <- bbx %>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street",
                            "service","unclassified",
                            "pedestrian", "footway",
                            "track","path")) %>%
  osmdata_sf()


railways <- bbx %>% opq() %>% 
  add_osm_feature(key = "railway",
                  value = c("light_rail", "rail", "subway", "tram")) %>%
  osmdata_sf()

st_write(railways, "railways.gpkg")