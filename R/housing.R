#' @title {Bautaetigkeit und Wohnen (Building activity and housing)}
#' @description {Get data from LIS about building activity and housing}
#' @param rubrik_nr Number (1 to 5)
#' \itemize{
#' \item {1 = Wohnungsbestand (yearly data only)}
#' \item {2 = Wohnsituation (yearly data only)}
#' \item {3 = Wohnungsmieten (yearly data only)}
#' \item {4 = Baugenehmigungen}
#' \item {5 = Baufertigstellungen (yearly data only)}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_housing(rubrik_nr = 1)
#' }
#' @export
get_lis_housing <- function(rubrik_nr = 1,
                            periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:5) {
    stop("'rubrik_nr' must be between 1 and 5!")
  }

  kategorie_nr <- 6
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
