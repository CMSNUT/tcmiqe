#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinyjs
#' @import shinyWidgets
#'
#' @noRd

app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    # fluidPage(
    #   golem::golem_welcome_page()
    # )


    dashboardPage(
      # 标题 header ----
      dashboardHeader(title = tags$b("中药智鉴(TCM-IQE)")),

      # 侧边栏 sidebar ----
      dashboardSidebar(
        sidebarMenu(
          id = "tabs",

          ## 主页 ----
          menuItem("主页", icon = icon("home"), tabName = "home"),

          ## 中药药理分析 ----
          menuItem("中药药理分析", icon = icon("th"), tabName = "pharm"),

          ## 中药复方优化 ----
          menuItem("中药复方优化", icon = icon("th"), tabName = "fmopt"),

          ## 药材品质分析 ----
          menuItem("药材品质分析", icon = icon("th"), tabName = "quality"),

          ## 药物性质评估 ----
          menuItem("药物性质评估", icon = icon("th"), tabName = "property"),

          ## 药物优化设计 ----
          menuItem("药物优化设计", icon = icon("th"), tabName = "cadd"),

          ## 数据库 ----
          menuItem("数据库", icon = icon("th"), tabName = "database"),

          ## 工具箱 ----
          menuItem("工具箱", icon = icon("th"), tabName = "toolkit")
        )
      ),

      # 主窗口 body ----
      dashboardBody(
        # 使用shinyjs
        useShinyjs(),

        tabItems(
          ## 主页 ----
          tabItem("home", div(p("home")), mod_home_ui("home")),

          ## 中药药理分析 ----
          tabItem("pharm", div(p("pharm")), mod_home_ui("pharm")),

          ## 中药复方优化 ----
          tabItem("fmopt", div(p("fmopt")), mod_home_ui("fmopt")),

          ## 药材品质分析 ----
          tabItem("quality", div(p("quality")), mod_home_ui("quality")),

          ## 药物性质评估 ----
          tabItem("property", div(p("property")), mod_home_ui("property")),

          ## 药物优化设计 ----
          tabItem("cadd", div(p("cadd")), mod_home_ui("cadd")),

          ## 数据库 ----
          tabItem("database", div(p("database")), mod_home_ui("database")),

          ## 工具箱 ----
          tabItem("toolkit", div(p("toolkit")), mod_home_ui("toolkit"))
        )
      ),

      title = "中药智鉴",
      # 浏览器页面标题
      skin = "green"
    )
  )
}
#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path("www", app_sys("app/www"))
  tags$head(favicon(),
            bundle_resources(path = app_sys("app/www"), app_title = "tcmiqe"))
}
