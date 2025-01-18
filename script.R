#install.packages("readr")

# Load Necessary Library
library(readr)

# Load the Dataset
data <- read_csv("50startup.csv")

# Build the full multiple linear regression model
fullmodel <- lm(PROFIT ~ RND + ADMIN + MKT, data=data)

# Summarize full model to view the results
summary(fullmodel)
