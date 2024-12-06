#' md UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_md_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' md Server Functions
#'
#' @noRd 
mod_md_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_md_ui("md_1")
    
## To be copied in the server
# mod_md_server("md_1")
