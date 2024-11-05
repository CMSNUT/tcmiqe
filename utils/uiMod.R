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
formulaHerbUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 中药成分 ----
herbIngredientsUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 成分靶点 ----
ingredientsTagetsUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 疾病靶点 ----
diseaseTagetsUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 靶点通路 ----
tagetsPathwayUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 研究文献 ----
refsUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 靶点交集 ----
commonTargetsUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 网络药理 ----
networkUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# 蛋白互作 ----
ppiUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# GO分析 ----
goUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}

# KEGG分析 ----
keggUI <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    h2("TCM-NP: 中药智鉴"),
    p("简介")
  )
}
