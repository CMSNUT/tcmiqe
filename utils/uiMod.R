library(shiny)
library(shinydashboard)
library(DT)

# 主页 ----
homeUI <- function(id) {
  ns <- NS(id)
  tagList(
    div(strong(h1("TCM-IQE: 中药智鉴",style="color:blue;text-align:center"))),
    tags$br(),
    column(width = 5,
           imageOutput(ns("home001"), fill = TRUE),
           style = "color:blue;text-align:center"),
    column(width = 7, imageOutput(ns("home002"), fill = TRUE), style = "color:blue;text-align:center")
  )
}



# 中药靶点网络 ----
networkUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh)
  )
}
