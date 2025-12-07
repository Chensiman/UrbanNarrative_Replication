# Replication Package for "Integrating Scene Theory and Spatial Narrative: Toward a Human-Centered Approach to Urban Storytelling and Design"

This folder contains reproducibility materials for the article:

Chen Siman, "Integrating Scene Theory and Spatial Narrative: Toward a Human-Centered Approach to Urban Storytelling and Design", submitted to Plos One.

## Folders

- `data/`
  - `segments_synthetic.csv` – fully synthetic dataset with the same variable names as used in the analysis. No real data are included.
  - `segments_clean.rds` – processed version used in the models.

- `code/`
  - `01_simulate_synthetic_data.R` – generates the synthetic dataset.
  - `02_clean_and_construct_indices.R` – prepares variables and constructs derived terms.
  - `03_main_regression_models.R` – runs the main regression models and diagnostics.

## How to run

1. Open R (version 4.3.1 or later).
2. Set the working directory to this folder.
3. Run:

```r
source("code/01_simulate_synthetic_data.R")
source("code/02_clean_and_construct_indices.R")
source("code/03_main_regression_models.R")

