#### Preamble ####
# Purpose: Testing Data from the KOSIS
# Prerequisites: Need to download and data from KOSIS, read read.me
# Author: Youngho Kim

#### Workspace set-up ####
library(tidyverse)
library(janitor)
library(here)
library(readr)

#### Test the 2015-2020 census data #### 
# retrieve data
popdata1 <- readr::read_csv(here::here("inputs/data/raw/Population, Households and Housing Units 2015-2020.csv"), show_col_types = FALSE)

# Test that the number of people in each column is more than 0
popdata1[ , grepl( "Year" , names( popdata1 ) ) ]  >0

# Test that the Unit of data matches with target of data
unique(popdata1$UNIT) == c("Person", "households", "Housing")


#### Test the 1960-2005 census data #### 
# retrieve data
popdata2 <- readr::read_csv(here::here("inputs/data/raw/Summary of Census Population(by administrative districtsexage) 1960-2010.csv"), show_col_types = FALSE)

# Test that the number of people in each column is more than 0
popdata2[ , grepl( "Year" , names( popdata2 ) ) ]  >0

# Test that the Unit of data matches with target of data
unique(popdata2$UNIT) == "Person"


#### Test the degree of stress data #### 
# retrieve data
stress <- readr::read_csv(here::here("inputs/data/raw/Degree_of_Stress__General_Life__13_years_old_and_over__20230419030139.csv"), show_col_types = FALSE)

stress<-stress %>%
  row_to_names(row_number = 1)

# Test that the number of people in each column more than 0

stress[,5:8] > 0

# Test that data is collected from whole country
stress[,1] == "Whole country"


#### Test the work satisfaction data #### 
# retrieve data
work <- readr::read_csv(here::here("inputs/data/raw/Level_of_Satisfaction_on_Work_Conditions__Efforts_to_prevent_Violence__13_years_old_and_over__20230419025955.csv"), show_col_types = FALSE)

work<-work %>%
  row_to_names(row_number = 1)

# Test that the number of people in each column more than 0

work[,5:10] > 0

# Test that data is collected from whole country
work[,1] == "Whole country"



#### Test achievement satisfaction data #### 
# retrieve data
achieve <- readr::read_csv(here::here("inputs/data/raw/Satisfaction_with_Achievement__19_years_old_and_over__20230419030224.csv"), show_col_types = FALSE)

achieve<-achieve %>%
  row_to_names(row_number = 1)

# Test that the number of people in each column more than 0

achieve[,5:9] > 0

# Test that data is collected from whole country
achieve[,1] == "Whole country"


#### Test life satisfaction data #### 
# retrieve data
life <- readr::read_csv(here::here("inputs/data/raw/Satisfaction_with_Life__13_years_old_and_over__20230419030238.csv"), show_col_types = FALSE)

life<-life %>%
  row_to_names(row_number = 1)

# Test that the number of people in each column more than 0

life[,5:9] > 0

# Test that data is collected from whole country
life[,1] == "Whole country"


#### Test health assessment data #### 
# retrieve data
health <- readr::read_csv(here::here("inputs/data/raw/Selfassessment_of_Health__13_years_old_and_over__20230419030115.csv"), show_col_types = FALSE)

health<-health %>%
  row_to_names(row_number = 1)

# Test that the number of people in each column more than 0

health[,5:9] > 0

# Test that data is collected from whole country
health[,1] == "Whole country"


#### Test society trust data #### 
# retrieve data
trust <- readr::read_csv(here::here("inputs/data/raw/Trust_in_Korean_Society__13_years_old_and_over__20230419030252.csv"), show_col_types = FALSE)

trust<-trust %>%
  row_to_names(row_number = 1)

# Test that the number of people in each column more than 0

trust[,5:8] > 0

# Test that data is collected from whole country
trust[,1] == "Whole country"