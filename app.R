#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinydashboard)

uis <- source("utils/uiMod.R")
ser <- source("utils/serverMod.R")

# uiSide ----
uiSidebar <- dashboardSidebar(
  sidebarMenu(
    id = "tabs",
    ## Home ----
    menuItem("主页",icon = icon("home",lib = "font-awesome"),tabName = "home"),

    ## 数据管理 ----
    menuItem("数据管理",icon = icon("database",lib = "font-awesome"),tabName = "dbmana"),

    ## 数据查询 ----
    menuItem("数据查询",icon = icon("database",lib = "font-awesome"),tabName = "dbquery"),


    ## 调控网络 ----
    menuItem("调控网络",icon = icon("database",lib = "font-awesome"),tabName = "network")
  ) # end Menu
) # end UI

# uiBody ----
uiBody <- dashboardBody(
  tabItems(
    ## 主页 ----
    tabItem(
      "home",
      homeUI("home")
    ),

    # 数据管理 ----
    tabItem(
      "dbmana",
      dbmanaUI("dbmana","数据管理")
    ),

    # 数据查询 ----
    tabItem(
      "dbquery",
      dbqueryUI("dbquery","数据查询")
    ),

    # 调控网络 ----
    tabItem(
      "network",
      networkUI("network","调控网络")
    )
  )
)



# Define UI for application that draws a histogram
ui <- dashboardPage(
  header = dashboardHeader(title = "中药智鉴(TCM-NP)"),
  sidebar = uiSidebar,
  body = uiBody,
  skin = "green",
  title = "TCM-NP: 中药智鉴"
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  dbmanaServer("dbmana")
  dbqueryServer("dbquery")
  networkServer("network")
}

# Run the application
shinyApp(ui = ui, server = server)
