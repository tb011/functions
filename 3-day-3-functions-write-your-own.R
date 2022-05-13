  ###########################################
  # 3. Functions - write your own functions #
  ###########################################
  
  # You've made it to the best bit - the part where you get to create! 
  # Before we jump straight in let's look at how a function is constructed. This 
  # will be key to get your functions up and running well! 
  
  ## 1. A name 
  
  # Do not let this one fool you. A function name should be very descriptive 
  # of what it a particular function does. It is good practice use a verb 
  # (a "doing word") as functions DO things! Let's take a look at some examples: 
  
          # non-verb - > verb 
             
          # validation -> validate
          # likelihood_calculation -> calculate_likelihood or calc_liklihood
          # function_maximum -> maximise_function or maximise_func
  
  # Naming conventions: lowercase with underscore, camelCase 
  # Example style guide: https://style.tidyverse.org/functions.html
  

  
  ## 2. Arguments
  
  # These are the input variables you would like to pass to the function. You 
  # can have no arguments or many.
  # What do you want to put in? 
  
          # A function with no arguments 
          function() 
          
          # A function with one argument, i.e. a dataframe, x
          function (x)
            
          # A function with two arguments, i.e. a dataframe, x and a list, y
          function(x, y)
    
            
  ## 3. Function Body
  
  # This is the set of instructions, or algorithm that you would like your 
  # function  # to execute. Today, we will also be creating functions that have
  # their start and end denoted by curly braces:
            
       calculate_sum_mean <- function (x){
            y <- sum(x$column1, x$column2)
            z <- mean(c(1, y))
          }
            
  ## 4. Return value 
  # The value that you'd like to return 
        
        return (z)
          
  # Always 'return' a value! Do not rely on the automatic function capability 
  # of R to return the last value.        
  
  # Et voila! Let's bring it altogether! You have everything you need to make 
  # your own function.

       calculate_sum_mean <- function (x){
          y <- sum(x$column1, x$column2)
          z <- mean(c(1, y))
          return(z)
        }
  
  # And then what...
  
  # We have to "invoke" or "call" the function
  
       calculate_sum_mean(x)
  
  # Wonderful! Now shall we try those previous steps together on a subset of 
  # the Liempe data?
  
  liempe_data <- read.csv("liempe-climate-data.csv")
  
  # What are the set of instructions you would like to execute? 
  
   y <- sum(liempe_data$tmp, liempe_data$rainfall)
   z <- mean(c(1, y))
   
   ## BE SURE to remove these values from your global environment! 
  
   # Let's turn that into a function 
   # 1. Name 
   # (Function declaration and curly brackets)
   # 2. Function arguments 
   # 3. Function body 
   # 4. Return statement 
    
  # Here's the original code  
  calculate_sum_mean <- function (x){
    y <- sum(x$column1, x$column2)
    z <- mean(c(1, y))
    return(z)
  }
  
  # Let's copy and paste it and Change it to facilitate our dataset below: 
  calculate_sum_mean <- function (liempe_data){
        y <- sum(liempe_data$tmp, liempe_data$rainfall)
        z <- mean(c(1, y))
        return(z)
       }
  
  # ! The plus signs (+) mean that you are within your function! To exit, you 
  # must close the curly braces 
  
  # Now, let's invoke the function
    
  calculate_sum_mean(liempe_data)
  
  # Any questions?
  
  
  ########################
  # Function indentation #
  ########################
  
  ##    This is how you can indent your function. Ctl + I (Windows)
  ##    Check what Ctrl + Shift + A does
  ##    Also try Shift tab to remove any indentation. 
  ##    I also like adding colour to my code, I find it easier to mark the start 
  ##    and end of functions - especially when dealing with nested functions! 
  ##    Tools > Global Options > Code > Display > Rainbow parentheses 
  ##    (Click apply)

  ###########################
  # Write your own function #
  ###########################
  
  # Let's get started on creating your own custom functions! 
  # Let's partner up, for some pair programming - it's even more fun together!  
  
  # Exercise 1: Create a one argument function
  
  # 1.1 How would you create a function that inputs our liempe dataframe,
  # calculates the mean rainfall and temperature for all observations, then
  # returns only the mean temperature?
  
  # 1.2 How would you then invoke/call the function and assign it to a variable? 
  
  
  # Exercise 2: Create a two argument function 
  
  # 2.1 How would you create a function that inputs the liempe dataframe
  # and a vector of each unique year? Then calculate the mean temperature for 
  # all data points, finally, to return only the input vector?
  # (Hint: could you create the vector variable first?)
  
  # 2.2 How would you then invoke/call the function and assign it to a variable?  
  
  # 2.3 Does this make any sense?
  
  # Exercise 3: Two argument function / return two variables
  
  # 3.1 How would you create a function that inputs the liempe dataframe and the 
  # vector of each unique year, calculates the median year in the vector, then 
  # the median temperate from all observations, finally returning the value of 
  # the median year AND the median temperature? 
  # Hint: you may need to Google how to return multiple items from a function! 
  
  # 3.2 How would you then invoke/call the function and assign it to a variable?
  
  # 3.3 How would you access both variables?  
  
  ####################
  
  # Great job!!! You are now a fully fledged creator of functions! Now I hope 
  # that you will go on to automate and create functions in your code,
  # especially for those computations that you repeatedly run! Start simple with
  # what you learnt today and before you know it, you'll be coding in only 
  # functions!
  
  
  
  