library(dplyr)
library(ggplot2)
library(scales)

dataset1 <- read.csv("us-jail-pop.csv")

updated_dataset1 <- na.omit(dataset1)

# Create a scatter plot showing the relationship between total population and total jail population
ggplot(updated_dataset1, aes(x = total_pop, y = total_jail_pop)) +
  geom_point() +
  labs(title = "Relationship Between Total Population and Total Jail Population",
       x = "Total Population",
       y = "Total Jail Population") +
  theme_minimal()