# 01_simulate_synthetic_data.R
# Synthetic example data for the Narrative Impact model
# This is FAKE data generated to mirror the structure and rough ranges in the paper.

set.seed(1234)

n <- 30   # number of segments (adjust if you like)

segment_id <- 1:n

# Core predictors
SC_z     <- rnorm(n, mean = 0, sd = 1)                # Scene characteristics (z)
P_z      <- rnorm(n, mean = 0, sd = 1)                # Participatory engagement (z)
SN_index <- pmin(pmax(rnorm(n, 0.52, 0.22), 0), 1)    # 0–1
I_index  <- pmin(pmax(rnorm(n, 74.3, 12.1), 0), 100)  # 0–100

# Simple data-generating process for NI (just to make the model work)
epsilon <- rnorm(n, 0, 1)

NI_raw <- 0.45 * SC_z +
  0.39 * (SN_index - mean(SN_index)) / sd(SN_index) +
  0.32 * (I_index  - mean(I_index))  / sd(I_index)  +
  0.28 * SC_z * P_z +
  epsilon

NI <- as.numeric(scale(NI_raw))   # standardize

synthetic_data <- data.frame(
  segment_id = segment_id,
  NI         = NI,
  SC_z       = SC_z,
  SN_index   = SN_index,
  P_z        = P_z,
  I_index    = I_index
)

dir.create("data", showWarnings = FALSE)
write.csv(synthetic_data, "data/segments_synthetic.csv", row.names = FALSE)
