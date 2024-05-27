library(dplyr)
library(ggplot2)

dataset1 <- read.csv("us-jail-pop.csv")

updated_dataset1 <- na.omit(dataset1)

new_data <- updated_dataset1 %>% 
  select("state", "county_name", "aapi_jail_pop")

ca_pop <- new_data %>% 
  filter(grepl("CA", state))

max_aapi_jail_pop <- ca_pop %>% 
  group_by(county_name) %>% 
  summarize(max_pop = max(aapi_jail_pop))

updated_data <- max_aapi_jail_pop %>% 
  mutate(county = tolower(county_name)) %>% 
  mutate(county_official = gsub(" county", "", county))

ca_shape <- map_data('county', 'california')

state_shape <- ca_shape %>% 
  left_join(updated_data, by = c("subregion" = "county_official"))

ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = max_pop),
    color = "white",
    linewidth = .1
  ) +
  coord_map() +
  scale_fill_continuous(low = "lightblue", high = "darkblue", na.value = "white")+
  labs(fill = "AAPI Jail Population",
       title = "Distribution of AAPI Jail Population in California Counties")+
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())



