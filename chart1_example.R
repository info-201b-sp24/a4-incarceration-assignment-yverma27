library(ggplot2)
library(dplyr)
library(stringr)

dataset <- read.csv("us-jail-pop.csv")
updated_dataset <- na.omit(dataset)


yearly_frequency <- updated_dataset %>%
  group_by(year) %>%
  summarize(frequency = n())

#data_viz <- ggplot(yearly_frequency, aes(x = release_year, y = frequency)) +
 # geom_line() +
  #geom_point() +
  #labs(title = "Amount of Content Released on Netflix Each Year",
   #    x = "Year",
    #   y = "Number of Content") +
  #theme_minimal() +
  #scale_x_continuous(breaks = seq(1932, 2024, by = 5))

#data_viz



x_values <- seq(1, 3)
y_values <- seq(1,3)

library(ggplot2)
ggplot() +
  geom_line(aes(x=x_values, y = y_values))
