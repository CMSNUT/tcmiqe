#' struct UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_struct_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' struct Server Functions
#'
#' @noRd 
mod_struct_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_struct_ui("struct_1")
    
## To be copied in the server
# mod_struct_server("struct_1")
