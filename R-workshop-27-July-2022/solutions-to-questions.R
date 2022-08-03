  #################################################
  # Solutions to questions - R Functions Workshop #
  #################################################
  
  # N.B. There are many possible solutions to the questions posed throughout
  # the workshop
  
  ###################
  # 1. Introduction # 
  ###################
  
  # Question: What type of data structure is your dataset? 
    # Dataframe
  
  # Question: How many variables are there? 
    # Four (Month, Year, tmp, rainfall) 
    # Be aware there are two variables in 'Camel Case' the other two lowercase. 
  
  
  # Question: How many functions we have used already?
    # 8 
  
  # Question: What are they? 
    # rm, list, ls, getwd, list.files, read.csv, str
  
  # Question: Where does str() come from?  
    # utils package (pre-installed with R)
  
  # Question: How can we take a sneak peak at the first 6 rows of the dataset? 
     head(liempe)
  
  # Question: How would you create a variable that subsets the dataset only for
  # the year of 2004? 
     year_2004 <- subset(liempe_data, Year == 2004)
  
  # Bonus Question: How would you create a variable that subsets the data, where 
  # temperate is over 21.5? 
     tmp_over_21.5 <- subset(liempe_data, tmp > 21.5)
    # Be sure to check the minimum value
     summary(tmp_over_21.5)
     
  # Question: What are the two arguments for the standard deviation function? 
     # 'x' - numerical vector and 'na.rm'
     
  # Question: What do you think na.rm = FALSE means? 
     # 'na.rm = FALSE' means that is the default value. 
     # If you do not specify na.rm in your function call, i.e. 
     # 'sd(liempe_data$rainfall)' the default value = FALSE. 
     # Meaning that nas will not be removed. 
     # If you would like NAs to be removed type:
     # sd(liempe_data$rainfall, na.rm = TRUE)
     
     
  # Question: What does the ellipsis ('...') mean in this function?
     # That you can pass as many arguments as to the function as you like 
  
  # Question: What are the numbers on the left hand side? 
     # Our row names 
     
  # Question: What do we need to do to include NAs in our table? 
     table(chick$weight, useNA = "ifany")
     table(chick$weight, useNA = "always")
     
  
   ###############################
   # 2. Write your own functions #
   ###############################
   
     # Exercise 1: Create a one argument function
     
     # 1.1 How would you create a function that inputs our liempe dataframe,
     # calculates the mean rainfall and temperature for all observations, then
     # returns only the mean temperature?
     
     mean_temp <- function (liempe_data){
       y <- mean(liempe_data$tmp)
       g <- mean(liempe_data$rainfall)
       return(g)
     } 
     
     # 1.2 How would you then invoke/call the function and assign it to a variable? 
     
     result_mean_temp <- mean_temp(liempe_data)
     
     # Exercise 2: Create a two argument function 
     
     
     # 2.1 How would you create a function that inputs two arguments: the liempe
     # dataframe and a number (x);
     
     #  1. Calculates the mean tempurature of the dataset 
     #  2. Squares the number (x)
     #  3. Adds the temperature mean and the squared number together
     #  4. Returns the value
     
     tempMeanAddSquare <- function(liempe_data, x){
       tmp_mean <- mean(liempe_data$tmp)
       x_squared <- x^2 
       sum_input <- tmp_mean + x_squared
       return(sum_input)
     }
     
     # 2.2 How would you then invoke/call the function and assign it to a variable?  
     
     result_mean_square <- tempMeanAddSquare(liempe_data, 3)
     
     # 3.1 How would you create a function that takes two arguments; the liempe 
     # dataset and a year, then calculates the mean rainfall and the mean 
     # temperature for the given year, returning the year, mean rainfall and mean
     # temperature.
     
     meanStats <- function(liempe_data, year_of_interest){
       data <- subset(liempe_data, Year == year_of_interest)
       # or 
       # data <- liempe_data[liempe_data[,"Year"] == year_of_interest,]
       mean_rainfall <- mean(data$tmp) 
       mean_temp <- mean(data$rainfall)
       return(list(year_of_interest = year_of_interest, 
                   mean_rainfall = mean_rainfall,
                   mean_temp = mean_temp))
     } 
     
     # 3.2 How would you then invoke/call the function and assign it to a variable?
     
     result_mean_stats <- meanStats(liempe_data, year_of_interest = 1961)
     
     # 3.3 How would you access all three variables, the mean rainfall, temperature
     # and the year?  
     
     mean_rainful_1950 <- result_mean_stats$mean_rainfall
     mean_temp_1950 <- result_mean_stats$mean_temp
     year_of_interest <- result_mean_stats$year_of_interest
     
     
     