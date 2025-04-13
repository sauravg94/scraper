# scrape_data.R

library(rvest)
library(tibble)
library(dplyr)
library(readr)

# Example: Scrape titles from rvest page
url <- "https://rvest.tidyverse.org/articles/starwars.html"
page <- read_html(url)
titles <- page %>% html_nodes("h2") %>% html_text()

data <- tibble(title = titles)

# Create timestamped filename
timestamp <- format(Sys.time(), "%Y-%m-%d_%H-%M-%S")
filename <- paste0("output_", timestamp, ".csv")

# Save CSV
write_csv(data,filename)
