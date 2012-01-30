x=[30 50 70 90]
y=[93.446 92.206 94.516 94.011]
y1=[38.919 51.409 64.039 76.175]
y2=[29.482 41.891 54.85 67.841]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o')
axis([20 100 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
