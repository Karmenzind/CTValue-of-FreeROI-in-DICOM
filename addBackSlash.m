function [ resstr ] = addBackSlash( str )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if ~isequal(str(length(str)), '\')
    resstr = [str '\'];
end

end