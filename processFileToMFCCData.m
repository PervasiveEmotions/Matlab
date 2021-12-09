function [MFCCDataMap, targetOutputMatrix] = processFileToMFCCData(testDataMap)

MFCCDataMap = containers.Map; %create map object
fs= 48000;
targetOutputMatrix = zeros(8,1440);

counter = 0;
for a = 1:8
    for b = 1:2
        for c = 1:2
            for d = 1:2
                for e = 1:24
                    counter = counter + 1;
                    if e < 10 %the last digit(e) has one number, therefore a 0 is added before it
                        name = "03-01-0"+a+"-0"+b+"-0"+c+"-0"+d+"-0"+e+".wav";%creates a string that corresponds
                        %to filename
                        filename = convertStringsToChars(name); %convert string to chars 
                    
                    else %last digit(e) has two numbers, no 0 is added before it
                        name = "03-01-0"+a+"-0"+b+"-0"+c+"-0"+d+"-"+e+".wav";
                        filename = convertStringsToChars(name);  
                    end
                    if not(a == 1 & b== 2)%there are no files with neutral voice and strong intensity, hence this

                        myCell = values(testDataMap,{filename});
                        rawDataArray = myCell{1,1};
                        
                        targetOutputMatrix(a,counter) = 1;
                        
                        
                        coeffs = mfcc(rawDataArray, fs);%FIXME-Window length doesnt work
                        coeffs = coeffs(:);
                        MFCCDataMap(filename) = coeffs;
                        
                        
                        
                    end
                    
                end
                    
            end
            
        end
        
    end
        
end

MFCCDataMap(:,1) = []; %remove first column which is empty 0s