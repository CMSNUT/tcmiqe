#' property UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_property_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' property Server Functions
#'
#' @noRd 
mod_property_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_property_ui("property_1")
    
## To be copied in the server
# mod_property_server("property_1")
