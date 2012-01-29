x=[1 2 3 4 5]
y=[	42.037	42.557	42.378	40.2015	41.827	]
y1=[	44.311	46.092	44.083	42.244	42.831	]
plot(x, y, '-x', x, y1, '-*')
axis([0 6 20 60])
xlabel('Time', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('SPT', 'PSWare')
%set(h, 'Box', 'on')
grid on
