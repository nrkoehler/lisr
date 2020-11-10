#' @title {Stadtgebiet und Witterung (Administrative area and weather)}
#' @description {Get data from LIS about geography and weather}
#' @param rubrik_nr Number (1 to 3)
#' \itemize{
#' \item {1 = Geographische Lage}
#' \item {2 = Flaeche und Nutzungsarten}
#' \item {3 = Wetterdaten}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_geo(rubrik_nr = 1)
#' }
#' @export
get_lis_geo <- function(rubrik_nr = 1,
                        periode = "y") {
  kategorie_nr <- 1
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
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Bevoelkerungsbewegung (Population movement)}
#' @description {Get data from LIS about population movement}
#' @param rubrik_nr Number (1 to 5)
#' \itemize{
#' \item {1 = Geborene und Gestorbene (Amtliche Daten)}
#' \item {2 = Geborene und Gestorbene (Melderegisterdaten)}
#' \item {3 = Eheschliessungen und Ehescheidungen}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
#' @title {Gesundheit und Soziales (Public health and social affairs)}
#' @description {Get data from LIS about public health and social affairs}
#' @param rubrik_nr Number (1, 2, 4)
#' \itemize{
#' \item {1 = Kindertageseinrichtungen}
#' \item {2 = Tagespflege}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Bildung (Education)}
#' @description {Get data from LIS about education}
#' @param rubrik_nr Number (1 to 5)
#' \itemize{
#' \item {1 = Allgemeinbildende Schulen}
#' \item {2 = Einschulungen und Nichteinschulungen}
#' \item {3 = Berufsbildende Schulen}
#' \item {4 = Hochschulen}
#' \item {5 = Volkshochschulen}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_edu(rubrik_nr = 1)
#' }
#' @export
get_lis_edu <- function(rubrik_nr = 1,
                        periode = "y") {
  kategorie_nr <- 5
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
#' \item {1 = Wohnungsbestand}
#' \item {2 = Wohnsituation}
#' \item {3 = Wohnungsmieten}
#' \item {4 = Baugenehmigungen}
#' \item {5 = Baufertigstellungen}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Erwerbstaetigkeit und Arbeitsmarkt (Occupation and labour market)}
#' @description {Get data from LIS about occupation and labour market}
#' @param rubrik_nr Number (1 to 3)
#' \itemize{
#' \item {1 = Beschaeftigte}
#' \item {2 = Auszubildende}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Wirtschaft (Economy)}
#' @description {Get data from LIS about economy}
#' @param rubrik_nr Number (1 to 12)
#' \itemize{
#' \item {1 = Unternehmen}
#' \item {2 = Handwerksbetriebe}
#' \item {3 = Verarbeitendes Gewerbe}
#' \item {4 = Bauhauptgewerbe}
#' \item {5 = Ausbaugewerbe}
#' \item {6 = Gewerbemeldungen}
#' \item {7 = Insolvenzverfahren}
#' \item {8 = Beherbergungskapazitaet}
#' \item {9 = Ankuenfte und Uebernachtungen}
#' \item {10 = Gaeste nach Herkunftslaendern}
#' \item {11 = Messen und Ausstellungen}
#' \item {12 = Bruttoinlandsprodukt und Bruttowertschoepfung}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Einkommen und Preise (Income and prices)}
#' @description {Get data from LIS about income and prices}
#' @param rubrik_nr Number (1 to 2)
#' \itemize{
#' \item {1 = Lebensunterhalt}
#' \item {2 = Nettoeinkommen}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_money(rubrik_nr = 1)
#' }
#' @export
get_lis_money <- function(rubrik_nr = 1,
                          periode = "y") {
  kategorie_nr <- 9
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
#' \item {1 = Strassennetz}
#' \item {2 = Kraftfahrzeugbestand}
#' \item {3 = Verkehrsunfaelle}
#' \item {4 = Personennahverkehr}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Kultur und Sport (Culture and sports)}
#' @description {Get data from LIS about culture and sports}
#' @param rubrik_nr Number (1 to 7)
#' \itemize{
#' \item {1 = Museen}
#' \item {2 = Theater}
#' \item {3 = Bibliotheken}
#' \item {4 = Zoo Leipzig}
#' \item {5 = Baeder}
#' \item {6 = Sportvereine}
#' \item {7 = Sporteinrichtungen}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
}
NULL
#' @title {Energie und Umwelt (Energy and environment)}
#' @description {Get data from LIS about energy and environment}
#' @param rubrik_nr Number (1, 3, 4)
#' \itemize{
#' \item {1 = Immissionen}
#' \item {3 = Wasserhygiene}
#' \item {4 = Energieverbrauch}
#' }
#' @param periode Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_environ(rubrik_nr = 1)
#' }
#' @export
get_lis_environ <- function(rubrik_nr = 1,
                            periode = "y") {
  kategorie_nr <- 13
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
#' \item {1 = Personal nach Aufgabenbereichen}
#' \item {2 = Personal nach Produktbereichen}
#' \item {3 = Personal nach Dienstverhaeltnissen}
#' \item {4 = Einnahmen}
#' \item {5 = Ausgaben}
#' \item {6 = Steuereinnahmen}
#' \item {7 = Realsteuervergleich}
#' \item {8 = Zufriedenheit mit den Lebensbedingungen}
#' \item {9 = Einsatz von Haushaltsmitteln}
#' \item {10 = Probleme aus Buergersicht}
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
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
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
get_lis_polls <- function(rubrik_nr = 1,
                          periode = "y") {
  kategorie_nr <- 15
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
#' @description {Leipzig's babynames between 2014 and 2019}
#' @param year Number (2014 to 2019)
#' @references
#' https://statistik.leipzig.de/statserv/servod.aspx
#' @examples
#' \dontrun{
#' get_lis_babynames(year = 2014)
#' }
#' @return Data frame with 6 columns
#' \itemize{
#' \item {RANG} {(Rank of name for girls and boys separately)}
#' \item {ANZAHL} {(Number of babys having this name)}
#' \item {VORNAME} {(Babyname)}
#' \item {GESCHLECHT} {(Sex)}
#' \item {YEAR} {(Year)}
#' \item {RANG_GESAMT} {(Rank of name for girls and boys together (Computed by function))}
#' }
#' @export
get_lis_babynames <- function(year = 2014) {
  if (year == 2014) id <- "40c25656-03aa-4d86-b27f-79484effb51b"
  if (year == 2015) id <- "bf164ae8-70e1-4a0d-9984-02b7df4c241f"
  if (year == 2016) id <- "520344d3-1939-4405-9b97-3a85b50dd45b"
  if (year == 2017) id <- "468d1bd1-26df-4ac5-a908-7dd586849236"
  if (year == 2018) id <- "1b2c8423-4b95-4490-b6de-ae69e3e33484"
  if (year == 2019) id <- "680183af-ecdd-4670-9357-3038cf5efd7e"
  dataset <- "c62e543b-a558-4fed-a5cb-973ba8dc787d"
  url <- paste0(
    "https://opendata.leipzig.de/dataset/",
    dataset, "/resource/",
    id, "/download/vornamensstatistik",
    year, ".csv"
  )

  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  data <- read.csv(tmpFile, dec = ",", fileEncoding = 'utf-8')
  df.f <- data[c("Rang", "Anzahl", "Vorname", "Geschlecht")]
  df.m <- data[c("Rang.1", "Anzahl.1", "Vorname.1", "Geschlecht.1")]
  colnames(df.m) <- colnames(df.f)
  data <- rbind(df.f, df.m)
  data <- na.omit(data)
  data$YEAR <- year
  colnames(data) <- toupper(colnames(data))
  data$RANG_GESAMT <- rank(-data$ANZAHL, ties.method = "max")
  data <- data[order(data$RANG_GESAMT), ]
  data
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
  data <- read.csv(tmpFile, dec = ",", sep = ';', fileEncoding = 'utf-8')
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
  data
}
