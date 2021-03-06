% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gloss_render.R
\encoding{UTF-8}
\name{gloss_render}
\alias{gloss_render}
\alias{gloss_pdf}
\alias{gloss_html}
\alias{gloss_tooltip}
\alias{gloss_leipzig}
\alias{gloss_word}
\title{Render a gloss}
\usage{
gloss_pdf(gloss)

gloss_html(gloss)

gloss_tooltip(gloss)

gloss_leipzig(gloss)

gloss_word(gloss)
}
\arguments{
\item{gloss}{Object of class \code{gloss_data}}
}
\value{
Object of class \code{gloss}
}
\description{
This functions are output-specific and can be used to check the specific output
  of certain calls, but are not meant to be used in an R Markdown file. Instead,
  use \code{\link{as_gloss}} or \code{\link{gloss_df}}.
}
\section{Functions}{
\itemize{
\item \code{gloss_pdf}: Render in PDF

\item \code{gloss_html}: Render in HTML

\item \code{gloss_tooltip}: Tooltip rendering for HTML

\item \code{gloss_leipzig}: Leipzig.js engine

\item \code{gloss_word}: Render in Word
}}

\examples{
ex_sp <- "Un ejemplo en español"
ex_gloss <- "DET.M.SG example in Spanish"
ex_trans <- "An example in Spanish"
my_gloss <- new_gloss_data(list(ex_sp, ex_gloss), translation = ex_trans, label="ex1")
gloss_pdf(my_gloss)

gloss_html(my_gloss)
}
