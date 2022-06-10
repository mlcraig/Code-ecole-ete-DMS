% fitting exponential growth

time = [0 1 2 3 4 5 6 7 8 9]; %time data
data = [10 14 22 32 50 70 101 152 225 330]; %cell count data

C0 = 0; %initial number of cells
r_guess = 0;%initial guess for growth rate

[param_fit t C] = fit_exponential_growth(time,data,C0,r_guess); %fitting exponential curve to data

figure
hold on 
plot(t,C,'LineWidth',2)
plot(time,data,'o:','LineWidth',1)
xlabel('Time')
ylabel('Cells')



    