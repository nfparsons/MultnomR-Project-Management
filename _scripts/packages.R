# Project/Script Title: Loading R Packages for Vital Records Processing
# Author: N.F. Parsons
# Date Created: 2025-02-05
# Email: nathan.parsons@multco.us
# Description: This script loads all necessary R packages for processing vital records data.

# -----------------------------------------------------------------------------
# 1. Setup/Dependencies (Package Manager)
# -----------------------------------------------------------------------------

if (!require("pacman")) {
  install.packages("pacman", repos = "https://cran.rstudio.org")
}
library(pacman)

# -----------------------------------------------------------------------------
# 2. Package Loading (Streamlined and Reorganized)
# -----------------------------------------------------------------------------

# Core/Essential Packages (General R use)
p_load(
  here,          # Folder/file management
  conflicted,    # Package conflict management
  english,       # Translate integers into text
  labelled,      # Manipulate variable/value metadata
  rlang,         # Functions for base R and tidyverse features
  xfun,          # Miscellaneous functions
  rio,           # Universal import/export
  archive,       # Archive files
  filesstrings,  # String manipulation
  googledrive,   # Interact with Google Drive
  knitr          # Dynamic report generation
)

# Data Manipulation and Transformation (Tidyverse first, then others)
p_load(
  tidyverse,      # Tidy data handling and analysis (includes dplyr, tidyr, ggplot2, etc.)
  janitor,       # Data cleaning and examination
  bestNormalize, # Data normalization
  mice,          # Multivariate imputation
  anesrake,      # ANES Raking
  skimr          # Summary statistics
)

# Tables
p_load(
  gt,            # Presentation-ready tables
  gtsummary,     # Publication-ready tables
  flextable      # MS Office compatible tables
)

# Spatial Analysis (sf preferred, then others)
p_load(
  sf,            # Simple features (primary spatial package)
  tidycensus,    # US Census data
  tidygeocoder,  # Geocoding
  geojsonio,     # GeoJSON/TopoJSON conversion
  tmap,          # Thematic maps
  tmaptools,     # Thematic map tools
  osmdata,       # OpenStreetMap data
  # ggmap,       # Spatial visualization (Consider if needed with tmap)
  maps           # Draw geographical maps (Consider if needed with sf/tmap)
)

# Time Series
p_load(
  xts,           # Extensible time series
  spacetime,     # Spatio-temporal data
  tsibble,       # Tidy temporal data frames
  slider,        # Sliding window functions
  imputeTS,      # Time series imputation
  feasts,        # Time series feature extraction
  forecast,      # Time series forecasting
  trending,      # Trending analysis
  tibbletime     # Time-aware tibbles
)

# Visualization (ggplot2 related first)
p_load(
  scales,        # Graphical scales (often used with ggplot2)
  showtext,      # Easy font use in plots
  patchwork,     # Plot composition
  ggpp,          # ggplot2 extensions
  ggExtra,       # ggplot2 enhancements
  ggalt,         # Extra ggplot2 geoms/stats
  ggpubr,        # Easy plot creation
  ggridges,      # Ridgeline plots
  ggfittext,     # Improved text rendering
  ggtext,         # Improved text rendering
  ggthemes,       # ggplot2 themes
  ggsci,          # ggplot2 color palettes
  hrbrthemes,     # ggplot2 themes
  viridis         # ggplot2 color palettes
)

# Visualization (GitHub)
p_load_gh(
  "AliciaSchep/gglabeller",  # Easy plot labeling
  "MarcellGranat/ggProfessional", # Professional ggplot2
  "mattcowgill/ggannotate"  # Easy plot annotation
)

# Visualization (Other)
p_load(
  # extrafont,  # Font tools (Consider if needed with showtext)
  magick,        # Image processing (Consider if actively used)
  xkcd,          # xkcd theme (Consider if actively used)
  harrypotter    # Harry Potter theme (Consider if actively used)
)

# Compatibility & Other
p_load(
  officedown,    # Microsoft Office compatibility
  DBI,          # Database interaction
  units,         # Measurement units
  yardstick,     # Model metrics
  surveillance   # Epidemic modeling
)



# -----------------------------------------------------------------------------
# 3. Conflict Resolution (After loading)
# -----------------------------------------------------------------------------

conflicts_prefer(
  dplyr::filter, 
  dplyr::summarize, 
  dplyr::select, 
  janitor::clean_names
)

# -----------------------------------------------------------------------------
# 4. Session Information
# -----------------------------------------------------------------------------

sessionInfo()

# -----------------------------------------------------------------------------
# 5. Confirmation output
# -----------------------------------------------------------------------------

str_glue("Packages loaded. \n")

# -----------------------------------------------------------------------------
# End of Script
# -----------------------------------------------------------------------------
