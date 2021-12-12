function [MFCCDataMatrix, targetOutputMatrix] = processFileToMFCCDataSimple(neutralMatrix, happyMatrix, sadMatrix, angryMatrix, fearfulMatrix, disgustMatrix)

MFCCDataMatrix = zeros(4046, 1440);
fs= 48000;
targetOutputMatrix = zeros(6,1440);

counter = 0;

for a = 1:96
    e = 1;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = neutralMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);  %calcualte mfcc
    coeffs = coeffs';      %transpose the matrix
    coeffs = reshape(coeffs,[],1);  %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:192
    e = 2;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = disgustMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);  %calcualte mfcc
    coeffs = coeffs';      %transpose the matrix
    coeffs = reshape(coeffs,[],1);  %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:192
    e = 3;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = happyMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);  %calcualte mfcc
    coeffs = coeffs';      %transpose the matrix
    coeffs = reshape(coeffs,[],1);  %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:192
    e = 4;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = sadMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);  %calcualte mfcc
    coeffs = coeffs';      %transpose the matrix
    coeffs = reshape(coeffs,[],1);  %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:192
    e = 5;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = angryMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);  %calcualte mfcc
    coeffs = coeffs';      %transpose the matrix
    coeffs = reshape(coeffs,[],1);  %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:192
    e = 6;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = fearfulMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);  %calcualte mfcc
    coeffs = coeffs';      %transpose the matrix
    coeffs = reshape(coeffs,[],1);  %reshape it to have a matrix of the size: input_features (6972) x 1. i.e. all values in one column
    MFCCDataMatrix(:, counter) = coeffs;
end
