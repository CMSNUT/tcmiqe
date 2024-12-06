#' search UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList actionButton
#' @importFrom DT DTOutput
#' @importFrom shinydashboard box
#' @importFrom shinyWidgets radioGroupButtons

mod_netpharm_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shinydashboard::box(
      width = 2,
      selectInput(
        ns("dbType"),
        "选择数据库类型",
        c(在线查询 = "online", 本地查询 = "local")
      )
    ),
    shinydashboard::box(
      width = 10,
      uiOutput(ns("ui"))
    ),
    shinydashboard::box(
      width = 12,
      uiOutput(ns("query"))
    ),

    shinydashboard::box(width = 12, status = "primary", solidHeader = TRUE, DT::DTOutput(ns("dbTable"))),
    shinydashboard::box(width = 12, downloadButton(ns("downBtn"), "下载结果",icon=icon("download")))
  )
}

#' search Server Functions
#'
#' @importFrom DT renderDT
#' @importFrom writexl write_xlsx
#' @import dplyr
#' @noRd
mod_netpharm_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # 获取 在线中医数据库 信息 ----
    db_online <- get("online") %>% as.data.frame
    db_online[, 1] <- paste0("<a href='",
                             db_online[, 2],
                             "' target='_blank'>",
                             db_online[, 1],
                             "</a>")
    db_online[, 5] <- paste0("<a href='https://doi.org/",
                             db_online[, 5],
                             "' target='_blank'>",
                             db_online[, 5],
                             "</a>")
    db_online <- db_online[, -2]

    # 定义反应式数据 ----
    db <- reactiveVal()
    df <- reactiveVal()
    ps <- reactiveVal()
    es <- reactiveVal()


    # 数据类型选择框反应 ----
    observeEvent(input$dbType, {
      if (input$dbType == 'local') {

        ## 本地数据选择框 界面 ----
        output$ui <- renderUI({
            shinyWidgets::radioGroupButtons(
              ns("localDB"),
              "选择本地数据库",
              c(
                "中药方剂" = "formula",
                "中药材" = "herb",
                "药物成分" = "ingredient",
                "临床疾病" = "disease",
                "治疗靶点" = "target",
                "中医症候" = "syndrome",
                "西医症状" = "symptom"
              ),
              # direction = "vertical",
              justified = TRUE,
              checkIcon = list(yes = icon("ok", lib = "glyphicon"))
            )


        })

        ## 本地数据 搜索框 界面 ----
        output$query <- renderUI({
          tagList(
            shinydashboard::box(
              width = 11,
              textInput(ns("queryText"), "", width = "100%",
                        # placeholder = "查询方剂、中药、成分、靶点、疾病、中医症候、西医症状...")
                        placeholder = ps())
            ),
            shinydashboard::box(
              width = 1,
              br(),
              actionButton(
                ns("searchBtn"),
                "",
                width = "100%",
                icon = icon("search")
              )
            ),
            shinydashboard::box(
              width = 12,
              div(es())
            )
          )
        })
      }
      else {
        output$ui <- renderUI("")
        output$query <- renderUI("")
      }
    })

    # 数据表响应 ----
    observeEvent(db(),{
      if (! is.null(db())) {
        output$dbTable <- renderDT(
          db(),
          escape = FALSE,
          # filter = 'top',
          options = list(
            pageLength = 20,
            dom = 'tip',
            scrollX = TRUE,
            language = list(
              info = '第 _START_ 至 _END_ 项，共 _TOTAL_ 项',
              # search = '搜索:',
              paginate = list(`previous` = '上页', `next` = '下页'),
              lengthMenu = '_MENU_ 项 / 页'
            )
          )
        )
      }
    })

    # 本地数据类别单选框 响应 ----
    observeEvent(input$localDB, {
      db(NULL)
      data <- get(input$localDB) %>% as.data.frame
      df(data)
      txt <- get("htxt") %>% as.data.frame
      txt2 <- getQueryDB(txt,input$localDB)
      ps(txt2[1,2])
      es(txt2[1,3])
    })

    # 搜索按钮 响应 ----
    observeEvent(input$searchBtn, {
      req(input$queryText)
      data <- df()
      data2 <- getQueryDB(data,input$queryText)
      db(data2)
    })

    # 数据类型 选择框 响应 ----
    observeEvent(input$dbType, {
      if (input$dbType == "online") {
        data <- db_online
        db(data)
      } else {
        db(NULL)
      }
    })

    # 下载按钮 响应 ----
    output$downBtn <- downloadHandler(
      req(db()),
      filename = function() {
        # Use the selected dataset as the suggested file name
        "result.xlsx"
      },
      content = function(file) {
        # Write the dataset to the `file` that will be downloaded
        write_xlsx(db(), file)
      }
    )
  })
}

## To be copied in the UI
# mod_netpharm_ui("search_1")

## To be copied in the server
# mod_netpharm_server("search_1")
