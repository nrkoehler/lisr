% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions.R
\name{get_lis_culture}
\alias{get_lis_culture}
\title{{Kultur und Sport (Culture and sports)}}
\usage{
get_lis_culture(rubrik_nr = 1, periode = "y")
}
\arguments{
\item{rubrik_nr}{Number (1 to 7)
\itemize{
\item {1 = Museen}
\item {2 = Theater}
\item {3 = Bibliotheken (yearly data only)}
\item {4 = Zoo Leipzig}
\item {5 = Baeder}
\item {6 = Sportvereine (yearly data only)}
\item {7 = Sporteinrichtungen (yearly data only)}
}}

\item{periode}{Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.}
}
\description{
{Get data from LIS about culture and sports}
}
\examples{
\dontrun{
get_lis_culture(rubrik_nr = 1)
}
}
\references{
https://statistik.leipzig.de/statserv/servod.aspx
}
