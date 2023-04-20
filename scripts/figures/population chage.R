library(janitor)


total_pop <- read_csv(here::here("inputs/data/cleaned/total_pop.csv"))

total_pop <- as.data.frame(t(total_pop)) %>%
  row_to_names(row_number = 1)

total_pop <- tibble::rownames_to_column(total_pop, "year")

total_pop <- total_pop %>% 
  mutate(year = as.integer(str_remove_all(year, " Year")))
  
p1 <- ggplot(total_pop, aes(x=year, y=`Whole country`, group=1)) +
  geom_line() +
  geom_point()+
  ggtitle("whole country")

p2 <- ggplot(total_pop, aes(x=year, y=Seoul, group=1)) +
  geom_line(color="grey") +
  geom_point()+
  ggtitle("Seoul")

# Display both charts side by side thanks to the patchwork package
p1 + p2
