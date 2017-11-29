library('neuralnet')

# Load training data
data = read.csv('train.csv', header=F)

# Load input parameters
library(data.table)
dframe <- read.table(file='params.txt',header=FALSE,sep='=',col.names=c('Key','Value'))
dtable <- data.table(dframe,key='Key')
n_truth = dtable['n_truth']$Value
n_data = dtable['n_data']$Value

truth_names = paste('t',seq(1,n_truth),sep='')
data_names = paste('d',seq(1,n_data),sep='')
colnames(data) <- c(truth_names,data_names)

# Train neural network
form_truth = paste(truth_names,collapse='+')
form_data = paste(data_names,collapse='+')
form = paste(form_truth,'~',form_data,sep='')
output = neuralnet(form,data,lifesign='full',lifesign.step=10,hidden=20)

# Load test data
z = read.csv('test.csv', header=F)
colnames(z) <- c(data_names)

# Run neural network
pred = compute(output,z)
z$pred <- pred$net.result
z$result = apply(z$pred,1,which.max)

# Save output
write.table(z[c('pred',data_names)], 'test_output.csv',row.names=F, col.names=F,sep=',')

