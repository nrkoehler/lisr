#' @title {Energie und Umwelt (Energy and environment)}
#' @description {Get data from LIS about energy and environment}
#' @note {Only yearly data are available}
#' @param rubrik_nr Number (1, 3, 4)
#' \itemize{
#' \item {1 = Immissionen}
#' \item {3 = Wasserhygiene}
#' \item {4 = Energieverbrauch}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_environ(rubrik_nr = 1)
#' }
#' @export
get_lis_environ <- function(rubrik_nr = 1) {

  # check for right rubrik_nr
  if (!rubrik_nr %in% c(1, 3, 4)) {
    stop("'rubrik_nr' must be 1, 3 or 4!")
  }

  kategorie_nr <- 13
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
#' @title {Strassenbaumkataster (Trees, planted)}
#' @description {Trees planted in Leipzig}
#' @references{
#' https://opendata.leipzig.de/dataset/strassenbaumkataster/resource/476c4909-89f8-439a-b353-4ee8d28d74d7
#' }
#' @examples
#' \dontrun{
#' get_lis_trees()
#' }
#' @return Data frame with 6 columns
#' \itemize{
#' \item {OBJECTID} {(Running number)}
#' \item {STRASSE_NAME} {(Name of street)}
#' \item {ORTSTEIL} {(Name of local district)}
#' \item {BAUMART_WISSENSCHAFTLICH} {(Name of tree, Latin)}
#' \item {BAUMART_DEUTSCH} {(Name of tree, German)}
#' \item {PFLANZJAHR} {(Year the tree was planted)}
#' }
#' @export
get_lis_trees <- function(...) {
  url <- "https://geodienste.leipzig.de/l3/OpenData//wfs?VERSION=1.3.0&REQUEST=getFeature&typeName=OpenData%3ABaeume&format_options=filename:Baumkataster_Stadt_Leipzig.csv&outputFormat=csv"

  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  # data <- read.delim(tmpFile, sep = ",", comment.char="#",
  #                    fileEncoding = 'utf-8')
  data <- lisr:::read_csv3(data = tmpFile)
  colnames(data) <- toupper(colnames(data))
  data$OBJECTID <- as.character(data$OBJECTID)
  data <- data

}
NULL
