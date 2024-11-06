library(shiny)
library(shinydashboard)
library(DT)

# 主页 ----
homeUI <- function(id) {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 中药方剂 ----
formulaHerbUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        title = paste0(tabNameZh,"管理"),
        width = 12,
        solidHeader = TRUE,
        status = "primary",

        tabsetPanel(
          ## 中药数据库 ----
          tabPanel(
            title = "中药数据库",
            DTOutput(ns("tcm_db"))
          ),

          ## 中药方剂 ----
          tabPanel(
            title = "中药方剂",
            box(
              title = "查询/修改/删除",
              width = 12,
              solidHeader = TRUE,
              status = "warning",
              collapsible = TRUE,

              column(
                width = 10,
                textInput(
                  ns("queryTxt"),
                  "输入查询字段",
                  value = "",
                  placeholder = "真武汤 或 Zhen Wu Tang，附子 或 Fu Zi"),
              ),

              column(
                width = 2,
                tags$br(),
                actionButton(ns("query"),"查询")
              ),
              DTOutput(ns("formula_herb_db"))
            ),

            box(
              title = "添加方剂成分",
              width = 12,
              solidHeader = TRUE,
              status = "warning",
              collapsible = TRUE,

              uiOutput(ns("addUI")),
              actionButton(ns("add"),"添加"),
              DTOutput(ns("formula_herb_db2"))
            )
          )
        )
      )
    )
  )
}

# 中药成分 ----
herbIngredientsUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    fluidRow(
      actionButton(ns("button"),"查询中药"),
      verbatimTextOutput(ns("out"))
    )
  )
}

# 成分靶点 ----
ingredientsTagetsUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}

# 疾病靶点 ----
diseaseTagetsUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}

# 靶点通路 ----
tagetsPathwayUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("Dd")
  )
}

# 研究文献 ----
refsUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}

# 靶点交集 ----
commonTargetsUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}

# 网络药理 ----
networkUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}

# 蛋白互作 ----
ppiUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}

# GO分析 ----
goUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}

# KEGG分析 ----
keggUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    p("简介")
  )
}
