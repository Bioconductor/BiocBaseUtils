#' Ask user for a yes/no response
#'
#' @param prompt `character()` Question form prompt to display to the user
#'   without a question mark
#'
#' @param interactive.only `logical(1)` If `TRUE`, the function will only
#'  prompt the user when the R session is interactive. If `FALSE`, the
#'  function will always prompt the user.
#'
#' @return TRUE when user replies with 'yes' to prompt, FALSE when 'no'
#'
#' @author Martin M.
#'
#' @examples
#'
#' askUserYesNo("Do you want to continue")
#'
#' @export
askUserYesNo <-
    function(prompt, interactive.only = TRUE)
{
    if (interactive.only && !interactive())
        return(FALSE)
    responses <- c("yes", "no")
    msg1 <- paste0(prompt, " [", paste(responses, collapse = ", "), "]? ")
    msg2 <- paste0("reply with '", paste(responses, collapse = "' or '"), "'")
    repeat {
        userResponse <- trimws(tolower(readline(msg1)))
        if (userResponse %in% responses)
            break
        message(msg2)
    }
    identical(userResponse, responses[1L])
}
