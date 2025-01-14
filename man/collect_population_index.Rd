% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collect.R
\name{collect_population_index}
\alias{collect_population_index}
\title{Collect population record index from population dataset}
\usage{
collect_population_index(meta, population)
}
\arguments{
\item{meta}{an \code{meta_adam} object.}

\item{population}{a character value of population term name.
The term name is used as key to link information.}
}
\description{
Collect population record index from population dataset
}
\examples{
library(r2rtf)
meta <- meta_dummy()
head(collect_population_index(meta, "apat"))
}
