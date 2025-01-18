

# Load Necessary Library
# Note: run command: install.packages("readr") if not already satisfied
library(readr)

# Load the Dataset
data <- read_csv("50startup.csv")

# Build the full multiple linear regression model
fullmodel <- lm(PROFIT ~ RND + ADMIN + MKT, data=data)

# Summarize full model to view the results
summary(fullmodel)

# Reduced model using only the significant variable (RND)
reducedmodel <- lm(PROFIT ~ RND, data = data)

# Summarize reduced model to view the results
summary(reducedmodel)

# TESTS FOR ASSUMPTIONS OF LINEAR REGRESSION

#Test for  Linearity Linearity plot
plot(reducedmodel$fitted.values, residuals(reducedmodel),
     xlab = "Fitted Values", ylab = "Residuals",
     main = "Residuals vs Fitted")
abline(h = 0, col = "red")


# Test for  Independence of Residuals:  Durbin-Watson test
# Note: run command: install.packages("lmtest") if not already satisfied

library(lmtest)
dwtest(reducedmodel)


#Test for Homoscedasticity
# Scale-location plot
plot(reducedmodel, which = 3)







