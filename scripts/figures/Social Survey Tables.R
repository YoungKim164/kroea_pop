work_satis <- read_csv(here::here("inputs/data/cleaned/work_satis.csv"))
work_satis[1,1]<-"Work Satisfaction"
env_in_future <- read_csv(here::here("inputs/data/cleaned/env_in_future.csv"))
sentiment_in_surr <- read_csv(here::here("inputs/data/cleaned/sentiment_in_surr.csv"))
class_aware <- read_csv(here::here("inputs/data/cleaned/class_aware.csv"))
social_network <- read_csv(here::here("inputs/data/cleaned/social_network.csv"))
trust_in_society <- read_csv(here::here("inputs/data/cleaned/trust_in_society.csv"))
life_satis <- read_csv(here::here("inputs/data/cleaned/life_satis.csv"))
achivement_satis <- read_csv(here::here("inputs/data/cleaned/achivement_satis.csv"))
stress <- read_csv(here::here("inputs/data/cleaned/stress.csv"))
self_health <- read_csv(here::here("inputs/data/cleaned/self_health.csv"))



kable(work_satis,
      linesep = "", digits = 1,  booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(env_in_future,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(sentiment_in_surr,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(class_aware,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(social_network,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(trust_in_society,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(life_satis,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(achivement_satis,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(stress,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)

kable(self_health,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = F)
