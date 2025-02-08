clc;
close all;
clear all;

fprintf('\n              FM_example3.m         \n');
fprintf('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');


%% Define FM modulation Index 
fprintf('FM_example3: Frequency of modulating signal ranges in [1, 3]\n\n');
fm = input(' Frequency of m(t):  fm = ');

% setup input parameters 
b =  2;        % FM modulation index
fc = 15;       % Frequency of carrier signal    
Ac = 1;        % Amplitude of carrier signal
Am = 1;        % Amplitude of modulating signal
               % Frequency of modulating signal
              
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% Initializations
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Fs = 1024;        % sampling rate
Ts = 1/Fs;        % sampling period
t  = [0:Ts:5];    % total time for simulation

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% modulating signal generation 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
m = Am*cos(2*pi*fm*t);  % Eqation of modulating signal

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% frequency modulation (FM)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
xFM= Ac*cos( 2*pi*fc*t + b*sin(2*pi*fm*t) ); % Slide 83

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fprintf('\n\n Experiment settings: \n\n');
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
disp('###################################################');
fprintf('                                 b = %f\n\n', b);
fprintf('Amplitude of carrier signal      Ac= %f\n', Ac);
fprintf('Frequency of carrier signal      fc= %f\n\n', fc);
fprintf('Amplitude of modulating signal   Am= %f\n', Am);
fprintf('Frequency of modulating signal   fm= %f\n', fm);
disp('###################################################');


fprintf('\n\nΚανόνας του Carson:  BW = 2*fm*(β+1)= %f\n\n', 2*fm*(b+1) );


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% Ploting signals in time domain
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
figure();

subplot(2,1,1); 
plot(t,m)% Graphical representation of Modulating signal
drawnow();
title (['Modulating Signal  A_m=',num2str(Am),', f_m=',num2str(fm)]);
xlabel('Time (sec) ');
ylabel('Amplitude (Volt)');
grid minor;

%modulated signal
subplot(2,1,2);
plot(t,xFM);% Graphical representation of FM signal
drawnow();
title  (['FM Modulated signal  \beta=',num2str(b)]);
xlabel ('time(sec) ');
ylabel ('Amplitude (volt)   ');
grid minor;

%
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
fprintf('\n\n Υπολογισμός πλάτους πλευρικών \n\n');
Freq = fc + (0:8)*fm;
N=length(Freq);
T=1;
for i=1:N
   f0=Freq(i);
   func  = @(t) (Ac*cos( 2*pi*fc*t + b*sin(2*pi*fm*t) )) .* cos(2*pi*1*f0*t);
   A = (2/T) * quad(func, -T/2,T/2,1e-12); % αριθμητική ολοκλήρωση
   
   func  = @(t) (Ac*cos( 2*pi*fc*t + b*sin(2*pi*fm*t) )) .* sin(2*pi*1*f0*t);
   B = (2/T) * quad(func, -T/2,T/2,1e-12); % αριθμητική ολοκλήρωση
   
   C(i)   = sqrt( A^2 + B^2 ); % μέτρο 
   fprintf('n=%1u f=%2u Hz\t C[%1u]=%f \n',...
                i-1,Freq(i),i-1,C(i));
 end 

%
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
figure();  

subplot(211)
FreqIndex = (-8:8);
CBand =[flip(C(2:end)) C];
stem(FreqIndex, CBand,'Linewidth',3); drawnow();
ylabel('{\it C}_{\it n}');
xlabel('frequency index (n)');
title('Amplitude C_{n}');
set(gca, 'xtick', FreqIndex)
grid minor;

subplot(212)
Frequencies = [flip(fc - (1:8)*fm) Freq];
stem(Frequencies, CBand,'Linewidth',3); drawnow();
ylabel('{\it C}_{\it n}');
xlabel('frequency (Hz)');
set(gca, 'xtick', Frequencies)
grid minor;

%
% ~~~~~~~~~~~~~~~~~~~Power spectrum ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
P = zeros(17,1); % αρχικοποίηση του array της ισχύος
for i = 1:17
  P(i) = 0.5*CBand(i)^2;
end
Ptotal = 0.5*Ac^2;

fprintf('\n\nTotal power: %f W\n',Ptotal);

n=[-8:8];
Pp  = 100*P/Ptotal;    % ποσοστό ισχύος για κάθε n
for i=1:length(n) % n=[-6:6]
 fprintf('n=%+u \t %6.3f \t %6.3f%% \n', n(i), P(i), Pp(i) );
end

figure();  

subplot(211)
FreqIndex = (-8:8);
stem(FreqIndex, Pp,'Linewidth',3); drawnow();
ylabel(' Percent of power (Watt)');
xlabel('frequency index (n)');
title('Power spectrum');
set(gca, 'xtick', FreqIndex)
grid minor;

subplot(212)
stem(Frequencies, Pp,'Linewidth',3); drawnow();
ylabel(' Percent of power (Watt)');
xlabel('frequency (Hz)');
set(gca, 'xtick', Frequencies)
grid minor;

