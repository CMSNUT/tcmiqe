#' modeling UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_modeling_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' modeling Server Functions
#'
#' @noRd 
mod_modeling_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_modeling_ui("modeling_1")
    
## To be copied in the server
# mod_modeling_server("modeling_1")
