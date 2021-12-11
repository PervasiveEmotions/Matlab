function [MFCCDataMatrix, targetOutputMatrix] = processFileToMFCCData(neutralMatrix, calmMatrix, happyMatrix, sadMatrix, angryMatrix, fearfulMatrix, disgustMatrix, suprisedMatrix)

MFCCDataMatrix = zeros(4046, 1448);
fs= 48000;
targetOutputMatrix = zeros(8,1448);

counter = 0;

for a = 1:97 % for all of neutral data
    e = 1;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;%set target output in correct row, here row 1, and correct column: the counter
    
    y = neutralMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs); %do mfcc on the audio vector in the specified file of the matrix
    coeffs = coeffs(:); %add all coeffs into a single column so it can be put in only one row in the matrix
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:193
    e = 2;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = calmMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);
    coeffs = coeffs(:);
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:193
    e = 3;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = happyMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);
    coeffs = coeffs(:);
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:193
    e = 4;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = sadMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);
    coeffs = coeffs(:);
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:193
    e = 5;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = angryMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);
    coeffs = coeffs(:);
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:193
    e = 6;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = fearfulMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);
    coeffs = coeffs(:);
    MFCCDataMatrix(:, counter) = coeffs;
end
for a = 1:193
    e = 7;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = disgustMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);
    coeffs = coeffs(:);
    MFCCDataMatrix(:, counter) = coeffs;
    
end
for a = 1:193
    e = 8;
    counter = counter + 1;
    targetOutputMatrix(e,counter) = 1;
    
    y = suprisedMatrix(:, a); % extract column at a
    
    coeffs = mfcc(y, fs);
    coeffs = coeffs(:);
    MFCCDataMatrix(:, counter) = coeffs;
end
