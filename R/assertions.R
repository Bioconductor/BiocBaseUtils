# adapted from S4Vectors
.isSingle <- function(x, na.ok, FUN)
{
    FUN(x) && identical(length(x), 1L) && (na.ok || !is.na(x))
}

#' @name Assertions
#' @title Suite of helper functions to test for types
#'
#' @description These are a group of helper functions that allow the developer
#' to easily check for common data types in Bioconductor. These include
#' logical, character, and numeric (& integer).
#'
#' @param x The input vector whose type is to be checked
#'
#' @param na.ok logical(1L) Whether it is acceptable to consider `NA` type
#'     inputs (default: `FALSE`).
#'
#' @param zchar logical(1L) Whether is is acceptable to consider 'zero'
#'     characters, i.e., `""` (default: `FALSE`).
#'
#' @param infinite.ok logical(1L) Whether it is acceptable to consider infinite
#'     values as identified by `is.finite` (default: `FALSE`).
#'
#' @author M. Morgan, H. Pagès
#'
#' @return Either `TRUE` or `FALSE`
#'
#' @md
#'
#' @examples
#'
#' isTRUEorFALSE(TRUE)
#' isTRUEorFALSE(FALSE)
#' isTRUEorFALSE(NA, na.ok = TRUE)
#'
#' isSingleCharacter(LETTERS)
#' isSingleCharacter("L")
#' isCharacter(LETTERS)
#' isCharacter(NA_character_, na.ok = TRUE)
#' is01character("")
#' is01character("", zchar = TRUE)
#'
#' isSingleInteger(1L)
#' isSingleInteger(1)
#'
#' isSingleNumber(1)
#' isSingleNumber(1:2)
#'
NULL


#' @describeIn Assertions
#'
#' @export
isTRUEorFALSE <- function(x, na.ok = FALSE)
{
    .isSingle(x, na.ok, is.logical)
}

#' @describeIn Assertions
#'
#' @export
isSingleCharacter <- function(x, na.ok = FALSE, zchar = FALSE)
{
    identical(length(x), 1L) && isCharacter(x, na.ok, zchar)
}

#' @describeIn Assertions
#'
#' @export
isSingleInteger <- function(x, na.ok = FALSE)
{
    .isSingle(x, na.ok, is.integer)
}

#' @describeIn Assertions
#'
#' @export
isSingleNumber <- function(x, na.ok = FALSE, infinite.ok = FALSE)
{
    .isSingle(x, na.ok, is.numeric) && (infinite.ok || is.finite(x))
}

#' @describeIn Assertions
#'
#' @export
isCharacter <- function(x, na.ok = FALSE, zchar = FALSE)
{
    is.character(x) && (na.ok || all(!is.na(x))) && (zchar || all(nzchar(x)))
}

#' @describeIn Assertions
#'
#' @export
is01character <- function(x, na.ok = FALSE, zchar = FALSE)
{
    (length(x) == 0L || length(x) == 1L) &&
        isCharacter(x, na.ok, zchar)
}
