function [] = getInsidexy( h_proc )

mask = h_proc.createMask();
[y, x] = find(mask);
display([y,x]);

end

