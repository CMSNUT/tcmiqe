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
ftc <- source("utils/fct.R")

# uiSide ----
uiSidebar <- dashboardSidebar(
  sidebarMenu(
    id = "tabs",
    ## Home ----
    menuItem("关于TCM-NP",icon = icon("home",lib = "font-awesome"),tabName = "home"),

    ## 数据管理 ----
    menuItem(
      "数据管理",
      icon = icon("database",lib = "font-awesome"),

      ### 中药方剂 ----
      menuSubItem(
        "中药方剂",
        icon = icon("database",lib = "font-awesome"),
        tabName = "formula_herb"
      ),

      ### 中药成分 ----
      menuSubItem(
        "中药成分",
        icon = icon("database",lib = "font-awesome"),
        tabName = "herb_ingredients"
      ),

      ### 成分靶点 ----
      menuSubItem(
        "成分靶点",
        icon = icon("database",lib = "font-awesome"),
        tabName = "ingredients_targets"
      ),

      ### 疾病靶点 ----
      menuSubItem(
        "疾病靶点",
        icon = icon("database",lib = "font-awesome"),
        tabName = "disease_targets"
      ),

      ### 靶点通路 ----
      menuSubItem(
        "靶点通路",
        icon = icon("database",lib = "font-awesome"),
        tabName = "targets_pathway"
      ),

      ### 研究文献 ----
      menuSubItem(
        "研究文献",
        icon = icon("database",lib = "font-awesome"),
        tabName = "refs"
      )
    ),

    ## 调控网络 ----
    menuItem(
      "调控网络",
      icon = icon("database",lib = "font-awesome"),

      ### 靶点交集 ----
      menuSubItem(
        "靶点交集",
        icon = icon("database",lib = "font-awesome"),
        tabName = "common_targets"
      ),

      ### 网络药理 ----
      menuSubItem(
        "网络药理",
        icon = icon("database",lib = "font-awesome"),
        tabName = "network"
      ),

      ### 蛋白互作 ----
      menuSubItem(
        "蛋白互作",
        icon = icon("database",lib = "font-awesome"),
        tabName = "ppi"
      )
    ),

    ## 富集分析 ----
    menuItem(
      "富集分析",
      icon = icon("database",lib = "font-awesome"),

      ### GO分析 ----
      menuSubItem(
        "GO分析",
        icon = icon("database",lib = "font-awesome"),
        tabName = "go"
      ),

      ### KEGG ----
      menuSubItem(
        "KEGG分析",
        icon = icon("database",lib = "font-awesome"),
        tabName = "kegg"
      )
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

    # 中药方剂 ----
    tabItem(
      "formula_herb",
      formulaHerbUI("formula_herb","中药方剂")
    ),

    # 中药成分 ----
    tabItem(
      "herb_ingredients",
      herbIngredientsUI("herb_ingredients","中药成分")
    ),

    # 成分靶点 ----
    tabItem(
      "ingredients_tagets",
      ingredientsTagetsUI("ingredients_tagets","成分靶点")
    ),

    # 疾病靶点 ----
    tabItem(
      "disease_tagets",
      diseaseTagetsUI("disease_tagets","疾病靶点")
    ),

    # 靶点通路 ----
    tabItem(
      "tagets_pathway",
      tagetsPathwayUI("tagets_pathway","靶点通路")
    ),

    # 研究文献 ----
    tabItem(
      "refs",
      refsUI("refs","研究文献")
    ),

    # 靶点交集 ----
    tabItem(
      "common_tagets",
      commonTargetsUI("common_tagets","靶点交集")
    ),

    # 网络药理 ----
    tabItem(
      "network",
      networkUI("network","网络药理")
    ),

    # 蛋白互作 ----
    tabItem(
      "ppi",
      ppiUI("ppi","蛋白互作网络")
    ),

    # GO分析 ----
    tabItem(
      "go",
      goUI("go","GO分析")
    ),

    # KEGG分析 ----
    tabItem(
      "kegg",
      keggUI("kegg","KEGG分析")
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
  formulaHerbServer("formula_herb")
  herbIngredientsServer("herb_ingredients")
  ingredientsTagetsServer("ingredients_targets")
  diseaseTagetsServer("disease_targets")
  tagetsPathwayServer("targets_pathway")
  refsServer("refs")
  commonTargetsServer("common_targets")
  networkServer("network")
  ppiServer("ppi")
  goServer("go")
  keggServer("kegg")
}

# Run the application
shinyApp(ui = ui, server = server)
