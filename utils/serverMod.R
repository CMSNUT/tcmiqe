library(shiny)
library(shinydashboard)
library(DT)
library(DBI)
library(RSQLite)
library(jsonlite)
library(readxl)
library(writexl)
library(tidyverse)
library(ggpubr)

ftc <- source("utils/fct.R")


# 数据管理 ----
dbmanaServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # 中药数据库管理 ----
      ## 表格 ----
      tcmdb <- reactive({getAllData("data/tcmnp.db","tcmdb")})
      output$tcm_db <- renderDT(tcmdb(), escape = FALSE,edit=TRUE)

      ## 新增按钮 ----
      observeEvent(input$new_tcmdb_addbtn, {
        req(input$new_tcmdb_name)
        if (length(trimws(input$new_tcmdb_link)) >0) {
          name <- paste0('<a herf="',trimws(input$new_tcmdb_link),'" target="_blank">',
                         trimws(input$new_tcmdb_name),'</a>')
        }
        else {
          name <- input$new_tcmdb_name
        }

        if (length(trimws(input$new_tcmdb_doi)) >0) {
          doi <- paste0('<a herf="','https:/doi.org/',trimws(input$new_tcmdb_doi),'" target="_blank">',
                        trimws(input$new_tcmdb_doi),'</a>')
        }
        else {
          doi <- ""
        }


        rs <- c(name,
                trimws(input$new_tcmdb_en),
                trimws(input$new_tcmdb_zh),
                trimws(input$new_tcmdb_year),
                trimws(input$new_tcmdb_version),
                doi,
                trimws(input$new_tcmdb_status)
                ) %>% paste0("'", .,sep="'",collapse = ",")

        putEntry("data/tcmnp.db","tcmdb",rs)

      })

      ## 清除按钮 -----
      # observeEvent(input$new_tcmdb_cleanbtn, {
      #   input$new_tcmdb_name = ""
      #   input$new_tcmdb_en = ""
      #   input$new_tcmdb_zh = ""
      #   input$new_tcmdb_year = ""
      #   input$new_tcmdb_version = ""
      #   input$new_tcmdb_doi = ""
      # })

      ## 更新 ----

      ## 删除 ----




    }
  )
}

# 数据查询 ----
dbqueryServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # 查询方剂库
      observeEvent(input$query, {
        req(input$queryTxt)
        con <- dbConnect(SQLite(),"data/tcmnp.db")
        # rs <- dbReadTable(con,"formula_herb") %>% lapply(as.factor) %>% as.data.frame
        rs <- dbGetQuery(con,
                         paste0(
                           'SELECT * FROM formula_herb WHERE "方剂名称" LIKE "%',
                           input$queryTxt,
                           '%" OR "方剂名称拼音" LIKE "%',
                           input$queryTxt,
                           '%" OR "中药名称" LIKE "%',
                           input$queryTxt,
                           '%" OR "中药名称拼音" LIKE "%',
                           input$queryTxt,
                           '%"'
                         )) %>% lapply(as.factor) %>% as.data.frame

        dbDisconnect(con)

        output$formula_herb_db <- renderDT(rs, escape = FALSE)

      })
    }
  )
}

# 调控网络 ----
networkServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      count <- reactiveVal(0)
      observeEvent(input$button, {
        count(count() + 1)
      })
      output$out <- renderText({
        count()
      })
      count
    }
  )
}


