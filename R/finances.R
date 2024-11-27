#' @title {Stadtverwaltung, Kommunalpolitik, Kommunalfinanzen (Local administration, politics and finances)}
#' @description {Get data from LIS about local administration, politics and finances}
#' @param rubrik_nr Number (1 to 10)
#' \itemize{
#' \item {1 = Personal nach Aufgabenbereichen (yearly data only)}
#' \item {2 = Personal nach Produktbereichen (yearly data only)}
#' \item {3 = Personal nach Dienstverhaeltnissen (yearly data only)}
#' \item {4 = Einnahmen (yearly data only)}
#' \item {5 = Ausgaben (yearly data only)}
#' \item {6 = Steuereinnahmen}
#' \item {7 = Realsteuervergleich (yearly data only)}
#' \item {8 = Zufriedenheit mit den Lebensbedingungen (yearly data only)}
#' \item {9 = Einsatz von Haushaltsmitteln (yearly data only)}
#' \item {10 = Probleme aus Buergersicht (yearly data only)}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_finances(rubrik_nr = 1)
#' }
#' @export
get_lis_finances <- function(rubrik_nr = 1,
                             periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:10) {
    stop("'rubrik_nr' must be between 1 and 10!")
  }

  kategorie_nr <- 14
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
#' @title {Einkommen und Preise (Income and prices)}
#' @description {Get data from LIS about income and prices}
#' @note {Only yearly data are available}
#' @param rubrik_nr Number (1 to 2)
#' \itemize{
#' \item {1 = Lebensunterhalt}
#' \item {2 = Nettoeinkommen}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_money(rubrik_nr = 1)
#' }
#' @export
get_lis_money <- function(rubrik_nr = 1) {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:2) {
    stop("'rubrik_nr' must be 1 or 2!")
  }

  kategorie_nr <- 9
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
