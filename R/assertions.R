# adapted from S4Vectors
.isSingle <- function(x, FUN)
{
    FUN(x) && identical(length(x), 1L) && !is.na(x)
}

isTRUEorFALSE <- function(x)
{
    .isSingle(x, is.logical)
}

isSingleString <- function(x)
{
    .isSingle(x, is.character)
}

isSingleInteger <- function(x)
{
    .isSingle(x, is.integer)
}

isSingleNumber <- function(x)
{
    .isSingle(x, is.numeric)
}
