

# PACKAGES
library(tidyverse)
library(here)
library(readxl)
library(janitor)


# Load data
calenviroscreen <- read_excel(here('data', 'calenviroscreen.xlsx')) %>% 
  clean_names() %>% # makes names lowercase (easier for R)
  select(!matches('_pctl') & !matches('ces') & !matches('score')) # removes the score and percentile columns, we want raw numbers

# I succeed in implement R and github -Junjia
library(ggplot2)
#hi