function [result] = test_input(net, test_input, no_target_classes)
%this function tests an input sample and classifies it in either of the total
%classes (no_traget_classes). The function receives as parameters a trained
%neural network, the input sample ready to be inputed in the network for
%testing and the total number of output classes. The function returns a 4
%digit number where the first digit represents the emotion class and the
%remaining 3 represent the accuracy of classification
test_output = net(test_input)                       %input the sample test in the NN
class = max(test_output);                           %the maximum element of the output matrix is the class to which the test corresponds
counter = 0;                                        %initialize variable to find the corresponding class of the max value
for i = 1:no_target_classes                         %iterate throug all rows(output classes)
    counter = counter + 1;                          %add 1 on every iteration
    if (test_output(i,1) == class)                  %when the current value is equal to the maximum value that is being searched
        break;                                      %stop iterating
    end
end
accuracy = round(class*100);                        %format as a percentage the accuracy of the classified sample
disp("Class: " + num2str(counter) + " with accuracy: " + num2str(accuracy) + "%");      %display the result in the command window
result = (counter * 1000) + accuracy;               %store by our convention the emotion and its accuracy of classification
    