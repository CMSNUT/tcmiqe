#' docking UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_docking_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' docking Server Functions
#'
#' @noRd 
mod_docking_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_docking_ui("docking_1")
    
## To be copied in the server
# mod_docking_server("docking_1")
