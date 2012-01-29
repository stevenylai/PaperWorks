x=[5 10 15 20 25]
y=[93.047 92.579 91.737 91.217 90.991]
y1=[82.433 80.988 80.341 80.262 80.023]
y2=[74.53 73.255 72.203 71.959 71.535]
y3=[69.743 69.162 67.858 67.698 67.525]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([0 30 50 120])
xlabel('Event Size', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
grid on
