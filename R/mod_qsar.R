#' qsar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_qsar_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' qsar Server Functions
#'
#' @noRd 
mod_qsar_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_qsar_ui("qsar_1")
    
## To be copied in the server
# mod_qsar_server("qsar_1")
