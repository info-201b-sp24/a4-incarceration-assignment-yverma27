library(dplyr)
library(ggplot2)
library(tidyr)
library(stringr)

dataset1 <- read.csv("us-jail-pop.csv")

updated_dataset1 <- na.omit(dataset1)
