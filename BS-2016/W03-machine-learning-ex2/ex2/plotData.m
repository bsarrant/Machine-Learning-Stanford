function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
l_positive_values = find(y==1);
l_negative_values = find(y==0);

plot(X(l_positive_values,1),X(l_positive_values,2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
hold on;
plot(X(l_negative_values,1),X(l_negative_values,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
hold off;
xlabel('Score on Exam 1');
ylabel('Score on Exam 2');
legend('Admitted','Not admitted');







% =========================================================================



hold off;

end
