
library(readr)
library(ggplot2)
library(rworldmap)


datafile <- "/Users/akhilperimbeti/Desktop/workout1/data/ibtracs-2010-2015.csv"

dat <- read_csv(datafile, col_names =  c("serial_num",
                                         "season",
                                         "num",
                                         "basin",
                                         "sub_basin",
                                         "name",
                                         "iso_time",
                                         "nature",
                                         "latitude",
                                         "longitude",
                                         "wind",
                                         "press"), col_types = 
                  cols(
                    serial_num = col_character(),
                    season = col_integer(), 
                    num = col_character(),
                    basin = col_factor(), 
                    sub_basin = col_character(), 
                    name = col_character(), 
                    iso_time = col_character(), 
                    nature = col_character(), 
                    latitude = col_double(), 
                    longitude = col_double(), 
                    wind = col_double(), 
                    press = col_double()), 
                na = c("-999.", "-1.0","0.0"), skip = 1)


sink("/Users/akhilperimbeti/Desktop/workout1/output/data-summary.txt")
summary(dat)
sink()

newmap <- getMap(resolution = "low")
plot(newmap, asp = 1)
points(dat$longitude, dat$latitude, col = "blue", cex = .2)
abline(h=0)
ggsave(file = "/Users/akhilperimbeti/Desktop/workout1/images/map-all-storms.pdf", width = 6.5, height = 5)
png(file = "/Users/akhilperimbeti/Desktop/workout1/images/map-all-storms.png", width = 8, height = 7, units = "in", res = 10)


