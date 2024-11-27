#' @title {Wirtschaft (Economy)}
#' @description {Get data from LIS about economy}
#' @param rubrik_nr Number (1 to 12)
#' \itemize{
#' \item {1 = Unternehmen (yearly data only)}
#' \item {2 = Handwerksbetriebe (yearly data only)}
#' \item {3 = Verarbeitendes Gewerbe}
#' \item {4 = Bauhauptgewerbe}
#' \item {5 = Ausbaugewerbe}
#' \item {6 = Gewerbemeldungen (yearly data only)}
#' \item {7 = Insolvenzverfahren (yearly data only)}
#' \item {8 = Beherbergungskapazitaet (yearly data only)}
#' \item {9 = Ankuenfte und Uebernachtungen}
#' \item {10 = Gaeste nach Herkunftslaendern (yearly data only)}
#' \item {11 = Messen und Ausstellungen (yearly data only)}
#' \item {12 = Bruttoinlandsprodukt und Bruttowertschoepfung (yearly data only)}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_economy(rubrik_nr = 1)
#' }
#' @export
get_lis_economy <- function(rubrik_nr = 1,
                            periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:12) {
    stop("'rubrik_nr' must be between 1 and 12!")
  }

  kategorie_nr <- 8
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
