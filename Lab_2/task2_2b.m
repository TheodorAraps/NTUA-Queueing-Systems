clc;
clear all;
close all;

# ??????? ????? ?/?/1 ?? Octave
# Task b

mu_values = 5.001 : 0.001 : 10;
lambda_rate = 5;

lambda_values = lambda_rate * ones(1, numel(mu_values));

[u, et, ent, g] = qsmm1(lambda_values, mu_values);

# ?????? ?????????????? (utilization) ?? ???? ?? ????? ????????????.

figure('Name', 'Utilization dependency on service rate');
plot(mu_values, u, "r", 'LineWidth', 1.2);
title('Utilization dependency on service rate');
xlabel('Service rate (\mu)');
ylabel('Utilization (u)');

# ????? ?????? ???????????? ??? ?????????? ?(?) ?? ???? ?? ????? ????????????.

figure('Name', 'Mean time of delay dependency on service rate');
plot(mu_values, et, "g", 'LineWidth', 1.2);
title('Mean time of delay dependency on service rate');
xlabel('Service rate (\mu)');
ylabel('Mean time of delay (E[T])');

# ????? ??????? ??????? ??? ??????? ?? ???? ?? ????? ????????????.

figure('Name', 'Mean number of clients dependency on service rate');
plot(mu_values, ent, "b", 'LineWidth', 1.2);
title('Mean number of clients dependency on service rate');
xlabel('Service rate (\mu)');
ylabel('Mean number of clients (E[n(t)])');

# ??????????? (throughput) ??????? ?? ???? ?? ????? ????????????

figure('Name', 'Throughput dependency on service rate');
plot(mu_values, g, "m", 'LineWidth', 1.2);
title('Throughput dependency on service rate');
xlabel('Service rate (\mu)');
ylabel('Throughput (\gamma)');