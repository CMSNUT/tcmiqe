#' fmopt UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_fmopt_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' fmopt Server Functions
#'
#' @noRd 
mod_fmopt_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_fmopt_ui("fmopt_1")
    
## To be copied in the server
# mod_fmopt_server("fmopt_1")
