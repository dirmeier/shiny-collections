library(shiny)
library(shinyjs)
library(ggplot2)
library(ggsci)
library(hrbrthemes)
library(wordcloud)
library(viridis)
library(viridisLite)
library(scales)
library(RColorBrewer)
library(plotly)
library(mvtnorm)

source("./textminer.R")

shinyServer(function(input, output)
{

    output$scatterplot <- renderPlot({
        ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species)) +
            geom_point(aes(colour=Species)) +
            geom_smooth(alpha=.1) +
            hrbrthemes::theme_ipsum_rc() +
            ggsci::scale_colour_rickandmorty() +
            labs(title="Iris scatter plot",
                 subtitle="Visualizing sepal width vs. sepal length for several species in a schwifty theme.")
  })

    output$wordcloud <- renderPlot({
        v <- term.matrix()
        wordcloud(names(v), v, scale=c(2,0.5),
                  min.freq = 10, max.words=100,
                  colors=ggsci::pal_lancet()(7))
  })

    output$histogram <- renderPlotly({
        s <- matrix(c(1, -.75, -.75, 1), ncol = 2)
        obs <- mvtnorm::rmvnorm(1000, sigma = s)
        plot_ly(x = obs[,1], y = obs[,2]) %>% add_histogram2d()
    })

    output$tileplot <- renderPlotly({
        n <- 100
        x <- seq(1, 5, length.out = n)
        y <- seq(1, 5, length.out = n)
        data <- expand.grid(X = x, Y = y)
        data$Value <- rnorm(n*n, 0, 5)

        g <- ggplot(data, aes(X, Y, z = Value)) +
            geom_tile(aes(fill = Value), color="black") +
            scale_x_discrete(expand = c(0,0)) +
            scale_y_discrete(expand = c(0,0)) +
            scale_fill_viridis(option="A")
        ggplotly(g, height=400, width=400) %>% layout(dragmode = "select")
  })

})
