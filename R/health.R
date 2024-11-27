#' @title {Gesundheit und Soziales (Public health and social affairs)}
#' @description {Get data from LIS about public health and social affairs}
#' @param rubrik_nr Number (1, 2, 4)
#' \itemize{
#' \item {1 = Kindertageseinrichtungen (yearly data only)}
#' \item {2 = Tagespflege (yearly data only)}
#' \item {4 = Grundsicherung für Arbeitssuchende}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_health(rubrik_nr = 1)
#' }
#' @export
get_lis_health <- function(rubrik_nr = 1,
                           periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% c(1, 2, 4)) {
    stop("'rubrik_nr' must be 1, 2 or 4!")
  }

  kategorie_nr <- 4
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
