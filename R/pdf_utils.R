#' Apply latex formatting to many words
#'
#' Facilitates applying the same latex formatting
#'   to different words in a row.
#'
#' @param text Character vector of length 1.
#' @param formatting Latex formatting code, e.g. `textit` or `textsc`.
#'
#' @return Reformatted string
#' @export
#'
#' @examples
#' gloss_format_words("Many words to apply italics on.", "textit")
gloss_format_words <- function(text, formatting) {
  if (formatting %in% style_options("i")) formatting <- "textit"
  if (formatting %in% style_options("b")) formatting <- "textbf"
  split_line <- gloss_linesplit(text) %>%
    purrr::map_chr(~ sprintf("\\%s{%s}", formatting, .x)) %>%
    purrr::map_chr(~ ifelse(
      stringr::str_detect(.x, " "),
      sprintf("{%s}", .x),
      .x)) %>%
    paste(collapse = " ")
  gsub("\\s+", " ", split_line)
}

#' Sublist glosses
#'
#' Takes a series of glosses from [gloss_render()]
#'   and puts them in a list within one example for PDF output.
#'
#' @param glist Concatenation of [`gloss`] objects, e.g.
#'   as output of [gloss_df()].
#' @param listlabel Label for the full list (optional)
#'
#' @return Character vector including the frame for a list of glosses.
#' @export
gloss_list <- function(glist, listlabel = NULL) {
  if (!inherits(glist, "gloss")) {
    cli::cli_abort(c("{.fun gloss_list} needs an object of class {.cls gloss}",
                     "please use {.fun as_gloss} or {.fun gloss_df} first."))
  }
  output <- getOption("glossr.output", "latex")
  clean_gloss <- unclass(glist)
  attr(clean_gloss, "data") <- NULL

  if (output == "latex") {
    llabel <- if (is.null(listlabel)) "" else sprintf("\\label{%s}", listlabel)
    clean_gloss <- stringr::str_replace_all(clean_gloss, "\\\\ex", "\\\\a") %>%
      stringr::str_remove_all("\\\\xe \\n") %>%
      paste(collapse = "\n")
    clean_gloss <- sprintf("\\pex%s %s \\xe \n", llabel, clean_gloss)
    new_gloss(attr(glist, "data"), clean_gloss)
  } else {
    glist
  }
}

#' Read Latex formatting options
#'
#' @param level Gloss line to format
#' @noRd
#' @return Key for expex
format_pdf <- function(level) {
  format <- getOption(sprintf("glossr.format.%s", level))
  if (is.null(format)) {
    NULL
  } else if (format %in% style_options("i")) {
    "\\itshape"
  } else if (format %in% style_options("b")) {
    "\\bfseries"
  } else {
    NULL
  }
}
