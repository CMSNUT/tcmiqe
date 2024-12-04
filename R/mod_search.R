#' search UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom DT DTOutput
#' @importFrom shinydashboard box
#' @importFrom shinyWidgets radioGroupButtons actionBttn
mod_search_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tabsetPanel(
      id = ns("tabs"),
      tabPanel(
        title = "在线查询",
        value = ns("online"),
        shinydashboard::box(
          width = 12,
          status = "primary",
          div(p("在下列在线数据库中检索结果")),
          DT::DTOutput(ns("onlineTable"))
        )
      ),
      tabPanel(
        title = "本地查询",
        value = ns("local"),
        shinydashboard::box(
          width = 12,
          status = "primary",
          radioGroupButtons(
              inputId = ns("dbSelected"),
              label = "",
              choices = c(
                "中药方剂" = "formula",
                "中药材" = "herb",
                "药物成分" = "ingredient",
                "临床疾病" = "disease",
                "治疗靶点" = "target",
                "中医症候" = "syndrome",
                "西医症状" = "symptom"
              ),
              justified = TRUE,
              checkIcon = list(yes = icon("ok", lib = "glyphicon"))
            )
        ),
        shinydashboard::box(width = 12,uiOutput(ns("queryUI"))),
        shinydashboard::box(width = 12, status = "primary", DT::DTOutput(ns("localTable")))
      )
    )
  )
}

#' search Server Functions
#'
#' @importFrom DT renderDT %>%
#' @noRd
mod_search_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    df <- reactiveVal()

    observeEvent(input$tabs, {
      if (input$tabs == ns("online")) {
        # print("online")
        output$onlineTable <- renderDT(
          # online %>% lapply(.,factor) %>% as.data.frame,
          online,
          escape = FALSE,
          # filter = 'top',
          options = list(
            pageLength = 20,
            dom = 'tipr',
            scrollX = TRUE,
            language = list(
              info = '第 _START_ 至 _END_ 项，共 _TOTAL_ 项',
              # search = '搜索:',
              paginate = list(`previous` = '上页', `next` = '下页'),
              lengthMenu = '_MENU_ 项 / 页'
            )
          )
        )

      } else {
        observeEvent(input$dbSelected, {
          if (input$dbSelected == "formula") {
            searchTitle <- "中药方剂查询"
            searchPlaceholder <- "输入中药方剂中文名称/中文拼音/英文名称，如真武汤/Zhen Wu Tang/Zhen Wu Decoction"
          } else if (input$dbSelected == "herb") {
            searchTitle <- "中药材查询"
            searchPlaceholder <- "输入中药材中文名称/中文拼音/拉丁名称，如附子/Fu Zi/radix aconiti carmichaeli"
          } else if (input$dbSelected == "ingredient") {
            searchTitle <- "药物成分查询"
            searchPlaceholder <- "输入药物成分中文名称/英文名称/SMILES/PubChem Cid/CAS/分子式，如"
          } else if (input$dbSelected == "disease") {
            searchTitle <- "临床疾病查询"
            searchPlaceholder <- "输入疾病中文名称/英文名称，如"
          } else if (input$dbSelected == "target") {
            searchTitle <- "治疗靶点查询"
            searchPlaceholder <- "输入靶蛋白中文名称/GenID，如附子"
          } else if (input$dbSelected == "syndrome") {
            searchTitle <- "中医症候查询"
            searchPlaceholder <- "输入中医症候中文名称/英文名称，如"
          } else if (input$dbSelected == "symptom") {
            searchTitle <- "西医症状查询"
            searchPlaceholder <- "输入西医症状中文名称/英文名称，如"
          }

          output$queryUI <- renderUI({

            tagList(
              shinydashboard::box(
                width = 10,
                textInput(
                  ns("queryWord"),
                  searchTitle,
                  width = "100%",
                  placeholder = searchPlaceholder
                )
              ),
              shinydashboard::box(
                width = 2,
                br(),
                actionButton(
                  ns("searchBtn"),
                  "",
                  color = "danger",
                  icon = icon("search")
                )
              )
            )

          }

          )
        })
      }
    })

    myFilter <- function(data,) {

    }

    observeEvent(input$searchBtn,{
      req(input$queryWord)
      output$localTable <- renderDT(
          get(input$dbSelected) %>% myFilter(),
          escape = FALSE,
          # filter = 'top',
          options = list(
            pageLength = 20,
            dom = 'tipr',
            scrollX = TRUE,
            language = list(
              info = '第 _START_ 至 _END_ 项，共 _TOTAL_ 项',
              # search = '搜索:',
              paginate = list(`previous` = '上页', `next` = '下页'),
              lengthMenu = '_MENU_ 项 / 页'
            )
          )
        )

    })

  })
}

## To be copied in the UI
# mod_search_ui("search_1")

## To be copied in the server
# mod_search_server("search_1")
