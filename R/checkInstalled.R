#' Check packages are installed otherwise suggest
#'
#' `checkInstalled` allows to check if a package is installed. If the package is
#' not available, a convenient copy-and-paste message is provided for package
#' installation with `BiocManager`. The function is typically used within
#' functions that check for package availability from the `Suggests` field.
#'
#' @param pkgs `character()` package names required for a function
#'
#' @return `TRUE` if all packages are installed, otherwise stops with a message
#'   and suggests installation of missing packages
#'
#' @author M. Morgan, M. Ramos
#'
#' @examples
#' if (interactive()) {
#'     checkInstalled(
#'         c("BiocParallel", "SummarizedExperiment")
#'     )
#' }
#' @export
checkInstalled <- function(pkgs) {
    inst <- vapply(pkgs, FUN = function(pkg) {
        !nzchar(system.file(package = pkg))
    }, logical(1L))
    toinst <- pkgs[inst]
    if (length(toinst))
        .install_suggestion(toinst)
    else
        TRUE
}

.install_suggestion <- function(pkgs) {
    n <- length(pkgs)
    txt <- if (identical(n, 1L)) '"%s"' else 'c(\n    "%s"\n  )'
    fmt <- '  BiocManager::install(%s)'
    fmt <- sprintf(fmt, txt)
    pkgs <- paste(strwrap(
        paste(pkgs, collapse='", "'),
        width = getOption("width") - 4L
    ), collapse="\n    ")
    cat(
        "Install the required package(s) with:",
        "\n\n", sprintf(fmt, pkgs), "\n\n", sep = ""
    )
    stop(
        "The calling function requires missing package dependencies:\n  ",
        sprintf("\"%s\"", pkgs),
        call. = FALSE
    )
}
