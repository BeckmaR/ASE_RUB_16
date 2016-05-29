clc;
clear all;
close all;

t_data = load('trainingsdaten.mat')
t_data_intakt = t_data.xIntakt;
t_data_defekt = t_data.xDefekt;

mat = [t_data_intakt.temp t_data_defekt.temp ; t_data_intakt.laut t_data_defekt.laut];

mat_intakt = [t_data_intakt.temp; t_data_intakt.laut];
mat_kaputt = [t_data_defekt.temp; t_data_defekt.laut];

%mat = sort(mat, 1);

scatter(mat_intakt(1,:), mat_intakt(2,:), [], 'green');

hold on;

scatter(mat_kaputt(1,:), mat_kaputt(2,:), [], 'red');

xlabel('Temperatur');
ylabel('Lautstärke');

theta_intakt = GaussianEstimation(mat_intakt);
theta_kaputt = GaussianEstimation(mat_kaputt);

gaussis = likelihood(mat, theta_intakt);
figure;
plot([1:200], gaussis);

hold off;



k_1.('name') = 'intakt';
k_1.('theta') = theta_intakt;
k_1.('prior') = 0.999;
k_2.('name') = 'defekt';
k_2.('theta') = theta_kaputt;
k_2.('prior') = 0.001;

k = [k_1, k_2];

test_data = load('testdaten.mat');

test_vector = [test_data.x.temp; test_data.x.laut];


gaussis = likelihood(test_vector, theta_intakt);
figure;
plot([1:40], gaussis);
hold on;
gaussis = likelihood(test_vector, theta_kaputt);
plot([1:40], gaussis, 'red');




bayes = zeros(1, length(test_vector));
max_likelihood = bayes; % leere Vektoren

figure;
for index = [1:length(test_vector)]
    x = test_vector(:, index);
    bayes(index) = Bayes(x, k);
    max_likelihood(index) = MaxLik(x, k);
    hold on;
    if max_likelihood(index) == 2
        scatter(x(1), x(2), [], 'red');
    else
        scatter(x(1), x(2), [], 'green');
    end
end

hold on;

figure;
subplot(3, 1, 1);
scatter(test_vector(1,:), test_vector(2,:));
title('All test values');
xlabel('Temperature');
ylabel('loudness');
subplot(3, 1, 2);
scatter(1:length(test_vector), bayes);
title('Bayes-Estimation');
subplot(3, 1, 3);
scatter(1:length(test_vector), max_likelihood);
title('Maximum Likelihood Estimation');



