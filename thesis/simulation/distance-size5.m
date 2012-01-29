x=[10 20 30 40 50]
y=[89.776 92.464 94.022 93.032 94.376]
y1=[79.874 81.566 82.452 82.363 82.419]
y2=[71.387 73.298 73.816 74.176 75.081]
y3=[67.126 68.812 69.499 70.065 70.998]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([0 60 50 120])
xlabel('Event Distance', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')
