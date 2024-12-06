#' bioinfoData UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_bioinfoData_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' bioinfoData Server Functions
#'
#' @noRd 
mod_bioinfoData_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_bioinfoData_ui("bioinfoData_1")
    
## To be copied in the server
# mod_bioinfoData_server("bioinfoData_1")
