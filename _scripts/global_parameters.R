# Project/Script Title: Setting Global Parameters and Resolving Conflicts
# Author: N.F. Parsons
# Date: 2025-02-05
# Email: nathan.parsons@multco.us
# Description: This script sets global parameters, resolves conflicts between packages,
#              loads fonts, sets API keys, and sets a random seed for reproducibility.

# -----------------------------------------------------------------------------
# 1. Setup/Dependencies
# -----------------------------------------------------------------------------

# Install packages if not already installed (using a helper function)
if (!require("pacman")) {
  install.packages("pacman", repos = "https://cran.rstudio.org")
}
library(pacman)

p_load("magick", "janitor", "dplyr", "tidycensus", "sysfonts", "rscopus", 
       "gtsummary", "flextable", "showtext", "ggmap", "stringr")


# -----------------------------------------------------------------------------
# 2. Global Parameters/Constants
# -----------------------------------------------------------------------------

# API Keys (Store securely, ideally in environment variables)
elsevier_api_key <- Sys.getenv("ELSEVIER_API_KEY")  # Get from environment
census_api_key <- Sys.getenv("CENSUS_API_KEY") # Get from environment
google_api_key <- Sys.getenv("GOOGLE_API_KEY") # Get from environment

# Check if API keys are set (important for security)
if (elsevier_api_key == "") {
  stop("Elsevier API key not found. Set the ELSEVIER_API_KEY environment variable.")
}
if (census_api_key == "") {
  stop("Census API key not found. Set the CENSUS_API_KEY environment variable.")
}
if (google_api_key == "") {
  stop("Google API key not found. Set the GOOGLE_API_KEY environment variable.")
}

# GIS repo (set for your own use)
gis_repo <- Sys.getenv("GIS_SHAPEFILE_REPO")

# Check if GIS repo is set
if (gis_repo == "") {
  stop("GIS shapefile repository not found. Set the GIS_SHAPEFILE_REPO environment variable using the following code: `gis_repo <- 'path/to/shapefiles/folder', or add the following code to your .Rprofile using `file.edit(file.path('~', '.Rprofile'))`: `Sys.setenv(DATA_REPO = 'path/to/shapefiles/folder')`")
}

# Data repo (set for your own use)
data_repo <- Sys.getenv("DATA_REPO")

# Check if GIS repo is set
if (data_repo == "") {
  stop("Data repository not found. Set the DATA_REPO environment variable using the following code: `data_repo <- 'path/to/data/folder'`, or add the following code to your .Rprofile using `file.edit(file.path('~', '.Rprofile'))`: `Sys.setenv(DATA_REPO = 'path/to/data/folder')`")
}

# Other Global Settings
set.seed(13) # Random seed for reproducibility
options(scipen = 9999) # Large number for scientific notation preference


# -----------------------------------------------------------------------------
# 3. Themes and Table Defaults
# -----------------------------------------------------------------------------

# gtsummary Themes
gtsummary::theme_gtsummary_journal(journal = "jama")
gtsummary::theme_gtsummary_compact()

# flextable Defaults (Font check!)
flextable::set_flextable_defaults(
  table.layout = "autofit", 
  font.size = 10, 
  font.family = "Times New Roman", # Ensure this font is available!
  padding.top = 0, 
  padding.bottom = 0
)


# -----------------------------------------------------------------------------
# 4. Font Loading
# -----------------------------------------------------------------------------

# Enable showtext for custom fonts
showtext::showtext_auto() 


# -----------------------------------------------------------------------------
# 5. API Key Registration
# -----------------------------------------------------------------------------

# Register API keys (after setting them as environment variables)

# tidycensus
tidycensus::census_api_key(census_api_key, overwrite = TRUE) 

# Elsevier 
rscopus::set_api_key(elsevier_api_key)  

# Google Maps 
ggmap::register_google(key = google_api_key) 


# -----------------------------------------------------------------------------
# 6.  Session Information
# -----------------------------------------------------------------------------

sessionInfo()


# -----------------------------------------------------------------------------
# 7. Confirmation output
# -----------------------------------------------------------------------------

stringr::str_glue("Options set. \n")


# -----------------------------------------------------------------------------
# End of Script
# -----------------------------------------------------------------------------
