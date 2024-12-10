#' quality UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_quality_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' quality Server Functions
#'
#' @noRd 
mod_quality_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_quality_ui("quality_1")
    
## To be copied in the server
# mod_quality_server("quality_1")
