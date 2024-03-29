
#' Run an lm model in a pipe.
#'
#' This function wraps around the [lm] function in order to make it
#' more friendly to pipe syntax (with the data first).
#'
#' @param data A `data.frame` containing the model data.
#' @param formula The `formula` to be fitted.
#' @param subset See the `lm` function.
#' @param weights See the `lm` function.
#' @param na.action See the `lm` function.
#' @param method See the `lm` function.
#' @param model See the `lm` function.
#' @param x See the `lm` function.
#' @param y See the `lm` function.
#' @param qr See the `lm` function.
#' @param singular.ok See the `lm` function.
#' @param contrasts See the `lm` function.
#' @param offset See the `lm` function.
#' @param ... Other arguments to be passed to the `lm` function.
#' @return A fitted model.
#'
#' @seealso
#' * [zglm] is a wrapper for `glm`, to fit generalized
#'   linear models.
#'
#' @examples
#' # Usage is possible without pipes
#' zlm( cars, dist ~ speed )
#'
#' # zfit works well with dplyr and magrittr pipes
#' if ( require("dplyr", warn.conflicts=FALSE) ) {
#'
#'   # Pipe cars dataset into zlm for fitting
#'   cars %>% zlm(speed ~ dist)
#'
#'   # Process iris with filter before piping to zlm
#'   iris %>%
#'     filter(Species == "setosa") %>%
#'     zlm(Sepal.Length ~ Sepal.Width + Petal.Width)
#' }
#'
#' # zfit also works well with the native pipe
#' if ( require("dplyr") && getRversion() >= "4.1.0" ) {
#'
#'   # Pipe cars dataset into zlm for fitting
#'   cars |> zlm(speed ~ dist)
#'
#'   # Process iris with filter() before piping. Print a
#'   # summary of the fitted model using zprint() before
#'   # assigning the model itself (not the summary) to m.
#'   m <- iris |>
#'     filter(Species == "setosa") |>
#'     zlm(Sepal.Length ~ Sepal.Width + Petal.Width) |>
#'     zprint(summary)
#' }
#'
#' @export
zlm <- zfitter(stats::lm)

