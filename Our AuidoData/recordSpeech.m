function [speechVector] = recordSpeech(sec,rep, actor)
%this function records speech signal for s seconds and returns a vector for
%speech
Fs=48000 ;
rec = audiorecorder(Fs,16,1); %audio recording and setup
recordblocking (rec, sec);

speechVector = getaudiodata (rec);
filename = "filename" +rep+ "-" +actor+  ".wav";
audiowrite(filename, speechVector, Fs);





