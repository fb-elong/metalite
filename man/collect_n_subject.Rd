% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collect_n_subject.R
\name{collect_n_subject}
\alias{collect_n_subject}
\title{Collect number of subjects and its subset condition}
\usage{
collect_n_subject(
  meta,
  population,
  parameter,
  listing = FALSE,
  histogram = FALSE,
  remove_blank_group = FALSE,
  use_na = c("ifany", "no", "always"),
  display_total = TRUE
)
}
\arguments{
\item{meta}{an \code{meta_adam} object.}

\item{population}{a character value of population term name.
The term name is used as key to link information.}

\item{parameter}{a character value of parameter term name.
The term name is used as key to link information.}

\item{listing}{a logical value to display drill down listing per row.}

\item{histogram}{a logical value to display histogram by group.}

\item{remove_blank_group}{a logical value to remove a group with all missing value of a parameter.}

\item{use_na}{a character value for whether to include NA values in the table. Refer \code{useNA} argument in \code{table} function for more details.}

\item{display_total}{a logical value to display total column.}
}
\description{
Collect number of subjects and its subset condition
}
\examples{
suppressWarnings(
meta <- meta_dummy() |> 
  define_parameter(name="sex", var = "SEX", label = "Sex") 
 )
collect_n_subject(meta, "apat", "sex")

}
