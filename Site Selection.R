library(tidyverse)
library(ggplot2)
library(lmtest)
library(zoo)
library(car)
library(pwr)
library(ggrepel)
site_selection = read.csv('D:/GIS Files/City of Ottawa Ponds and Parks/Site Selection Criteria.csv')
summary(site_selection)
range(site_selection$Area..ha.)
Area <- site_selection$Area..ha.
Habitat <- site_selection$Habitat.Unit.Id
Natural <- site_selection$X..Natural.Landcover
Vegetation <- site_selection$Vegetation.Heterogeneity.Score.
Impervious <- site_selection$X..Impervious.Area
Habitat.Type <- site_selection$ï..Habitat.Type
Buffer_2500m <- site_selection$X..Natural.Landcover.2500m
Offset_2500m <- site_selection$X2500m.Offset

natural_x_veg_graph1 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Natural, y = Vegetation, color = Habitat.Type))
natural_x_veg_graph1

impervious_x_veg_graph2 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Impervious, y = Vegetation, color = Habitat.Type))
impervious_x_veg_graph2

natural_x_veg_graph3 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Natural.Offset, y = Vegetation.Offset, color = Habitat.Type))         
natural_x_veg_graph3


impervious_x_veg_graph4 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Impervious.Offset, y = Vegetation.Offset, color = Habitat.Type))
impervious_x_veg_graph4

boxplot(Area ~ Habitat.Type, data = site_selection)

options(ggrepel.max.overlaps = Inf)

natural_x_veg_graph3 + geom_label_repel(aes(x = Natural.Offset, y = Vegetation.Offset, label = Habitat),
                 box.padding   = 0.35, 
                 point.padding = 0.5,
                 segment.color = 'grey50') +
  theme_classic()

impervious_x_veg_graph4 + geom_label_repel(aes(x = Impervious.Offset, y = Vegetation.Offset, label = Habitat),
                                           box.padding   = 0.35, 
                                           point.padding = 0.5,
                                           segment.color = 'grey50') + theme_classic()

Natural_x_Veg_graph5 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Offset_2500m, y = Vegetation.Offset, color = Habitat.Type))         
Natural_x_Veg_graph5
  