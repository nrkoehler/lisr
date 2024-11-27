#' @title {Bildung (Education)}
#' @description {Get data from LIS about education}
#' @note {Only yearly data are available}
#' @param rubrik_nr Number (1 to 5)
#' \itemize{
#' \item {1 = Allgemeinbildende Schulen}
#' \item {2 = Einschulungen und Nichteinschulungen}
#' \item {3 = Berufsbildende Schulen}
#' \item {4 = Hochschulen}
#' \item {5 = Volkshochschulen}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_edu(rubrik_nr = 1)
#' }
#' @export
get_lis_edu <- function(rubrik_nr = 1) {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:5) {
    stop("'rubrik_nr' must be between 1 and 5!")
  }


  kategorie_nr <- 5
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








