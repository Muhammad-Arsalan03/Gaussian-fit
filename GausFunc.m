%% clearing
fclose all; close all; clear all; 
clc; pause(0.1);
%% import data from txt file
data=importdata("mlem4.txt");
[rw,cl]=size(data);
%% Maximum column in data
sumF=sum(data);
max(sumF);
[row1, column1] = find(sumF == max(sumF));
column_y=data(:,column1);
x=0:1:(cl-1);
scatter(x,column_y)
%% Gaussian fitting
[sigmaNew,muNew,Anew]=mygaussfit(x,column_y);
y=Anew*exp(-(x-muNew).^2/(2*sigmaNew^2));
%% ploting
hold on; 
figure (1)
plot(x,y,'r','LineWidth',2)
grid on
title('Maximum column Gaussian fit')
xlabel('x')
ylabel('y')
legend('Maximum Column data','Gaussian Fit')



%% 
%% Maximum row in data
SumRow = sum(data,2)
max(SumRow);
[row2, column2] = find(SumRow == max(SumRow));
Row_y=data(row2,:)
x=0:1:(rw-1);
figure(2)
scatter(x,Row_y)
grid on

%% Gaussian fitting
[sigmaNew,muNew,Anew]=mygaussfit(x,Row_y);
y=Anew*exp(-(x-muNew).^2/(2*sigmaNew^2));
hold on; plot(x,y,'b','LineWidth',2)
grid on
title('Maximum Row Gaussian fit')
xlabel('x')
ylabel('y')
legend('Maximum Row data','Gaussian Fit')
