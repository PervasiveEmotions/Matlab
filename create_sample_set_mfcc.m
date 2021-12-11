function [samples] = create_sample_set_mfcc(total_no_samples, actor)
%This function receives as a parameter (1)the number of the actor who recorded the audio, (2)the total number of samples for the
%training set and creates the set with the feature of mfcc, ready to be inputted to a neural network 
%note this function has a fixed number of windows, for audios lasting 4s
M = 14;                                         %number of coefficients returned per frame
L = 398;                                        %number of analysis windows the audio signal is partitioned into
input_features = M * L;                         %number of elements of input_features is equal to the dimensions of the M x L matrix
samples = zeros(input_features,total_no_samples);
for i = 1:total_no_samples                      %iterate through the total number of audio files
    filename = "audioData/filename" + num2str(i) + "-" + num2str(actor) + ".wav";    %the filename of the current audio file
    [audioIn, Fs] = audioread(filename);        %read the audio file
    coeffs = mfcc(audioIn, Fs);                 %calcualte mfcc
    coeffs = coeffs';                           %transpose the matrix
    coeffs = reshape(coeffs,[],1);              %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
    samples(:,i)= coeffs;                       %assign the sample at the ith column with the current mfc coefficients
end
    