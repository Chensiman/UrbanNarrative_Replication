# 02_clean_and_construct_indices.R
# Example cleaning and variable preparation

library(dplyr)

dat <- read.csv("data/segments_synthetic.csv")

# Center predictors (so interactions make more sense)
dat <- dat %>%
  mutate(
    SC_c = SC_z - mean(SC_z, na.rm = TRUE),
    SN_c = SN_index - mean(SN_index, na.rm = TRUE),
    P_c  = P_z - mean(P_z, na.rm = TRUE),
    I_c  = I_index - mean(I_index, na.rm = TRUE),
    SCxP = SC_c * P_c
  )

saveRDS(dat, file = "data/segments_clean.rds")
