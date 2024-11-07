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
            box(
              width = 12,
              title = "中药数据库信息",
              status = "primary",
              solidHeader = TRUE,

              column(width = 1, textInput(ns("tcmdb_id"),"数据库ID")),
              column(width = 3, textInput(ns("tcmdb_name"),"英文缩写及链接")),
              column(width = 2, textInput(ns("tcmdb_en"),"英文全称")),
              column(width = 2, textInput(ns("tcmdb_zh"),"中文全称")),
              column(width = 1, textInput(ns("tcmdb_year"),"建立年份")),
              column(width = 2, textInput(ns("tcmdb_doi"),"文章DOI")),
              column(width = 1, selectInput(ns("tcmdb_status"),"链接状态",choices = c("可用"="可用","失效"="失效"))),

              column(width = 1, actionButton(ns("tcmdb_update_btn"),"更新")),
              column(width = 1, actionButton(ns("tcmdb_delete_btn"),"删除")),
              column(width = 1, actionButton(ns("tcmdb_add_btn"),"新增")),
              column(width = 9,
                     p('超链接编辑方法: <a href="https://old.tcmsp-e.com/tcmsp.php" target="_blank">TCMSP</a>'))
            ),
            DTOutput(ns("tcm_db"))
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
