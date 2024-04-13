library(survival)

placebo <- c(1, 1, 2, 2, 3, 4, 4, 5, 5, 8, 8, 8, 8, 11, 11, 12, 12, 17, 22, 23)
mp <- c(6, 6, 6, 7, 10, 13, 6, 22, 23, 6, 9, 10, 11, 17, 9, 20, 25, 32, 32, 34, 35)

weibull_fit <- survreg(Surv(placebo) ~ 1, data = data.frame(placebo), dist = "weibull")
lognormal_fit <- survreg(Surv(placebo) ~ 1, data = data.frame(placebo), dist = "lognormal")
loglogistic_fit <- survreg(Surv(placebo) ~ 1, data = data.frame(placebo), dist = "loglogistic")
exponential_fit <- survreg(Surv(placebo) ~ 1, data = data.frame(placebo), dist = "exponential")

weibull_loglikelihood <- -logLik(weibull_fit)
lognormal_loglikelihood <- -logLik(lognormal_fit)
loglogistic_loglikelihood <- -logLik(loglogistic_fit)
exponential_loglikelihood <- -logLik(exponential_fit)

chi_square_weibull_lognormal <- -2 * (weibull_loglikelihood - lognormal_loglikelihood)
chi_square_weibull_loglogistic <- -2 * (weibull_loglikelihood - loglogistic_loglikelihood)
chi_square_weibull_exponential <- -2 * (weibull_loglikelihood - exponential_loglikelihood)

p_value_weibull_lognormal <- 1 - pchisq(chi_square_weibull_lognormal, df = 2)
p_value_weibull_loglogistic <- 1 - pchisq(chi_square_weibull_loglogistic, df = 2)
p_value_weibull_exponential <- 1 - pchisq(chi_square_weibull_exponential, df = 2)

chi_square_exponential_weibull <- -2 * (exponential_loglikelihood - weibull_loglikelihood)
p_value_exponential_weibull <- 1 - pchisq(chi_square_exponential_weibull, df = 1)
