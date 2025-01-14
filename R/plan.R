#    Copyright (c) 2022 Merck & Co., Inc., Rahway, NJ, USA and its affiliates. All rights reserved.
#
#    This file is part of the metalite program.
#
#    metalite is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

#' Create a analysis plan from all combination of variables
#'
#' This function is a wrapper of `expand.grid`
#'
#' @param analysis a character value of analysis term name.
#' The term name is used as key to link information.
#' @param population a character value of population term name.
#' The term name is used as key to link information.
#' @param observation a character value of observation term name.
#' The term name is used as key to link information.
#' @param parameter a character value of parameter term name.
#' The term name is used as key to link information.
#' @param mock a numeric value of mock table number.
#' @param ... additional arguments
#'
#' @examples
#'
#' # example 1
#' # create an analysis plan of AE summary
#' # with any AE, drug-related AE and serious AE
#' plan(
#'   analysis = "ae_summary",
#'   population = "apat",
#'   observation = c("wk12", "wk24"),
#'   parameter = "any;rel;ser"
#' )
#'
#' # example 2
#' # create an analysis plan of AE specific
#' # with any AE, drug-related AE and serious AE
#' plan(
#'   analysis = "ae_specific",
#'   population = "apat",
#'   observation = c("wk12", "wk24"),
#'   parameter = c("any", "rel", "ser")
#' )
#' @export
#'
plan <- function(analysis, population, observation, parameter, mock = 1, ...) {
  stopifnot(length(analysis) == 1)

  x <- new_plan(analysis, population, observation, parameter, mock = 1, ...)

  validate_plan(x)
}

#' Create a analysis plan from all combination of variables
#'
#' This function is a wrapper of `expand.grid`
#'
#' @inheritParams plan
#' @examples
#' metalite:::new_plan(
#'   analysis = "ae_specific",
#'   population = "apat",
#'   observation = c("wk12", "wk24"),
#'   parameter = c("any", "rel", "ser")
#' )
new_plan <- function(analysis, population, observation, parameter, mock = 1, ...) {
  # create a data frame from all combinations of the supplied vectors or factors.
  x <- expand.grid(
    mock = mock,
    analysis = analysis,
    population = population,
    observation = observation,
    parameter = parameter,
    ...,
    stringsAsFactors = FALSE # specifying if char vec are converted to factors
  )

  class(x) <- c("meta_plan", "data.frame")

  x
}

#' Validate an analysis plan object
#'
#' @param plan a `meta_plan` object
#' @examples
#' x <- plan(analysis = "ae_summary", population = "apat", observation = "wk12", parameter = "any")
#' metalite:::validate_plan(x)
validate_plan <- function(plan) {
  stopifnot(all(c("meta_plan", "data.frame") %in% class(plan)))
  stopifnot(all(c("analysis", "population", "observation", "parameter") %in% names(plan)))

  plan
}

#' Add additional analysis plan
#'
#' @inheritParams plan
#' @inheritParams validate_plan
#'
#' @examples
#' plan("ae_summary",
#'   population = "apat",
#'   observation = c("wk12", "wk24"), parameter = "any;rel"
#' ) |>
#'   add_plan("ae_specific",
#'     population = "apat",
#'     observation = c("wk12", "wk24"), parameter = c("any", "rel")
#'   )
#' @export
add_plan <- function(plan, analysis, population, observation, parameter, ...) {
  plan <- validate_plan(plan)

  plan1 <- plan(analysis, population, observation, parameter, mock = max(plan$mock + 1), ...)
  bind_rows2(plan, plan1)
}
