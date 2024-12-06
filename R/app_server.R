#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#' DO NOT REMOVE.
#'
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  # 主页 ----
  mod_home_server("home")

  # 网络药理学 ----
  mod_home_server("tool")
  mod_home_server("netpharm")

  # 生物信息学 ----
  mod_home_server("bioinfoData")
  mod_home_server("statistics")
  mod_home_server("survival")
  mod_home_server("cox")
  mod_home_server("deg")

  # 化学计量学 ----
  mod_home_server("sampleData")
  mod_home_server("algorithm")
  mod_home_server("modeling")


  # 化学信息学 ----
  mod_home_server("struct")
  mod_home_server("qsar")
  mod_home_server("docking")
  mod_home_server("md")
}
