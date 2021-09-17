%Write a MATLAB program for Amplitude Shift Keying (ASK) Generation.
clc;
clear all;
close all;
x=[0 1 0 0 1 0 1 1 1];
bp=0.000001;
disp('Binary Information at transmitter');
disp(x);
%Representation of Transmitting binary information as digital signal
bit=[];
for n=1:1:length(x)
 if x(n)==1;
 se=ones(1,100);
 else
 x(n)==0;
 se=zeros(1,100);
 end
 bit=[bit se];
end
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(3,1,1)
plot(t1,bit,'linewidth',2.5);
grid on;
axis([0 bp*length(x) -0.5 1.5]);
ylabel('Amplitude (volt)');
xlabel('Time (sec)');
title('Transmitting Information as Digital Signal');
%Binary ASK Modulation
A1=10;
A2=5;
br=1/bp;
f=br*10;
t2=bp/99:bp/99:bp;
ss=length(t2);
m=[];
for(i=1:1:length(x))
 if x(i)==1;
 y=A1*cos(2*pi*f*t2);
 else
 y=A2*cos(2*pi*f*t2);
 end
 m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2)
plot(t3,m);
grid on;
xlabel('Time(sec)');
ylabel('Amplitude (volt)');
title('Waveform for binary ASK Modulation corresponding binary information');
%Binary ASK Demodulation
mn=[];
for n=ss:ss:length(m)
 t=bp/99:bp/99:bp;
 y=cos(2*pi*f*t);
 mm=y.*m((n-(ss-1)):n);
 t4=bp/99:bp/99:bp;
 z=trapz(t4,mm);
 zz=round((2*z/bp));
 if(zz>7.5)
 a=1;
 else
 a=0;
 end
 mn=[mn a];
end
disp('Binary Information at Receiver');
disp(mn);
%Represntation of Binary data into Digital signal
bit=[];
for n=1:length(mn)
 if mn(n)==1;
 se=ones(1,100);
 else
 se=zeros(1,100);
 end
 bit=[bit se];
end
t4=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(3,1,3)
plot(t4,bit,'linewidth',2.5);
grid on;
axis([0 bp*length(mn) -0.5 1.5]);
xlabel('Time(sec)');
ylabel('Amplitude (volt)');
title('Received information as Digital Signal');
