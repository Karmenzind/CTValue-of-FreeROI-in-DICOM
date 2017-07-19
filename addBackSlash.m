function [ resstr ] = addBackSlash( str )

if ~isequal(str(length(str)), '\')
    resstr = [str '\'];
end

end