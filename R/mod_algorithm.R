#' algorithm UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_algorithm_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' algorithm Server Functions
#'
#' @noRd 
mod_algorithm_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_algorithm_ui("algorithm_1")
    
## To be copied in the server
# mod_algorithm_server("algorithm_1")
