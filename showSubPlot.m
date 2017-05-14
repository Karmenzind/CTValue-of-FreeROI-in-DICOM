function [XData, YData] = showSubPlot(h_proc)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

figure
% subplot 211
h = h_proc; % Draw your doodle here
hc = get(h,'Children');
XData = []; YData = [];
for ii=1:length(hc)
  x = get(hc(ii),'XData');
  y = get(hc(ii),'YData');
  XData = [XData; x(:)];
  YData = [YData; y(:)];
end
subplot 
plot(XData,YData)

% disp(XData);
% disp(YData);
% for m = 1:length(XData)
%     disp XData(m);
% end
% for n = 1:length(YData)
%     YData(n);
% end
    

return

end

