#' @title {Kleinraeumige Daten (Leipzig's districts)}
#' @description {Get data from LIS about Leipzig's districts}
#' @param kategorie_nr Number (1 to 10 and 12)
#' \itemize{
#' \item {1 = Lage und Territorium (Geography)}
#' \item {2 = Bevoelkerungsbestand (Population)}
#' \item {3 = Bevoelkerungsbewegung (Population movement)}
#' \item {4 = Gesundheit und Soziales (Public health and social affairs)}
#' \item {5 = Bildung (Education)}
#' \item {6 = Bautaetigkeit und Wohnen (Building activity and housing)}
#' \item {7 = Erwerbstaetigkeit und Arbeitsmarkt (Occupation and labour market)}
#' \item {8 = Wirtschaft (Economy)}
#' \item {9 = Einkommen und Preise (Income and prices)}
#' \item {10 = Verkehr (Traffic)}
#' \item {12 = Oeffentliche Ordnung und Infrastruktur (Crime)}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_kd(kategorie_nr = 1)
#' }
#' @export
get_lis_kd <- function(kategorie_nr = 1) {

  # check for right kategorie_nr
  if (!kategorie_nr %in% c(1:10, 12)) {
    stop("'kategorie_nr' must be either between 1 and 10 or 12!")
  }

  url <- paste0(
    "https://statistik.leipzig.de/opendata/api/kdvalues?kategorie_nr=",
    kategorie_nr,
    "&rubrik_nr=1&periode=y&format=csv"
  )

  tmpFile <- tempfile()

  download.file(url, destfile = tmpFile, method = "curl")

  data <- lisr:::read_csv3(data = tmpFile)
}
NULL
