# Load the necessary packages
library("readxl")

# Read in the data from the .xlsx file
TestData <- read_excel("C:/Users/lenovo/Documents/Data/TestData.xlsx")

# Check the normality of the data
shapiro.test(TestData$DeliveryTimes)
qqnorm(TestData$DeliveryTimes)
qqline(TestData$DeliveryTimes)

# Check the homogeneity of variances
bartlett.test(TestData$DeliveryTimes ~ TestData$Courier)

# Perform the ANOVA analysis
model <- aov(DeliveryTimes ~ Courier, data = TestData)
summary(model)

# Interpret the results
TukeyHSD(model)
