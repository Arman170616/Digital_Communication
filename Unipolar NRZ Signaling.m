%Write a MATLAB program for Unipolar Non-Return to Zero (NRZ) Signaling.
  
  %Unipolar Non Return to Zero Line Coding
clc;
clear all;
close all;
N=10;
%Number of bits
n=randi([0,1],1,N)
%Random bit generation
%Mapping Function
for m=1:N
if n(m)==1
nn(m)=1;
else
nn(m)=0;
end
end
nn
%Signal Shaping
i=1;
t=0:0.01:length(n);
for j=1:length(t)
if t(j)<=i
y(j)=nn(i);
else
y(j)=nn(i);
i=i+1;
end
end
plot(t,y, 'linewidth',2);
axis([0,N,-1.5,1.5]);
%100 Times duration set up for a single binary bit
%Indexing set-up for time duration
%Binary input data index Check-up Condition
%Assign value from the mapping function
%Binary input data index increment
%Axis set-up
grid on;
title("Unipolar NZR Signaling");
