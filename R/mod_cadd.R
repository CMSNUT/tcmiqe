#' cadd UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_cadd_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' cadd Server Functions
#'
#' @noRd 
mod_cadd_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_cadd_ui("cadd_1")
    
## To be copied in the server
# mod_cadd_server("cadd_1")
