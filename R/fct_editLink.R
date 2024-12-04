#' editLink
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
editLink <- function(link,perfix=NULL,suffix=NULL) {
  link <- paste0("<a href='",perfix,link,suffix,"' target='_blank'>",link,"</a>")
  return(link)
}
