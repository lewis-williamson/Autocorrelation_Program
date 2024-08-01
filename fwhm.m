function [FWHM,center_x,fit]=fwhmsec(x_data,y_data)

sech2_model = @(params, x) params(1) * sech(params(2) * (x - params(3))).^2 + params(4);

% Initial guess for the parameters [amplitude, scale, center]
initial_guess = [max(y_data), 1, mean(x_data), min(y_data),1];

% Set bounds for the parameters if necessary
lb = [0, 0, min(x_data), -Inf]; % Lower bounds [amplitude, scale, center, offset]
ub = [Inf, Inf, max(x_data), Inf]; % Upper bounds [amplitude, scale, center, offset]

% Perform the curve fitting using lsqcurvefit
options = optimoptions('lsqcurvefit', 'Display', 'iter', 'MaxIterations', 10000);
[params_fit, resnorm, residual, exitflag, output] = lsqcurvefit(sech2_model, initial_guess, x_data,abs(y_data), lb, ub, options);

fit=sech2_model(params_fit, x_data);

% Display the fitted parameters
disp('Fitted parameters:');
disp(params_fit);


%% Analytical FWHM calculation
half_max = (max(fit) + params_fit(4))/2;

% Find the indices where the fitted curve crosses the half-maximum value
above_half_max = fit > half_max;
cross_points = diff(above_half_max);

% Find the x-values of the crossings
x_cross1 = x_data(find(cross_points, 1, 'first'));
x_cross2 = x_data(find(cross_points, 1, 'last'));

% Calculate the FWHM
fwhm = x_cross2 - x_cross1;

% Display the FWHM
disp(['FWHM: ', num2str(fwhm)]);

%% params fit fwhm

FWHM = 2 * log(sqrt(2) + 1) / params_fit(2);
disp(FWHM);

%% find max value and center point of fit 

[center_y,loc]=max(fit);
center_x=x_data(loc);

%% plot results

% Plot the original data and the fitted curve
figure;
hold on;
%scatter(x_data, abs(y_data), 'bo'); % Original data
plot(x_data, fit, 'r-', 'LineWidth', 2); % Fitted curve
scatter(center_x,center_y);
title('Data Fitting using sech^2 Function');
xlabel('x');
ylabel('y');
legend1=['Params FWHM = ' num2str(FWHM, '%.2f')];
legend(legend1,['Analytical FWHM = ' num2str(fwhm, '%.2f')],legend1);

hold off;

end 