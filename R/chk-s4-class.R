#' Check Inherits from S4 Class
#'
#' @description
#' Checks inherits from S4 class using
#'
#' `isS4(x) && methods::is(x, class)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_is
#' @export
#'
#' @examples
#'
#' # chk_s4_class
#' try(chk_s4_class(1, "numeric"))
#' chk_s4_class(getClass("MethodDefinition"), "classRepresentation")
chk_s4_class <- function(x, class, x_name = NULL) {
  if (vld_s4_class(x, class)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must inherit from S4 class '", class, "'")
}

#' @describeIn chk_s4_class Validate Inherits from S4 Class
#'
#' @export
#'
#' @examples
#'
#' # vld_s4_class
#' vld_s4_class(numeric(0), "numeric")
#' vld_s4_class(getClass("MethodDefinition"), "classRepresentation")
vld_s4_class <- function(x, class) isS4(x) && methods::is(x, class)
