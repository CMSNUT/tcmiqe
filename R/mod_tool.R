#' tool UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @import DT
#' @importFrom shiny NS tagList
mod_tool_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tabsetPanel(
      id = ns("tabs"),

      # 在线中药数据库 ----
      tabPanel(
        title = "在线中药数据库",
        value = ns("online"),
        DT::DTOutput(ns("onlineTable"))
      ),

      # 本地中药数据库 ----
      tabPanel(
        title = "本地中药数据库",
        value = "local",
        DT::DTOutput(ns("localTable"))
      )
    )


  )
}

#' tool Server Functions
#'
#' @noRd
mod_tool_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_tool_ui("tool_1")

## To be copied in the server
# mod_tool_server("tool_1")
