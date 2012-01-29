x=[30 50 70 90]
y=[92.14 92.787 92.089 91.856]
y1=[37.071 52.218 62.702 75.111]
y2=[27.803 43.3 53.996 66.321]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o')
axis([20 100 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
