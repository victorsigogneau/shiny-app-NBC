# Shiny Naive Bayes Classifier App

The application is hosted [here](https://c4sf5g-victor-sigogneau.shinyapps.io/shiny_test/)
## Overview

This Shiny application is designed to train and evaluate a Naive Bayes Classifier using user-provided datasets. It also allows users to make predictions on new datasets and explore the importance of variables.

## Getting Started

### Prerequisites

Make sure you have the following R libraries installed:

- shiny
- e1071
- R6
- shinythemes
- xlsx
- doParallel

You can install them using the following R commands:

```R
install.packages(c("shiny", "e1071", "R6", "shinythemes", "xlsx", "doParallel"))
# Running the App
```
1. **Clone or download this repository** to your local machine.

2. Open the R script **naive_bayes_app.R** in your R environment.

3. Install any missing R packages if prompted.

4. Change the path in app.R and server.R. 

5. Run the app by executing the entire script.

6. The Shiny app should launch in your default web browser. If not, check the R console for instructions.

# Using the App

## Training the Model
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/412ed671-c698-46a4-a717-831bd841f3fe)


1. Navigate to the **"Entraîner le modèle"** tab.

2. Upload a CSV file containing your training data. Select the target variable and explanatory variables.

3. Configure model parameters such as preprocessing and epsilon.

4. Click the **"Traiter les données"** button to train the Naive Bayes model.

5. Explore accuracy and model output in the **"Pré-Visualisation des données"** and **"Accuracy"** sections.

## Importance Variable Graph
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/5ebc1546-0553-4ef0-a3ee-3ca9981836d1)


1. Switch to the **"Graphique Importance variable"** tab.

2. View the bar plot showing the importance of each variable.

## Predicting with a New Dataset
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/af7a044e-e2ac-4604-97cc-5c89f20346ea)

1. Go to the **"Prediction avec un nouveau fichier"** tab.

2. Upload a new CSV file containing the data you want to predict.

3. Configure options such as separator and header.

4. Click **"Prédire les classes"** to predict the classes for the new data.


## Predictions and Probabilities
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/1a595e80-e9a4-41e5-9f08-86ca9e3a8345)

![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/302ee1b8-b950-4c58-a669-59501261f061)



1. Switch to the **"Prédictions classe"** and **"Probabilité d'appartenance"** tabs to view predictions and probabilities.

## Downloading Results

1. After making predictions, a **"Download .xlsx"** button will appear in the **"Prédictions classe"** tab.

2. Click the button to download the results in Excel format.

# Additional Information

- The app utilizes the NaiveBayes R6 class defined in the script.

- Make sure to provide complete and clean datasets for training and prediction.

- For any issues or feedback, please contact [your contact information].
