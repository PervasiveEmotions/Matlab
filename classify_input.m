function [result] = classify_input(net, input_location)
%this function determines the class (emotion) to which the input
%corresponds. It does this by extracting the mfcc from the audio file(4s)
%and inputting this values in the already trained NN. The function returns a 4
%digit number where the first digit represents the emotion class and the
%remaining 3 represent the accuracy of classification
[audioIn, Fs] = audioread(input_location);          %read the audio file
input = mfcc(audioIn, Fs);                          %calcualte mfcc
input = input';                                     %transpose the matrix
input = reshape(input,[],1);                        %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
output = net(input);                                %input the sample test in the NN
class = max(output);                                %the maximum element of the output matrix is the class to which the test corresponds
counter = 0;                                        %initialize variable to find the corresponding class of the max value
for i = 1:6                                         %iterate throug all rows(output classes)
    counter = counter + 1;                          %add 1 on every iteration
    if (output(i,1) == class)                       %when the current value is equal to the maximum value that is being searched
        break;                                      %stop iterating
    end
end
accuracy = round(class*100);                        %format as a percentage the accuracy of the classified sample
result = (counter * 1000) + accuracy;               %store by our convention the emotion and its accuracy of classification