library(shiny)
library(shinythemes)


ui <- navbarPage(
  theme = shinytheme("yeti"),
  title = "Application Naive Bayes Classifier",
  tabPanel("Entraîner le modèle",
           fluidRow(
             column(width = 3,
                    HTML("<h4 style='text-align: left;'>Chargement du CSV</h4>"),
                    fileInput("file", "Sélectionnez le fichier CSV"),
                    selectInput("target_variable", "Sélectionnez la variable cible", choices = NULL),
                    selectInput("explanatory_variables", "Sélectionnez les variables explicatives", choices = NULL, multiple = TRUE),
                    selectInput("separator", "Séparateur", choices = c(",", ";"), selected = ","),
                    selectInput("decimal", "Décimal", choices = c(".", ","), selected = "."),
                    checkboxInput("header", "Le fichier CSV a un en-tête", value = TRUE),
                    HTML("<h4 style='text-align: left;'>Paramètres du modèle</h4>"),
                    checkboxInput("preproc", "Prétraiter les données", value = TRUE),
                    numericInput("epsilon", "Epsilon", value = 0.001, step = 0.001),
                    actionButton("process_data", "Traiter les données")
             ),
             column(width = 9,
                    HTML("<h3 style='text-align: left;'>Pré-Visualisation des données</h3>"),
                    tableOutput("raw_data_table"),
                    HTML("<h3 style='text-align: left;'>Accuracy</h3>"),
                    textOutput("accuracy_output"),
                    HTML("<h3 style='text-align: left;'>Sorties du modèle</h3>"),
                    verbatimTextOutput("model_output")
             )
           )
  ),
  
  tabPanel("Graphique Importance variable",
           plotOutput("importance_plot")
  ),
  
  tabPanel("Prediction avec un nouveau fichier",
           fluidRow(
             column(width = 3,
                    fileInput("new_file", "Sélectionnez le nouveau fichier CSV"),
                    selectInput("new_separator", "Séparateur", choices = c(",", ";"), selected = ","),
                    selectInput("new_decimal", "Décimal", choices = c(".", ","), selected = "."),
                    checkboxInput("new_header", "Le nouveau fichier CSV a un en-tête", value = TRUE),  
                    actionButton("predict_new_data", "Prédire les classes"),
                    textOutput("export_message"),
             ),
             column(width = 4,
                    HTML("<h3 style='text-align: left;'>Nouvelles données</h3>"),
                    tableOutput("new_data_table"),
                    downloadButton("downloadexcel", "Download .xlsx"),
             )
           )
  ),
  tabPanel("Prédictions classe",
           tableOutput("data_table")
  ),
  
  tabPanel("Probabilité d'appartenance",
           tableOutput("predictions_table")
  )
  
  
)