%This file will simulate a simple model of tumour growth and inhibition by
%T cells, with the effects of a chemotherapy drug
%% Parameters

%set parameter values
p.S0 = 100;%initial tumour volume
p.T0 = 0;%initial number of T cells
p.dose = 100;%initial drug dose (single admin)

p.r = 1;%tumour cell replication rate
p.K = 10000;%tumour carrying capacity
p.kappa = 0.0001;%rate of T cell killing of tumour cells 
p.delta = 0.01;%rate of drug killing of tumour cells 
p.EC50 = 40;%half-maximal concentration of drug effect
p.a = 1;%T cell activation rate
p.d = 1;%T cell death rate
p.kel = 0.05;%drug elimination rate

%% Get solution

p.initialcondition = [p.S0,p.T0,p.dose];%set initial conditions
p.tspan = [0 20];%set timespan for simulations

%Call ODE solver function
sol = solver_fullmodel(p);

%% Plot solution

%Reduce number of points to plot
time = linspace(p.tspan(1), p.tspan(2),1000);
all_pop = deval(sol,time);

%plot tumour cells
fig = figure
left_color = [0.19,0.67,0.65];
right_color = [0 .5 .5];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(time,all_pop(1,:),'LineWidth',2)
ylabel('Number of tumour cells')
yyaxis right
plot(time,all_pop(2,:),'LineWidth',2)
ylabel('Number of T cells')
set(gca,'FontSize',16)
xlabel('Time (days)')

%plot drug concentration
figure
plot(time,all_pop(3,:),'Color',[0.19,0.67,0.65],'LineWidth',2)
xlabel('Time (days)')
ylabel('Drug concentration')
set(gca,'FontSize',16)