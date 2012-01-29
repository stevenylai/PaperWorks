x=[20 30 40 50 60]
y=[	88.96	92.912	88.808	92.038	91.771	]
y1=[	31.968	39.51	42.884	50.274	56.349	]
y2=[	22.324	30.163	34.231	41.517	47.664	]
y3=[	17.667	25.653	29.672	37.094	43.236	]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 100])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E', 'Location', 'Best')
%set(h, 'Box', 'on')
grid on
