## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(glossr)
default_width <- glossr:::config$word$page_width

## -----------------------------------------------------------------------------
print_config()

## ----results="asis", echo=FALSE-----------------------------------------------
cat("```yaml\n")
readLines(system.file("extdata/glossr-config.yml", package="glossr")) |> 
  paste(collapse = "\n") |> 
  cat()
cat("\n")
cat("```\n")

## -----------------------------------------------------------------------------
config_from_file(system.file("extdata/glossr-config.yml", package="glossr"))
print_config()

## -----------------------------------------------------------------------------
use_glossr(styling = list(a = "i", numbering = TRUE, trans_quotes = "**"))
print_config("other")

## -----------------------------------------------------------------------------
use_glossr(styling = list(
  a = "i", preamble = "b"
))
print_config("format")
as_gloss("First line", "Primera línea", source="This should be in bold")

## -----------------------------------------------------------------------------
print_config("format")

## -----------------------------------------------------------------------------
use_glossr(styling = list(
  exskip = 6,
  extraglskip = 15
))

## -----------------------------------------------------------------------------
print_config("pdf")

## -----------------------------------------------------------------------------
use_glossr(styling = list(
  font_family = list(a = "Arial", default = "Cambria"),
  font_size = 11,
  page_width = 430))

## -----------------------------------------------------------------------------
print_config("word")

## -----------------------------------------------------------------------------
use_glossr(styling = list(
  trans_quotes = "~",
  numbering = FALSE
))
as_gloss("First line", "Primera línea", translation = "Free translation")

## -----------------------------------------------------------------------------
print_config("other")

