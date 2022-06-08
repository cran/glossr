## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE
)

## ----setup--------------------------------------------------------------------
library(glossr)

## ----useglossr----------------------------------------------------------------
use_glossr(styling = list(
  source = "b",
  first = "i"
))

## ---- first-gloss-------------------------------------------------------------
my_gloss <- as_gloss(
  "她 哇的一聲 大 哭起來，",
  "tā wā=de-yì-shēng dà kū-qǐlái,",
  "TSG waa.IDEO-LINK-one-sound big cry-inch",
  translation = "Waaaaa, she began to wail.",
  label = "my-label",
  source = "ASBC (nº 100622)"
)
my_gloss

## ---- data, message = FALSE---------------------------------------------------
library(magrittr)
library(dplyr) # for select() and filter()
data(glosses)
glosses <- glosses %>% 
  select(original, parsed, translation, label, source) %>% 
  mutate(source = paste0("(", source, ")"))
glosses
glosses$label

## ---- data-gloss--------------------------------------------------------------
gloss_df(head(glosses, 3))

## ---- jp-gloss----------------------------------------------------------------
filter(glosses, endsWith(label, "jp")) %>% 
  gloss_df() %>% 
  gloss_list(listlabel = "jp")

## ---- format-words------------------------------------------------------------
gloss_format_words("A long piece of text", "textit")

## ---- last-gloss--------------------------------------------------------------
my_gloss <- as_gloss(
  original = gloss_format_words("Hace calor/frío", "textbf"),
  parsed = "make.3SG.PRS heat/cold.N.A",
  translation = "'It is hot/cold'",
  label = "formatted"
)
my_gloss

