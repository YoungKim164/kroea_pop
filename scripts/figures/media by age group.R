
media_age2 <- select(media_age,-c(women_number, husband_number))
media_age2 <- pivot_longer(media_age2, women_read_weekly:husband_read_weekly)
media_age2 <- media_age2 %>% 
  rename(read_weekly = "value", age_group = "characteristic")

media_age2 <- media_age2 %>% 
  mutate(sex = if_else(name=="women_read_weekly","women","husband")) %>% 
  select(-c(name))

media_age2 <- media_age2 %>% 
  subset(read_weekly != "*") %>% 
  subset(read_weekly != "NA")

ggplot(data=media_age2, aes(x=age_group, y=read_weekly, group=sex))+
  geom_line(aes(color=sex))+
  geom_point(aes(color=sex))
  