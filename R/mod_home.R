#' home UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom shinydashboard box
mod_home_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(
        width = 12,
        status = "primary",
        div(strong(h2("中药智鉴")),style="color:blue;text-align:center"),
        div(strong(p("TCM-IQE: a toolkit for TCM")),style="color:orange;text-align:center"),
        tags$hr(),
        shinydashboard::box(p("xxxxxxxxxxxxxxxx")),
        shinydashboard::box(p("yyyyyyyyyyyyyyyy"))
      )
    )
  )
}

#' home Server Functions
#'
#' @noRd
mod_home_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_home_ui("home_1")

## To be copied in the server
# mod_home_server("home_1")
