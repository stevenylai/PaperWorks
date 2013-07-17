x = [20 30 40 50 60]
y = [4.03 4.02 4.24 4.85 4.65]
y1 = [8.89 8.9901875 8.97575 8.719875 8.3554375]
y2 = [2.26 3.530375 4.5365 5.2345625 5.89]
y3 = [2.36 3.630375 4.6365 5.1345625 5.99]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 12])
xlabel('Event probablity', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')

