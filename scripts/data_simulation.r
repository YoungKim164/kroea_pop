### Preamble ####
# Purpose: Read in data from the KOSIS
# Prerequisites: Need to know where to get KOSIS data, read read.me
# Author:Youngho Kim


#### Workspace set-up ####
library(tidyverse) # A collection of data-related packages
library(janitor) # Helps clean datasets
set.seed(3825968) # Set the seed for consistent randomness

simulated_raw_data <-
  tibble(
    # Configure for Very satisfied numbered 1-10
    "Very satisfied" = sample(
      x = c(1:10),
      size = 10000,
      replace = TRUE
    ),
    # Configure for Moderately satisfied responses 1-30
    "Moderately satisfied" = sample(
      x = c(1:30),
      size = 10000,
      replace = TRUE
    ),
    # Configure for Neither satisfied nor dissatisfied giving responses 1-40
    "Neither satisfied nor dissatisfied" = sample(
      x = c(1:40),
      size = 10000,
      replace = TRUE
    ),
    # Configure for Moderately dissatisfied 1-30
    "Moderately dissatisfied" = sample(
      x = c(1:30),
      size = 10000,
      replace = TRUE
    ),
    # Configure for Very dissatisfied  1-10
    "Very dissatisfied" = sample(
      x = c(1:10),
      size = 10000,
      replace = TRUE
    ),
    # Configure for Dont Know dissatisfied 1-10
    "Dont Know" = sample(
      x = c(1:10),
      size = 10000,
      replace = TRUE
    ),
  )

simulated_raw_data
