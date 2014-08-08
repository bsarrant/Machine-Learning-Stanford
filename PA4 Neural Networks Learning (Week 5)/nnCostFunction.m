function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

% Setup some useful variables
m = size(X, 1);
             
% Setup some useful variables 2 :
a1 = [ones(m, 1) X];
z2 = Theta1 * a1';
a2 = [ones(m,1) sigmoid(z2)'];
z3 = Theta2 * a2';
a3 = sigmoid(z3);
all_combos = eye(num_labels);    
y_matrix = all_combos(y,:);

% Feedforward :
reg = lambda/(2*m)*(sum(sum(Theta1(:,2:end).^2))+sum(sum(Theta2(:,2:end).^2)));
J = -1/m*( trace( log(a3)*y_matrix + log(1-a3)*(1-y_matrix) ) ) + reg;

% Setup some useful variables 2 :
d3 =  a3' - y_matrix;
d2 = (d3 * Theta2(:,2:end)).*sigmoidGradient(z2');
delta3 = d3' * a2;
delta2 = d2' * a1;
Theta2_grad = delta3 / m + [zeros(num_labels,1) lambda/m*Theta2(:,2:end)];
Theta1_grad = delta2 / m + [zeros(hidden_layer_size,1) lambda/m*Theta1(:,2:end)];
%
% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
