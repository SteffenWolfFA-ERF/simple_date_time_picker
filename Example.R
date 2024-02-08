library(SimpleDateTimePicker)
library(shiny)
library(lubridate)
ui <- fluidPage(
  br(),
  sidebarLayout(
    sidebarPanel(
      textInput("text", "Text:", value = "blabla"),
      fluidRow(
        column(8, datetimePickerInput(
          "dtpicker",
          label = "Datetime:",
          value = NULL
          #style = "font-family: Montserrat, 'Segoe UI', Tahoma, sans-serif;"
        )),
        column(4, actionButton("now", "Now"))
      )
    ),
    mainPanel(
      verbatimTextOutput("dtpicker")
    )
  )
)

server <- function(input, output, session){
  output[["dtpicker"]] <- renderPrint({
    input[["dtpicker"]]
  })

  observeEvent(input$now, updateDatetimePickerInput(session, "dtpicker", value = now()))
}

shinyApp(ui, server)
