function [XData, YData] = showSubPlot(h_proc)

figure

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

return

end

