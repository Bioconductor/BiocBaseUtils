#' Select and return only some entries from a vector
#'
#' `selectSome` works well in `show` methods. It abbreviates a vector input
#' depending on the `maxToShow` argument.
#'
#' @param obj character() A vector to be abbreviated for display purposes
#'
#' @param maxToShow numeric(1) The maximum number of values to show in the
#'     output (default: 5)
#'
#' @param ellipsis character(1) The symbol used to abbreviate values in the
#'     vector (default: "...")
#'
#' @param ellipsisPos character(1) The location for the ellipsis in the output,
#'     by default in the `"middle"` but can be moved to either the `"end"` or
#'     the `"start"`.
#'
#' @param quote logical(1) Whether or not to add a single quote around the `obj`
#'     input. This only works for character type inputs.
#'
#' @return An abbreviated output of `obj`
#'
#' @importFrom utils head tail
#'
#' @author M. Morgan, H. Pagès
#'
#' @examples
#'
#' letters
#'
#' selectSome(letters)
#'
#' @export
selectSome <- function(obj, maxToShow = 5, ellipsis = "...",
    ellipsisPos = c("middle", "end", "start"), quote = FALSE)
{
    if (is.character(obj) && quote)
        obj <- sQuote(obj)
    ellipsisPos <- match.arg(ellipsisPos)
    len <- length(obj)
    if (maxToShow < 3)
        maxToShow <- 3
    if (len > maxToShow) {
        maxToShow <- maxToShow - 1
        if (ellipsisPos == "end") {
            c(head(obj, maxToShow), ellipsis)
        } else if (ellipsisPos == "start") {
            c(ellipsis, tail(obj, maxToShow))
        } else {
            bot <- ceiling(maxToShow/2)
            top <- len - (maxToShow - bot - 1)
            sbot <- seq_len(bot)
            nms <- obj[c(sbot, top:len)]
            c(as.character(nms[sbot]), ellipsis, as.character(nms[-sbot]))
        }
    } else {
        obj
    }
}
