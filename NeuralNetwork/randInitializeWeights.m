function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections

% You need to return the following variables correctly 
W = zeros(L_out, 1 + L_in);


epsiloninit = 0.12;
W = rand(L_out,1 + L_in) * 2 *epsiloninit-epsiloninit;







end
