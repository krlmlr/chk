#' Check Unique
#'
#' @description
#' Checks if unique using
#'
#' `!anyDuplicated(x, incomparables = incomparables)`
#'
#' @inheritParams params
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_misc
#' @export
#'
#' @examples
#'
#' # chk_unique
#' chk_unique(c(NA, 2))
#' try(chk_unique(c(NA, NA, 2)))
#' chk_unique(c(NA, NA, 2), incomparables = NA)
chk_unique <- function(x, incomparables = FALSE, x_name = NULL) {
  if (vld_unique(x, incomparables = incomparables)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be unique")
}

#' @describeIn chk_unique Validate Unique
#'
#' @export
#'
#' @examples
#'
#' # vld_unique
#' vld_unique(NULL)
#' vld_unique(numeric(0))
#' vld_unique(c(NA, 2))
#' vld_unique(c(NA, NA, 2))
#' vld_unique(c(NA, NA, 2), incomparables = NA)
vld_unique <- function(x, incomparables = FALSE) {
  !.anyDuplicated(x, incomparables = incomparables)
}
