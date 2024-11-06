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

# 中药方剂 ----
formulaHerbServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # 中药库
      tcmdb <- reactive({
        # rs <- readxl::read_xlsx("data/中药数据库.xlsx") %>% lapply(as.factor) %>% as.data.frame
        # rs$数据库 <- paste0('<a href="',rs$网址,'" target="_blank">', rs$数据库, '</a>') %>% as.data.frame
        # colnames(rs[,1]) <- "数据库"
        # rs <- rs[-ncol(rs)]
        # rs
        con <- dbConnect(SQLite(),"data/tcmnp.db")
        rs <- dbReadTable(con,"tcmdb") %>% lapply(as.factor) %>% as.data.frame
        dbDisconnect(con)
        rs
      })
      output$tcm_db <- renderDT(tcmdb(), escape = FALSE)

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

# 中药成分 ----
herbIngredientsServer <- function(id) { # 中药方剂
  moduleServer(
    id,
    function(input, output, session) {
      count <- reactiveVal(0)
      observeEvent(input$button, {
        count(count() + 2)
      })
      output$out <- renderText({
        count()
      })
      count
    }
  )
}

# 成分靶点 ----
ingredientsTagetsServer <- function(id) { # 中药方剂
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

# 疾病靶点 ----
diseaseTagetsServer <- function(id) { # 中药方剂
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

# 靶点通路 ----
tagetsPathwayServer <- function(id) { # 中药方剂
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

# 研究文献 ----
refsServer <- function(id) { # 中药方剂
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

# 靶点交集 ----
commonTargetsServer <- function(id) { # 中药方剂
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

# 网络药理 ----
networkServer <- function(id) { # 中药方剂
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

# 蛋白互作 ----
ppiServer <- function(id) { # 中药方剂
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

# GO分析 ----
goServer <- function(id) { # 中药方剂
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

# KEGG分析 ----
keggServer <- function(id) { # 中药方剂
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


