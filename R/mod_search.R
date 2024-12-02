#' search UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_search_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' search Server Functions
#'
#' @noRd 
mod_search_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_search_ui("search_1")
    
## To be copied in the server
# mod_search_server("search_1")
