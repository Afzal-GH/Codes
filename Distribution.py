import scipy.stats as stats

# Population sizes
female_population = 157e6
male_population = 151.8e6

# Sample size
sample_size = 30000

# Number of female participants in the sample
female_sample = range(14500, 15001)

# (a) Probability for sampling without replacement
probability_without_replacement = sum(stats.hypergeom.pmf(female_sample,
            male_population + female_population, female_population, sample_size))

# (b) Probability for sampling with replacement
probability_with_replacement = sum(stats.binom.pmf(female_sample, sample_size,
            female_population / (female_population + male_population)))

print("Probability without replacement:", probability_without_replacement)
print("Probability with replacement:", probability_with_replacement)
