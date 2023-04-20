#### Preamble ####
# Purpose: Clean survey data
# Prerequisites: Run install_dependencies.R before to get required packages. You must download data from KOSIS. Read read.me
# Author: Youngho Kim

#retrieve data
work_satis <- read_csv(here::here("inputs/data/raw/Level_of_Satisfaction_on_Work_Conditions__Efforts_to_prevent_Violence__13_years_old_and_over__20230419025955.csv"))
env_in_future <- read_csv(here::here("inputs/data/raw/Environment_in_the_future__As_Compared_with_5_Years_Ago__13_years_old_and_over__20230419030705.csv"))
sentiment_in_surr <- read_csv(here::here("inputs/data/raw/Sentiment_in_the_Present_Surrounding_Environment__Air__13_years_old_and_over__20230419030642.csv"))
class_aware <- read_csv(here::here("inputs/data/raw/Class_Awareness__19_years_old_and_over__20230419030546.csv"))
social_network <- read_csv(here::here("inputs/data/raw/Social_Networks__Interacts_with_others_a_day__13_years_and_over__20230419030345.csv"))
trust_in_society <- read_csv(here::here("inputs/data/raw/Trust_in_Korean_Society__13_years_old_and_over__20230419030252.csv"))
life_satis <- read_csv(here::here("inputs/data/raw/Satisfaction_with_Life__13_years_old_and_over__20230419030238.csv"))
achivement_satis <- read_csv(here::here("inputs/data/raw/Satisfaction_with_Achievement__19_years_old_and_over__20230419030224.csv"))
stress <- read_csv(here::here("inputs/data/raw/Degree_of_Stress__General_Life__13_years_old_and_over__20230419030139.csv"))
self_health <- read_csv(here::here("inputs/data/raw/Selfassessment_of_Health__13_years_old_and_over__20230419030115.csv"))

#cleaning data
work_satis <- work_satis %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

work_satis[1,1]<-"Work Satisfaction"

work_satis <- work_satis%>% 
  row_to_names(row_number = 1)

env_in_future <- env_in_future %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)") 

env_in_future[1,1] <- "Enviroment in Future"

env_in_future <- env_in_future %>% 
  row_to_names(row_number = 1)

sentiment_in_surr <- sentiment_in_surr %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

sentiment_in_surr[1,1] <- "Sentiment in Surrounding"

sentiment_in_surr<-sentiment_in_surr %>% 
  row_to_names(row_number = 1)

class_aware <- class_aware %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "19~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)", -"2021...6", -"2021...7", -"2021...9", -"2021...10", -"2021...12", -"2021...13")

class_aware[1,1]<-"Class Awareness"

class_aware<-class_aware %>% 
  row_to_names(row_number = 1)

social_network <- social_network %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

social_network[1,1] <- "Social Network"

social_network<-social_network %>% 
  row_to_names(row_number = 1)

trust_in_society <- trust_in_society %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

trust_in_society[1,1] <- "Trust in Society"

trust_in_society <- trust_in_society%>% 
  row_to_names(row_number = 1)

life_satis <- life_satis %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
         `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

life_satis[1,1] <- "Life Satisfaction"

life_satis <- life_satis %>% 
  row_to_names(row_number = 1)

achivement_satis <- achivement_satis %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "19~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

achivement_satis[1,1] <- "Achievement Satisfaction"

achivement_satis<-achivement_satis %>% 
  row_to_names(row_number = 1)

stress <- stress %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

stress[1,1] <- "Degree of Stress"

stress <- stress %>% 
  row_to_names(row_number = 1)

self_health <- self_health %>% 
  filter(`Type(2)` == "Total" | `Type(2)` == "20~29 years old" | `Type(2)` =="Type(2)" |
           `Type(2)` == "30~39 years old") %>% 
  select(-"By city & province(1)", -"Type(1)")

self_health[1,1] <- "Self Health Assessment"

self_health<-self_health %>% 
  row_to_names(row_number = 1)


#save 
write.csv(work_satis, "inputs/data/cleaned/work_satis.csv", row.names=FALSE)
write.csv(env_in_future, "inputs/data/cleaned/env_in_future.csv", row.names=FALSE)
write.csv(sentiment_in_surr, "inputs/data/cleaned/sentiment_in_surr.csv", row.names=FALSE)
write.csv(class_aware, "inputs/data/cleaned/class_aware.csv", row.names=FALSE)
write.csv(social_network, "inputs/data/cleaned/social_network.csv", row.names=FALSE)
write.csv(trust_in_society, "inputs/data/cleaned/trust_in_society.csv", row.names=FALSE)
write.csv(life_satis, "inputs/data/cleaned/life_satis.csv", row.names=FALSE)
write.csv(achivement_satis, "inputs/data/cleaned/achivement_satis.csv", row.names=FALSE)
write.csv(stress, "inputs/data/cleaned/stress.csv", row.names=FALSE)
write.csv(self_health, "inputs/data/cleaned/self_health.csv", row.names=FALSE)
