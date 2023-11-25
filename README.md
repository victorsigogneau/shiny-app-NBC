# Shiny Naive Bayes Classifier App

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

4. Run the app by executing the entire script.

5. The Shiny app should launch in your default web browser. If not, check the R console for instructions.

# Using the App

## Training the Model
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/863f2c51-9dac-410b-9d1f-3a6c5b0fe23a)

1. Navigate to the **"Entraîner le modèle"** tab.

2. Upload a CSV file containing your training data. Select the target variable and explanatory variables.

3. Configure model parameters such as preprocessing and epsilon.

4. Click the **"Traiter les données"** button to train the Naive Bayes model.

5. Explore accuracy and model output in the **"Pré-Visualisation des données"** and **"Accuracy"** sections.

## Importance Variable Graph
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/b5e7f642-cb90-40b3-ba37-1fe2c7956113)

1. Switch to the **"Graphique Importance variable"** tab.

2. View the bar plot showing the importance of each variable.

## Predicting with a New Dataset

1. Go to the **"Prediction avec un nouveau fichier"** tab.

2. Upload a new CSV file containing the data you want to predict.

3. Configure options such as separator and header.

4. Click **"Prédire les classes"** to predict the classes for the new data.


## Predictions and Probabilities
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/d60f03a5-3f28-4f29-9f57-9a28417ee69a)
![image](https://github.com/victorsigogneau/shiny-app-NBC/assets/114923062/c0c9a92a-7c4e-428c-93d7-c72c40914b0e)


1. Switch to the **"Prédictions classe"** and **"Probabilité d'appartenance"** tabs to view predictions and probabilities.

## Downloading Results

1. After making predictions, a **"Download .xlsx"** button will appear in the **"Prédictions classe"** tab.

2. Click the button to download the results in Excel format.

# Additional Information

- The app utilizes the NaiveBayes R6 class defined in the script.

- Make sure to provide complete and clean datasets for training and prediction.

- For any issues or feedback, please contact [your contact information].
