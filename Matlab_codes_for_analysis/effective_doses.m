thick = [21, 31, 41, 51, 61, 71, 81, 91, 101];
% Cs137 at t = 0, s = 5mm
% Antero Posterior Effective Dose
dose_ap = [100.25, 3.075, 0.35365, 0.04085, 0.0047, 0.00053, 0.000067, 0.00000386, 1e-7];
% Postero Anterior Effective Dose
dose_pa = [80.7, 2.265, 0.259, 0.0296, 0.003395, 0.000379, 0.000049, 0.000002735, 1e-7];
% Working Time per year exstimated
work_time = 2080*60*60;
% Conversion of Total Effective dose in a year
dose_ap_year = dose_ap.*work_time;
dose_pa_year = dose_pa.*work_time;
% Interpolation
Thickint = linspace(91,101);
Thicktot = linspace(21,101);
doseapyeartot = interp1(thick,dose_ap_year,Thicktot);
dosepayeartot = interp1(thick,dose_pa_year,Thicktot);
doseapyear_int = interp1(thick,dose_ap_year,Thickint);
dosepayear_int = interp1(thick,dose_pa_year,Thickint);
% Plot
limit =@(x) 20+0.*x;
figure()
hold on
xlabel('Thickness (cm)');
ylabel('ED/y (mSv)');
title('Effective Dose AP & PA per year');
plot(Thicktot,doseapyeartot,LineWidth=2);
plot(Thicktot,dosepayeartot,"LineWidth",2);
legend('ED-AP','ED-PA');

figure()
hold on
xlabel('Thickness (cm)');
ylabel('EDAP');
title('EDAP in a year related to the Thickness - Cs137');
plot(Thickint,doseapyear_int,'LineWidth',2);
plot(Thickint,limit(Thickint),LineWidth=2);
legend('AP Effective dose','Cat.A ICRP limit');

figure()
hold on
xlabel('Thickness (cm)');
ylabel('EDPA');
title('EDPA in a year related to the Thickness - Cs137');
plot(Thickint,dosepayear_int,'LineWidth',2);
plot(Thickint,limit(Thickint),LineWidth=2);
legend('PA Effective dose','Cat.A ICRP limit');
%%
thick = [21, 31, 41, 51, 61, 71, 81, 91, 101];
% Pa233 at t = 669d, s = 5mm
% Antero Posterior Effective Dose
dose_ap = [1.18e-3, 2.19e-5, 1.7e-6, 1.27e-7, 8.82e-9, 6.17e-10, 5.71e-11, 2.715e-11, 1e-12];
% Postero Anterior Effective Dose
dose_pa = [8.9e-4, 1.55e-5, 1.195e-6, 8.8e-8, 6.14e-9, 4.25e-10, 3.97e-11, 1.693e-11, 1e-12];
% Working Time per year exstimated
work_time = 2080*60*60;
% Conversion of Total Effective dose in a year
dose_ap_year = dose_ap.*work_time;
dose_pa_year = dose_pa.*work_time;
% Interpolation
Thickint = linspace(38,48);
Thicktot = linspace(21,101);
doseapyeartot = interp1(thick,dose_ap_year,Thicktot);
dosepayeartot = interp1(thick,dose_pa_year,Thicktot);
doseapyear_int = interp1(thick,dose_ap_year,Thickint);
dosepayear_int = interp1(thick,dose_pa_year,Thickint);
% Plot
limit =@(x) 20+0.*x;
figure()
hold on
xlabel('Thickness (cm)');
ylabel('ED/y (mSv)');
title('Effective Dose AP & PA per year');
plot(thick,dose_ap_year,LineWidth=2);
plot(thick,dose_pa_year,"LineWidth",2);
legend('ED-AP','ED-PA');

figure()
hold on
xlabel('Thickness (cm)');
ylabel('EDAP');
title('EDAP in a year related to the Thickness - Pa233');
plot(Thickint,doseapyear_int,'LineWidth',2);
plot(Thickint,limit(Thickint),LineWidth=2);
legend('AP Effective dose','Cat.A ICRP limit');

figure()
hold on
xlabel('Thickness (cm)');
ylabel('EDPA');
title('EDPA in a year related to the Thickness - Pa233');
plot(Thickint,dosepayear_int,'LineWidth',2);
plot(Thickint,limit(Thickint),LineWidth=2);
legend('PA Effective dose','Cat.A ICRP limit');
%%
thickcs = [21, 25, 31, 35, 41, 45, 47, 51];
thickpa = [21, 23, 25, 27, 29, 31, 33, 35];
% Antero Posterior Effective Dose
dose_apcs = [98.8, 1.64, 0.0206, 0.00119, 0.0000214, 0.00000129, 3.19e-7, 1e-7];
dose_appa = [0.00116, 4.62e-5, 5.6e-6, 7.6e-7, 1.05e-7, 1.54e-8, 2e-9, 2.69e-10];
% Working Time per year exstimated
work_time = 2080*60*60;
% Conversion of Total Effective dose in a year
dose_apcs_year = dose_apcs.*work_time;
dose_appa_year = dose_appa.*work_time;
% Interpolation
Thickpa = linspace(25,31);
Thickcs = linspace(44,51);
doseapcsyeartot = interp1(thickcs,dose_apcs_year,Thickcs);
doseappayeartot = interp1(thickpa,dose_appa_year,Thickpa);
doseapcsyear_int = interp1(thickcs,dose_apcs_year,Thickcs);
doseappayear_int = interp1(thickpa,dose_appa_year,Thickpa);
% Plot
limit =@(x) 20+0.*x;
figure()
hold on
xlabel('Thickness (cm)');
ylabel('EDAP/y (mSv)');
title('Effective Dose AP related to the thickness of the cask');
plot(thickcs,dose_apcs,LineWidth=2);
plot(thickpa,dose_appa,"LineWidth",2);
legend('Cs137','Pa233');

figure()
hold on
xlabel('Thickness (cm)');
ylabel('EDAP');
title('EDAP in a year related to the Thickness of the metal cask - Cs137');
plot(Thickcs,doseapcsyear_int,'LineWidth',2);
plot(Thickcs,limit(Thickcs),LineWidth=2);
legend('AP Effective dose of Cs137','Cat.A ICRP limit');

figure()
hold on
xlabel('Thickness (cm)');
ylabel('EDAP');
title('EDAP in a year related to the Thickness of the metal cask - Pa233');
plot(Thickpa,doseappayear_int,'LineWidth',2);
plot(Thickpa,limit(Thickpa),LineWidth=2);
legend('AP Effective dose of Pa233','Cat.A ICRP limit');