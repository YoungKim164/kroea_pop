#### Preamble ####
# Purpose: Generate table for survey data
# Prerequisites: Run install_dependencies.R and data_cleaning_survey.R before to get required packages and clean dataset.
#                You must download data from KOSIS. Read read.me
# Author: Youngho Kim

#retrieve and name each data set
work_satis <- read_csv(here::here("inputs/data/cleaned/work_satis.csv"))
trust_in_society <- read_csv(here::here("inputs/data/cleaned/trust_in_society.csv"))
life_satis <- read_csv(here::here("inputs/data/cleaned/life_satis.csv"))
achivement_satis <- read_csv(here::here("inputs/data/cleaned/achivement_satis.csv"))
stress <- read_csv(here::here("inputs/data/cleaned/stress.csv"))
self_health <- read_csv(here::here("inputs/data/cleaned/self_health.csv"))


#generate table

kable(stress,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = T)

kable(work_satis,
      linesep = "", digits = 1,  booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = T)

kable(self_health,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = T)

kable(life_satis,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = T)

kable(achivement_satis,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = T)

kable(trust_in_society,
      linesep = "", digits = 1, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)%>%
  kable_styling(full_width = T)

