x = [20 30 40 50 60]
y = [4.43 4.42 4.64 5.25 5.25]
y1 = [9.79 9.8001875 10.87575 11.319875 12.1554375]
y2 = [2.56 3.730375 4.9465 5.5345625 6.49]
y3 = [2.66 4.130375 5.2365 5.4345625 6.59]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 14])
xlabel('Event probablity', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')

