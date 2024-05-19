## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(glossr)
library(dplyr)
library(stringr)

## ----fact1--------------------------------------------------------------------
by_label <- gloss_factory(glosses)

## ----fact2--------------------------------------------------------------------
by_label <- glosses |> 
  select(-language, -translation) |> 
  gloss_factory()

## ----fact3--------------------------------------------------------------------
by_label <- glosses|> 
  rename(trans = translation)|> 
  gloss_factory()

## ----fact4--------------------------------------------------------------------
modified_glosses <- glosses |>
  mutate(source = paste0("(", source, ")"))
by_label <- modified_glosses |>
  gloss_factory(ignore_columns = "language")

## ----print-func---------------------------------------------------------------
class(by_label)

## ----lab1---------------------------------------------------------------------
by_label("heartwarming-jp")

## ----lab2---------------------------------------------------------------------
by_label("heartwarming-jp", "languid-jp", "feel-dutch")

## ----lab3---------------------------------------------------------------------
by_language <- modified_glosses |> 
  gloss_factory(id_column = "language", ignore_columns = "language")
by_language("Icelandic")

## ----lab4---------------------------------------------------------------------
by_language("Japanese", "Mandarin")

## ----cond1--------------------------------------------------------------------
by_cond <- modified_glosses |>
  gloss_factory(use_conditionals = TRUE, ignore_columns = "language")
by_cond(str_ends(label, "jp"))

