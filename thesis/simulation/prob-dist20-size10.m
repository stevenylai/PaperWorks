x=[20 30 40 50 60]
y=[	92.168	91.369	90.241	92.548	93.722	]
y1=[	30.264	37.014	44.529	51.021	57.357	]
y2=[	20.97	27.665	36.016	42.539	48.825	]
y3=[	16.772	23.08	31.679	38.148	44.238	]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E', 'Location', 'Best')
grid on
%set(h, 'Box', 'on')
