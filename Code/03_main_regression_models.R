# 03_main_regression_models.R
# Main regression model + simple diagnostics

library(dplyr)
library(lmtest)
library(sandwich)
library(car)
library(boot)

dat <- readRDS("data/segments_clean.rds")

# Main model (adapt formula to match your paper)
m1 <- lm(NI ~ SC_c + SN_c + P_c + I_c + SCxP, data = dat)

# Standard summary
summary(m1)

# Robust SE (HC3)
coeftest(m1, vcov = vcovHC(m1, type = "HC3"))

# Multicollinearity
vif(m1)

# Residual normality
shapiro.test(resid(m1))

# RESET test (functional form)
resettest(m1)

# Bootstrap (optional)
boot_fun <- function(data, indices) {
  d <- data[indices, ]
  m <- lm(NI ~ SC_c + SN_c + P_c + I_c + SCxP, data = d)
  coef(m)
}

set.seed(123)
boot_res <- boot(data = dat, statistic = boot_fun, R = 1000)

boot_res
