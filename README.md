# Developing Data Products: A Shiny application. 

## Introduction

This application performs a clinical prediction rule validated for mortality predicting in community adquired pneumonia: CURB-65. This clinical rule is recommended by the British Thoracic Society for the assessment of the severity of the pneumonia. The CURB-65 involves calculating a score, which places a given patient into one of 6 risk classes (0-5). The higher the score, the higher the risk mortality is. 


## CURB-65 score description

First of all, the score computation is explained. To this end, the following patient charateristics are considered to compute the mentioned index:

* Age of patient: Patients >=65 years old are assigned 1 point. 
* Confusion, mental test: Patient's mental status is assessed. 1 point if the patient is has an altered mental test.  
* Blood urea nitrogen (BUN) (mmol/l): This is a test which counts the urea level in blood. A BUN >7 mmol/l 
adds 1 point to the score. 
* Respiratory Rate (RR): A respiratory rate >=30 assigns 1 point. 
* Blood pressure: Both systolic and diastolic arterial pressures are measured. Patients with a systolic <90 mmHg or with a diastolic <=60 mmHg will have 1 point. 

The score total is the sum of the abovementiond five components. It ranges from 0 (no risk) to 5 (high risk). 
After that, a classification can be performed:

* Low risk mortality :  Scores with 0 or 1 points (Management: To home)
* Moderate risk mortality: Score with 2 points.   (Management: Likely to need admission)
* High risk mortality: Score >=3 points.          (Management: Admission and manage as Severe)


## Application description

Link of Application on github shiny server: <a href="https://ggdrq.shinyapps.io/ProjectDef/">https://ggdrq.shinyapps.io/ProjectDef/</a>. 

This application computes the mentioned score. It is divided in two parts:

* Sidebar panel: Panel where values of input variables are displayed and introduced. 
* Main panel: CURB-65 index score, the clinical decission (Home, Likely to need admission, Admission and manage as severe). A barplot of the mortality risk according to the CURB-65 score is also performed. 


