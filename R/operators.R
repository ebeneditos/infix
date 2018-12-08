
#' @name operators
#'
#' @title Common Infix Operators
#'
#' @section Infix Operators: \describe{
#'     \item{\code{\link{paste0}}}{Concatenate Strings (see \code{?"\%+\%"}).}
#'     \item{\code{\link{file.path}}}{Construct Path to File (see \code{?"\%//\%"}).}
#'     \item{\code{\link{nomatch}}}{Value (non) Matching (see \code{?"\%!in\%"}).}
#'     \item{\code{\link{nil}}}{Default value for \code{NULL} (see \code{?"\%||\%"}).}
#' }
NULL

#' @name paste0
#' @aliases paste
#' @aliases %+%
#'
#' @title Concatenate Strings
#'
#' @description Analogous to \code{paste0(x, y)}.
#'
#' @param x,y Objects to be converted to character vectors.
#' @examples
#' "01" %+% "jan" %+% "1970" # returns "01jan1970"
#' @export
`%+%` <- function(x, y) paste0(x, y)

#' @name file.path
#' @aliases %//%
#'
#' @title Construct Path to File
#'
#' @description Analogous to \code{file.path(x, y)}.
#'
#' @param x,y Character vectors.
#' @examples
#' "home" %//% "dir" # returns "home/dir"
#' @export
`%//%` <- function(x, y) file.path(x, y)

#' @name nomatch
#' @aliases %!in%
#'
#' @title Value (non) Matching
#'
#' @description The logical negation of \code{\link[base]{\%in\%}}.
#'
#' @param x Vector or \code{NULL}: the values to be (not) matched.
#' @param table Vector or \code{NULL}: the values to be (not) matched against.
#' @examples
#' 4 %!in% 1:3 # returns TRUE
#' @export
`%!in%` <- function(x, table) match(x, table, nomatch = 0L) <= 0L

#' @name nil
#' @aliases %||%
#'
#' @title Default value for \code{NULL}
#'
#' @description This infix function makes it easy to replace \code{NULL}`s with
#'     a default value. It's inspired by the way that Ruby's or operation
#'     (\code{`||`}) works.
#'
#' @param a,b If \code{a} is \code{NULL}, will return \code{b}; otherwise returns \code{a}.
#' @examples
#' 1 %||% 2 # returns 1
#' NULL %||% 2 # returns 2
#' @export
`%||%` <- function(a, b) if (is.null(a)) b else a
