library(RSQLite)
library(jsonlite)
library(readxl)
library(writexl)
library(tidyverse)
library(ggpubr)


getAllData <- function(db,table) {
  con <- dbConnect(SQLite(),db)
  rs <- dbReadTable(con,table) %>% lapply(as.factor) %>% as.data.frame
  dbDisconnect(con)
  return(rs)
}


putEntry <- function(db,table,query) {
  con <- dbConnect(SQLite(),db)
  # query <- paste0("'",list,sep="'",collapse = ",")
  dbSendQuery(con, paste0("INSERT INTO ",table," VALUES (",query,")"))
}
