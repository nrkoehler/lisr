#' @title {Verkehr (Traffic and public transport)}
#' @description {Get data from LIS about traffic and public transport}
#' @param rubrik_nr Number (1 to 5)
#' \itemize{
#' \item {1 = Strassennetz (yearly data only)}
#' \item {2 = Kraftfahrzeugbestand (yearly data only)}
#' \item {3 = Verkehrsunfaelle}
#' \item {4 = Personennahverkehr (yearly data only)}
#' \item {5 = Luftverkehr}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_traffic(rubrik_nr = 1)
#' }
#' @export
get_lis_traffic <- function(rubrik_nr = 1,
                            periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:5) {
    stop("'rubrik_nr' must be between 1 and 5!")
  }

  kategorie_nr <- 10
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
#' @title {Strassennamenverzeichnis (Streets register)}
#' @description {Register of Leipzig's streets}
#' @references{
#' https://www.leipzig.de/buergerservice-und-verwaltung/unsere-stadt/gebietsgliederung-und-strassennamen/strassennamen/
#' }
#' @examples
#' \dontrun{
#' get_lis_trees()
#' }
#' @return Data frame with 5 columns
#' \itemize{
#' \item {STADTBEZIRKSNUMMER} {(ID of larger administrative districts)}
#' \item {STADTBEZIRKSNAME} {(Name of larger administrative districts)}
#' \item {ORTSTEIL} {(ID of smaller local district)}
#' \item {ORTSTEILNAME} {(Name of smaller local districts)}
#' \item {STRASSENNAME} {(Street name)}
#' }
#' @importFrom readxl read_xlsx
#' @export
get_lis_streets <- function(...) {
  dataset <- "8024d039-9b75-4154-a4ad-05968094f4eb"
  id <- "476c4909-89f8-439a-b353-4ee8d28d74d7"
  date <- "12032020"
  url <- paste0(
    "https://static.leipzig.de/fileadmin/mediendatenbank/",
    "leipzig-de/Stadt/02.1_Dez1_Allgemeine_Verwaltung/",
    "12_Statistik_und_Wahlen/Raumbezug/",
    "Strassennamenverzeichnis_ot_sbz.xlsx"
  )
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  data <- readxl::read_xlsx(tmpFile)
  colnames(data) <- toupper(colnames(data))
  colnames(data)[5] <- 'STRASSENNAME'
  data <- subset(data, !is.na(ORTSTEIL))
}
NULL
