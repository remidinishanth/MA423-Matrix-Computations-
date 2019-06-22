function [ W ] = Wilk( n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    W = -tril(ones(n),-1)+eye(n);
    W(:,n)=ones(n,1);
end

