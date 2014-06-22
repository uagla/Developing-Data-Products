## Developing Data Products
## Shiny Application - CURB-65 Pneumonia Severity computer
## Server 

## The CURB-65 involves calculating a score, which places a given patient into one of 6 risk classes (0-5)'
## It takes the following inputs:
## 1. Age of patient
## 2. Mental status (Confusion)
## 3. Blood Urea Nitrogen
## 4. Respiratory Rate
## 5. Having the blood pressure altered: Systolic < 90 mmHg or Diastolic <=60 mmHg
### Moreover, a decision is suggested and a mortality risk is plotted according to the computed score.

library(shiny)
library(ggplot2)

riskmort<-c(0.7,3.2,13.0,17.0,41.5,57)
score<-c(0,1,2,3,4,5)
data<-data.frame(score,riskmort)
data$score<-as.factor(data$score)


clr<-function(value,colour){
  color<-c()
  for(i in 1:length(data$score)){
      if (data$score[i]==value) {
            color[i]=colour
      } else color[i]="gray" 
  }
  return (color)
}

baseplot <- function(value) {
  color<-ifelse(value %in% c(0,1),"darkgreen",ifelse(value==2,"orange","red"))
  colors<-clr(value,color)
  data<-Data()
  ggplot(data,aes(score,riskmort))+geom_bar(stat = "identity", position = "stack", colour="black",
                                            aes(fill=score))+
    scale_fill_manual(values = colors) +labs(x="CURB-65 score Pneumonia Severity", y="Mortality Risk (%)") +
    theme(legend.direction="horizontal", legend.position="top") +
    scale_color_hue("")
  
}


shinyServer(
  function(input, output) { 
    
   output$val<-renderText({
      ifelse(input$Age>65,1,0)+ifelse(input$Confusion=="Y",1,0)+ifelse(input$BUN>7,1,0)+ifelse(input$RR>=30,1,0)+ifelse(input$SBP_DBP=="Y",1,0)

  })
  
  output$management<-renderText({
    value<-ifelse(input$Age>65,1,0)+ifelse(input$Confusion=="Y",1,0)+ifelse(input$BUN>7,1,0)+ifelse(input$RR>=30,1,0)+ifelse(input$SBP_DBP=="Y",1,0)
    man<-ifelse(value %in% c(0,1),"Home",ifelse(value==2,"Likely to need admission","Admission and manage as Severe"))
    man    
  })
  
  output$figure<-renderPlot({
    value<-ifelse(input$Age>65,1,0)+ifelse(input$Confusion=="Y",1,0)+ifelse(input$BUN>7,1,0)+ifelse(input$RR>=30,1,0)+ifelse(input$SBP_DBP=="Y",1,0)
    color<-ifelse(value %in% c(0,1),"darkgreen",ifelse(value==2,"orange","red"))
    colors<-clr(value,color)
    p<-ggplot(data,aes(score,riskmort))+geom_bar(stat = "identity", position = "stack", colour="black",
                                              aes(fill=score))+
      scale_fill_manual(values = colors) +labs(x="CURB-65 score Pneumonia Severity", y="Mortality Risk (%)", title="Mortality risk by CURB-65 score") +
      theme(legend.direction="horizontal", legend.position="top") +
      scale_color_hue("")

     print(p)
  })
  
})

