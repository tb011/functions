  ################################################
  # Bonus material: apply, lapply, sapply, split #
  ################################################
  
  # The apply family are a powerful class of functions that allow you to apply 
  # a function to a data structure. 
  
  # These are much simpler to write than a for loop in R! 
  # For loop example: for (i in 1:10) {print (i)}
  
  # Let's stick with our Liempe data for now
  liempe_data <- read.csv("liempe-climate-data.csv")
  
  #########
  # apply #
  #########
  
  # Let's see how the apply function works.  
  ?apply 
  
  # It looks like minimally we would need:
  # 1) Our data frame
  # 2) the margins: 1 = rows, 2 = columns 
  # 3) The function we'd like to apply to the dataset
  
  # Let's say we wanted to apply the sum function to the temperature and 
  # rainfall columns
  tmp_rain <- liempe_data[,c(3,4)]
  apply(tmp_rain, 2, sum)
  
  # Woohoo! Just like that we summed all 
  
  # Let's check it:
   sum(tmp_rain$tmp)
   sum(tmp_rain$rainfall)
   colSums(tmp_rain)   
       
  # Yes using colSums, looks like a much easier in this instance, especially 
  # since we are using numerical data for now. But imagine what functions you
  # could write and apply over categorical data or even character strings! 
  
  # Question: what do you think apply(tmp_rain, 1, mean) does?
  # Question: What other function do you think will return the same result? 

  ############################
  # split, lapply and sapply # 
  ############################
  
  # Let's see how we can split the Liempe dataset by Month
  liempe_month <- split(liempe_data, liempe_data$Month)
  
  # How about splitting it into months and years?
  liempe_year_month <- split(liempe_data, list(liempe_data$Month,liempe_data$Year))
  # We've managed to create a rather long list! With each element of the list 
  # containing one observation.
  
  # Let's see how we could go about calculating the mean rainfall 
  # for each month (for all years)
  
  # Here we can use something called an 'anonymous function' which means the
  # function doesn't have a name and we define the function in the same line of 
  # code. 
  
  # lapply returns output of function a list (remove NAs, T = TRUE)
  lapply(liempe_month, function(x) mean(x[,"rainfall"], na.rm=T))
  
  # How about if we would like to see a more console-user-friendly output, as
  # a vector or a matrix? 
  sapply(liempe_month, function(x) mean(x[,"rainfall"], na.rm=T))
  
  # If we wanted to be fancy we could even calculate the temperature AND rainfall 
  # at the same time, by applying the colMeans function to the dataset.
  # Investigate the function to see what it does exactly
 
  lapply(liempe_month, function(x) colMeans(x[,c("tmp","rainfall")], na.rm=T))
  sapply(liempe_month, function(x) colMeans(x[,c("tmp","rainfall")], na.rm=T))
  
  # Question: Could you compute the total amount of rainfall for each month 
  # over all years?

  # Bonus Question: How would you save the output in a matrix form AND store it 
  # as an object? 
  
  