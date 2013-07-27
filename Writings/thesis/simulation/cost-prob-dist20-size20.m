x=[20 30 40 50 60]
y=[	92.642	89.973	91.848	89.957	91.306	]
y1=[	31.327	37.058	44.261	48.828	55.725	]
y2=[	22.105	28.285	35.296	40.081	46.752	]
y3=[	17.836	23.787	31.037	35.85	42.638	]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E', 'Location', 'Best')
%set(h, 'Box', 'on')
grid on
