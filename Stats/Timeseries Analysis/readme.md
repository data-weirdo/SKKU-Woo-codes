# Timeseries Analysis  

## TS_Code1  
- Just the remind of basic simple linear regression  

## TS_Code2 ~ TS_Code4  
- Simple TS model just considering 'trend' and 'seasonality' to make stationary error  

  ```  
  Summary  
  1. Want to remove trend?  
    - Polynomial Regression  
    - Moving Average (15, Spencer's, Exponential, ...)  
    - Differencing  
    
  2. Want to remove seasonality?  
    - Harmonic Regression  
    - Seasonal Averaging  
    - Differencing  
    
  3. Want to remove both?  
    - Polynomial Reg + Harmonic Reg  
    - Classical Decomposition  
    - Differencing (Caution: Involves one order trend removal automatically)  
  ```  
  - As all the examples in code2 and code3 show the 'dependence structure',  
    need to consider other models like AR, MA, ARMA, ARIMA, SARIMA etc...  
    
- Test of Randomness  

## TS_Code5  
- ARMA Model need 4 good properties: stationary, causal, invertibility, identifiability  
- Theoretical ACF / PACF  

## TS_Code6  
- Order Selection of ARMA(p,q) model  

  ```  
  Summary  
  - There might be a lot of methods to estimate the order of ARMA model.  
    : 1. See plots and Select
      2. Use information Criteria
      3. Out-of=sample forcasting error 
      4. Adaptive Lasso for AR model  
      ...  
      
    1. See plots and Select
      - Plot the ACF / PACF of raw data  
      -> Choose a lot of possible selection that seems reasonable  
      -> fit the arma model  
      -> test (diagnostics)
      -> Choose the most plausible model among models that looks reasonable in several tests. 
      
      functions to consider) arima, tsdiag(fitted_model), resid(fitted_model), test
      
    2. Use information Criteria  
      - AIC / BIC / AICC(Improved version of AIC which can consinder the dependent structure in TS)  
      
      functions to consider) auto.arima
      
    3. Out-of-sample forcasting error   
   
    ...  
    ```  
- Of course, on the same order of ARMA(p,q), the result can be different among 1, 2, 3  
 
- 'test' involves a lot of things: iid? normal? even coeffs=0 or not  
- Do the `FORECAST`  
