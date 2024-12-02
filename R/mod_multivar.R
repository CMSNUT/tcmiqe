#' multivar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_multivar_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' multivar Server Functions
#'
#' @noRd 
mod_multivar_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_multivar_ui("multivar_1")
    
## To be copied in the server
# mod_multivar_server("multivar_1")
