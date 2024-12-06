#' getQueryDB
#'
#' @description A fct function
#' @param df A dataframe data
#' @param queryText A string used for retrieving data
#' @return d, Obtained subset of df.
#'
#' @noRd
getQueryDB <- function(df, queryText) {
  rs <- rep(FALSE, nrow(df))
  for (i in c(1:ncol(df))) {
    rs <- rs | grepl(queryText, df[, i])
  }
  d <- df[rs, ]
  return(d)
}
