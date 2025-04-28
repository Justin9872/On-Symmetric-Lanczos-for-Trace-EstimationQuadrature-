function S = rademacher(m,n)
%RADEMACHER(m,n) generates a random Rademacher distributed matrix with size
% m*n.
%
%
%  Input: 
%  m: number of rows
%  n: number of columns
%
%  Output:
%  S: Rademacher matrix with m rows and n columns
%
%  Usage (example):
%  S = rademacher(50,1)
%
%  Copyright: Wenhao Li, HongKong Baptist University;
%             Shengxin Zhu, Beijing Normal University
S = ones(m,n);
odd = 0;
if mod(m,2)==0
    half = m/2;
else
    half = (m-1)/2;
    odd = 1;
end

for j = 1:n
    p = randperm(2*half,half);
    S(p,j) = -1;
end

if odd
    p = randperm(n,round(n/2));
    S(m,p) = -1;
end