x=[20 30 40 50 60]
y=[	90.825	88.749	91.153	90.708	90.361	]
y1=[	32.727	37.429	42.991	50.352	57.007	]
y2=[	22.735	28.348	33.691	40.308	48.678	]
y3=[	18.08	23.78	29.179	35.813	43.983	]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E', 'Location', 'Best')
%set(h, 'Box', 'on')
grid on
