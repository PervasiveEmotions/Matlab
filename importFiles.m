function  testDataMap = importFiles() %this function imports data from the RAVDESS English Database,
%The database contains 24 professional actors 
%(12 female, 12 male), vocalizing two lexically-matched statements in a neutral North American accent.
%Filename identifiers:
%Modality (01 = full-AV, 02 = video-only, 03 = audio-only). - only audio
%for our purpose
%Vocal channel (01 = speech, 02 = song).- only speech
%Emotion (01 = neutral, 02 = calm, 03 = happy, 04 = sad, 05 = angry, 06 = fearful, 07 = disgust, 08 = surprised).
%Emotional intensity (01 = normal, 02 = strong). NOTE: There is no strong intensity for the 'neutral' emotion.
%Statement (01 = "Kids are talking by the door", 02 = "Dogs are sitting by the door").
%Repetition (01 = 1st repetition, 02 = 2nd repetition).
%Actor (01 to 24. Odd numbered actors are male, even numbered actors are female).

testDataMap = containers.Map; %create map object

counter = 0;
for a = 1:8
    for b = 1:2
        for c = 1:2
            for d = 1:2
                for e = 1:24
                    if e < 10 %the last digit(e) has one number, therefore a 0 is added before it
                        name = "03-01-0"+a+"-0"+b+"-0"+c+"-0"+d+"-0"+e+".wav";%creates a string that corresponds
                        %to filename
                        filename = convertStringsToChars(name); %convert string to chars 
                    
                    else %last digit(e) has two numbers, no 0 is added before it
                        name = "03-01-0"+a+"-0"+b+"-0"+c+"-0"+d+"-"+e+".wav";
                        filename = convertStringsToChars(name);  
                    end
                    if not(a == 1 & b== 2)%there are no files with neutral voice and strong intensity, hence this
                        [y, Fs] = audioread(filename);%read wav file into vector y, at sampling frequency Fs = 48000
                        y = y(1:140000); %cut the vectors to the same size
                        testDataMap(filename) = y;
                    end
                    
                end
                    
            end
            
        end
        
    end
        
end