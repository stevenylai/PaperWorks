x=[20 30 40 50 60]
y=[	91.332	92.562	91.147	90.51	91.803	]
y1=[	32.421	38.202	43.817	52.086	57.229	]
y2=[	23.587	29.002	35.109	42.892	48.268	]
y3=[	19.193	24.695	30.489	38.275	43.898	]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E', 'Location', 'Best')
%set(h, 'Box', 'on')
grid on
