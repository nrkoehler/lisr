% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions.R
\name{get_lis_economy}
\alias{get_lis_economy}
\title{{Wirtschaft (Economy)}}
\usage{
get_lis_economy(rubrik_nr = 1, periode = "y")
}
\arguments{
\item{rubrik_nr}{Number (1 to 12)
\itemize{
\item {1 = Unternehmen (yearly data only)}
\item {2 = Handwerksbetriebe (yearly data only)}
\item {3 = Verarbeitendes Gewerbe}
\item {4 = Bauhauptgewerbe}
\item {5 = Ausbaugewerbe}
\item {6 = Gewerbemeldungen (yearly data only)}
\item {7 = Insolvenzverfahren (yearly data only)}
\item {8 = Beherbergungskapazitaet (yearly data only)}
\item {9 = Ankuenfte und Uebernachtungen}
\item {10 = Gaeste nach Herkunftslaendern (yearly data only)}
\item {11 = Messen und Ausstellungen (yearly data only)}
\item {12 = Bruttoinlandsprodukt und Bruttowertschoepfung (yearly data only)}
}}

\item{periode}{Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.}
}
\description{
{Get data from LIS about economy}
}
\examples{
\dontrun{
get_lis_economy(rubrik_nr = 1)
}
}
\references{
https://statistik.leipzig.de/statserv/servod.aspx
}
