#' toolkit UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_toolkit_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' toolkit Server Functions
#'
#' @noRd 
mod_toolkit_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_toolkit_ui("toolkit_1")
    
## To be copied in the server
# mod_toolkit_server("toolkit_1")
