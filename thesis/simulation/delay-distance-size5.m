x = [20 30 40 50 60]
y = [2.03 3.02 4.24 4.85 6.65]
y1 = [4.89 6.9901875 8.97575 10.719875 12.3554375]
y2 = [2.26 3.530375 4.5365 5.2345625 6.89]
y3 = [2.36 3.630375 4.6365 5.1345625 6.99]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 14])
xlabel('Event distance', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')

