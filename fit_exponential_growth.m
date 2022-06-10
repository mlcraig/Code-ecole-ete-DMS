function [param_fit t C] = fit_exponential_growth(time,data,C0,parameter_guess) %fitting exponential curve to data

options = optimoptions(@lsqnonlin,'Algorithm', 'trust-region-reflective','MaxFunEval',5000,'display','iter');%options function to pass to optimizer
[param_fit,resnorm,residual,exitflag,output,lambda,jacobian] = lsqnonlin(@residualsfunction, parameter_guess, [0], [Inf], options);%calling optimizer (note: if fitting more than one parameter, need vector for ub and lb)

r = param_fit;
t = linspace(time(1),time(end),100);
C = C0.*exp(r.*t);

%------------------------------------------------------------------------
function val = residualsfunction(param)

    r = param;
    
    val = C0.*exp(r.*time)-data; %difference between the model at the sampled time points AND the data
    
end
%------------------------------------------------------------------------
end