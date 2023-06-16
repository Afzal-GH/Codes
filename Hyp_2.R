# Data
risk <- c(57, 22, 57, 68, 39, 41, 4, 23, 70, 19, 21, 64, 52, 53, 58, 61, 37, 63, 5, 57)
age <- c(85, 68, 82, 87, 71, 66, 59, 79, 86, 60, 59, 86, 88, 75, 74, 86, 70, 77, 61, 82)
blood_pressure <- c(182, 151, 178, 219, 189, 180, 126, 103, 182, 128, 151, 193, 134, 201, 199, 152, 160, 207, 129, 165)
smoker <- c(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0)

# Part (a) - Estimated regression equation
model_a <- lm(risk ~ age + blood_pressure)
summary(model_a)

# Part (b) - Estimated regression equation with additional variables
interaction_term <- age * blood_pressure
model_b <- lm(risk ~ age + blood_pressure + interaction_term + smoker)
summary(model_b)

# Part (c) - F-test
anova(model_a, model_b)
