function [Im,theta,tau,T] = Lanczos_Quadrature(A, u, m, n)
%LANCZOS_QUADRATURE(A, u, m, n) computes a symmetric tridiagonal matrix by 
% Lanczos iteration.
%
%  Input:
%  A: positive semi-definite matrix
%  u: initial vector
%  m: Lanczos iteration steps
%  n: dimension of u and A
%
%  Ouput:
%  Im: the value of quadratic form u'log(A)u
%  theta: Gaussian quadrature nodes
%  tau: Gaussian quadrature weights
%  T: symmetric tridiagonal matrix
%
%  Usage (example):
%  A = gallery('wathen',10,10); u = ones(length(A),1); 
%  T = Lanczos(A,u,100);
%
%  Copyright: Shengxin Zhu, Beijing Normal University
alpha = zeros(m,1);
beta = zeros(m+1,1);
xold = zeros(n,1);
normu = norm(u);
x = u./normu;
for i = 1:m
    y = A*x;
    alpha(i) = dot(x,y);
    eta = y - alpha(i)*x - beta(i)*xold;
    beta(i+1) = norm(eta,2);
    if(beta(i+1) == 0) 
        break; 
    end
    xold = x;
    x = eta/beta(i+1);
end
% Obtain symmetric tridiagonal matrix T.
T = diag(alpha) + diag(beta(2:end-1),1) + diag(beta(2:end-1),-1);

[V,D] = eig(T);
theta = diag(D);
tau = V(1,:).^2;
Im = tau*exp(theta)*normu^2;