#' @title {Wahlen (Polls)}
#' @description {Get data from LIS about polls}
#' @param rubrik_nr Number (1 to 4)
#' \itemize{
#' \item {1 = Europawahlen}
#' \item {2 = Bundestagswahlen}
#' \item {3 = Landtagswahlen}
#' \item {4 = Stadtratswahlen}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_polls(rubrik_nr = 1)
#' }
get_lis_polls <- function(rubrik_nr = 1) {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:4) {
    stop("'rubrik_nr' must be between 1 and 4!")
  }

  kategorie_nr <- 15
  periode <- "y"
  url <- paste0(
    "https://statistik.leipzig.de/opendata/api/values?kategorie_nr=",
    kategorie_nr,
    "&rubrik_nr=",
    rubrik_nr,
    "&periode=",
    periode,
    "&format=csv"
  )

  tmpFile <- tempfile()

  download.file(url, destfile = tmpFile, method = "curl")

  data <- lisr:::read_csv3(data = tmpFile)
}
NULL
