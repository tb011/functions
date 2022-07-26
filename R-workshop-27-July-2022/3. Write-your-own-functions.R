  ###########################################
  # 3. Functions - write your own functions #
  ###########################################
  
  # You've made it to the best bit - the part where you get to create! 
  # Before we jump straight in let's look at how a function is constructed. This 
  # will be key to get your functions up and running well! 
  
  # First up, let's add some colour to our code! 
  # I find it easier to mark the start and end of functions. 
  # Use the menu: Tools > Global Options > Code > Display > Rainbow parentheses
  # (Click apply)
  
  # Is it looking more colourful now?
  str(list(unique(liempe_data$Month)))
  
  # Let's take a look at the 'function-syntax.png' image in your folder
  
  ## 1. Name
  
  # Do not let this one fool you. A function name should be very descriptive 
  # of what it a particular function does. It is good practice use a verb 
  # (a "doing word") as functions DO things! Let's take a look at some examples: 
  
          # NON-VERB -> VERB
            
          # Examples: 
          # validation -> validate
          # likelihood_calculation -> calculate_likelihood or calc_liklihood
          # function_maximum -> maximise_function or maximise_func
  
  # Naming conventions: snake_case, camelCase, etc. 
  # Example style guide: https://style.tidyverse.org/functions.html
  # Tip: Take the 'Good' and 'Bad' examples light-heartedly! Just use it to 
  # improve on what you are currently doing :) 
  
  ## 2. Arguments
  
  # These are the input variables you would like to pass to the function. You 
  # can have no arguments or many.
  
        # A function with no arguments 
        function() 
          
        # A function with one argument, i.e. a dataframe, x
        function(x)
            
        # A function with two arguments, i.e. a dataframe, x and a list, y
        function(x, y)
    
            
  ## 3. Function Body
  
  # This is the set of instructions, or algorithm that you would like your 
  # function to execute. Today, we will also be creating functions that have
  # their start and end denoted by curly braces. 
          
  # Here's an abstract example: 
            
       calculate_sum_median <- function(x){
            y <- sum(x$column1, x$column2)
            z <- median(y)
          }
            
  ## 4. Return value 
  # The value that you'd like to return, is given by:
        
       return (z)
          
  # Always 'return' a value! Do not rely on the automatic function capability 
  # of R to return the last value.        
  
  # Et voila! Let's bring it altogether! You have everything you need to make 
  # your own function.

       calculate_sum_median <- function(x){
          y <- sum(x$column1, x$column2)
          z <- median(y)
          return(z)
        }
  
  # And then what...
  
  # We have to "invoke" or "call" the function
  
       calculate_sum_median(x)
  
  # Wonderful! Now shall we try those previous steps together on a subset of 
  # the Liempe data?
  
      liempe_data <- read.csv("liempe-climate-data.csv")
  
  # What are the set of instructions you would like to execute? 
  
       y <- sum(liempe_data$tmp, liempe_data$rainfall)
       z <- median(y) 
   
  ## BE SURE to remove these values from your global environment! 
 
  # Let's turn that into a function 
  # 1. Name 
  # (Function declaration and curly brackets)
  # 2. Function arguments 
  # 3. Function body 
  # 4. Return statement 
       
  # Remember our previous function? 
       
      calculate_sum_median <- function(x){
        y <- sum(x$column1, x$column2)
        z <- median(y)
        return(z)
      }
  
  # Let's use this same function and change it to facilitate our dataset below: 
      calculate_sum_median <- function(liempe_data){
        y <- sum(liempe_data$tmp, liempe_data$rainfall)
        z <- median(y)
        return(z)
      }
  
  # As with everything in R (programming), you can write the same thing in many
  # ways! How about we write same function subsetting the dataset using brackets?
      
      calculate_sum_median <- function(liempe_data) {
        y <- sum(liempe_data[, "tmp"], liempe_data[, "rainfall"])
        z <- median(y)
        return(z)
      }
  
  # Now, let's invoke the function:
    
      median_temp_rain <- calculate_sum_median(liempe_data)
  
  # We can also check this answer using a function we used before! 
      summary(y)

  # Tip!: Function indentation 

  #    This is how you can indent your function. Ctl + I (Windows)
  #    Check what Ctrl + Shift + A does
  #    Also try Shift tab to remove any indentation
  
      
  ############################
  # Write your own functions #
  ############################
  
  # Let's get started on creating your own custom functions. 
  # Let's partner up, for some pair programming - it's even more fun together!

  # Exercise 1: Create a one argument function
  
  # 1.1 How would you create a function that inputs the liempe dataframe,
  # calculates both the mean rainfall and the mean temperature for all 
  # observations, and then returns only the mean temperature?
  
  # 1.2 How would you then invoke/call the function and assign it to a variable? 
   
      
  # Exercise 2: Create a two argument function and return one variable
      
      # Example exercise 2: 
      
      squareAddition <- function(x, y){
        x_squared <- x^2
        y_squared <- y^2
        sum_of_squares <- x_squared + y_squared
        return(sum_of_squares)
      } 
      
      result_square <- squareAddition(5,7) 
  
  # 2.1 How would you create a function that inputs two arguments: the liempe
  # dataframe and a number (x);
      
  #  1. Calculates the mean temperature of the dataset 
  #  2. Squares the number (x)
  #  3. Adds the temperature mean and the squared number together
  #  4. Returns the value
      
  # 2.2 How would you then invoke/call the function and assign it to a variable?  

      
  # BONUS CONTENT / OPTIONAL EXERCISE! 
      
  # Exercise 3: Two argument function / return multiple variables 
      
      # Example exercise 3: 
      
      squareAdditionMultiple <- function(x, y){
        x_squared <- x^2
        y_squared <- y^2
        sum_of_squares <- x_squared + y_squared
        return(list(x_squared = x_squared, 
                    y_squared = y_squared,
                    sum_of_squares = sum_of_squares))
        } 
      
      
      result_square_all <- squareAdditionMultiple(5,7) 
      
      x_squared <- result_square_all$x_squared
      y_squared <- result_square_all$y_squared
      sum_of_squares <- result_square_all$sum_of_squares
    

    # 3.1 How would you create a function that takes two arguments; the liempe 
    # dataset and a year, then calculates the mean rainfall and the mean 
    # temperature for the given year, returning the year, mean rainfall and
    # mean temperature.
      
    # Tip! Perhaps you may like to subset the data first.
    # i.e. Remember the subset function: 
    # subset(liempe_data, Year == year_of_interest)
    
    # 3.2 How would you then invoke/call the function and assign it to a
    # variable?
    
    # 3.3 How would you access all three variables, the mean rainfall,
    # temperature and the year?  
    
    ####################
    
    # Great job!!! You are now a fully fledged creator of functions! Now I 
    # hope that you will go on to automate and create functions in your code,
    # especially for those computations that you repeatedly run. Start simple,
    # withwhat you learnt today and before you know it you'll become more 
    # confident to program in a 'functional' style! 
      
    
  