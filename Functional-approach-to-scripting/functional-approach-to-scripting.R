# Functional approach to scripting
# Tineka Blake
# 15th July 2022 

# 1. Setwd to this source file location

# STEP 1: 
# Determine your aim
# Load in csv file for analysis 


# STEP 2: Write a function for ONE FILE
# How would I load in ONE file? 

files <- list.files(pattern = ".csv")
file <- files[[1]]

loadDataset <- function(file){
  dataset <- read.csv(file)
  return(dataset)
}

# Try changing the number to see if it still loads?
file <- files[[2]]
my_data2 <- loadDataset(file)

file <- files[[3]]
my_data3 <- loadDataset(file)

# STEP 3: Call / invoke the function 
# Save that function output to a variable 
my_data <- loadDataset(file)

# ------------------------------------------

# AIM: Load in and explore MULTIPLE datasets for analysis
# Lapply approach 

files <- list.files(pattern = ".csv")

loadDataset <- function(file){
  dataset <- read.csv(file)
  return(dataset)
}

all_datasets <- lapply(files, loadDataset)
names(all_datasets) <- files

my_data1 <- all_datasets$one.csv
my_data2 <- all_datasets$two.csv
my_data3 <- all_datasets$three.csv

# -----------------------------------------
# Multiple argument function 

transformSquared <- function(file, x){
  dataset <- read.csv(file)
  transformed_dataset <- c(dataset, dataset)
  squared <- x^2
  return(list(transformed_dataset = transformed_dataset, squared = squared))
}

x <- 7

transformSquared(file, x)

# How do you get these results to your global environment? 
# 1. Without superassignment arrow "<<-" 
# 2. Without envir = globalenv())

all_results <- transformSquared(file, x)
transformed_dataset <- all_results$transformed_dataset
squared <- all_results$squared

# My functional scripting approach

# 1) Define functions (at the top of the file)
# Alt + O to collapse all functions 

# 2) Write the script = a series of function calls! 

# Show export (SummaryStats, run-one-biomarker)





