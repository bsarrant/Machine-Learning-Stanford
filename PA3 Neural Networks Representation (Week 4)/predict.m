function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% On va commencer par rajouter les 1 des biais � X :
X = [ones(m, 1) X];
% On commence par le premier layer :
%size(X')
%size(Theta1)
L1 = sigmoid (Theta1 * X'); % devrait donner une matrice 25*5000
% On ajoute les 1 pour avoir les biais pour le second layer :
L1 = [ones(1,m); L1];
% On se fait le second layer
%size(Theta2)
%size(L1)
proba = sigmoid (Theta2 * L1); % devrait donner une matrice 5000x10
% Il n'y a plus qu'� obtenir le r�sultat en cherchant l'indice qui comporte
% la valeur max dans proba.
%size(proba)
[v, p] = max(proba);
p = p';








% =========================================================================


end
