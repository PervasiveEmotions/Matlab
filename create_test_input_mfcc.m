function [neuron_input] = create_test_input_mfcc()
%this function creates a sample input to test a neural network. It analyses
%the sound signal and returns mfcc features
Fs = 48000;                                 %set the sampling frequency
rec = audiorecorder(Fs,16,1);               %create a recorder object with the sampling frequency, 16 bits and 1 channel
disp("Recording starting");
recordblocking (rec, 4);                    %record for 4 seconds
disp("Recording stopped");
y = getaudiodata(rec);                      %acquire the audio values
neuron_input = mfcc(y,Fs);                  %calculate mfcc
neuron_input = neuron_input';               %transpose the matrix           
neuron_input = reshape(neuron_input,[],1);  %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
sound(y, Fs);                               %play the sound to ensure it was properly recorded