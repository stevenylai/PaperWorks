x=[5 10 15 20 25]
y=[93.364 92.68 92.52 91.873 91.015]
y1=[81.939 81.771 81.07 80.852 80.746]
y2=[73.732 73.223 73.191 73.146 72.682]
y3=[69.548 69.398 69.353 69.156 68.751]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([0 30 50 120])
xlabel('Event Size', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')


