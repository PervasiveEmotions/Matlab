function [samples] = create_sample_set_mfcc_f0(total_no_samples, actor)
%This function receives as a parameter (1)the number of the actor who recorded the audio, (2)the total number of samples for the
%training set and creates the set with the features of mfcc and fundamental frequency(f0),
% ready to be inputted to a neural network 
%note this function has a fixed number of windows, for audios lasting 4s
M = 14;                                         %number of coefficients returned per frame
L = 398;                                        %number of analysis windows the audio signal is partitioned into
input_features = (M * L) + 1;                   %number of elements of input_features is equal to the dimensions of the M x L matrix, plus an additional input feature for the fundamental frequency
samples = zeros(input_features,total_no_samples);
for i = 1:total_no_samples                      %iterate through the total number of audio files
    filename = "audioData/filename" + num2str(i) + "-" + num2str(actor) + ".wav";    %the filename of the current audio file
    [audioIn, Fs] = audioread(filename);        %read the audio file
    coeffs = mfcc(audioIn, Fs);                 %calculate mfcc
    coeffs = coeffs';                           %transpose the matrix
    coeffs = reshape(coeffs,[],1);              %reshape it to have a matrix of the size: input_features (6973) x 1. i.e. all values in one column
    all_fundamental_frequencies = pitch(audioIn,Fs);%estimate fundamental frequency of audio signal
    f0 = mean(all_fundamental_frequencies);     %calculate the average fundamental frequency of all the audio signal
    samples(1:(end-1),i)= coeffs;               %assign the sample at the ith column with the current mfc coefficients
    samples(end,i) = f0;                        %the last row of the input feature is the fundamental frequency
end
