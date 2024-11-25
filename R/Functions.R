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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = "utf-8")
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_',
                        substr(colnames(data), 5, 6)), colnames(data))
  }
  data
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_Q',
                                                                     substr(colnames(data), 2, 2)), colnames(data))
  }
  data
}
#' @title {Gesundheit und Soziales (Public health and social affairs)}
#' @description {Get data from LIS about public health and social affairs}
#' @param rubrik_nr Number (1, 2, 4)
#' \itemize{
#' \item {1 = Kindertageseinrichtungen (yearly data only)}
#' \item {2 = Tagespflege (yearly data only)}
#' \item {4 = Grundsicherung für Arbeitssuchende}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_health(rubrik_nr = 1)
#' }
#' @export
get_lis_health <- function(rubrik_nr = 1,
                           periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% c(1, 2, 4)) {
    stop("'rubrik_nr' must be 1, 2 or 4!")
  }

  kategorie_nr <- 4
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_',
                                                                     substr(colnames(data), 5, 6)), colnames(data))
  }
  data
}
NULL
#' @title {Bildung (Education)}
#' @description {Get data from LIS about education}
#' @note {Only yearly data are available}
#' @param rubrik_nr Number (1 to 5)
#' \itemize{
#' \item {1 = Allgemeinbildende Schulen}
#' \item {2 = Einschulungen und Nichteinschulungen}
#' \item {3 = Berufsbildende Schulen}
#' \item {4 = Hochschulen}
#' \item {5 = Volkshochschulen}
#' }
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_edu(rubrik_nr = 1)
#' }
#' @export
get_lis_edu <- function(rubrik_nr = 1) {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:5) {
    stop("'rubrik_nr' must be between 1 and 5!")
  }


  kategorie_nr <- 5
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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_Q',
                                                                     substr(colnames(data), 2, 2)), colnames(data))
  }
  data
}
NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_',
                                                                     substr(colnames(data), 5, 6)), colnames(data))
  }
  data
}
NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_Q',
                                                                     substr(colnames(data), 2, 2)), colnames(data))
  }
  data
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_Q',
                                                                     substr(colnames(data), 2, 2)), colnames(data))
  }
  data
}
NULL
#' @title {Kultur und Sport (Culture and sports)}
#' @description {Get data from LIS about culture and sports}
#' @param rubrik_nr Number (1 to 7)
#' \itemize{
#' \item {1 = Museen}
#' \item {2 = Theater}
#' \item {3 = Bibliotheken (yearly data only)}
#' \item {4 = Zoo Leipzig}
#' \item {5 = Baeder}
#' \item {6 = Sportvereine (yearly data only)}
#' \item {7 = Sporteinrichtungen (yearly data only)}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_culture(rubrik_nr = 1)
#' }
#' @export
get_lis_culture <- function(rubrik_nr = 1,
                            periode = "y") {

  # check for right rubrik_nr
  if (!rubrik_nr %in% 1:7) {
    stop("'rubrik_nr' must be between 1 and 7!")
  }

  kategorie_nr <- 11
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_Q',
                                                                     substr(colnames(data), 2, 2)), colnames(data))
  }
  data
}
NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  if (periode == "y") {
    colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  } else {
    colnames(data) <- ifelse(grepl('\\d{4}', colnames(data)), paste0("JAHR_", substr(colnames(data), 8, 11), '_Q',
                                                                     substr(colnames(data), 2, 2)), colnames(data))
  }
  data
}
NULL
#' @title {Wahlen (Polls)}
#' @description {Get data from LIS about polls}
#' @param rubrik_nr Number (1 to 4)
#' \itemize{
#' \item {1 = Europawahlen}
#' \item {2 = Bundestagswahlen}
#' \item {3 = Landtagswahlen}
#' \item {4 = Stadtratswahlen}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Vornamen (Babynames)}
#' @description {Leipzig's babynames between 2014 and 2020}
#' @param year Number (2014 to 2020)
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_babynames(year = 2020)
#' }
#' @return Data frame with 4 columns
#' \itemize{
#' \item {ANZAHL} {(Number of babys having this name)}
#' \item {VORNAME} {(Babyname)}
#' \item {GESCHLECHT} {(Sex)}
#' \item {YEAR} {(Year)}
#' }
#' @importFrom readr read_delim
#' @export
get_lis_babynames <- function(year = 2022) {

  # check for right year
  if (!year %in% 2014:2023) {
    stop("'year' must be between 2014 and 2023!")
  }

  name <- paste0("vornamensstatistik_", year)

  if (year == 2014) {
    name <- paste0("vornamensstatistik", year)
    dataset <- "c62e543b-a558-4fed-a5cb-973ba8dc787d"
    resource <- "40c25656-03aa-4d86-b27f-79484effb51b"
  } else if (year == 2015) {
    dataset <- "712164f5-a316-47f6-b157-50f5357008dc"
    resource <- "52a5d094-c79c-4cdf-8785-d2724550a0c3"
  } else if (year == 2016){
    dataset <- "af353191-ed9d-40f8-927f-de14cca5694b"
    resource <- "c263ca88-9c6d-4a31-b831-749b0c6a1d8b"
  } else if (year == 2017) {
    dataset <- "3d361523-04a3-4aef-805e-09239e5994d5"
    resource <- "77e633ff-43fd-4b82-b860-a04ccedd891a"
  } else if (year == 2018) {
    dataset <- "2ddc2b70-19ff-44fa-be8d-a205f6a96d13"
    resource <- "64f4a1fd-8eba-448d-8c09-9a7377586691"
  } else if (year == 2019) {
    dataset <- "99766e60-275e-4688-8c0f-028be2304eeb"
    resource <- "7a6612ce-746e-4355-845e-c246350feb8f"
  } else if (year == 2020) {
    dataset <- "986e5c01-ba5e-4960-8ac2-b845ae1b4dde"
    resource <- "fe2874df-e904-40c2-b532-410303d7d34b"
  } else if (year == 2021) {
    dataset <- "91e823fc-e845-47ca-9fe3-3dbe1f193815"
    resource <- "9b7e230b-dbea-44c0-9354-94a226e32cd2"
  } else if (year == 2022) {
    dataset <- "190c9591-3e84-49eb-b2a2-9ceea7958a5d"
    resource <- "8886df20-74b8-48d9-ac96-688113b22a03"
  } else if (year == 2023) {
    dataset <- "a2f12d0f-ebad-4bb5-9b79-0e7077cbb800"
    resource <- "1dd0bdde-9fab-415f-ad4e-7b9246cf5739"
  } else {
    stop("Jahresangabe muss zwischen 2014 und 2023 liegen!", call. = FALSE)
  }


  url <- paste0(
    "https://opendata.leipzig.de/dataset/",
    dataset, "/resource/",
    resource, "/download/", name, ".csv"
  )

  # separator <- ifelse(year < 2020, ',', ',')
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  # data <- read.delim(tmpFile, sep = separator, dec = ",", fileEncoding = 'utf-8')
  data <- readr::read_delim(tmpFile, delim = ',',
                            show_col_types = FALSE)

  if (year %in% 2014:2020) {
    df.f <- data[2:4]
    df.m <- data[7:9]
    colnames(df.m) <- colnames(df.f)
    data <- rbind(df.f, df.m)
  } else if (year %in% 2021:2023) {
    data <- subset(data, position == 1)
    data <- data[1:3]
  }
  data <- na.omit(data)
  data$YEAR <- year
  colnames(data) <- c("ANZAHL", "VORNAME", "GESCHLECHT", "YEAR")
  data <- data[order(data$ANZAHL), ]
  data$GESCHLECHT <- tolower(data$GESCHLECHT)
  data <- subset(data, GESCHLECHT %in% c('w', 'm'))
}

NULL
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Straßenbaumkataster (Trees, planted)}
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
  dataset <- "8024d039-9b75-4154-a4ad-05968094f4eb"
  id <- "476c4909-89f8-439a-b353-4ee8d28d74d7"
  date <- "12032020"
  url <- paste0(
    "https://opendata.leipzig.de/dataset/",
    dataset, "/resource/",
    id, "/download/strassenbaumkatasterleipzig",
    date, ".csv"
  )
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  data <- read.delim(tmpFile, sep = ";", comment.char="#",
                     fileEncoding = 'WINDOWS-1252')
  data$SHAPE <- NULL
  colnames(data) <- toupper(colnames(data))
  data$STANDORTNUMMER <- as.character(data$STANDORTNUMMER)
  data
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
  subset(data, !is.na(ORTSTEIL))
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
  data
}
NULL
