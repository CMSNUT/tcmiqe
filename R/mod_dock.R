#' dock UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_dock_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' dock Server Functions
#'
#' @noRd 
mod_dock_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_dock_ui("dock_1")
    
## To be copied in the server
# mod_dock_server("dock_1")
