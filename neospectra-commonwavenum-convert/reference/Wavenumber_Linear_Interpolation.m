function [lambda_op,Bop] = Wavenumber_Linear_Interpolation(Interpolation_points,lambda_in,Bin)

vin = 1e7./lambda_in;
lambdamax = 2.55;
Common_Wavenumber_vector_4096_step = (1e4/1.35 - 1e4/2.55)/(4096-1);
pointso = Interpolation_points;
if (Interpolation_points < 1024)
    pointso = 1025;
end

wavenumber_step = Common_Wavenumber_vector_4096_step*(4096-1)/(pointso-1);
vop=linspace(1e4/lambdamax,1e4/lambdamax+wavenumber_step*(pointso-1),pointso);
Bop=interp1(vin,Bin,vop,'linear','extrap');     %% Linear Interpolation 

if (Interpolation_points < 1024)
    mskip = round((pointso-1)/(Interpolation_points-1));
    vop = vop(1:mskip:end);
    Bop = Bop(1:mskip:end);
end

lambda_op = 1e7./vop;

end