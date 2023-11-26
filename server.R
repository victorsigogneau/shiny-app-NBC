library(shiny)
library(e1071)
library(R6)
library(shinythemes)
library(xlsx)
library(doParallel)
library(openxlsx)
library(devtools)
source("C:/Users/user/Documents/GitHub/naive_bayes_r/Victor/SHINY_TEST/NB.R")

nb_model <- NaiveBayes$new()
set.seed(42)

server <- function(input, output, session) {
  data <- reactive({
    req(input$file)
    read.csv(input$file$datapath, sep = input$separator, dec = input$decimal, header = input$header)
  })
  
  #Target variable
  observe({
    choices <- names(data())
    updateSelectInput(session, "target_variable", choices = choices)
  })
  
  #Explanatory variables
  observe({
    choices <- names(data())
    updateSelectInput(session, "explanatory_variables", choices = choices)
  })
  
  #Show the train dataset
  output$raw_data_table <- renderTable({
    df <- head(data(), n = 7)
    return(df)
  }, include.rownames = FALSE)
  
  predictions <- reactiveVal(NULL)
  test_data <- reactiveVal(NULL)
  
  #Fitting the model
  observe({
    if (input$process_data > 0) {
      n_rows <- nrow(data())
      train_index <- sample(1:n_rows, 0.7 * n_rows)
      test_index <- setdiff(1:n_rows, train_index)
      train_data <- data()[train_index, ]
      test_data <- data()[test_index, ]
      X_train <- train_data[, input$explanatory_variables]
      y_train <- train_data[, input$target_variable]
      X_test <- test_data[, input$explanatory_variables]
      y_test <- test_data[, input$target_variable]
      nb_model$fit(X_train, y_train, preproc = input$preproc, epsilon = input$epsilon)
    }
  })
  
  #Calculate and show the accuracy
  output$accuracy_output <- renderText({
    if (input$process_data > 0) {
      n_rows <- nrow(data())
      train_index <- sample(1:n_rows, 0.7 * n_rows)
      test_index <- setdiff(1:n_rows, train_index)
      train_data <- data()[train_index, ]
      test_data <- data()[test_index, ]
      X_train <- train_data[, input$explanatory_variables]
      y_train <- train_data[, input$target_variable]
      X_test <- test_data[, input$explanatory_variables]
      y_test <- test_data[, input$target_variable]
      predictions <- nb_model$predict(X_test)
      comparison_result <- y_test == predictions
      count_identical <- sum(comparison_result)
      accuracy <- sum(count_identical) / length(y_test)
      return(accuracy)
    }
  })
  
  #Show the result the summary and information about the model
  output$model_output <- renderPrint({
    if (input$process_data>0) {
      nb_model$Summary()
      nb_model$Print()
    }
  })
  
  #Plot importance variables
  output$importance_plot <- renderPlot({
    if (input$process_data > 0) {
      nb_model$compute_and_plot_importance()
    }
  })
  
  #Load the new_data(the data to predict)
  new_data <- reactive({
    req(input$new_file)
    read.csv(input$new_file$datapath, sep = input$new_separator, dec = input$new_decimal, header = input$new_header)
  })
  
  # Store combined_data as a reactive value
  combined_data <- reactiveVal(NULL)
  
  #Show the dataset to predict
  output$new_data_table <- renderTable({
    new_data_table <- head(new_data(), n = 7)
    return(new_data_table)
  })
  
  #Predict new classe of the new dataset
  observe({
    if (input$predict_new_data > 0) {
      if (is.null(combined_data())) {
        # If not, calculate and store predictions in combined_data
        predictions <- nb_model$predict(new_data()[, input$explanatory_variables])
        combined_data_value <- cbind(new_data(), Prediction = predictions)
        combined_data(combined_data_value)
        print(44)
        output$export_message <- renderText({
          paste("Prédictions terminées")
        })
      }
    }
  })
  
  
  #Predict and return full dataset with the predicted class
  output$data_table <- renderTable({
    if (input$predict_new_data > 0) {
      # Check if combined_data is already calculated
      if (is.null(combined_data())) {
        # If not, calculate and store predictions in combined_data
        predictions <- nb_model$predict(new_data()[, input$explanatory_variables])
        combined_data_value <- cbind(new_data(), Prediction = predictions)
        combined_data(combined_data_value)
        print(44)
      }
      return(combined_data())
    }
  })
  
  #Show the probability of membership of classes
  output$predictions_table <- renderTable({
    if (input$predict_new_data > 0) {
      probabilities <- nb_model$predict_proba(new_data()[, input$explanatory_variables])
      probabilities <- cbind(new_data(), probabilities)
      return(probabilities)
    }
  })
  
  #Downloadable excel of result
  output$downloadexcel <- downloadHandler(
    filename = function() {
      paste("result", ".xlsx", sep = "")},
    content = function(file) {
      xlsx::write.xlsx(combined_data(), file, row.names = TRUE)}
  )
}
