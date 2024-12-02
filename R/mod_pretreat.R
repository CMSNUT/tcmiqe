#' pretreat UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pretreat_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' pretreat Server Functions
#'
#' @noRd 
mod_pretreat_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_pretreat_ui("pretreat_1")
    
## To be copied in the server
# mod_pretreat_server("pretreat_1")
