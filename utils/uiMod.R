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

# 数据管理 ----
dbmanaUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        title = tabNameZh,
        width = 12,
        solidHeader = TRUE,
        status = "primary",

        tabsetPanel(
          id = "tabs",
          ## 中药数据库 ----
          tabPanel(
            title = "中药数据库管理",
            column(width = 1, textInput(ns("new_tcmdb_name"),"数据库英文缩写")),
            column(width = 1, textInput(ns("new_tcmdb_link"),"数据库链接网址")),
            column(width = 3, textInput(ns("new_tcmdb_en"),"数据库英文全称")),
            column(width = 2, textInput(ns("new_tcmdb_zh"),"数据库中文全称")),
            column(width = 1, textInput(ns("new_tcmdb_year"),"数据库建立年份")),
            column(width = 1, textInput(ns("new_tcmdb_version"),"数据库版本")),
            column(width = 2, textInput(ns("new_tcmdb_doi"),"数据库文章DOI")),
            column(width = 1, selectInput(ns("new_tcmdb_status"),"数据库链接状态",choices = c("可用"="可用","失效"="失效"))),
            # column(width = 1, actionButton(ns("new_tcmdb_cleanbtn"),"清除"),actionButton(ns("new_tcmdb_addbtn"),"确认添加")),
            column(width = 1, tags$hr(), actionButton(ns("new_tcmdb_addbtn"),"确认添加")),

            DTOutput(ns("tcm_db")),

            actionButton(ns("update_tcmdb"),"更新"),
            actionButton(ns("delete_tcmdb"),"删除"),
            textOutput(ns("txt"))
          ),

          ## 中药方剂库 ----
          tabPanel(
            title = "中药方剂管理",
            tabBox(
              id="tabs2",
              tabPanel(ns("新增"), "First tab content"),
              tabPanel(ns("更新/删除"), "tab2 content")
            )
          )
        )
      )
    )
  )
}

# 数据查询 ----
dbqueryUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh),
    fluidRow(
      actionButton(ns("button"),"查询中药"),
      verbatimTextOutput(ns("out"))
    )
  )
}

# 调控网络 ----
networkUI <- function(id, tabNameZh) {
  ns <- NS(id)
  tagList(
    h2(tabNameZh)
  )
}
