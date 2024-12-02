#' erichment UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_erichment_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' erichment Server Functions
#'
#' @noRd 
mod_erichment_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_erichment_ui("erichment_1")
    
## To be copied in the server
# mod_erichment_server("erichment_1")
