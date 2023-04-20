
media_residence2 <- select(media_residence,-c(women_number, husband_number))
media_residence2 <- pivot_longer(media_residence2, women_read_weekly:husband_read_weekly)
media_residence2 <- media_residence2 %>% 
  rename(read_weekly = "value", residence = "characteristic")

media_residence2 <- media_residence2 %>% 
  mutate(sex = if_else(name=="women_read_weekly","women","husband")) %>% 
  select(-c(name))

ggplot(media_residence2, aes(x=residence, y=read_weekly, group=sex))+
  geom_bar(stat="identity") +
  facet_wrap(~sex)
