library("readxl")
library("here")
library("tidyverse")
library("dplyr")

pop_data1 <- read_csv(here::here("inputs/data/raw/Summary of Census Population(by administrative districtsexage) 1960-2010.csv"))
pop_data2 <- read_csv(here::here("inputs/data/raw/Population, Households and Housing Units 2015-2020.csv"))

pop_data1 <- pop_data1 %>%
  filter(`By age` == "Total") %>% 
  filter(`Item` == "Population[Person]") %>% 
  filter(`By administrative divisions` == "Whole country" |`By administrative divisions` == "Seoul"  ) %>% 
  select(-"Item") %>% 
  select(-"By age") %>% 
  select(-"UNIT") %>% 
  select(-"...16")

pop_data2 <- pop_data2 %>% 
  filter(`Item` == "Total population[Person]") %>% 
  filter(`By administrative divisions(eup, myeon, dong)` == "Whole country" |`By administrative divisions(eup, myeon, dong)` == "Seoul"  ) %>% 
  select(-"Item") %>%
  select(-"UNIT") %>% 
  select(-"...11") %>% 
  rename(`By administrative divisions` = `By administrative divisions(eup, myeon, dong)`)

pop_merge <- left_join(pop_data1, pop_data2, by = c("By administrative divisions"))

write.csv(pop_merge, "inputs/data/cleaned/total_pop.csv", row.names=FALSE)
