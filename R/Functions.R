# https://statistik.leipzig.de/statserv/servod.aspx

# Stadtgebiet und Witterung ------------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Geographische Lage
  # 2 = Fläche und Nutzungsarten
  # 3 = Wetterdaten
}



# Bevölkerungsbestand -----------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Einwohner
  # 2 = Einwohner nach Alter
  # 5 = Wohnberechtigte Einwohner nach Alter
}


# Bevölkerungsbewegung ----------------------------------------------------

get_lis_pop_move <- function(rubrik_nr = 1,
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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Geborene und Gestorbene
  # 2 = Geborene und Gestorbene
  # 3 = Eheschließungen und Ehescheidungen
  # 4 = Wanderungen
  # 5 = Wanderungen
}



# Gesundheit und Soziales -------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Kindertageseinrichtungen
  # 2 = Tagespflege
  # 4 = Grundsicherung für Arbeitssuchende
}


# Bildung -----------------------------------------------------------------

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

  # 1 = Allgemeinbildende Schulen
  # 2 = Einschulungen und Nichteinschulungen
  # 3 = Berufsbildende Schulen
  # 4 = Hochschulen
  # 5 = Volkshochschulen
}


# Bautätigkeit und Wohnen -------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Wohnungsbestand
  # 2 = Wohnsituation
  # 3 = Wohnungsmieten
  # 4 = Baugenehmigungen
  # 5 = Baufertigstellungen
}


# Erwerbstätigkeit und Arbeitsmarkt ---------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Beschäftigte
  # 2 = Auszubildende
  # 3 = Arbeitslose
}


# Wirtschaft --------------------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Unternehmen
  # 2 = Handwerksbetriebe
  # 3 = Verarbeitendes Gewerbe
  # 4 = Bauhauptgewerbe
  # 5 = Ausbaugewerbe
  # 6 = Gewerbemeldungen
  # 7 = Insolvenzverfahren
  # 8 = Beherbergungskapazität
  # 9 = Ankünfte und Übernachtungen
  # 10 = Gäste nach Herkunftsländern
  # 11 = Messen und Ausstellungen
  # 12 = Bruttoinlandsprodukt und Bruttowertschöpfung
}


# Einkommen und Preise ----------------------------------------------------

get_lis_wages <- function(rubrik_nr = 1,
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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Lebensunterhalt
  # 2 = Nettoeinkommen
}


# Verkehr -----------------------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Straßennetz
  # 2 = Kraftfahrzeugbestand
  # 3 = Verkehrsunfälle
  # 4 = Personennahverkehr
  # 5 = Luftverkehr
}


# Kultur und Sport --------------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Museen
  # 2 = Theater
  # 3 = Bibliotheken
  # 4 = Zoo Leipzig
  # 5 = Bäder
  # 6 = Sportvereine
  # 7 = Sporteinrichtungen
}



# Energie und Umwelt ------------------------------------------------------


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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Immissionen
  # 3 = Wasserhygiene
  # 4 = Energieverbrauch
}


# Stadtverwaltung, Kommunalpolitik, Kommunalfinanzen ----------------------

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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Personal nach Aufgabenbereichen
  # 2 = Personal nach Produktbereichen
  # 3 = Personal nach Dienstverhältnissen
  # 4 = Einnahmen
  # 5 = Ausgaben
  # 6 = Steuereinnahmen
  # 7 = Realsteuervergleich
  # 8 = Zufriedenheit mit den Lebensbedingungen
  # 9 = Einsatz von Haushaltsmitteln
  # 10 = Probleme aus Bürgersicht
}


# Wahlen ------------------------------------------------------------------


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
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data

  # 1 = Europawahlen
  # 2 = Bundestagswahlen
  # 3 = Landtagswahlen
  # 4 = Stadtratswahlen
}


# Vornamen ----------------------------------------------------------------

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
  data <- read.csv(tmpFile, dec = ",")
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


# Kleinräumige Daten ------------------------------------------------------

get_lis_kd <- function(kategorie_nr = 1) {
  url <- paste0(
    "https://statistik.leipzig.de/opendata/api/kdvalues?kategorie_nr=",
    kategorie_nr,
    "&rubrik_nr=1&periode=y&format=csv"
  )
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  data <- read.csv(tmpFile, dec = ",")
  colnames(data) <- toupper(colnames(data))
  colnames(data) <- gsub("^X", "JAHR_", colnames(data))
  data
  
  # 1 = Geographische Lage
  # 2 = Bevölkerungsbestand
  # 3 = Bevölkerungsbewegung
  # 4 = Kinder
  # 5 = Bildung
  # 6 = Bautätigkeit und Wohnen
  # 7 = Erwerbstätigkeit und Arbeitsmarkt
  # 8 = Wirtschaft
  # 9 = Einkommen und Preise
  # 10 = Verkehr
  # 12 = Kriminalität
}
