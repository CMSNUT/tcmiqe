#' statistics UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_statistics_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' statistics Server Functions
#'
#' @noRd 
mod_statistics_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_statistics_ui("statistics_1")
    
## To be copied in the server
# mod_statistics_server("statistics_1")
