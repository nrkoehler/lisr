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

  tmpFile <- tempfile()

  download.file(url, destfile = tmpFile, method = "curl")

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
