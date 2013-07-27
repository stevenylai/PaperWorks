x=[30 50 70 90]
y=[92.264 93.411 92.39 92.821]
y1=[38.15 50.274 61.982 75.004]
y2=[28.457 41.644 53.654 66.794]
y3=[24.275 37.582 49.262 62.529]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([20 100 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-R', 'TED-E', 'TED-C')
%set(h, 'Box', 'on')
