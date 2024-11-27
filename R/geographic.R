#' @title {Stadtgebiet und Witterung (Administrative area and weather)}
#' @description {Get data from LIS about geography and weather}
#' @note {Only yearly data are available}
#' @param rubrik_nr Number (1 to 3)
#' \itemize{
#' \item {1 = Geographische Lage}
#' \item {2 = Flaeche und Nutzungsarten}
#' \item {3 = Wetterdaten}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_geo(rubrik_nr = 1)
#' }
#' @export
get_lis_geo <- function(rubrik_nr = 1) {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:3) {
    stop("'rubrik_nr' must be between 1 and 3!")
  }

  kategorie_nr <- 1
  periode = "y"
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
#' @title {Shapefile mit Grenzen der Bezirke / Ortsteile (Shapefile)}
#' @description {Shapefile with Leipzig's borders}
#' @param shape "Ortsteile" (default) or "Bezirke"
#' @references{
#' https://opendata.leipzig.de/dataset/geo-datensatze-zu-ortsteilen-und-stadtbezirken
#' }
#' @return Spatial data frame with 5 columns
#' \itemize{
#' \item {OT} {(ID of smaller local districts)}
#' \item {SBZ} {(ID of larger administrative districts)}
#' \item {Name} {(Name of smaller local / larger administrative districts)}
#' \item {geometry} {(Longitude, latitude etc.)}
#' }
#' @importFrom sf st_read
#' @export
get_lis_shapefile <- function(shape = "Ortsteile", ...) {

  # check for right input
  if (!shape %in% paste(c('Ortsteile', 'Bezirke'))) {
    stop("Input must be either 'Ortsteile' or 'Bezirke'.
         Please check for typos!")
  }

  if (shape == "Ortsteile") x <- "Leipzig_Ortsteile_UTM33N.zip"
  if (shape == "Bezirke") x <- "Leipzig_Stadtbezirke_UTM33N.zip"

  url <- paste0(
    "https://www.leipzig.de/fileadmin/mediendatenbank/leipzig-de/Stadt/",
    "02.1_Dez1_Allgemeine_Verwaltung/12_Statistik_und_Wahlen/Geodaten/",
    x
  )
  temp <- tempfile()
  temp2 <- tempfile()
  download.file(url, destfile = temp, method = "curl")
  unzip(zipfile = temp, exdir = temp2)
  data <- list.files(temp2, pattern = ".shp$", full.names=TRUE)
  data <- sf::st_read(data)

}
NULL
