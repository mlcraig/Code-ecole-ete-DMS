function sol = solver_fullmodel(p)

sol = ode15s(@fullmodel,p.tspan,p.initialcondition);

function dydt = fullmodel(t,y)
   S = y(1);%susceptible tumour cells
   T = y(2);%T cells
   drug = y(3);%drug concentrations
   
   dS = p.r*S*(1-S/p.K)-p.kappa*S*T-p.delta*drug/(drug+p.EC50)*S;
   dT = p.a*S-p.d*T-p.delta*drug/(drug+p.EC50)*T;
   ddrug=  -p.kel*drug;

   dydt = [dS;dT;ddrug];

end

end