function [eps] = epsilon_flops(beta,t)
% [eps] = epsilon_flops(beta,t): Calcola epsilon macchina di un insieme floating point
%
% beta: base
% t: cifre significative
%
% eps: epsilon macchina

eps = beta ^ (1 - t);
end

