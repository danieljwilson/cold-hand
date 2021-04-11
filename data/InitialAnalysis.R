#Goal: Interactive Debt Map
#  Debt breakdowns by institution
#                  by major
# % debt repayment / years of repayment & defaults
library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)

# DEBT CHARTS
####-------------------
data <- read_csv("/Users/clairemorton/Documents/Datathon/Most-Recent-Cohorts-All-Data-Elements.csv")

# Variables we want:
# DEBT RELATED:
# DEBT_MDN -- median student loan debt
#   GRAD_DEBT_MDN -- for students who graduated
#   WDRAW_DEBT_MDN -- for students who withdrew
# LO_INC_DEBT_MDN -- 0-30,000
# MD_INC_DEBT_MDN -- 30,001-75,000
# HI_INC_DEBT_MDN -- 75001+
# DEP_DEBT_MDN -- dependent status
# IND_DEBT_MDN -- independent status
# PELL_DEBT_MDN -- have received a Pell grant
# NOPELL_DEBT_MDN -- have never received a Pell grant
# Probably don't need gender
# FIRSTGEN_DEBT_MDN
# NOTFIRSTGEN_DEBT_MDN

# OTHER:
# COSTT4_A -- Academic year cost of attendance ("tuition and fees, books 
#             and supplies, and living expenses for all full-time, 
#             first-time, degree/certificate-seeking undergraduates 
#             who receive Title IV aid.)
# COSTT4_P -- Above but program-year institutions

debt <- data %>%
  select (c(DEBT_MDN, GRAD_DEBT_MDN, WDRAW_DEBT_MDN, LO_INC_DEBT_MDN, MD_INC_DEBT_MDN,
            HI_INC_DEBT_MDN, DEP_DEBT_MDN, IND_DEBT_MDN, PELL_DEBT_MDN, NOPELL_DEBT_MDN,
            FIRSTGEN_DEBT_MDN, NOTFIRSTGEN_DEBT_MDN)) %>%
  mutate(across(where(is.character), ~na_if(., "PrivacySuppressed"))) %>%
  mutate_if(is.character,as.numeric)

# Boxplot all debt variables
ggplot(stack(debt), aes(x = ind, y = values)) +
  geom_boxplot()

debt_cost <- data %>%
  select (c(COSTT4_A, COSTT4_P, DEBT_MDN, GRAD_DEBT_MDN, WDRAW_DEBT_MDN, LO_INC_DEBT_MDN, MD_INC_DEBT_MDN,
            HI_INC_DEBT_MDN, DEP_DEBT_MDN, IND_DEBT_MDN, PELL_DEBT_MDN, NOPELL_DEBT_MDN,
            FIRSTGEN_DEBT_MDN, NOTFIRSTGEN_DEBT_MDN)) %>%
  mutate(across(where(is.character), ~na_if(., "PrivacySuppressed"))) %>%
  mutate_if(is.character,as.numeric) %>%
  mutate(quantile = ntile(COSTT4_A, 3))

# Debt is higher at institutions with higher tuition
ggplot(debt_cost, aes(x = quantile, y = DEBT_MDN, group = quantile)) +
  geom_boxplot()

# Comparing debt/

# Field of study data
field1416 <- read_csv("/Volumes/Claire External/Datathon/Raw Data Files/FieldOfStudyData1415_1516_PP.csv")
field1618 <- read_csv("/Volumes/Claire External/Datathon/Raw Data Files/FieldOfStudyData1617_1718_PP.csv")

# Variables we want:
# CREDLEV -- 1: Undergraduate Certificates or Diplomas, 2: Associate’s Degrees, 3: Bachelor’s Degrees, 
#            4: Post-Baccalaureate Certificates, 5: Master’s Degrees, 6: Doctoral Degrees
#            7: First Professional Degrees, 8: Graduate / Professional Certificates
# CIPCODE -- Code for degree at any level

# Group by degree type, graph debt:
field2 <- field1618 %>%
  mutate(across(where(is.character), ~na_if(., "PrivacySuppressed"))) %>%
  select(CREDLEV, DEBT_ALL_STGP_ANY_MDN) %>%
  mutate_if(is.character,as.numeric) %>%
  filter(!is.na(DEBT_ALL_STGP_ANY_MDN))

ggplot(field2, aes(x = CREDLEV, y = DEBT_ALL_STGP_ANY_MDN, group = CREDLEV)) +
  geom_boxplot()

# Group by field of study, graph debt:
field3 <- field1618 %>%
  mutate(across(where(is.character), ~na_if(., "PrivacySuppressed"))) %>%
  select(CIPCODE, DEBT_ALL_STGP_ANY_MDN) %>%
  mutate(FIRST2 = substr(CIPCODE, start = 1, stop = 2)) %>%
  mutate_if(is.character,as.numeric) %>%
  filter(!is.na(DEBT_ALL_STGP_ANY_MDN)) %>%
  group_by(FIRST2) %>%
  mutate(MEAN = mean(DEBT_ALL_STGP_ANY_MDN))

ggplot(field3, aes(x = FIRST2, y = DEBT_ALL_STGP_ANY_MDN, group = FIRST2)) +
  geom_boxplot()

# Splitting into stem and nonstem based on this: https://studyinthestates.dhs.gov/stem-opt-hub/additional-resources/eligible-cip-codes-for-the-stem-opt-extension
# STEM 2 digit codes are 14, 26, 27, 40
field4 <- field1618 %>%
  mutate(across(where(is.character), ~na_if(., "PrivacySuppressed"))) %>%
  select(CIPCODE, DEBT_ALL_STGP_ANY_MDN) %>%
  mutate(FIRST2 = substr(CIPCODE, start = 1, stop = 2)) %>%
  mutate_if(is.character,as.numeric) %>%
  mutate(STEM = ifelse(FIRST2 %in% c(14, 26, 27, 40), 1, 0)) %>%
  filter(!is.na(DEBT_ALL_STGP_ANY_MDN)) %>%
  group_by(STEM) %>%
  mutate(MEAN = mean(DEBT_ALL_STGP_ANY_MDN))

ggplot(field4, aes(x = STEM, y = DEBT_ALL_STGP_ANY_MDN, group = STEM)) +
  geom_boxplot()

# Make debt table for interactive use (user can input college name or field of study and they get median debt)
# 2-digit CIP codes to fields from: https://nces.ed.gov/ipeds/cipcode/searchresults.aspx?y=56&sw=1%2c2%2c3&ct=1&ca=1%2c2%2c5%2c3%2c4
conversion <- read_csv("/Users/clairemorton/Documents/Datathon/SearchResults.csv")
conversion <- conversion %>%
  select(c("Title", "CIP Code")) %>%
  mutate (CIPCODE = substr(conversion$"CIP Code", start = 3, stop = 4)) %>%
  mutate (CIPCODE = as.numeric(CIPCODE)) %>%
  select(-"CIP Code")

field5 <- field1618 %>%
  mutate(across(where(is.character), ~na_if(., "PrivacySuppressed"))) %>%
  select(INSTNM, CIPCODE, DEBT_ALL_STGP_ANY_MDN) %>%
  filter(!is.na(DEBT_ALL_STGP_ANY_MDN)) %>%
  mutate(FIRST2 = substr(CIPCODE, start = 1, stop = 2)) %>%
  mutate (CIPCODE = as.numeric(CIPCODE)) %>%
  mutate (DEBT_ALL_STGP_ANY_MDN = as.numeric(DEBT_ALL_STGP_ANY_MDN)) %>%
  mutate(FIRST2 = as.numeric(FIRST2)) %>%
  group_by(INSTNM,FIRST2) %>%
  mutate(MDN_DEBT = median(DEBT_ALL_STGP_ANY_MDN)) %>%
  select(-c(2:3)) %>%
  unique() %>%
  rename(CIPCODE = FIRST2)

merged <- merge(field5, conversion, by = "CIPCODE") %>%
  select(-CIPCODE) %>%
  spread(Title, MDN_DEBT) %>% 
  ungroup()



####---------
# REPAYMENT CHARTS
data9697 <- read_csv("/Volumes/Claire External/Datathon/Raw Data Files/MERGED1996_97_PP.csv")
data1819 <- read_csv("/Volumes/Claire External/Datathon/Raw Data Files/MERGED2018_19_PP.csv")

# Relevant variables:
# CDR3: 3-year default rate (from entering into loan repayment)
# DBRR: DBRR[YR]_[LOAN]_[GROUP]_[METRIC], loan FED or PP (parent plus), 
# From yearly:
# BBRR[YR]_[LOAN]_[GROUP]_[STATUS], loan can be FED or PP (parent plus)
# Graph percentage repayment by 



# Question:
# How do loan repayment rates vary over time -- is the student debt crisis getting worse?

# Which majors are best at paying off their debt (STEM school loan repayment vs. non-STEM school)






