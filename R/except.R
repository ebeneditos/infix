
#' @name except
#' @aliases tryExcept
#' @aliases %except%
#'
#' @title Simple Error Handling
#'
#' @description Use this method to handle errors. The function evaluates an expression,
#'     and if it raises an error then evaluates a second expression.
#'
#' @details \code{tryExcept} is a wrapper around \code{\link[base]{tryCatch}},
#'     but it allows you to run a whole expression (\code{except}) when an error occurs to
#'     the first expression argument (\code{expr}). Note that, if \code{expr} raises
#'     an error, the code evaluated before the error will be in use.
#' @param expr expression to be evaluated.
#' @param except expression to be evaluated if \code{expr} raises an error.
#' @examples \dontrun{
#' # No errors are raised
#' tryExcept(stop())
#'
#' # If 'expr' has no errors
#' tryExcept({
#'   foo <- "foo"
#' }, except = {
#'   foo <- "foo bar"
#' })
#' print(foo) # "foo"
#'
#' # If 'expr' has an error
#' tryExcept({
#'   foo <- "foo"
#'   stop()
#' }, except = {
#'   foo <- "foo bar"
#' })
#' print(foo) # "foo bar"
#'
#' # Running it with the infix operator
#' {foo <- "foo"} %except% {foo <- "foo bar"}
#' print(foo) # "foo"
#'
#' { foo <- "foo"
#'   stop()
#' } %except% {
#'   foo <- "foo bar"
#' }
#' print(foo) # "foo bar"
#' }
#' @export
tryExcept <- function (expr, except = {})
{
  tryCatch(return(expr), error = function(e){})
  invisible(except)
}

#' @rdname except
#' @export
`%except%` <- tryExcept
