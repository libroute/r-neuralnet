# Machine learning using neuralnet in R
A basic machine learning template which uses input data to train a neural network and outputs the results of a test data set.

# Data inputs
## params.txt
A key value file containing the number of objective variables (one per output class) and data variables, for example:
n\_truth=3
n\_data=2

## train.csv
A csv file containing training data with objective variables (of which n\_truth) then data variables (of which n\_data), with one data point per row.

## test.csv
A csv file containing a set of data variables to be evaluated using the trainet network, with the same number of columns as specified in n\_data.

# Data outputs
## test\_output.csv
A csv file containing the predictions of the test set, followed by the test set data values, with one data point per row.

