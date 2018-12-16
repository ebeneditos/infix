# infix

> Basic Infix Binary Operators

[![CRAN](http://www.r-pkg.org/badges/version/infix)](https://cran.r-project.org/package=infix)
[![Travis CI Status](https://travis-ci.org/ebeneditos/infix.svg?branch=master)](https://travis-ci.org/ebeneditos/infix)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/ebeneditos/infix?branch=master&svg=true)](https://ci.appveyor.com/project/ebeneditos/infix)
[![Codecov](https://codecov.io/gh/ebeneditos/infix/branch/master/graphs/badge.svg?branch=master)](https://codecov.io/gh/ebeneditos/infix)

Contains a number of infix binary operators that may be useful in day to day practices.

## Installation

You can install `infix` from CRAN:

``` r
install.packages("infix")
```

Or the development version from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("ebeneditos/infix")
```

## Usage

You can find a full list of operators running `?infix`, but here there are a few examples:

```r
library(infix)

# tryExcept (%except%)
{foo <- "foo"} %except% {foo <- "foo bar"}
print(foo) # "foo"

{ foo <- "foo"
  stop()
} %except% {
  foo <- "foo bar"
}
print(foo) # "foo bar"

# paste0 (%+%)
"01" %+% "jan" %+% "1970" # returns "01jan1970"

# file.path (%//%)
"home" %//% "dir" # returns "home/dir"

# nomatch (%!in%)
4 %!in% 1:3 # returns TRUE

# nil (%||%)
1 %||% 2 # returns 1
NULL %||% 2 # returns 2

# functions logic (%&%, %|% and %xor%)
is.null.na <- is.null %|% is.na
all(is.null.na(NA), is.null.na(NULL)) # returns TRUE
```

Also, `magrittr` pipe-operators (such as `%>%`) are imported.
