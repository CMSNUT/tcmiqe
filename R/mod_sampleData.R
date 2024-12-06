#' sampleData UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sampleData_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' sampleData Server Functions
#'
#' @noRd 
mod_sampleData_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sampleData_ui("sampleData_1")
    
## To be copied in the server
# mod_sampleData_server("sampleData_1")
