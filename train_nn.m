function [predicted, net] = train_nn(no_hidden_neurons, inputs, targets)
%This function trains a neural network and plots the confusion matrix from
%its results. It receives as parameters the number of hidden neurons, the
%input features matrix and the corresponding targets label for every
%sample. The function also returns the predicted matrix and the trained
%network
net = patternnet (no_hidden_neurons);   %create a neural network with 1 hidden layer and (usually 10)no_hidden_neurons
net = train (net, inputs, targets);     %train and visualize the network's progress
predicted = net (inputs);               %predict the classes for all the training set
plotconfusion(targets,predicted);       %plot confusion matrix