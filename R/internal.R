#' @title {Import csv-files}
#' @noRd
#' @keywords internal
#' @importFrom readr read_csv
read_csv3 <- function(data = tempfile) {

  data <- readr::read_csv(data,
                  show_col_types = FALSE,
                  locale = locale(decimal_mark = ",",
                                  grouping_mark = ".")
                  )
  colnames(data) <- toupper(colnames(data))
  data <- data
}
NULL
