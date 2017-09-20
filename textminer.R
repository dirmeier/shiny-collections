library(shiny)
library(shinyjs)
library(tm)
library(magrittr)

term.matrix <- function()
{
    text <- readLines("data/local.txt", encoding="UTF-8")
    corp <-  Corpus(VectorSource(text)) %>%
        tm_map(content_transformer(tolower)) %>%
        tm_map(removePunctuation) %>%
        tm_map(removeNumbers) %>%
        tm_map(removeWords,
               c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))

    m <- TermDocumentMatrix(corp, control = list(minWordLength = 1)) %>%
        as.matrix

    sort(rowSums(m), decreasing = TRUE)
}
