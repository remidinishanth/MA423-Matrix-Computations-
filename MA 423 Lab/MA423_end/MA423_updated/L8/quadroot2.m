function [ x1,x2 ] = quadroot2( a,b,c )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    d=sqrt(b.^2-4*a*c);
    x1 = (-b-sign(b)*d)/(2*a);
    x2 = c/(a*x1);
end

