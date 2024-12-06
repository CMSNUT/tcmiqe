#' cox UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_cox_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' cox Server Functions
#'
#' @noRd 
mod_cox_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_cox_ui("cox_1")
    
## To be copied in the server
# mod_cox_server("cox_1")
