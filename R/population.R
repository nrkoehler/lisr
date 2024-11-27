#' @title {Bevoelkerungsbestand (Population)}
#' @description {Get data from LIS about the population of Leipzig}
#' @param rubrik_nr Number (1, 2, 5)
#' \itemize{
#' \item {1 = Einwohner}
#' \item {2 = Einwohner nach Alter}
#' \item {5 = Wohnberechtigte Einwohner nach Alter}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_pop(rubrik_nr = 1)
#' }
#' @importFrom readr read_csv
#' @export
get_lis_pop <- function(rubrik_nr = 1,
                        periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% c(1, 2, 5)) {
    stop("'rubrik_nr' must be 1, 2 or 5!")
  }

  kategorie_nr <- 2
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
#' @title {Bevoelkerungsbewegung (Population movement)}
#' @description {Get data from LIS about population movement}
#' @param rubrik_nr Number (1 to 5)
#' \itemize{
#' \item {1 = Geborene und Gestorbene (Amtliche Daten)}
#' \item {2 = Geborene und Gestorbene (Melderegisterdaten)}
#' \item {3 = Eheschliessungen und Ehescheidungen (yearly data only)}
#' \item {4 = Wanderungen (Amtliche Daten)}
#' \item {5 = Wanderungen (Melderegisterdaten)}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_move(rubrik_nr = 1)
#' }
#' @export
get_lis_move <- function(rubrik_nr = 1,
                         periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:5) {
    stop("'rubrik_nr' must be between 1 and 5!")
  }

  kategorie_nr <- 3
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
