
# Load Necessary Library
library(readxl)

# Load the Dataset
data <- read_excel("50startups.xlsx")

# Build the full multiple linear regression model
fullmodel <- lm(PROFIT ~ RND + ADMIN + MKT, data=data)

# Summarize full model to view the results
summary(fullmodel)

# Reduced model using only the significant variables (RND & MKT)
reducedmodel <- lm(PROFIT ~ RND+MKT, data = data)

# Summarize reduced model to view the results
summary(reducedmodel)


#Check  Linearity 

# Plot residuals vs. fitted values to check linearity
plot(reducedmodel$fitted.values, residuals(reducedmodel),
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals",
     pch = 20, col = "blue")
abline(h = 0, col = "red")

# Check Independece of Residuals
# Durbin-Watson test for independence
library(lmtest)
dwtest(reducedmodel)

# Check Homoscedasticity
# Breusch-Pagan test for homoscedasticity
library(lmtest)
bptest(reducedmodel)

# Plot Scale-Location (Residuals vs. Square Root of Fitted Values)
plot(reducedmodel, which = 3)


# Check Normality of Residuals
# Q-Q plot
qqnorm(residuals(reducedmodel))
qqline(residuals(reducedmodel), col = "red")

# Shapiro-Wilk test for normality
shapiro.test(residuals(reducedmodel))


# Check For Multicollinearity
# Variance Inflation Factor (VIF)
library(car)
vif(reducedmodel)





