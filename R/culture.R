#' @title {Kultur und Sport (Culture and sports)}
#' @description {Get data from LIS about culture and sports}
#' @param rubrik_nr Number (1 to 7)
#' \itemize{
#' \item {1 = Museen}
#' \item {2 = Theater}
#' \item {3 = Bibliotheken (yearly data only)}
#' \item {4 = Zoo Leipzig}
#' \item {5 = Baeder}
#' \item {6 = Sportvereine (yearly data only)}
#' \item {7 = Sporteinrichtungen (yearly data only)}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_culture(rubrik_nr = 1)
#' }
#' @export
get_lis_culture <- function(rubrik_nr = 1,
                            periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:7) {
    stop("'rubrik_nr' must be between 1 and 7!")
  }

  kategorie_nr <- 11
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
