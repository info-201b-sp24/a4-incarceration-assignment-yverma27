library(dplyr)

dataset <- read.csv("us-jail-pop.csv")

year <- 2018
filtered_data <- dataset %>% filter(year == year)

summary_stats <- filtered_data %>%
  summarise(
    total_counties = n_distinct(county_name), 
    min_black_jail_pop = min(black_jail_pop, na.rm = TRUE),
    max_black_jail_pop = max(black_jail_pop, na.rm = TRUE), 
    median_white_jail_pop = median(white_jail_pop, na.rm = TRUE), 
    total_jail_pop = sum(total_jail_pop, na.rm = TRUE), 
  )

summary_df <- as.data.frame(t(summary_stats))

colnames(summary_df) <- "Summary"

caption <- paste("Summary statistics for the year", year)

cat(caption, "\n\n")

print(summary_df)


