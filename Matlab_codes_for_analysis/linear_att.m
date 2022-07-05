% Data variables declaration :
% 1) 100keV DATA
sim100a = 4.3e13;
sim100b = 2.9e13;
sim100c = 1.65e13;
sim100d = 7.5e12;
sim100vec = [sim100a, sim100b, sim100c, sim100d];

teo100a = 4.6e13;
teo100b = 3.3e13;
teo100c = 1.7e13;
teo100d = 4.45e12;
teo100vec = [teo100a, teo100b, teo100c, teo100d];

% 2) 311keV DATA
sim311a = 4e13;
sim311b = 3.4e13;
sim311c = 2.7e13;
sim311d = 2.4e13;
sim311vec = [sim311a, sim311b, sim311c, sim311d];

teo311a = 2.97e13;
teo311b = 2.93e13;
teo311c = 2.85e13;
teo311d = 2.71e13;
teo311vec = [teo311a, teo311b, teo311c, teo311d];

Thickness = [0.125, 0.250, 0.500, 1.000];

% Plot of the results
% 1)
figure()
hold on
xlabel('Thickness (cm)');
ylabel('Particles');
title('100keV Particles Fluence Analysis');
plot(Thickness,sim100vec,LineStyle="-",LineWidth=2,Color='b');
plot(Thickness,teo100vec,LineWidth=1.5,Marker="*",LineStyle="none");
legend('Simulation','Theoretical');

% 2)
figure()
hold on
xlabel('Thickness (cm)');
ylabel('Particles');
title('311keV Particles Fluence Analysis');
plot(Thickness,sim311vec,LineStyle="-",LineWidth=2,Color='b');
plot(Thickness,teo311vec,LineStyle="none",LineWidth=1.5,Marker="*");
legend('Simulation','Theoretical');