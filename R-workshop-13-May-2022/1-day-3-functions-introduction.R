  # Day 3 - Functions 
  # R Training Course
  # Tineka Blake
  
  # Before we start playing around with functions...
  # Tip! Use CTRL + ENT to execute an expression in the R Studio environment 
  
  # Let's make sure that we have a clean environment
  # See that broomstick in the top right under the 'Environment' tab? 
  # That cleans up any existing variables you may have lurking around
  # Alternatively you can type: 
  rm(list = ls())
  # (On a windows machine ALT + S, C works swimmingly also...)
  
  # Now let's work out where we are in our file system
  # wd = working directory
  # So let's 'get' our wd! 
  getwd()
  
  # Now let's navigate to our dataset by setting our 'wd'
  # setwd("C:/write/your/file/path/here")
  # You can use the TAB button to explore your file system in the terminal below
  
  # Let's see what files currently exist in this directory
  list.files()
  
  # The Liempe climate data looks interesting - let's read it in
  # Did you remember the command from your first day's training? 
  
  liempe_data <- read.csv("liempe-climate-data.csv")
  
  # Did you know you can auto-complete and navigate through previous commands?
  # 1. Type in 'lie' now press tab! 
  # 2. Try pressing the up arrow in the console
  # 3. Now type mean + CTRL + arrow up
  
  # Let's have a little sneak peak of our dataset 
  # 1. Click on the dataset within your 'Global Environment' 
  # 2. Let's gather some more information using 'str' (also from day 1)  
  str(liempe_data)
  
  # Question: What type of data structure is your dataset? 
  # Question: How many variables are there? 
  # Question: How can we take a sneak peak at the first 6 rows of the dataset? 
  # Hint! Try using terminal only - clicking around a lot, can slow us down!
  
  ##########################
  # 1.1. Common functions  #
  ##########################
  
  # Let's explore common functions that we use all the time 
  # (Perhaps without thinking of them as 'functions'!)
  
  # Question: How many functions we have used already?
  # Question: What are they? 
  # How can we find out more information about these functions? 
  ?rm
  help(rm)
  ??rm
  # Question: So what's the difference between single or double question/mark? 
  # Hint: Let's Duck Duck Go / Google it! 
  
  # Hmmm we can see that the sum function belongs to {base}
  # But what is 'base', otherwise known as 'base R'?
  
  # Question: where does 'str' come from? 
  # Let's look into these packages and see what packages we have currently loaded 
  # into our system 
  library()
  
  # As we can see, there are packages that come along with R/R studio and there
  # are packages that we can install ourselves. We can find them all together. 
  
  # Now, let let's work some magical functions on our dataset! 
  # Let's start by investigating the data 
  # These are all functions that input a variable (dataset) and return something
  
  head(liempe_data)
  dim(liempe_data)
  table(liempe_data$Year)
  table(liempe_data$Month) 
  summary(liempe_data)
  
  # Let's confirm these things are actually functions! 
  # Let's look at the code
  head
  table
  sum
  summary
  
  # Let's start with a function that we may be most familiar with, "sum" 
  sum(liempe_data$rainfall)
  # But what useful information does this tell us? ... 
  
  ## Subsetting 
  
  # Perhaps we should subset our data to make this function a bit more valuable?
  march <- subset(liempe_data, Month == "March")
  sum(march$rainfall)
  
  # Question: How would you create a variable that subsets the Liempe dataset
  # only for the year of 2004? 
  
  # Bonus Question: How would you create a variable that subsets the Liempe 
  # dataset, where the temperature is over 21.5? 
  
  # How about we go all out and try a new function, which can provide us
  # with a lot more information with less steps? 
  # aggregate(), what is this function? Let's explore it's parameters/arguments
  ?aggregate
  
  # Sounds like three main things are needed: 
  
  # 1. An R object 
  # 2. A list of grouping elements (aggregate group) - don't be scared of lists!
  # 3. The function we would like to apply to the aggregate group 
  
  # Let's have a go: 
  
  # 1. liempe_data, rainfall 
  liempe_data$rainfall
  
  # 2. Let's aggregate by month (we need to create a list for this)
  list(liempe_data$Month)
  
  # we can check the 'unique entries' by using yet another function... 
  list(unique(liempe_data$Month))
  
  # 3. What function would we like to use here? Sum! 
  # FUN = sum
  # (let's not run line 130 else it will get saved into the Global Environment)
  
  aggregate(liempe_data$rainfall, list(liempe_data$Month), FUN=sum) 
  
  # Did we get the same value for our previous computation on March? 
  # Let's put our aggregate function output into a variable, remember we only 
  # saved it to the console
  
  agg <- aggregate(liempe_data$rainfall, list(liempe_data$Month), FUN=sum) 
  sum(march$rainfall) == agg$x[agg$Group.1 == "March"]
  
  ##########################
  # 1.2 Function arguments #
  ##########################
  
  # How to know what a function expects from us?
  
  ## Try Rstudio first
  # 1. '?(function-name)'
  # This Help shows us in order of importance - you will start to know the 
  # difference between mandatory and optional 
  # 2. Type function name + "hover" + f1 
  # 3. Continue to type until open bracket (to see a sneak preview)
  # 4. args(function-name) for a short printed overview
  
  ## Go online 
  # rdocumentation.org
  # tutorials / blogs
  # stackoverflow (to find a working example) 
  
  # Let's explore a few functions arguments! 
  
  # 1. sd
  # Question: What are the two arguments for the 'sd' function? 
  # Question: What do you think na.rm = FALSE means? 
  
  
  # 2. table
  # The ellipsis / dot dot dot ("...")  means any number of arguments can be 
  # passed to this function
  # For this let's use a new dataset! 
  # Tip!: Type data() to see 
  ChickWeight
  chick <- ChickWeight[1:20,]
  chick[1,"weight"] <- NA
  table(chick$weight)
  
  # Hmm, where's our NA? 
  # Question: What do we need to do to include NAs in our table? 
  
  # 3. data.frame 
  # Question: What does the ellipsis mean in this function?
  # What datatypes can you input into this data? Let's have a look! 
  data.frame(letters)
  data.frame(1:26)
  data.frame (letters, 1:26)
  
  # Question: What are the numbers on the left hand side? 
  
  # How do we change these? Let's adjust the row.names argument! 
  data.frame(letters, 1:26, row.names = letters)
  
  our_frame <- data.frame(letters, 1:26, row.names = letters)
  our_frame <- data.frame(letters, 1:26, row.names = 1:26)
  
  # How do we check that our dataframe is now a dataframe?! 
  str(our_frame)
  is.data.frame(our_frame)
  
  # Let's tamper with one more argument, stringAsFactors 
  our_frame <- data.frame(letters, 1:26, 
                          row.names = letters,
                          stringsAsFactors = TRUE)
  str(our_frame)

  # Ctr+ L clears the console screen (Windows / Linux), cmd + alt + L (Mac) 
  
  #################################################
  # 1.3 Stacking functions / Function Composition #
  #################################################
  
  # Adding multiple functions together can be very powerful. 
  # N.B. We have used this concept, perhaps without realising!
  
  # Remember when we wanted to check the number of duplicated items in our list?
  list(unique(liempe_data$Month))
  # Let's break it down 
  liempe_data$Month
  unique(liempe_data$Month)
  list(unique(liempe_data$Month))

  # Even, how about the following? That's 3 functions stacked on top of each
  # other. Go you! 
  str(list(unique(liempe_data$Month)))
  
  # How about if we're being lazy and we want to check if there are any 
  # duplicated items in our list (no matter how small our list is - we can 
  # always save brain power, it scales when we're working with bigger datasets!)
  liempe_data[1:12,"Month"]
  duplicated(liempe_data[1:12,"Month"])
  sum(duplicated(liempe_data[1:12,"Month"]))
  
  # Now let's check if this function would work if we do have duplicates
  dups <- c(liempe_data[1:12,"Month"], "September")
  duplicated(dups)
  sum(duplicated(dups))
  rm(dups)
  # Of course it does! 
  
  # But do remember to routinely check your assumptions: is your code doing what 
  # think it is doing? Also be particularly scrupulous of code that comes from 
  # external packages/dependencies! 
  
  # Exercise: Can you play around with stacking some functions? 
  
  