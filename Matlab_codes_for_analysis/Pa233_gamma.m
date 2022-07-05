% From atomic and isotopic calculations, N0 is the starting number of
% Np-237 atoms (at t = 0)

N0 = 1.383852863e25;

% Getting the data from IAEA Nuclides Chart, here we have the decay
% constant of Np-237, and his son, Pa-233 (Np-237 is an alpha emitter,
% Pa-233 a beta- one)

lambdaNp = 1.0243e-14;
lambdaPa = 2.9724e-7;

% With this data it is possible to plot the number of atoms of Np in
% function of the time, with the decay formula

NNp =@(t) N0.*exp(-lambdaNp.*t);

% And also the number of atoms of Pa in function of time, knowing that Pa
% is son of Np :

NPa =@(t) ((N0*lambdaNp)/(lambdaPa-lambdaNp)).*(exp(-lambdaNp.*(t))-exp(-lambdaPa.*(t)));


% we are considering a very long time of observation, due to the long
% half-life of Np, and, starting from a t0 = 0, we arrive to an instant at
% 100 millions of years from the beginning :

t0 = 0;
tf = 3600*8760*1e6;
year_s = 3600*8760;
tvect = [t0:year_s:tf];
tvecyear = (1/year_s).*tvect;

% Now we are ready to plot the amount of the two nuclides in time

figure()
hold on
title('Np237 - Isotopes Decay : #N of Isotopes');
xlabel('Time (y)');
ylabel('Isotopes (#N)');
plot(tvecyear, NNp(tvect),'LineWidth',2);
hold off

figure()
hold on
title('Pa233 - Isotopes Decay : #N of Isotopes');
xlabel('Time (y)');
ylabel('Isotopes (#N)');
plot(tvecyear, NPa(tvect), 'LineWidth',2);
hold off

% From the graphics and data obtained is clear that the two elements, due
% to their decay constant, will enter, after a relative short time, into a
% secular equilibrium.
% Deriving NPa(t) we obtain the Activity of Pa233, and we can extract 
% the moment in which it's reached the peak of it :

dNPa =@(t) ((N0*lambdaNp*lambdaPa)/(lambdaPa-lambdaNp)).*(exp(-lambdaNp.*(t))...
      - exp(-lambdaPa.*(t)));

dNNp =@(t) (lambdaNp*N0).*exp(-(lambdaNp.*t));

figure()
hold on
title('Pa233 - Isotopes Decay : Activity');
xlabel('Time (y)');
ylabel('Activity (Bq)');
plot(tvecyear, dNPa(tvect), 'LineWidth',2);
hold off

figure()
hold on
plot(tvecyear, dNPa(tvect), 'LineWidth',2);
plot(tvecyear, dNNp(tvect), 'LineWidth',2);

% As we can see the peak is obviously in the first 100kyears. Reducing in
% this interval the analysis, we can find the year and the maximum activity
% level (and also the maximum number of Pa233 isotopes) :

% Maximum activity calculation :

tf_100k = 3600*8760*1e5;
years_100k = t0 : year_s : tf_100k;
Actv_Pa = [dNPa(years_100k)];
[Act_max_Pa, Pa_max_act_loc] = max(Actv_Pa);

% Maximum number of isotopes calculation :

NumIs_Pa = [NPa(years_100k)];
[NumIs_max_Pa, Pa_max_num_loc] = max(NumIs_Pa);

% From the calculations we can observe that the peak is within the first 5
% years. To have a more precise result we can restrict another time the
% field of the analysis :

day_s = 3600*24 ;
t_fin_5y = day_s * 365 * 5;
tvect_days = [t0 : day_s : t_fin_5y];

% Now we can see the precise number of days afther that we have the maximum
% spread of radioactivity by Pa233 :

NumIs_Pa_d = [NPa(tvect_days)];
[NumIs_Pa_d_max, loc] = max(NumIs_Pa_d);
maxIs_day_Pa = loc-1 ;
Act_Pa_d = [dNPa(tvect_days)];
[Act_max_Pa_d, loc2] = max(Act_Pa_d);
maxAct_day_Pa = loc2 -1;

% Here a plot of the variation of Pa233 (Activity) compared with its parent
% Np237 :

days_5y = 0 : 1825;

figure()
hold on
title('Np237 - Pa233 first 5 years activity');
xlabel('Time (d)');
ylabel('Activity (Bq)');
plot(days_5y,dNPa(tvect_days),LineWidth=2);
plot(days_5y,dNNp(tvect_days),LineWidth=2);
legend('Pa233 - Activity','Np237 - Acitivity',Location='southeast');

% For our simulations we will simplify the decay of Pa233, and in order to
% do gamma-radiation shielding considerations, we will consider the most
% relevant gamma decay branching, which from IAEA data results to be the
% 311.901 keV gamma decay - 38,2% branching.

Pa233_gamma_max = 0.382 * Act_max_Pa_d;
disp(Pa233_gamma_max);
disp(maxAct_day_Pa);