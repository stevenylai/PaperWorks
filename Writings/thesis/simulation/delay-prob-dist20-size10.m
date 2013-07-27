x = [20 30 40 50 60]
y = [4.43 4.52 4.74 5.15 5.15]
y1 = [9.69 9.7001875 10.97575 11.419875 12.0554375]
y2 = [2.66 3.830375 4.9365 5.6345625 6.39]
y3 = [2.76 4.030375 5.1365 5.5345625 6.49]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 14])
xlabel('Event probablity', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')

