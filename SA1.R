library(shiny)
ui <- fluidPage(
   output$greeting <- renderText({
    paste0("Hello ", input$name)
  })
)
  

server <- function(input, output, session) {
  numericInput("age", "How old are you?", value = NA)
  textInput("name", "What's your name?")
  textOutput("greeting")
  output$histogram <- renderPlot({
    hist(rnorm(1000))
  }, res = 96)
}


shinyApp(ui, server)




ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "If y is", min = 1, max = 50, value = 30),
  "then x times y is",
  textOutput("product")
)
server <- function(input, output, session) {
  output$product <- renderText({
    input$x*input$y
  })
}
shinyApp(ui, server)


ui <- fluidPage(
  sliderInput("x", "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", "and y is", min = 1, max = 50, value = 5),
  "then, (x * y) is", textOutput("product"),
  "and, (x * y) + 5 is", textOutput("product_plus5"),
  "and (x * y) + 10 is", textOutput("product_plus10")
)
server <- function(input, output, session) {
  product <- reactive({input$x * input$y})
  output$product <- renderText({
    product()
  })
  output$product_plus5 <- renderText({
    #product <- input$x * input$y
    product() + 5
  })
  output$product_plus10 <- renderText({
    #product <- input$x * input$y
    product() + 10
  })
}
shinyApp(ui, server)


library(ggplot2)
datasets <- c("economics", "faithfuld", "seals")
ui <- fluidPage(
 selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)
server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$plot <- renderPlot({
    plot(dataset())
  }, res = 96)
}
shinyApp(ui, server)



ui <- fluidPage(
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3)
)

shinyApp(ui, server)


ui <- fluidPage(
  numericInput("num", "Number one", value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100)
)

shinyApp(ui, server)


ui <- fluidPage(
  dateInput("dob", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?")
)

shinyApp(ui, server)

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")
ui <- fluidPage(
  selectInput("state", "What's your favourite state?", state.name),
  radioButtons("animal", "What's your favourite animal?", animals)
)

shinyApp(ui, server)

ui <- fluidPage(
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry", "happy", "sad")
  )
)
shinyApp(ui, server)


ui <- fluidPage(
  selectInput(
    "state", "What's your favourite state?", state.name,
    multiple = TRUE
  )
)


shinyApp(ui, server)

ui <- fluidPage(
  checkboxGroupInput("animal", "What animals do you like?", animals)
)


shinyApp(ui, server)
ui <- fluidPage(
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?")
)

shinyApp(ui, server)

ui <- fluidPage(
  fileInput("upload", NULL)
)


shinyApp(ui, server)


ui <- fluidPage(
  actionButton("click", "Click me!"),
  actionButton("drink", "Drink me!", icon = icon("beer"))
)


shinyApp(ui, server)



ui <- fluidPage(
  fluidRow(
    actionButton("click", "Click me!", class = "btn-danger"),
    actionButton("drink", "Drink me!", class = "btn-lg btn-success")
  ),
  fluidRow(
    actionButton("eat", "Eat me!", class = "btn-block")
  )
)

shinyApp(ui,server)


ui <- fluidPage(
  textOutput("text"),
  verbatimTextOutput("code")
)
server <- function(input, output, session) {
  output$text <- renderText({
    "Hello friend!"
  })
  output$code <- renderPrint({
    summary(1:10)
  })
}

shinyApp(ui,server)

ui <- fluidPage(
  tableOutput("static"),
  dataTableOutput("dynamic")
)
server <- function(input, output, session) {
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 10))
}


shinyApp(ui,server)

ui <- fluidPage(
  plotOutput("plot1", width = "400px")
)
server <- function(input, output, session) {
output$plot1 <- renderPlot(plot(1:5,6:10, col='red', xlab='Eje X', ylab='Eje Y', main='Grafica')
                             , res = 96)
}

shinyApp(ui,server)

ui <- fluidPage(
  textOutput("greeting")
)
server <- function(input, output, session) {
  output$greeting <- renderText("Hello human!")
}
shinyApp(ui, server)




ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)
server <- function(input, output, session) {
  string <- reactive(paste0("Hello ", input$name, "!"))
  output$greeting <- renderText(string())
}



shinyApp(ui, server)



ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)


server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}


shinyApp(ui,server)






shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)
shinyApp(ui,server)






