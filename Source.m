
clc;
clear all;
close all;
t=audiodevinfo; %getting audio device status connected with the computer system
n=size(t.input,2); %getting especially the input device status
disp('Details Of Audio Recording device Connected:');
for i=0:n-1
    disp('Device Name:')  
    disp(t.input(1,i+1).Name) %display the audio input device name
    disp('Device id:')
    disp(i) %diaplay the device id
end
d=input('Enter your Device ID from the above Device List to Start Recording:');
%getting the device id for recording
t=input('Enter the Duration of Recording(s):'); %getting the duration of recording
b=input('Enter Bit Depth of Recording(e.g. 8bit):'); %getting the bit depth of recording
disp('Recording at 48kHz Sampling frequency');
aud=audiorecorder(48000,b,2,d); 
disp('Recording....')
recordblocking(aud,t);
myRecording = getaudiodata(aud); %start audio recoding
plot(myRecording); %plot the recorded data
audiowrite('xyz.wav',myRecording, 48000); %write the recorded audio to a file
disp('Saving the Audio File as xyz.wav in the working directory...!');
disp('Playing....');
play(aud); %play the recorded file
