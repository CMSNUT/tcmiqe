#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#' DO NOT REMOVE.
#'
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  mod_home_server("home")
  mod_home_server("pharm")
  mod_home_server("fmopt")
  mod_home_server("quality")
  mod_home_server("property")
  mod_home_server("cadd")
  mod_home_server("database")
  mod_home_server("toolkit")
}
