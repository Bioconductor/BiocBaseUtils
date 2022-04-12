#' Convenience function to set slot values
#'
#' @aliases replaceSlots
#'
#' @description
#' Given the current object, the function `setSlots` will take name-value
#' pair inputs either as named arguments or a `list` and replace the values of
#' the specified slots. This is a convenient function for updating slots in
#' an S4 class object.
#'
#' @param object An S4 object with slots to replace
#'
#' @param ... Slot name and value pairs either as named arguments
#'     or a named list, e.g., `slotName = value`.
#'
#' @param check logical(1L) Whether to run validObject after the slot
#'     replacement
#'
#' @return The object input with updated slot data
#'
#' @importFrom methods slot<- validObject
#'
#' @author H. Pagès
#'
#' @examples
#'
#' setClass("A", representation = representation(slotA = "character"))
#'
#' aclass <- new("A", slotA = "A")
#'
#' setSlots(aclass, slotA = "B")
#'
#' @export
setSlots <- function (object, ..., check = TRUE)
{
    if (!isTRUEorFALSE(check))
        stop("'check' must be TRUE or FALSE")
    object <- unsafe_replaceSlots(object, ...)
    if (check)
        validObject(object)
    object
}

unsafe_replaceSlots <- function (object, ..., .slotList = list())
{
    slots <- c(list(...), .slotList)
    slots_names <- names(slots)
    for (i in seq_along(slots)) {
        slot_name <- slots_names[[i]]
        if (identical(slot_name, "mcols"))
            slot_name <- "elementMetadata"
        slot_val <- slots[[i]]
        slot(object, slot_name, check = FALSE) <- slot_val
    }
    object
}

