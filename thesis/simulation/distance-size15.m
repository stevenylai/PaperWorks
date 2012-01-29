x=[10 20 30 40 50]
y=[	90.807	92.1	91.901	90.324	92.147	]
y1=[	79.725	80.322	81.669	80.425	81.028	]
y2=[	71.312	72.775	73.505	72.382	73.624	]
y3=[	66.977	68.545	69.17	68.018	69.916	]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([0 60 50 120])
xlabel('Event Distance', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
grid on
