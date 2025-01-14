% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plan.R
\name{add_plan}
\alias{add_plan}
\title{Add additional analysis plan}
\usage{
add_plan(plan, analysis, population, observation, parameter, ...)
}
\arguments{
\item{plan}{a \code{meta_plan} object}

\item{analysis}{a character value of analysis term name.
The term name is used as key to link information.}

\item{population}{a character value of population term name.
The term name is used as key to link information.}

\item{observation}{a character value of observation term name.
The term name is used as key to link information.}

\item{parameter}{a character value of parameter term name.
The term name is used as key to link information.}

\item{...}{additional arguments}
}
\description{
Add additional analysis plan
}
\examples{
plan("ae_summary",
  population = "apat",
  observation = c("wk12", "wk24"), parameter = "any;rel"
) |>
  add_plan("ae_specific",
    population = "apat",
    observation = c("wk12", "wk24"), parameter = c("any", "rel")
  )
}
