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
      dashboardHeader(
        title=tags$b("中药智鉴(TCM-IQE)")
      ),

      # 侧边栏 sidebar ----
      dashboardSidebar(
        sidebarMenu(
          id="tabs",

          ## 主页 ----
          menuItem(
            "主页",
            tabName = "home",
            icon = icon("home")
          ),

          ## 网络药理学 ----
          menuItem(
            "网络药理学",
            icon = icon("th"),

            menuSubItem("重要研究工具",tabName = "tool"),
            menuSubItem("网络药理分析",tabName = "netpharm")
          ),

          ## 生物信息学 ----
          menuItem(
            "生物信息学",
            icon = icon("th"),

            menuSubItem("生信数据",tabName = "bioinfoData"),
            menuSubItem("统计工具",tabName = "statistics"),
            menuSubItem("生存分析",tabName = "survival"),
            menuSubItem("Cox回归",tabName = "cox"),
            menuSubItem("差异表达",tabName = "deg")
          ),

          ## 化学计量学 ----
          menuItem(
            "化学计量学",
            icon = icon("th"),

            menuSubItem("示例数据",tabName = "sampleData"),
            menuSubItem("关键算法",tabName = "algorithm"),
            menuSubItem("模型构建",tabName = "modeling")
          ),

          ## 化学信息学 ----
          menuItem(
            "化学信息学",
            icon = icon("th"),

            menuSubItem("结构转换",tabName = "struct"),
            menuSubItem("构效关系",tabName = "qsar"),
            menuSubItem("分子对接",tabName = "docking"),
            menuSubItem("分子动力学",tabName = "md")
          )
        )
      ),

      # 主窗口 body ----
      dashboardBody(
        # 使用shinyjs
        useShinyjs(),

        tabItems(
          ## 主页 ----
          tabItem(
            "home",
            div(p("home")),
            mod_home_ui("home")
          ),

          ## 网络药理学 ----
          ### 重要研究工具 ----
          tabItem(
            "tool",
            div(p("tool")),
            mod_tool_ui("tool")
          ),

          ### 网络药理分析 ----
          tabItem(
            "netpharm",
            div(p("netpharm")),
            mod_netpharm_ui("netpharm")
          ),


          ## 生物信息学 ----
          ### 生信数据 ----
          tabItem(
            "bioinfoData",
            div(p("bioinfoData")),
            mod_bioinfoData_ui("bioinfoData")
          ),

          ### 统计工具 ----
          tabItem(
            "statistics",
            div(p("statistics")),
            mod_statistics_ui("statistics")
          ),

          ### 生存分析 ----
          tabItem(
            "survival",
            div(p("survival")),
            mod_survival_ui("survival")
          ),

          ### Cox回归 ----
          tabItem(
            "cox",
            div(p("cox")),
            mod_cox_ui("cox")
          ),

          ### 差异表达 ----
          tabItem(
            "deg",
            div(p("deg")),
            mod_deg_ui("deg")
          ),


          ## 化学计量学 ----

          ### 示例数据 ----
          tabItem(
            "sampleData",
            div(p("sampleData")),
            mod_sampleData_ui("sampleData")
          ),

          ### 关键算法 ----
          tabItem(
            "algorithm",
            div(p("algorithm")),
            mod_algorithm_ui("algorithm")
          ),

          ### 模型构建 ----
          tabItem(
            "modeling",
            div(p("modeling")),
            mod_modeling_ui("modeling")
          ),

          ## 化学信息学 ----
          ### 结构转换 ----
          tabItem(
            "struct",
            div(p("struct")),
            mod_struct_ui("struct")
          ),

          ### 构效关系 ----
          tabItem(
            "qsar",
            div(p("qsar")),
            mod_qsar_ui("qsar")
          ),

          ### 分子对接 ----
          tabItem(
            "docking",
            div(p("docking")),
            mod_docking_ui("docking")
          ),

          ### 分子动力学 ----
          tabItem(
            "md",
            div(p("md")),
            mod_md_ui("md")
          )
        ),


      ),

      title = "中药智鉴", # 浏览器页面标题
      skin ="green"
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
