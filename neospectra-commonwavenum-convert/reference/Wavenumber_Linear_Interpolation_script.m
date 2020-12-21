clc
clear all

Interpolation_points = 257;           % (65,129,257,513,1024,2048,4096)

Data = importdata('Measurement_1.InterPSD','\t',1);
Data = Data.data;

lambda_in = Data(:,1);
Bin = Data(:,2);

[lambda_op,Bop] = Wavenumber_Linear_Interpolation(Interpolation_points,lambda_in,Bin);
figure; plot(lambda_in,Bin,lambda_op,Bop);
