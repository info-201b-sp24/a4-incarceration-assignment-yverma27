library(dplyr)
library(ggplot2)
library(scales)

dataset1 <- read.csv("us-jail-pop.csv")

updated_dataset1 <- na.omit(dataset1)




ggplot(updated_dataset1, aes(x = total_jail_pop, y = black_jail_pop, color = factor(year))) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
  labs(title = "Relationship Between Total Jail Population and Black Jail Population",
       x = "Total Jail Population",
       y = "Black Jail Population",
       color = "Year") +
  theme_minimal() +
  scale_color_viridis_d()