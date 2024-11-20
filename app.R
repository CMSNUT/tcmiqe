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
    menuItem("数据管理",icon = icon("database",lib = "font-awesome"),
             menuSubItem("中药数据库",tabName = "tcmdb"),
             menuSubItem("中药方剂",tabName = "formula"),
             menuSubItem("中药有效成分",tabName = "herbIng"),
             menuSubItem("成分潜在靶点",tabName = "ingTarget"),
             menuSubItem("疾病潜在靶点",tabName = "disTarget")
             ),

    ## 网络药理 ----
    menuItem("网络药理",icon = icon("database",lib = "font-awesome"),
             menuSubItem("中药靶点网络",tabName = "herbNet"),
             menuSubItem("疾病靶点网络",tabName = "diseaseNet"),
             menuSubItem("蛋白互作网络",tabName = "ppi"),
             menuSubItem("GO分析",tabName = "go"),
             menuSubItem("KEGG分析",tabName = "kegg")
             ),

    ## 组学分析 ----
    menuItem("生信分析",icon = icon("database",lib = "font-awesome"),

             menuSubItem("差异表达",tabName = "dea"),
             menuSubItem("生存分析",tabName = "surv"),
             menuSubItem("Cox分析",tabName = "cox"),
             menuSubItem("富集分析",tabName = "enrich")
            ),

    ## 谱学分析 ----
    menuItem("谱学分析",icon = icon("database",lib = "font-awesome"),
             menuSubItem("谱图预处理",tabName = "pretreat"),
             menuSubItem("一阶校正",tabName = "foc"),
             menuSubItem("二阶校正",tabName = "soc"),
             menuSubItem("高阶校正",tabName = "hoc"),
             menuSubItem("高光谱分析",tabName = "hsa")
             )
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

    # 数据查询 ----
    tabItem(
      "tcmdb",
      dbmanaUI("tcmdb","中药数据库")
    ),

    # 网络药理 ----
    tabItem(
      "pharma",
      networkUI("pharma","网络药理")
    ),

    # 生信分析 ----
    tabItem(
      "bioinfo",
      networkUI("bioinfo","生信分析")
    ),

    # 谱学分析 ----
    tabItem(
      "spectra",
      networkUI("spectra","谱学分析")
    )
  )
)



# Define UI for application that draws a histogram
ui <- dashboardPage(
  header = dashboardHeader(title = "中药智鉴(TCM-IQE)"),
  sidebar = uiSidebar,
  body = uiBody,
  skin = "green",
  title = "TCM-IQE: 中药智鉴"
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  homeServer("home")
  dbmanaServer("tcmdb")
  networkServer("network")
}

# Run the application
shinyApp(ui = ui, server = server)
