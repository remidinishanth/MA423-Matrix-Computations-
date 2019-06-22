function [ x1,x2 ] = quadroot1( a,b,c )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    d = sqrt(b^2-4*a*c);
    x1 = (-b+d)/(2*a);
    x2 = (-b-d)/(2*a);
end

