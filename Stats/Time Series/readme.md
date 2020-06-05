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
    - Differencing (Caution: Involves one order trend removal automatically  
  ```  
  - As all the examples in code2 and code3 show the 'dependence structure',  
    need to consider other models like AR, MA, ARMA, ARIMA, SARIMA etc...  
    
- Test of Randomness  
