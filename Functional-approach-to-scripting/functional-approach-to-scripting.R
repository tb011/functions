# Functional approach to scripting
# Tineka Blake
# 15th July 2022 

# 1. Firstly, set your working directory setwd() to this source file location
# (Session > Set Working Directory > To Source File Location)

# STEP 1: 
# Determine your aim
# Aim: Load in csv file for analysis 

files <- list.files(pattern = ".csv")

# STEP 2: Write a function for ONE FILE
# How would I load in ONE file? 

file <- files[[1]]

loadDataset <- function(file){
  dataset <- read.csv(file)
  return(dataset)
}

# STEP 3: Call / invoke the function 
# Save that function output to a variable in the Global environment
my_data <- loadDataset(file)

# Try changing the number to see if it still loads?
file <- files[[2]]
my_data2 <- loadDataset(file)

file <- files[[3]]
my_data3 <- loadDataset(file)

# Great! 

# ------------------------------------------

# AIM: Load in and explore MULTIPLE datasets for analysis
# The 'lapply' approach 

# Lets start by clearing your Global environment

files <- list.files(pattern = ".csv")

loadDataset <- function(file){
  dataset <- read.csv(file)
  return(dataset)
}

all_datasets <- lapply(files, loadDataset)

# Let's take a look at this structure... 
# str(all_datasets)
# We can see of our our datasets have been imported into a list format

# Our list elements are looking a bit nameless, let's spruce them up a little
# So we know what we're dealing with...
names(all_datasets) <- files

# Once more, let's transport these to our Global Environment 
my_data1 <- all_datasets$one.csv
my_data2 <- all_datasets$two.csv
my_data3 <- all_datasets$three.csv

# -----------------------------------------

# Let's talk scoping rules ... 

# -----------------------------------------
# Multiple argument function 

files <- list.files(pattern = ".csv")
file <- files[[1]]

transformSquared <- function(file, x){
  dataset <- read.csv(file)
  transformed_dataset <- c(dataset, dataset)
  squared <- x^2
  return(list(transformed_dataset = transformed_dataset, squared = squared))
}

x <- 7

transformSquared(file, x)

# Multiple arguments in R are returned via a list! 
# How do you get these results to your global environment? 
# 1. Without superassignment arrow "<<-" 
# 2. Without envir = globalenv()

# -------------------------------
# Let's talk Scoping rules... 
#--------------------------------

all_results <- transformSquared(file, x)
transformed_dataset <- all_results$transformed_dataset
squared <- all_results$squared

# Here's a functional scripting approach that I use...

# STEP 1) Define functions (at the top of the file)
# Alt + O to collapse all functions 

# STEP 2) Write the script = a series of function calls! 

# Show export (SummaryStats, run-one-biomarker, test-SummaryStats)
