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

homeServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$home001 <- renderImage({
      filename <- normalizePath(file.path('images/home001.jpg'))
      list(src = filename,width = 600,height = 400)
    },
    deleteFile = FALSE)

    output$home002 <- renderImage({
      filename <- normalizePath(file.path('images/home002.jpg'))
      list(src = filename,width = 800,height = 400)
    },
    deleteFile = FALSE)
  })
}


# 数据管理 ----
dbmanaServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    # 中药数据库管理 ----
    ## 表格 ----
    output$tcm_db <- renderDT(
      getAllData("data/tcmnp.db", "tcmdb"),
      escape = FALSE,
      edit = TRUE,
      selection = "single"
    )

    ## 表格选择 ----
    observeEvent(input$tcm_db_rows_selected, {
      if (!is.null(input$tcm_db_rows_selected)) {
        df <- getAllData("data/tcmnp.db", "tcmdb") %>% as.data.frame
        # save(df,file = 'df.Rda')
        rs <- as.numeric(input$tcm_db_rows_selected)

        updateTextInput(session, "tcmdb_id", value = df[rs, 1])
        updateTextInput(session, "tcmdb_name", value = df[rs, 2])
        updateTextInput(session, "tcmdb_en", value = df[rs, 3])
        updateTextInput(session, "tcmdb_zh", value = df[rs, 4])
        updateTextInput(session, "tcmdb_year", value = df[rs, 5])
        updateTextInput(session, "tcmdb_doi", value = df[rs, 6])
        updateTextInput(session, "tcmdb_status", value = df[rs, 7])
      }
    })

    ## 更新 ----
    observeEvent(input$tcmdb_update_btn, {
      if (!is.null(input$tcm_db_rows_selected)) {
        rs <- c(
          trimws(input$tcmdb_id),
          trimws(input$tcmdb_name),
          trimws(input$tcmdb_en),
          trimws(input$tcmdb_zh),
          trimws(input$tcmdb_year),
          trimws(input$tcmdb_doi),
          trimws(input$tcmdb_status)
        )

        conditons <- paste0(paste("ID=", trimws(input$tcmdb_id), sep = "'"), "'")

        updateEntry("data/tcmnp.db", "tcmdb", rs, conditons)
        output$tcm_db <- renderDT(
          getAllData("data/tcmnp.db", "tcmdb"),
          escape = FALSE,
          edit = TRUE,
          selection = "single"
        )
      }
    })

    ## 删除 ----
    observeEvent(input$tcmdb_delete_btn, {
      if (!is.null(input$tcm_db_rows_selected)) {
        conditons <- paste0("ID='", trimws(input$tcmdb_id), "'")

        deleteEntry("data/tcmnp.db", "tcmdb", conditons)

        output$tcm_db <- renderDT(
          getAllData("data/tcmnp.db", "tcmdb"),
          escape = FALSE,
          edit = TRUE,
          selection = "single"
        )
      }
    })

    ## 新增按钮 ----
    observeEvent(input$tcmdb_add_btn, {
      if (is.null(input$tcm_db_rows_selected)) {
        db <- getAllData("data/tcmnp.db", "tcmdb")
        if (nrow(db) > 0) {
          mid <- max(as.numeric(db[, 1]))
          id <- as.character(mid + 1)
          updateTextInput(session, "tcmdb_id", value = id)
        } else {
          id <- '1'
        }

        rs <- c(
          id,
          trimws(input$tcmdb_name),
          trimws(input$tcmdb_en),
          trimws(input$tcmdb_zh),
          trimws(input$tcmdb_year),
          trimws(input$tcmdb_doi),
          trimws(input$tcmdb_status)
        ) %>% paste0("'", ., sep = "'", collapse = ",")

        putEntry("data/tcmnp.db", "tcmdb", rs)
        output$tcm_db <- renderDT(
          getAllData("data/tcmnp.db", "tcmdb"),
          escape = FALSE,
          edit = TRUE,
          selection = "single"
        )
      }
    })
  })
}

# # 数据查询 ----
# dbqueryServer <- function(id) {
#   moduleServer(id, function(input, output, session) {
#     # 查询方剂库
#     observeEvent(input$query, {
#       req(input$queryTxt)
#       con <- dbConnect(SQLite(), "data/tcmnp.db")
#       # rs <- dbReadTable(con,"formula_herb") %>% lapply(as.factor) %>% as.data.frame
#       rs <- dbGetQuery(
#         con,
#         paste0(
#           'SELECT * FROM formula_herb WHERE "方剂名称" LIKE "%',
#           input$queryTxt,
#           '%" OR "方剂名称拼音" LIKE "%',
#           input$queryTxt,
#           '%" OR "中药名称" LIKE "%',
#           input$queryTxt,
#           '%" OR "中药名称拼音" LIKE "%',
#           input$queryTxt,
#           '%"'
#         )
#       ) %>% lapply(as.factor) %>% as.data.frame
#
#       dbDisconnect(con)
#
#       output$formula_herb_db <- renderDT(rs, escape = FALSE)
#
#     })
#   })
# }

# 调控网络 ----
networkServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    count <- reactiveVal(0)
    observeEvent(input$button, {
      count(count() + 1)
    })
    output$out <- renderText({
      count()
    })
    count
  })
}
