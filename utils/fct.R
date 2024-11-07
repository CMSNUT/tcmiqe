library(RSQLite)
library(jsonlite)
library(readxl)
library(writexl)
library(tidyverse)
library(ggpubr)


# 获取数据表的全部数据 ----
getAllData <- function(db, table) {
  con <- dbConnect(SQLite(), db)
  rs <- dbReadTable(con, table)
  dbDisconnect(con)
  return(rs)
}

# 更新数据表一条数据 ----
updateEntry <- function(db, table, values, conditons) {
  con <- dbConnect(SQLite(), db)
  # query <- paste0("'",list,sep="'",collapse = ",")
  rs1 <- dbListFields(con, table)
  rs2 <- paste(rs1, values, sep = "='", collapse = "',") %>% paste0(., "'")

  dbSendQuery(con, paste0("UPDATE ", table, " SET ", rs2, " WHERE ", conditons))

  dbDisconnect(con)
}

# 删除数据表一条数据 ----
deleteEntry <- function(db, table, conditons) {
  con <- dbConnect(SQLite(), db)
  dbSendQuery(con, paste0("DELETE FROM ", table, " WHERE ", conditons))
  dbDisconnect(con)
}


# 新增数据表一条数据 ----
putEntry <- function(db, table, values) {
  con <- dbConnect(SQLite(), db)
  # query <- paste0("'",list,sep="'",collapse = ",")
  dbSendQuery(con, paste0("INSERT INTO ", table, " VALUES (", values, ")"))
  dbDisconnect(con)
}
