library("readxl")
library("here")
library("tidyverse")
library("dplyr")
library("janitor")
library("knitr")
library("kableExtra")
library("janitor")
library("patchwork")
library("scales")
total_pop <- read_csv(here::here("inputs/data/cleaned/total_pop.csv"))

total_pop <- as.data.frame(t(total_pop)) %>%
  row_to_names(row_number = 1)

total_pop <- tibble::rownames_to_column(total_pop, "year")

total_pop <- total_pop %>% 
  mutate(year = as.numeric(str_remove_all(year, " Year"))) %>% 
  mutate(`Whole country`=as.numeric(`Whole country`)) %>% 
  mutate(Seoul=as.numeric(Seoul))
         
p1 <- ggplot(total_pop, aes(x=year, y=`Whole country`, group=1)) +
  geom_line(aes(y=`Whole country`),color="grey") +
  geom_point(aes(y=`Whole country`))+
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale()))+
  ggtitle("whole country")+
  labs(y= "Population", x = "Year")

p2 <- ggplot(total_pop, aes(x=year, y=Seoul, group=1)) +
  geom_line(aes(y=`Whole country`),color="grey") +
  geom_point(aes(y=`Whole country`))+
  ggtitle("Seoul")+
  labs(y= "Population", x = "Year")

# Display both charts side by side thanks to the patchwork package
p1 + p2
