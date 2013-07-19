x=[10 20 30 40 50]
y=[90.34 91.58 90.344 93.722 93.327]
y1=[79.853 82.168 80.49 83.189 81.322]
y2=[72.284 73.15 71.83 74.071 73.526]
y3=[67.836 68.549 67.625 69.462 69.494]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([0 60 50 120])
xlabel('Event Distance', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
grid on
