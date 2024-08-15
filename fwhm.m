function [FWHM,center_x,center_y,fit]=fwhm(x_data,y_data);
% Find the x and y values of the maximum peak in the data
[max_y, idx] = max(y_data);
max_x = x_data(idx);

% Define the sech^2 function to fit
sech2_model = @(params, x) params(1) * sech(params(2) * (x - params(3))).^2 + params(4);

% Enhanced initial guesses [amplitude, scale, center, offset]
baseline_guess = min(y_data);
amplitude_guess = max_y - baseline_guess;
width_guess = 1 / (range(x_data));  % Rough estimate for width
center_guess = max_x; % Start guess at the peak of the data

initial_guess = [amplitude_guess, width_guess, center_guess, baseline_guess];

% Set bounds for the parameters
lb = [0, 0, min(x_data), -Inf]; % Lower bounds [amplitude, scale, center, offset]
ub = [Inf, Inf, max(x_data), Inf]; % Upper bounds [amplitude, scale, center, offset]

% Objective function to minimize: sum of squared differences
objective_func = @(params) sum((sech2_model(params, x_data) - y_data).^2);

% Constraint function: center should be equal to max_x
nonlcon = @(params) deal([], params(3) - max_x);

% Perform the curve fitting using fmincon with the constraint
options = optimoptions('fmincon', 'Display', 'iter', 'MaxIterations', 2000, 'TolFun', 1e-12, 'TolX', 1e-12);
params_fit = fmincon(objective_func, initial_guess, [], [], [], [], lb, ub, nonlcon, options);

% Display the fitted parameters
disp('Fitted parameters:');
disp(params_fit);

% Calculate the FWHM from the fit parameters
B = params_fit(2);
FWHM = 2 * log(sqrt(2) + 1) / B;
disp(['FWHM: ', num2str(FWHM)]);

% Calculate the fitted curve
fitted_curve = sech2_model(params_fit, x_data);

fit=sech2_model(params_fit, x_data);
[center_y,loc]=max(fit);
center_x=x_data(loc);


% Plot the original data and the fitted curve
% figure;
% hold on;
% scatter(x_data, y_data, 'bo'); % Original data
% plot(x_data, fitted_curve, 'r-', 'LineWidth', 2); % Fitted curve
% title('Data Fitting using sech^2 Function with Peak Alignment');
% xlabel('Time (s)');
% ylabel('Voltage (V)');

% Add FWHM to the legend
% legend('Data', ['Fitted curve (FWHM = ' num2str(FWHM, '%.2f') 's)']);
% hold off;
end
