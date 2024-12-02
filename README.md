
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{tcmiqe}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/CMSNUT/tcmiqe/graph/badge.svg)](https://app.codecov.io/gh/CMSNUT/tcmiqe)
<!-- badges: end -->

## Installation

You can install the development version of `{tcmiqe}` like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Run

You can launch the application by running:

``` r
tcmiqe::run_app()
```

## About

You are reading the doc about version : 1.0

This README has been compiled on the

``` r
Sys.time()
#> [1] "2024-12-03 07:06:00 CST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading tcmiqe
#> Warning: replacing previous import 'shinyWidgets::alert' by 'shinyjs::alert'
#> when loading 'tcmiqe'
#> Warning: replacing previous import 'shiny::runExample' by 'shinyjs::runExample'
#> when loading 'tcmiqe'
#> ── R CMD check results ───────────────────────────────────────── tcmiqe 1.0 ────
#> Duration: 4.7s
#> 
#> ❯ checking package dependencies ... ERROR
#>   Namespace dependencies missing from DESCRIPTION Imports/Depends entries:
#>     'shinyWidgets', 'shinydashboard'
#>   
#>   See section 'The DESCRIPTION file' in the 'Writing R Extensions'
#>   manual.
#> 
#> 1 error ✖ | 0 warnings ✔ | 0 notes ✔
#> Error: R CMD check found ERRORs
```

``` r
covr::package_coverage()
#> tcmiqe Coverage: 97.04%
#> R/run_app.R: 0.00%
#> R/app_config.R: 100.00%
#> R/app_ui.R: 100.00%
#> R/golem_utils_server.R: 100.00%
#> R/golem_utils_ui.R: 100.00%
#> R/mod_cox.R: 100.00%
#> R/mod_deg.R: 100.00%
#> R/mod_dock.R: 100.00%
#> R/mod_erichment.R: 100.00%
#> R/mod_home.R: 100.00%
#> R/mod_md.R: 100.00%
#> R/mod_multivar.R: 100.00%
#> R/mod_netpharm.R: 100.00%
#> R/mod_pretreat.R: 100.00%
#> R/mod_qsar.R: 100.00%
#> R/mod_search.R: 100.00%
#> R/mod_statistics.R: 100.00%
#> R/mod_survival.R: 100.00%
```

``` r
library(fresh)

create_theme(
  theme = "default",
  bs_vars_navbar(
    default_bg = "rgb(92,184,92)",
    default_color = "#FFFFFF",
    default_link_color = "#FFFFFF",
    default_link_active_color = "#FFFFFF"
  ),
  bs_vars_color(
    gray_base = "#354e5c",
    brand_primary = "#75b8d1",
    brand_success = "#c9d175",
    brand_info = "#758bd1",
    brand_warning = "#d1ab75",
    brand_danger = "#d175b8"
  ),
  bs_vars_state(
    success_text = "#FFF",
    success_bg = "#c9d175",
    success_border = "#c9d175",
    info_text = "#FFF",
    info_bg = "#3f2d54",
    info_border = "#3f2d54",
    danger_text = "#FFF",
    danger_bg = "#d175b8",
    danger_border = "#d175b8"
  ),
  bs_vars_wells(
    bg = "#FFF",
    border = "#3f2d54"
  ),
  output_file = "inst/app/www/mytheme.css"
)
```
