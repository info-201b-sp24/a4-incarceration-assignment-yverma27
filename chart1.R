library(ggplot2)
library(dplyr)
library(scales)

dataset1 <- read.csv("us-jail-pop.csv")

updated_dataset1 <- na.omit(dataset1)

agg_data <- updated_dataset1 %>%
  group_by(year) %>%
  summarize(
    aapi_jail_pop_avg = mean(aapi_jail_pop),
    black_jail_pop_avg = mean(black_jail_pop),
    latinx_jail_pop_avg = mean(latinx_jail_pop),
    native_jail_pop_avg = mean(native_jail_pop),
    white_jail_pop_avg = mean(white_jail_pop),
    other_race_jail_pop_avg = mean(other_race_jail_pop)
  )

ggplot(agg_data, aes(x = year)) +
  geom_line(aes(y = aapi_jail_pop_avg, color = "AAPI")) +
  geom_line(aes(y = black_jail_pop_avg, color = "Black")) +
  geom_line(aes(y = latinx_jail_pop_avg, color = "Latinx")) +
  geom_line(aes(y = native_jail_pop_avg, color = "Native")) +
  geom_line(aes(y = white_jail_pop_avg, color = "White")) +
  geom_line(aes(y = other_race_jail_pop_avg, color = "Other")) +
  labs(title = "Average Jail Population Trends by Racial Group Over Time",
       x = "Year",
       y = "Average Jail Population",
       color = "Racial Group") +
  scale_color_manual(values = c("AAPI" = "blue", "Black" = "red", 
                                "Latinx" = "green", "Native" = "purple", 
                                "White" = "orange", "Other" = "gray")) +
  scale_y_continuous(breaks = seq(0, 120, by = 10)) +
  scale_x_continuous(breaks = seq(1990, 2018, by = 5)) +
  theme_minimal()
