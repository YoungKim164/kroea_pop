# kroea_pop



# Happiness and Altruism in the United States

This repository contains all of the files necessary to replicate the research paper the KOSIS, KOrean Statistical Information Service. The aim of this research is to find affect of population decline have in social perception of young adult. 

> **Note**<br>
> The research paper is available [here](https://github.com/YoungKim164/kroea_pop/blob/5decef87664269afc66b3bf6a56cd5747c3f59cf/outputs/paper/paper.pdf).

## Getting Started

### Requirements

This project requires both the [R programming language](https://www.r-project.org/) and [Quarto](https://quarto.org/docs/get-started/). If you do not have these tools, it is required to install them to replicate this research. You will also need an integrated development environment (IDE) capable of running R scripts. Recommendation for IDE for this research are [RStudio](https://posit.co/products/open-source/rstudio/) (local) or [Posit Cloud](https://posit.cloud/) (cloud-based).

Once your environment is set up, you must install several packages to perform various tasks in this research, like graphing data, creating tables, and general data processing. All required packages are located in the file `scripts/install_dependencies.r`.

### Download the data
> **Note**<br>
> A general guide to use KOSIS database is available [here](https://kosis.kr/eng/aboutKosis/kosisGuide.do).

The first step in this research is to download following data sets from the [KOSIS database](https://kosis.kr/eng/statisticsList/statisticsListIndex.do?menuId=M_01_01&vwcd=MT_ETITLE&parmTabId=M_01_01#content-group).

* Summary of Census Population(by administrative districtsexage) 1960-2010
* Population, Households and Housing Units 2015-2020
* Degree_of_Stress__General_Life__13_years_old_and_over
* Level_of_Satisfaction_on_Work_Conditions__Efforts_to_prevent_Violence__13_years_old_and_over
* Satisfaction_with_Achievement__19_years_old_and_over
* Satisfaction_with_Life__13_years_old_and_over
* Selfassessment_of_Health__13_years_old_and_over
* Trust_in_Korean_Society__13_years_old_and_over


Once you access to the data from KOSIS, download data sets as `.csv` files and place in `inputs/data/raw`.

### Clean the data

The data sets will have unessacery information that is out of scope for this research. You need to run `scripts/data_cleaning_pop.r` and `scripts/data_cleaning_survey.r`to clean the data. This data cleaning process includes fixing column names, selecting the appropriate columns, and filtering any rows that contain null data or out of scope data. 

These files will create cleaned data on `inputs/data/cleaned/` as `.csv` files. At the end of this process, you should have following files:
* `achivement_satis.csv`
* `life_satis.csv`
* `self_health.csv`
* `stress.csv`
* `total_pop.csv`
* `trust_in_society.csv`
* `work_satis.csv`

### Analyze the data

The main data analysis of this project is in `outputs/paper/paper.qmd` file. Quarto will generate a `paper.pdf` from this file file in the same directory. The references used in `paper.qmd` are available in `outputs/paper/references.bib` file.

## Debugging

### Test the data

If you find trouble with data, there is a test script to test the data. data types, number ranges, and data ranges. This testing script can be found in `scripts/data_testing.r`. The file contains a number of tests to run on the all raw `.csv` data files. 

All of these tests should return true for all value if downloaded data has no problem. 

### Simulate the data

There is also a simulation script you can used to debug without testing. The `scripts/data_simulation.r` file generates random, fake data based on the information initially downloaded from KOSIS.

## Acknowledgments

Created by Youngho Kim © 2023, licensed under the [BSD 3-Clause License](https://github.com/YoungKim164/kroea_pop/blob/main/LICENSE). Contains information from [KOSIS](https://kosis.kr/eng/aboutKosis/Introduction.do). Created using [R](https://www.r-project.org/), an open-source statistical programming language.

This project uses a number of R packages, including:
[readxl](https://CRAN.R-project.org/package=readxl), [here](https://cran.r-project.org/web/packages/here/index.html), [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html). [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html), [janitor](https://cran.r-project.org/web/packages/janitor/index.html), [knitr](https://cran.r-project.org/web/packages/knitr/index.html), [kableExtra](https://CRAN.R-project.org/package=kableExtra), [patchwork](https://CRAN.R-project.org/package=patchwork), [scales](https://cran.r-project.org/web/packages/scales/index.html),
[ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html)