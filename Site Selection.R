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
Natural <- site_selection$X..Natural.Landcover.1500m
Vegetation <- site_selection$Vegetation.Heterogeneity.Score.
Impervious <- site_selection$X..Impervious.Area
Habitat.Type <- site_selection$ï..Habitat.Type
Buffer_2500m <- site_selection$X..Natural.Landcover.2500m
Offset_2500m <- site_selection$X2500m.Offset

natural_x_veg_graph1 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Natural, y = Vegetation, color = Habitat.Type))
natural_x_veg_graph1


natural_x_veg_graph2 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Natural.Offset.1500m, y = Vegetation.Offset, color = Habitat.Type))         
natural_x_veg_graph2


boxplot(Area ~ Habitat.Type, data = site_selection)

options(ggrepel.max.overlaps = Inf)

natural_x_veg_graph2 + geom_label_repel(aes(x = Natural.Offset.1500m, y = Vegetation.Offset, label = Habitat),
                 box.padding   = 0.35, 
                 point.padding = 0.5,
                 segment.color = 'grey50') +
  theme_classic()



Natural_x_Veg_graph3 <-ggplot(data = site_selection) +
  geom_point(mapping = aes(x = Offset_2500m, y = Vegetation.Offset, color = Habitat.Type))         
Natural_x_Veg_graph3

Area_Selection <- read.csv('D:/GIS Files/City of Ottawa Ponds and Parks/Site Selection less than 1.5 ha.csv')
summary(Area_Selection)
range(Area_Selection$Area..ha.)
Area_1.5 <- Area_Selection$Area..ha.
Habitat_1.5 <- Area_Selection$Habitat.Unit.Id
Natural_1.5 <- Area_Selection$X..Natural.Landcover.1500m
Vegetation_1.5 <- Area_Selection$Vegetation.Heterogeneity.Score.
Habitat.Type_1.5 <- Area_Selection$ï..Habitat.Type
Buffer_2500m_1.5 <- Area_Selection$X..Natural.Landcover.2500m
Offset_2500m_1.5 <- Area_Selection$X2500m.Offset  

natural_1.5_graph4 <-ggplot(data = Area_Selection) +
  geom_point(mapping = aes(x = Natural_1.5, y = Vegetation_1.5, color = Habitat.Type_1.5))
natural_1.5_graph4


natural_1.5_graph5 <-ggplot(data = Area_Selection) +
  geom_point(mapping = aes(x = Natural.Offset.1500m, y = Vegetation.Offset, color = Habitat.Type_1.5))         
natural_1.5_graph5


boxplot(Area_1.5 ~ Habitat.Type_1.5, data = Area_Selection)
