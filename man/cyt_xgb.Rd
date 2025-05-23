% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyt_xgb.R
\name{cyt_xgb}
\alias{cyt_xgb}
\title{Run XGBoost Classification on Cytokine Data.}
\usage{
cyt_xgb(
  data,
  group_col,
  train_fraction = 0.7,
  nrounds = 500,
  max_depth = 6,
  eta = 0.1,
  nfold = 5,
  cv = FALSE,
  objective = "multi:softprob",
  early_stopping_rounds = NULL,
  eval_metric = "mlogloss",
  gamma = 0,
  colsample_bytree = 1,
  subsample = 1,
  min_child_weight = 1,
  top_n_features = 10,
  plot_roc = FALSE,
  output_file = NULL,
  progress = NULL
)
}
\arguments{
\item{data}{A data frame containing the cytokine data, with one column as the grouping variable
and the rest as numerical features.}

\item{group_col}{A string representing the name of the column with the grouping variable
(i.e., the target variable for classification).}

\item{train_fraction}{A numeric value between 0 and 1 representing the proportion of data to use for training (default is 0.7).}

\item{nrounds}{An integer specifying the number of boosting rounds (default is 500).}

\item{max_depth}{An integer specifying the maximum depth of the trees (default is 6).}

\item{eta}{A numeric value representing the learning rate (default is 0.1).}

\item{nfold}{An integer specifying the number of folds for cross-validation (default is 5).}

\item{cv}{A logical value indicating whether to perform cross-validation (default is FALSE).}

\item{objective}{A string specifying the XGBoost objective function (default is "multi:softprob" for multi-class classification).}

\item{early_stopping_rounds}{An integer specifying the number of rounds with no improvement to stop training early (default is NULL).}

\item{eval_metric}{A string specifying the evaluation metric (default is "mlogloss").}

\item{gamma}{A numeric value for the minimum loss reduction required to make a further partition (default is 0).}

\item{colsample_bytree}{A numeric value specifying the subsample ratio of columns when constructing each tree (default is 1).}

\item{subsample}{A numeric value specifying the subsample ratio of the training instances (default is 1).}

\item{min_child_weight}{A numeric value specifying the minimum sum of instance weight needed in a child (default is 1).}

\item{top_n_features}{An integer specifying the number of top features to display in the importance plot (default is 10).}

\item{plot_roc}{A logical value indicating whether to plot the ROC curve and calculate the AUC for binary classification (default is FALSE).}

\item{output_file}{Optional. A file path to save the outputs as a PDF file. If provided, outputs are written to the file and results are returned invisibly.}
}
\value{
A list containing:
\item{summary_text}{A character string summarizing key results (interactive mode only).}
\item{model}{The trained XGBoost model.}
\item{confusion_matrix}{The confusion matrix (test set).}
\item{importance}{The feature importance data for the top features.}
\item{class_mapping}{A named vector showing the mapping from class labels to numeric values used for training.}
\item{cv_results}{Cross-validation results if performed (otherwise NULL).}
\item{plot}{A ggplot object showing the feature importance plot.}
}
\description{
This function trains and evaluates an XGBoost classification model on cytokine data.
It allows for hyperparameter tuning, cross-validation, and visualizes feature importance.
}
\examples{
# Example usage:
data_df0 <- ExampleData1
data_df <- data.frame(data_df0[, 1:3], log2(data_df0[, -c(1:3)]))
data_df <- data_df[, -c(2,3)]
data_df <- dplyr::filter(data_df, Group != "ND")

cyt_xgb(
  data = data_df, group_col = "Group",
  nrounds = 500, max_depth = 4, eta = 0.05,
  nfold = 5, cv = FALSE, eval_metric = "mlogloss",
  early_stopping_rounds = NULL, top_n_features = 10,
  plot_roc = TRUE
)

}
