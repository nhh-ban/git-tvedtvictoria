# Problem 2
# -------------------------------------------
# Used "galaxy_skeleton2.R" to complete the problem


# Install / read necessary package
library(tidyverse)

# Read the entire data file into memory using the readlines()-function. Read
#the file using the local file that is in the repository

raw_file <- readLines(con = "suites_dw_Table1.txt")

# Identify the line number L of the separator line between the column names and
# the rest of the data table.

# 1) Extract the two first letters of each element. First letter = 1 and
#second letter = 2

substr(x = raw_file, start = 1, stop = 2)

# 2) Find out *which* line starts with "--", and pick out the first one.
L <- 
  (substr(x = raw_file, start = 1, stop = 2) == "--") %>% 
  which() %>% 
  min()

# Save the variable descriptions (i.e. the information in lines 1:(L-2)) in a
# text-file for future reference using the cat()-function.

cat(raw_file[1:(L-2)], sep = "\n", file = "variable_descriptions.txt")

# Extract the variable names (i.e. line (L-1)), store the names in a vector.

variable_names <- 
  str_split(string = raw_file[L-1], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

# Read the data

comma_separated_values <- 
  raw_file[(L+1):length(raw_file)] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)


# Add the variable names (separated with commas) on top, and use cat() to make
#the whole thing into a .csv file

comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)    

cat(comma_separated_values_with_names, sep = "\n", file = "output_file.csv")

# Read the file back in as a normal csv-file
galaxies <- read_csv("output_file.csv")

