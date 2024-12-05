#' @title {Wahlen (Polls)}
#' @description {Get data from LIS about polls}
#' @param rubrik_nr Number (1 to 4)
#' \itemize{
#' \item {1 = Europawahlen}
#' \item {2 = Bundestagswahlen}
#' \item {3 = Landtagswahlen}
#' \item {4 = Stadtratswahlen}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_polls(rubrik_nr = 1)
#' }
#' @export
get_lis_polls <- function(rubrik_nr = 1) {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:4) {
    stop("'rubrik_nr' must be between 1 and 4!")
  }

  kategorie_nr <- 15
  periode <- "d"
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
#' @title {Bundestagswahlen 2021 (Polls)}
#' @description {Wahlergebnisse der Bundestagswahlen 2021 auf 3 Ebenen:}
#' \itemize{
#' \item {Stadtergebnis}
#' \item {Ortsteilergebnisse}
#' \item {Wahlkreisergebnisse}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_bundestag()
#' }
#' @export
get_lis_bundestag <- function(...) {

  # stadt
  url <- "https://opendata.leipzig.de/dataset/fff8cfc0-a4aa-4627-89ed-a46bb6a29c59/resource/8322e9af-940c-4b71-a2f4-fc1f1c0aa4b0/download/open-data-bundestagswahl-_land-sachsen_3-1.csv"
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  stadt <- readr::read_delim(file = tmpFile, delim = ";")
  stadt$location <- "Stadtergebnis"
  # ortsteil
  url <- "https://opendata.leipzig.de/dataset/8354f558-9291-44a4-b487-35577e5ea2ec/resource/78c648fd-ef32-4852-8d86-eb9603d4b378/download/open-data-bundestagswahl-_land-sachsen_3-3.csv"
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  ot <- readr::read_delim(file = tmpFile, delim = ";")
  ot$location <- "Ortsteilergebnisse"
  # wahlkreis
  url <- "https://opendata.leipzig.de/dataset/f5b27739-e3dd-49ca-95cd-9b0e9b907684/resource/07498708-915c-4ae7-995c-68b637c5b8a2/download/open-data-bundestagswahl-_land-sachsen_36.csv"
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  wk <- lisr:::read_csv3(data = tmpFile)
  wk$location <- "Wahlkreisergebnisse"
  colnames(wk) <- colnames(ot)

  data <- rbind(stadt, ot, wk)

  colnames(data) <- c(
    "data", "wahl", "ags", "gebiet_nr", "gebiet_name",
    "max_schnellmeldungen", "anz_schnellmeldungen",
    "wahlberechtigte_ohne_sperrvermerk",
    "wahlberechtigte_mit_sperrvermerk",
    "wahlberechtigte_nicht_aufgefuehrt",
    "wahlberechtigte_gesamt",
    "waehler", "waehler_mit_wahlschein",
    "erststimmen_ungueltig",
    "erststimmen_gueltig",
    "zweitstimmen_ungueltig",
    "zweitstimmen_gueltig",
    "erststimmen_afd",
    "zweitstimmen_afd",
    "erststimmen_cdu",
    "zweitstimmen_cdu",
    "erststimmen_linke",
    "zweitstimmen_linke",
    "erststimmen_spd",
    "zweitstimmen_spd",
    "erststimmen_fdp",
    "zweitstimmen_fdp",
    "erststimmen_gruene",
    "zweitstimmen_gruene",
    "erststimmen_tierschutz_na",
    "zweitstimmen_tierschutz",
    "erststimmen_partei",
    "zweitstimmen_partei",
    "erststimmen_npd_na",
    "zweitstimmen_npd",
    "erststimmen_fw",
    "zweitstimmen_fw",
    "erststimmen_piraten",
    "zweitstimmen_piraten",
    "erststimmen_oedp",
    "zweitstimmen_oedp",
    "erststimmen_veganer_na",
    "zweitstimmen_veganer",
    "erststimmen_mlpd",
    "zweitstimmen_mlpd",
    "erststimmen_basis",
    "zweitstimmen_basis",
    "erststimmen_buendnisc_na",
    "zweitstimmen_buendnisc",
    "erststimmen_dritterweg_na",
    "zweitstimmen_dritterweg",
    "erststimmen_dkp_na",
    "zweitstimmen_dkp",
    "erststimmen_humanisten",
    "zweitstimmen_humanisten",
    "erststimmen_gesundheit_na",
    "zweitstimmen_gesundheit",
    "erststimmen_gerechtigkeit_na",
    "zweitstimmen_gerechtigkeit",
    "erststimmen_volt_na",
    "zweitstimmen_volt",
    "erststimmen_leipziger",
    "zweitstimmen_leipziger_na",
    "erststimmen_karlkommt",
    "zweitstimmen_karlkommt_na",
    "erststimmen_wir",
    "zweitstimmen_wir_na",
    "erststimmen_bayer",
    "zweitstimmen_bayer_na",
    "erststimmen_schoellner",
    "zweitstimmen_schoellner_na",
    "ebene"
  )

  data <- data

}
NULL
