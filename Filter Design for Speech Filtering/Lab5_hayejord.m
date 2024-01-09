%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Jordan Hayes
%Lab 4: Discrete Time Impulse Response and Convolution   
%EGR 323: Signal Processing and Analysis 
%Professor Krug 
%6/9/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1) first we create a 300 Hz square wave, sampled at 8kHz, for 10 cycles

sampling_period = 1/8000;                       %sampling period is the step of my time        
end_point = 1/300 * 10;                          %At which the function will be sampled

n = 0:sampling_period:end_point;                %end_point cycles sampled 8000 times

f=300 * 2 * pi;                                 %frequency in rad/sec
wave_Square = square(f.*n);                     %create square wave with frequency by sampling vector

figure(1)
plot(n,wave_Square);
title('Generated Square Wave (dB)'); 
xlabel('T (seconds)'); 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2) a filter was designed in filterDesigner, LPF
% fs = 8000 
% f_pass = 900 Hz 
% f_stop = 1000 Hz
% A_stop = -20
% impulse response is plotted
figure(2); 
stem(Num);
title('LPF Impulse Response'); 
xlabel('Sample'); 
ylabel('Amplitude'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3) now we are processing the signal square wave with the LPF created

inputProcessed_LPF = conv(wave_Square, Num);       %convolve them 

% for i = 1:1:length(n)                           %the vector is too large, so we need to truncate
%     trunc_inputProcessed_LPF(i) = input_processed_LPF(i);
% end 

figure(3); 
stem(inputProcessed_LPF);
title('Convolution Output LPF with Square Wave'); 
xlabel('Sample'); 
ylabel('Amplitude');
%set(gca, 'yscal', 'log');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4) We are repeating steps 2 and 3 with a HPF
%it was created with 
% fs = 8000 
% f_pass = 1200 Hz 
% f_stop = 1000 Hz
% A_stop = -20
%impulse plotted 
figure(4); 
stem(HPF);
title('HPF Impulse Response'); 
xlabel('Sample'); 
ylabel('Amplitude');

%%%%%%%%%%%%%%%%%
%now convolve again 

inputProcessed_HPF = conv(wave_Square, HPF);       %convolve them 
figure(5); 
stem(inputProcessed_HPF);
title('Convolution Output HPF with Audio'); 
xlabel('Sample'); 
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%6) import the noise corrupted speech file speech1.wav using audioread

%sampleRate_Hz = 22050; 

[sampledData, sampleRate_Hz] = audioread('speech1.wav'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The unwanted noise is present at 8kHz
%and above where there is very little signal energy.
%a filter must be designed: a lowpass
% fs = 22050
% f_pass = 5000 Hz 
% f_stop = 7000 Hz
% A_stop = -20

figure(6);
stem(LPF_designed); 
title('Designed LPF Impulse Response'); 
xlabel('Sample'); 
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%convolve the sampled data with the filter

audioProcessed_LPF_designed = conv(sampledData, LPF_designed);       %convolve them 

figure(7); 
stem(audioProcessed_LPF_designed); 
title('LPF Convolution Output with Audio'); 
xlabel('Sample'); 
ylabel('Amplitude');

% file must be listened to for testing 
sound(audioProcessed_LPF_designed, sampleRate_Hz); 
% checked and good!


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%7) now import the specified file for individual, Renamed Jordans_test

[sampledData, sampleRate_Hz] = audioread('Jordans_test.wav'); 

%a filter must be designed: a bandstop
% fs = 22050
% f_pass1 =  8750
% f_stop1 = 9250
% f_stop2 = 9750
% f_pass1 = 10250 
% A_stop = -30

figure(8);
stem(BSF_designed3); 
title('Designed BSF Impulse Response'); 
xlabel('Sample'); 
ylabel('Amplitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% convolve the sampled data with the filter

audioProcessed_BSF_designed = conv(sampledData, BSF_designed3);       %convolve them 

figure(9); 
stem(audioProcessed_BSF_designed); 
title('BSF Convolution with Audio'); 
xlabel('Sample'); 
ylabel('Amplitude');

 %sound(audioProcessed_BSF_designed, sampleRate_Hz);
