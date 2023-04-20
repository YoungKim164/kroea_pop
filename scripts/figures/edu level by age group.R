data2 <- data
#data2$primary_complete <- as.numeric(data2$primary_complete)*2
#data2$secondary_incomplete <- as.numeric(data2$secondary_incomplete)*3
#data2$secondary_complete <- as.numeric(data2$secondary_complete)*4
#data2$edu_level <- as.numeric(data2$primary_incomplete) + data2$primary_complete + data2$secondary_incomplete + data2$secondary_complete
data2$edu_level <- as.numeric(data2$secondary_incomplete) + as.numeric(data2$secondary_complete)


age_data<- data2 %>% 
  select(gender, characteristic, edu_level)

age_data <- age_data %>% 
  subset(characteristic != "Urban") %>%
  subset(characteristic != "Rural") %>% 
  subset(characteristic != "15-24")

  


ggplot(age_data, aes(x=characteristic, y=edu_level, group=gender))+
  geom_line(aes(color=gender))+
  geom_point(aes(color=gender))
