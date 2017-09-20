library(shiny)
library(shinyjs)
library(plotly)

shinyUI(
    fluidPage(
        useShinyjs(),
        theme = "extra.css",
        fluidRow(
            column(
                width = 8, offset=2,
                HTML("<h1 style=\"margin-top: 10%;margin-bottom: 2.5%\">Collections</h1>"),
                HTML("<h3 style=\"margin-bottom: 10%\"><a href=\"https://dirmeier.github.io/\">dirmeier.github.io</a></h3>"),
                HTML("<p style=\"margin-top: 10%;margin-bottom: 10%\">
                     This is just a test implementation of a shiny
                     server with some custom css and a few plots.
                     <br>
                     You can find the source at <a href=\"https://github.com/dirmeier/shiny-collections\">GitHub</a>.</p>"
                )
            )
        ),
        fluidRow(column(width = 6,offset=2,  HTML("<hr>"))),
        fluidRow(
            column(
                width = 6,offset=2,
                h3("Scatterplot"),
                HTML("<h5><i>Created using ggplot2, hrbrthemes and ggsci on the iris data.</i></h5>"),
                tags$img(src = "spinner.gif", class = "loading-spinner"),
                plotOutput("scatterplot", width=800)
            )
        ),
        fluidRow(column(width = 6,offset=2,  HTML("<hr>"))),
        fluidRow(
            column(
                width = 6,offset=2,
                h3("WordCloud"),
                HTML("<h5><i>Created using tm, wordcloud and ggsci on Sophocles' Oedipus trilogy.</i></h5>"),
                tags$img(src = "spinner.gif", class = "loading-spinner"),
                plotOutput("wordcloud", width=800)
            )
        ),
        fluidRow(column(width = 6,offset=2,  HTML("<hr>"))),
        fluidRow(
            column(
                width = 6,offset=2,
                h3("Histogram"),
                HTML("<h5><i>Created using plotly on random data.</i></h5>"),
                tags$img(src = "spinner.gif", class = "loading-spinner"),
                plotlyOutput("histogram",  width=800)
            )
        ),
        fluidRow(column(width = 6,offset=2,  HTML("<hr>"))),
        fluidRow(
            column(
                width = 6,offset=2,
                h3("Tileplot"),
                HTML("<h5><i>Created using plotly, ggplot2, hrbrthemes on random data.</i></h5>"),
                tags$img(src = "spinner.gif", class = "loading-spinner"),
                column(6, offset = 2,
                    plotlyOutput("tileplot", height=600, width=800)
                )
            )
        ),
        fluidRow(
            column(
                width = 6,offset=2,
                HTML("<p style=\"font-size: 0.75em;\">&copy;2017 Simon Dirmeier (<a href=\"mailto:simon.dirmeier@gmx.de\">mailto:simon.dirmeier@gmx.de</a>)")
            )
        )
    )
)


