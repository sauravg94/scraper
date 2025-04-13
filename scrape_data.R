# R/scrape.R

library(rvest)
library(tidyverse)
library(lubridate)

url <- "https://rvest.tidyverse.org/articles/starwars.html"
page <- read_html(url)
titles <- page %>% html_nodes("#main h2") %>% html_text() %>% str_trim()

data <- tibble(title = titles)

# Timestamped file name
timestamp <- format(Sys.time(), "%Y-%m-%d_%H-%M-%S")
file_name <- paste0("output_", timestamp, ".csv")

# Ensure output dir exists
if (!dir.exists("output")) dir.create("output")

# Save
write_csv(data, file = file.path("output", file_name))
