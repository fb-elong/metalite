% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/meta_check.R
\name{meta_check_var}
\alias{meta_check_var}
\title{Check variable name are in meta data}
\usage{
meta_check_var(meta, var, type = c("population", "observation"))
}
\arguments{
\item{meta}{a \code{meta_adam} object.}

\item{var}{a character vector of variable names}

\item{type}{a character vector of data type to check}
}
\description{
Check variable name are in meta data
}
\examples{
# meta_check_var(meta_dummy(), var = "RACE")
}
