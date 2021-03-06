% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions.R
\name{get_lis_labour}
\alias{get_lis_labour}
\title{{Erwerbstaetigkeit und Arbeitsmarkt (Occupation and labour market)}}
\usage{
get_lis_labour(rubrik_nr = 1, periode = "y")
}
\arguments{
\item{rubrik_nr}{Number (1 to 3)
\itemize{
\item {1 = Beschaeftigte}
\item {2 = Auszubildende (yearly data only)}
\item {3 = Arbeitslose}
}}

\item{periode}{Yearly ('y') or quarterly ('q'). Quarterly data are nor always available.}
}
\description{
{Get data from LIS about occupation and labour market}
}
\examples{
\dontrun{
get_lis_labour(rubrik_nr = 1)
}
}
\references{
https://statistik.leipzig.de/statserv/servod.aspx
}
