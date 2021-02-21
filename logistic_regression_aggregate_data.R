library(tidyverse)
set.seed(5)

df <- tibble::tibble(Gender = as.factor(sample(c("m", "f"), 200, replace = TRUE, prob = c(0.6, 0.4))),
  Age_Group = as.factor(sample(c("[<30]", "[30-65]", "[65+]"), 200, replace = TRUE, prob = c(0.3, 0.6, 0.1))),
  Response = rbinom(200, 1, prob = 0.2)
)

glimpse(df)

# Logist Regression on non-aggregate data
model1 <- glm(Response ~ Gender + Age_Group, data = df, family = binomial("logit"))
summary(model1)
