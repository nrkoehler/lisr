#' @title {Erwerbstaetigkeit und Arbeitsmarkt (Occupation and labour market)}
#' @description {Get data from LIS about occupation and labour market}
#' @param rubrik_nr Number (1 to 3)
#' \itemize{
#' \item {1 = Beschaeftigte}
#' \item {2 = Auszubildende (yearly data only)}
#' \item {3 = Arbeitslose}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_labour(rubrik_nr = 1)
#' }
#' @export
get_lis_labour <- function(rubrik_nr = 1,
                           periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:3) {
    stop("'rubrik_nr' must be between 1 and 3!")
  }

  kategorie_nr <- 7
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
