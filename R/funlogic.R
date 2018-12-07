
#' @name funlogic
#' @aliases %&%
#' @aliases %|%
#' @aliases %xor%
#'
#' @title Function Logical Operators
#'
#' @description Creates a function which returns the corresponding logical
#' operation between what \code{f1} and \code{f2} return.
#'
#' @details To obtain the logical negation of what a function \code{f} returns,
#'     use \code{base} function \code{\link[base]{Negate}}.
#'
#' @param f1,f2 Arbitrary predicate functions.
NULL

#' @rdname funlogic
#' @export
`%&%` <- function(f1, f2){
  f1 <- match.fun(f1)
  f2 <- match.fun(f2)
  function(...) f1(...) & f2(...)
}

#' @rdname funlogic
#' @examples
#' is.null.na <- is.null %|% is.na
#' all(is.null.na(NA), is.null.na(NULL)) # returns TRUE
#' @export
`%|%` <- function(f1, f2){
  f1 <- match.fun(f1)
  f2 <- match.fun(f2)
  function(...) f1(...) | f2(...)
}

#' @rdname funlogic
#' @export
`%xor%` <- function(f1, f2){
  f1 <- match.fun(f1)
  f2 <- match.fun(f2)
  function(...) xor(f1(...), f2(...))
}
