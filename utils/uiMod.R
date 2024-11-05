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
    h2(tabNameZh),
    fluidRow(
      box(
        title = paste0(tabNameZh,"管理"),
        width = 9,
        solidHeader = TRUE,
        status = "primary",

        tabsetPanel(
          tabPanel(
            title = "查询",
            actionButton(ns("query"),"查询"),
            verbatimTextOutput(ns("out"))
          ),
          tabPanel(
            title = "新增",
            actionButton(ns("add"),"新增"),
            verbatimTextOutput(ns("out2"))
          ),
          tabPanel(
            title = "删除",
            actionButton(ns("add"),"新增"),
            verbatimTextOutput(ns("out2"))
          ),
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
