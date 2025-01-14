% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outdata.R
\name{outdata}
\alias{outdata}
\title{Construct outdata class}
\usage{
outdata(
  meta,
  population,
  observation,
  parameter,
  n,
  order,
  group,
  reference_group,
  ...
)
}
\arguments{
\item{meta}{a meta data created by \code{metalite}.}

\item{population}{a character value of population term name.
The term name is used as key to link information.}

\item{observation}{a character value of observation term name.
The term name is used as key to link information.}

\item{parameter}{a character value of parameter term name.
The term name is used as key to link information.}

\item{n}{a dataframe for number of subjects in each criteria}

\item{order}{a numeric vector of row display order}

\item{group}{a character vector of group variable names in an ADaM dataset.}

\item{reference_group}{a numeric value to indicate reference group in levels of group.}

\item{...}{additional variables save to \code{outdata}.}
}
\value{
A list with class \code{outdata}. Components of the list are either quosures or constants.
}
\description{
The outdata class define a standard output format for analysis and reporting.
}
\details{
The implementation idea mimic \code{ggplot2::aes}.
}
\examples{
metalite:::outdata(
  meta = meta_dummy(),
  population = "apat",
  observation = "wk12",
  parameter = "rel",
  n = data.frame(
    TRTA = c("Placebo", "Xanomeline Low Dose", "Xanomeline High Dose"),
    n = c(86, 84, 84)
  ),
  group = "TRTA",
  reference_group = 1,
  order = 1:3
)

}
