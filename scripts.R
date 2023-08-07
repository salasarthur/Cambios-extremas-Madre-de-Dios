## Load libraries --------------------------------------------------------------
require(pacman)
p_load(tidyverse, RColorBrewer, terra, fs, sf, rgeos, gtools, elevatr, glue,
       MODISTools)

g <- gc(reset = T)
rm(list = ls())
options(scipen = 999, warn = -1)

## Load data -------------------------------------------------------------------
dts_p <- st_read('H:/GIS/gpkg/distritos_peru.gpkg')
aos <- filter(dts_p, DISTRITO == 'MADRE DE DIOS' |
                DISTRITO == 'INAMBARI'|
                DISTRITO == 'HUEPETUHE')

# Plot UH
ggplot()+
  geom_sf(data = dts_p, fill = NA, col = 'grey80')+
  geom_sf(data = aos, fill = NA ,col = 'grey10')+
  geom_sf_label(data = aos, aes(label = DISTRITO), alpha = 0.01, size = 3,
                label.r = unit(NA, 'lines'))+
  labs(x = "Longitud", y = "Latitud")+
  theme_classic()+
  coord_sf(xlim = ext(aos)[1:2], ylim = ext(aos)[3:4],expand = TRUE,
           crs = NULL,)



