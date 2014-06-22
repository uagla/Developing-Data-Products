## Developing Data Products
## Shiny Application - CURB-65 Pneumonia Severity computer
## User Interface

## The CURB-65 involves calculating a score, which places a given patient into one of 6 risk classes (0-5)'
## It takes the following inputs:
## 1. Age of patient
## 2. Mental status (Confusion)
## 3. Blood Urea Nitrogen
## 4. Respiratory Rate
## 5. Having the blood pressure altered: Systolic < 90 mmHg or Diastolic <=60 mmHg

library(shiny)  

shinyUI(fluidPage( 
  
  titlePanel("CURB-65: Mortality and infection prediction in Community Acquired Pneumonia"), 
  sidebarLayout(
  sidebarPanel(
    p('CURB-65 is a clinical prediction rule validated for mortality predicting in community adquired pneumonia. It is recommended 
      by the British Thoracic Society for the assessment of the severity of the pneumonia. The CURB-65 involves calculating a score, which places a given patient into one of 6 risk classes (0-5)'),
    tags$hr(),
    p('Symptons'),
    sliderInput(inputId = "Age",
                label = "1. Age of patient",
                min = 0, max = 110, value = 60, step = 1),
    radioButtons(inputId = "Confusion",
                       label = "2. Confusion (Mental Test)",
                       choices = list("No" = "N", "Yes" = "Y")),
    numericInput(inputId = "BUN",
                 label = "3. Blood Urea Nitrogen (mmol/l)",4,
                 min=0),
    numericInput(inputId = "RR",
                 label = "4. Respiratory Rate", 20,min=0),
    
    radioButtons(inputId = "SBP_DBP",
                 label = "5. Blood pressure: Systolic < 90 mmHg or Diastolic <=60 mmHg",
                 choices = list("No" = "N", "Yes" = "Y")),    

    tags$hr()
    
    #submitButton("Compute score")
    ),
  
    mainPanel( 
           h3("CURB-65 score:"),
           verbatimTextOutput("val"),
           h4("Management:"),
           verbatimTextOutput("management"),
           plotOutput("figure")
           
      )
  )
))
