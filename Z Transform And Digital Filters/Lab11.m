%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Jordan Hayes
%Lab 11: Z Transform and the Discrete Time Fourier Series 
%EGR 323: Signal Processing and Analysis 
%Professor Krug 
%7/28/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%objective is to explore using the z transform to simplify the Fourier
%transform of a discrete time signal. 


%generate a sampled cosine wave

n = 0:1:99;                 %sample vector, 100 total

x_n = cos((4/pi) .* n);     %cosine vector that repeats every 8 samples

figure(1); 
plot(n, x_n); 
grid; 
xlabel('Samples'); 
ylabel('x(n)'); 
title('Sampled Cosin Wave'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting 100 samples of r^-n with r < 1
r = .95; 
r_n = r.^(-n); 

figure(2); 
stem(n, r_n); 
grid; 
xlabel('Samples'); 
ylabel('r(n)'); 
title('Sampled r(n)'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot x(n) * r(n) 

z_n = r_n .* x_n; 

figure(3); 
stem(n, z_n); 
grid; 
xlabel('Samples'); 
ylabel('z(n)'); 
title('Sampled z(n), r<1'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r = 1.05;

r_n = r.^(-n); 

figure(4); 
stem(n, r_n); 
grid; 
xlabel('Samples'); 
ylabel('r(n)'); 
title('Sampled r(n)'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r_n = r.^(-n); 
z_n = r_n .* x_n; 


figure(5); 
stem(n, z_n); 
grid; 
xlabel('Samples'); 
ylabel('z(n)'); 
title('Sampled z(n), r > 1'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = 1;

r_n = r.^(-n); 

figure(6); 
stem(n, r_n); 
grid; 
xlabel('Samples'); 
ylabel('r(n)'); 
title('Sampled r(n)'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r = 1;

r_n = r.^(-n); 
z_n = r_n .* x_n; 


figure(7); 
plot(n, z_n); 
grid; 
xlabel('Samples'); 
ylabel('z(n)'); 
title('Sampled z(n), r > 1'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5. 
syms x a n

a = (1/10).^n;

ans_5a = ztrans(a); 

syms x w n
x = sin(w.*n);

ans_5b = ztrans(x); 

syms x w n
x = cos(w.*n);

ans_5c = ztrans(x);

syms x n
x = exp(1j.*4.*n);

ans_5d = ztrans(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%6.

num_6 = [1,0]; 

den_6a = [1,-.6,1]; 

den_6b = [1,-.707, .25];

den_6c = [1,-2,1.5];

figure(8); 
grid; 
zplane(num_6, den_6a); 
title('Z-Plane Plot, 6-a');

figure(9); 
grid; 
impz(num_6, den_6a); 
title('Impulse Response Plot, 6-a');


figure(10); 
grid; 
zplane(num_6, den_6b); 
title('Z-Plane Plot, 6-b');

figure(11); 
grid; 
impz(num_6, den_6b); 
title('Impulse Response Plot, 6-b');

figure(12); 
grid; 
zplane(num_6, den_6c); 
title('Z-Plane Plot, 6-c');

figure(13); 
grid; 
impz(num_6, den_6c); 
title('Impulse Response Plot, 6-c');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%7. 

figure(14); 
freqz(num_6, den_6a); 
title('Magnitude and Phase for 6-a'); 

figure(15); 
freqz(num_6, den_6b); 
title('Magnitude and Phase for 6-b'); 

figure(16); 
freqz(num_6, den_6c); 
title('Magnitude and Phase for 6-c'); 








