% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plan.R
\name{validate_plan}
\alias{validate_plan}
\title{Validate an analysis plan object}
\usage{
validate_plan(plan)
}
\arguments{
\item{plan}{a \code{meta_plan} object}
}
\description{
Validate an analysis plan object
}
\examples{
x <- plan(analysis = "ae_summary", population = "apat", observation = "wk12", parameter = "any")
metalite:::validate_plan(x)
}
