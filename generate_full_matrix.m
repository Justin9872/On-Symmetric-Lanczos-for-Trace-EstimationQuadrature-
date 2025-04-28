function A = generate_full_matrix(n,d)
%GENERATE_FULL_MATRIX(n,d) generate a symmetric positive-definite 
% full Householder matrix A with respect to all-one vector. 
%
%  Input:
%  n: dimension of matrix
%  d: eigenvalues of matrix A
%
%  Output:
%  A: Householder matrix with respect to all-one vector and predetermined
%     eigenvalues
%  
%  Usage (example):
%  dim = 50; d = zeros(dim,1);
%  for i = 1:dim
%      d(i) = i/dim;
%  end
%  A = generate_full_matrix(dim,d);
%
%  Copyright: Wenhao Li, HongKong Baptist University
x = ones(1,n); % <- Reproducible
%x = (rand(1,n)<.5)*2 - 1; % <- Random
x = x./norm(x);
H = eye(n,n) - 2 * (x' * x);
D = diag(d);
A = H * D * H';