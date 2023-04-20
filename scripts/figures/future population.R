#### Preamble ####
# Purpose: Apply model and generate figure for future prediction
# Prerequisites: Run install_dependencies.R and data_cleaning_pop.R before to get required packages and clean dataset.
#                You must download data from KOSIS. Read read.me
# Author: Youngho Kim

#retrieve data
total_pop <- read_csv(here::here("inputs/data/cleaned/total_pop.csv"))

#modify for model application
total_pop <- as.data.frame(t(total_pop)) %>%
  row_to_names(row_number = 1)

total_pop <- tibble::rownames_to_column(total_pop, "year")

total_pop <- total_pop %>% 
  mutate(year = as.integer(str_remove_all(year, " Year")),
         `Whole country` = as.integer(`Whole country`),
         Seoul = as.integer(Seoul)
  )

#calculate growth rate
growth_rate = total_pop %>%
  mutate(Diff_year = year - lag(year),  # Difference in time (just in case there are gaps)
         Diff_growth_whole = `Whole country` - lag(`Whole country`), # Difference in route between years
         Rate_percent_whole = (Diff_growth_whole / Diff_year)/`Whole country` * 100,
         Diff_growth_seoul = `Seoul` - lag(`Seoul`), # Difference in route between years
         Rate_percent_seoul = (Diff_growth_seoul / Diff_year)/`Seoul` * 100,
  ) # growth rate in percent

#generate linear model
whole_linear_model <- lm(Rate_percent_whole~year, data = growth_rate)
seoul_linear_model <- lm(Rate_percent_seoul~year, data = growth_rate)

#apply model to predict growth rate
years <- data.frame(year = c(2025,2030,2035,2040,2045,2050))
whole_predict_data <- as.data.frame(predict(whole_linear_model, newdata = years, interval = 'confidence')) %>% 
  mutate(years)
seoul_predict_data <- as.data.frame(predict(seoul_linear_model, newdata = years, interval = 'confidence')) %>% 
  mutate(years)


#apply predicted growth rate
fit_pop=c(growth_rate[18,2])
for (val in 1:6){
  fit_pop <- append(fit_pop, fit_pop[val]+(fit_pop[val]*whole_predict_data[val,1]/20))
}


lwr_pop=c(growth_rate[18,2])
for (val in 1:6){
  lwr_pop <- append(lwr_pop, lwr_pop[val]+(lwr_pop[val]*whole_predict_data[val,2]/20))
}

upr_pop=c(growth_rate[18,2])
for (val in 1:6){
  upr_pop <- append(upr_pop, upr_pop[val]+(upr_pop[val]*whole_predict_data[val,3]/20))
}

#clean up the result
whole_predict_data <- whole_predict_data %>% 
  add_row(year=2021)

whole_predict_data <- whole_predict_data[order(whole_predict_data$year),]

rownames(whole_predict_data) = NULL

whole_predict_data <- whole_predict_data %>% 
  mutate(fit_pop,lwr_pop,upr_pop)


#apply predict for seoul
fit_pop=c(growth_rate[18,3])
for (val in 1:6){
  fit_pop <- append(fit_pop, fit_pop[val]+(fit_pop[val]*seoul_predict_data[val,1]/20))
}

lwr_pop=c(growth_rate[18,3])
for (val in 1:6){
  lwr_pop <- append(lwr_pop, lwr_pop[val]+(lwr_pop[val]*seoul_predict_data[val,2]/20))
}

upr_pop=c(growth_rate[18,3])
for (val in 1:6){
  upr_pop <- append(upr_pop, upr_pop[val]+(upr_pop[val]*seoul_predict_data[val,3]/20))
}

#clean up the result of seoul prediction
seoul_predict_data <- seoul_predict_data %>% 
  add_row(year=2021)

seoul_predict_data <- seoul_predict_data[order(seoul_predict_data$year),]

rownames(seoul_predict_data) = NULL

seoul_predict_data <- seoul_predict_data %>% 
  mutate(fit_pop,lwr_pop,upr_pop)


#drawing graphs
p1 <- ggplot(whole_predict_data, aes(year)) + 
  geom_line(aes(y = fit_pop, colour = "fit_pop")) +
  geom_point(aes(y = fit_pop, colour = "fit_pop"))+
  geom_line(aes(y = lwr_pop, colour = "lwr_pop")) +
  geom_point(aes(y = lwr_pop, colour = "lwr_pop"))+
  geom_line(aes(y = upr_pop, colour = "upr_pop")) +
  geom_point(aes(y = upr_pop, colour = "upr_pop"))+
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale()))+
  ggtitle("Whole country")+
  labs(y= "Population", x = "Year")+
  scale_colour_discrete(name = "Bound", labels = c("Fit", "Lower", "Upper"))


p2 <- ggplot(seoul_predict_data, aes(year)) + 
  geom_line(aes(y = fit_pop, colour = "fit_pop")) +
  geom_point(aes(y = fit_pop, colour = "fit_pop"))+
  geom_line(aes(y = lwr_pop, colour = "lwr_pop")) +
  geom_point(aes(y = lwr_pop, colour = "lwr_pop"))+
  geom_line(aes(y = upr_pop, colour = "upr_pop")) +
  geom_point(aes(y = upr_pop, colour = "upr_pop"))+
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale()))+
  ggtitle("Seoul")+
  labs(y= "Population", x = "Year")+
  scale_colour_discrete(name = "Bound", labels = c("Fit", "Lower", "Upper"))

# Display both charts side by side thanks to the patchwork package
p1 + p2
