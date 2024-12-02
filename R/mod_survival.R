#' survival UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_survival_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' survival Server Functions
#'
#' @noRd 
mod_survival_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_survival_ui("survival_1")
    
## To be copied in the server
# mod_survival_server("survival_1")
