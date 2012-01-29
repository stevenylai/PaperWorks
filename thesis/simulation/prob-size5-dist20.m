x=[20 30 40 50 60]
y=[	92.901	91.887	90.517	90.959	91.662	]
y1=[	31.697	39.667	44.18	50.834	56.858	]
y2=[	22.582	30.03	34.865	41.881	47.975	]
y3=[	18.153	25.734	30.36	37.627	43.622	]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E', 'Location', 'Best')
%set(h, 'Box', 'on')
grid on
