function [] = getInsidexy( h_proc )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mask = h_proc.createMask();
% [y,x] = find(mask);
[y, x] = find(mask);
% global x;
% x = tmp;
display([y,x]);
end

