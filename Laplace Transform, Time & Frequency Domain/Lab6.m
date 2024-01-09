%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Jordan Hayes
%Lab 6: Laplace Transforms 
%EGR 323: Signal Processing and Analysis 
%Professor Krug 
%6/23/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%numbers correspond to numbers on given lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%2: finding zeroes and poles for each system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2-a
Y_s_1 = [2,5,12];             %coefficients of Y(s)
X_s_1 = [1,4,14,20];          %coefficients of X(s) 

zeros_H_s = roots(Y_s_1);     %roots of numerator, zeros of H(s), H(s) = 0
poles_H_s = roots(X_s_1);     %roots of denominator, poles of H(s), H(s) = inf 

%3-a
figure(1); 
zplane(zeros_H_s, poles_H_s); 
grid;
title('Pole-Zero Plot H_1(s)'); 
ylabel('Poles H(s)'); 
xlabel('Zeros H(s)'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2-b
Y_s_2 = [2,5,12];             %coefficients of Y(s)
X_s_2 = [1,2,10, 0];          %coefficients of X(s) 

zeros_H_s = roots(Y_s_2);     %roots of numerator, zeros of H(s), H(s) = 0
poles_H_s = roots(X_s_2);     %roots of denominator, poles of H(s), H(s) = inf 

%3-b
figure(2); 
zplane(zeros_H_s, poles_H_s); 
grid;
title('Pole-Zero Plot H_2(s)'); 
ylabel('Poles H(s)'); 
xlabel('Zeros H(s)'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2-c
Y_s_3 = [1,2,5];              %coefficients of Y(s)
X_s_3 = [1,-3];               %coefficients of X(s) 

zeros_H_s = roots(Y_s_3);     %roots of numerator, zeros of H(s), H(s) = 0
poles_H_s = roots(X_s_3);     %roots of denominator, poles of H(s), H(s) = inf 

%3-c
figure(3); 
zplane(zeros_H_s, poles_H_s); 
grid;
title('Pole-Zero Plot H_3(s)'); 
ylabel('Poles H(s)'); 
xlabel('Zeros H(s)');  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4. Plotting the magnitude of the transfer function in the s-domain with the j-axis
%response identified for each of the systems of part 1

%defining two vectors to create the desired range
sigma = -5:0.5:5;           %sigma sample points, real part
omega = -10:0.5:10;         %frequency sample points, imaginary part 


[sigmagrid, omegagrid] = meshgrid(sigma, omega);
sgrid = sigmagrid + 1j * omegagrid;                 % establishes the s
                                                    % value at each point in the s-plane

%4-a                                                   
H1 = polyval(Y_s_1, sgrid) ./ polyval(X_s_1, sgrid);% creating the transfer functions magnitude vector
                                                     
figure(4); 
mesh(sigma, omega, abs(H1)); 
title('3D Plot System H_1(s)'); 
ylabel('Omega'); 
xlabel('Sigma'); 
zlabel('Magnitude');

hold on;
plot3(zeros(1,length(omega)), omega, abs(H1(:, ceil(length(sigma)/2)))+0.05,'r');        
                                                    %NOTE: the +0.05 is to raise the line off of the surface
                                                    %to make it visible)
hold off;
 
% %This also equals the frequency response, or Bode plot, of the system.
% figure(5);
% plot(omega, abs(H1(:, ceil(length(sigma)/2))));
% xlim([0 10]);
% title('Frequency Response H_1(s)'); 
% ylabel('Gain (dB)'); 
% xlabel('Frequency (rad/sec)'); 

%4-b 
H2 = polyval(Y_s_2, sgrid) ./ polyval(X_s_2, sgrid); 
 
figure(6); 
mesh(sigma, omega, abs(H2)); 
title('3D Plot System H_2(s)'); 
ylabel('Omega'); 
xlabel('Sigma'); 
zlabel('Magnitude');

hold on;
plot3(zeros(1,length(omega)), omega, abs(H2(:, ceil(length(sigma)/2)))+0.05,'r');       
                                                    %NOTE: the +0.05 is to raise the line off of the surface
                                                    %to make it visible)
hold off;
 
% %This also equals the frequency response, or Bode plot, of the system.
% figure(7);
% plot(omega, abs(H2(:, ceil(length(sigma)/2))));
% xlim([0 10]);
% title('Frequency Response H_2(s)'); 
% ylabel('Gain (dB)'); 
% xlabel('Frequency (rad/sec)'); 

%4-c 
H3 = polyval(Y_s_3, sgrid) ./ polyval(X_s_3, sgrid); 

figure(8); 
mesh(sigma, omega, abs(H3)); 
title('3D Plot System H_3(s)'); 
ylabel('Omega'); 
xlabel('Sigma'); 
zlabel('Magnitude');     

hold on;
plot3(zeros(1,length(omega)), omega, abs(H3(:, ceil(length(sigma)/2)))+0.05,'r');        
                                                     %NOTE: the +0.05 is to raise the line off of the surface
                                                     %to make it visible)
hold off;
 
%This also equals the frequency response, or Bode plot, of the system.
% figure(9);
% plot(omega, abs(H3(:, ceil(length(sigma)/2))));
% xlim([0 10]);
% title('Frequency Response H_3(s)'); 
% ylabel('Gain (dB)'); 
% xlabel('Frequency (rad/sec)'); 
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%5) Using the residue funtion to perform the partial fraction expansion of
%the tranfer functions to find the time domain response

%5-a
[R_1, P_1, K_1] = residue(Y_s_1, X_s_1);    %H_1(s) coefficients

%5-b
[R_2, P_2, K_2] = residue(Y_s_2, X_s_2);    %H_2(s) coefficients

%5-c
[R_3, P_3, K_3] = residue(Y_s_3, X_s_3);    %H_3(s) coefficients
