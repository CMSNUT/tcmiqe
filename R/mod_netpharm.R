#' netpharm UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_netpharm_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' netpharm Server Functions
#'
#' @noRd 
mod_netpharm_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_netpharm_ui("netpharm_1")
    
## To be copied in the server
# mod_netpharm_server("netpharm_1")
