#install.packages("here")
#install.packages("rio")
install.packages("skimr")
library(here)
library(rio)
library(tidyverse)
library(janitor)
library(skimr)
here()

list.files(here("data"))

here("data", "Project_Reads_Scores.csv")

exam1 <- import(here("data", "exam1.csv"))
eclsk <- import(here("data", "ecls-k_samp.sav"))
fatality <- import(here("data", "Fatality.txt"))

hls <- import("https://github.com/datalorax/ncme_18/raw/master/data/pubschls.csv",  setclass = "tbl_df")

export(exam1, here("data", "exam1.sav"))
export(exam1, here("data", "exam1.txt"))
export(exam1, here("data", "exam1.dta"))


convert(here("data", "ecls-k_samp.sav"), 
        here("data", "ecls-k_samp.dta"))

reads <- import(here("data", "Project_Reads_Scores.csv"), setclass = "tbl_df")

reads <- import(here("data", "Project_Reads_Scores.csv")) %>% 
  as_tibble()


reads <- reads %>% 
  clean_names()

dim(reads)
skim(reads)

view(reads)

reads <- reads %>%
  filter(student_id != "All Students (Average)")


view(reads)
