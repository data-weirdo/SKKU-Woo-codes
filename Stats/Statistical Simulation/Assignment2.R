# 1

pb1 <- function(gen){
  
  z <- vector('numeric', gen)
  
  for (i in 1:gen){
    x <- rexp(1, 2)
    y <- rexp(1, 3)
    
    z_element <- min(x,y)
    
    z[i] = z_element
  }

  return(z)
}


mc_values <- pb1(10)
sd(mc_values) # standard error of thete_hat


hist(mc_values) # This is absolutely not the symmetric one. 
ci_candidate <- seq(0.001, 0.049, by=0.001)
CI = NULL

for (i in ci_candidate){
  ci <- quantile(mc_values, probs = c(i, i+0.95))
  CI <- rbind(CI, ci)
}

len <- CI[,2] - CI[,1]
CI[which.min(CI[,2]-CI[,1]),]

  
#########################################################


# 2 

pb2 <- function(pop=1, num, gen){
  
  # pop: choose between Chi-square, Uniform, and Exponential
  # num: the number of samples to generate in each simulation
  # gen: the number of simulating numbers
  
  pop_mean <- 1
  mc_values <- vector('numeric', gen)

  for (i in 1:gen){
    # Chi-square Dist'n ~ chi(1)
    if (pop == 1) distn <- rchisq(num, 1)
    
    # Uniform Dist'n ~ Unif(0,2)  
    else if (pop == 2) distn <- runif(num, min=0, max=2)
    
    # Exponential Dist'n ~ Exp(1)    
    else distn <- rexp(num, 1)
    
    temp <- (mean(distn) - pop_mean)/(sd(distn)/sqrt(num))
    mc_values[i] <- ifelse(abs(temp) >= qt(0.975, num-1), 1, 0)
  }
  
  result <- mean(mc_values)
  
  return(result)
}

pb2(1, 10, 100)
pb2(1, 30, 100)
pb2(1, 50, 100)

pb2(2, 10, 100)
pb2(2, 30, 100)
pb2(2, 50, 100)


pb2(3, 10, 100)
pb2(3, 30, 100)
pb2(3, 50, 100)


################################################################

# 3

pb3 <- function(gen, beta1){
  
  # gen: the number of beta1 values to generate
  # beta1: assumed beta1 
  
  beta1_for_ols <- vector('numeric', gen)
  beta1_for_wls <- vector('numeric', gen)
  

  for (i in 1:gen){
    
    x <- runif(30, 1, 10)
    error_part <- 36 / x
    y <- vector('numeric', 30)
    
    for (j in 1:30){ 
      y[j] <- 2 + 3*x[j] + rnorm(1, mean=0, sd=sqrt(error_part[j]))
    }

    w <- (1 / x)^(-1) 
    
    lm.ols <- lm(y ~ 1 + x)
    lm.wls <- lm(y ~ 1 + x, weights=w)
    
    beta1_for_ols[i] <- lm.ols$coefficients[2]
    beta1_for_wls[i] <- lm.wls$coefficients[2]
    
  }  
  
  MSE_for_ols <- mean((beta1_for_ols - beta1)^2)
  MSE_for_wls <- mean((beta1_for_wls - beta1)^2)
  
  result <- data.frame(MSE_for_ols, MSE_for_wls)
  
  return(result)

}


result <- pb3(100, 3)
result