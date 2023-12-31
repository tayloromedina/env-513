

# PACKAGES
library(tidyverse)
library(here)
library(readxl)
library(janitor)
library(partykit)



# Load data
calenviroscreen <- read_excel(here('data', 'calenviroscreen.xlsx')) %>% 
  clean_names() %>% # makes names lowercase (easier for R)
  select(!matches('_pctl') & !matches('ces') & !matches('score')) # removes the score and percentile columns, we want raw numbers

# subset data to only numeric
subsetdata <- calenviroscreen %>% 
  select(!1:7) %>% 
  mutate_if(is.character,as.numeric)

subsetdata <- subsetdata[is.finite(rowSums(subsetdata)),]
  
# pca
pca_fit <- subsetdata %>%  # retain only numeric columns
  scale() %>% # scale data
  prcomp()

pca_fit %>%
  broom::augment(subsetdata) %>% # add original dataset back in
  ggplot(aes(.fittedPC1, .fittedPC2)) + 
  geom_point(size = 1.5) 


 # SUBSET THE DATA BY GROUPS
health <- subsetdata %>% 
  select(15:17)

pollution <- subsetdata %>% 
  select(1:14)

socioeconomic <- subsetdata %>% 
  select(18:23)


