#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinyjs
#' @import shinyWidgets
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    # fluidPage(
    #   golem::golem_welcome_page()
    # )
    tags$style(type="text/css", "body {padding-top: 50px;}"),
    navbarPage(
      title = a("中药智鉴(TCM-IQE)",herf="https://github.com/CMSNUT/tcmiqe.git", target="_blank"),
      theme = "mytheme.css",
      id = "tabs",
      position = "fixed-top",

      # 主页home ----
      tabPanel(
        title = "主页",
        value = "home",
        icon = icon("home"),
        mod_home_ui("home")
      ),

      # 网络药理 ----
      navbarMenu(
        title = "网络药理",
        icon = icon("home"),

        ## 数据查询 ----
        tabPanel(
          title = "数据查询",
          value = "search",
          icon = icon("home"),
          mod_search_ui("search")
        ),

        ## 调控网络 ----
        tabPanel(
          title = "调控网络",
          value = "netpharm",
          icon = icon("home"),
          mod_netpharm_ui("netpharm")
        )
      ),

      # 生信分析 ----
      navbarMenu(
        title = "生信分析",
        icon = icon("home"),

        ## 基础统计 ----
        tabPanel(
          title = "基础统计",
          value = "statistics",
          icon = icon("home"),
          mod_statistics_ui("statistics")
        ),

        ## 生存分析 ----
        tabPanel(
          title = "生存分析",
          value = "survival",
          icon = icon("home"),
          mod_survival_ui("survival")
        ),

        ## Cox回归 ----
        tabPanel(
          title = "生存分析",
          value = "cox",
          icon = icon("home"),
          mod_cox_ui("cox")
        ),

        ## 差异表达 ----
        tabPanel(
          title = "差异表达",
          value = "deg",
          icon = icon("home"),
          mod_deg_ui("deg")
        ),

        ## 富集分析 ----
        tabPanel(
          title = "富集分析",
          value = "erichment",
          icon = icon("home"),
          mod_erichment_ui("erichment")
        )
      ),

      # 多元谱学 ----
      navbarMenu(
        title = "多元谱学",
        icon = icon("home"),

        ## 数据预处理 ----
        tabPanel(
          title = "数据处理",
          value = "pretreat",
          icon = icon("home"),
          mod_pretreat_ui("pretreat")
        ),

        ## 多元校正 ----
        tabPanel(
          title = "多元校正",
          value = "multivar",
          icon = icon("home"),
          mod_multivar_ui("multivar")
        )
      ),

      # 虚拟筛选 ----
      navbarMenu(
        title = "虚拟筛选",
        icon = icon("home"),

        ## QSAR ----
        tabPanel(
          title = "QSAR",
          value = "qsar",
          icon = icon("home"),
          mod_qsar_ui("qsar")
        ),

        ## 分子对接 ----
        tabPanel(
          title = "分子对接",
          value = "dock",
          icon = icon("home"),
          mod_dock_ui("dock")
        ),

        ## 分子动力学 ----
        tabPanel(
          title = "分子动力学",
          value = "md",
          icon = icon("home"),
          mod_md_ui("md")
        )
      )
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
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "tcmiqe"
    )
  )
}
