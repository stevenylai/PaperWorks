x = [20 30 40 50 60]
y = [2.13 3.12 4.14 4.75 6.55]
y1 = [4.79 6.9801875 8.87575 10.619875 12.4554375]
y2 = [2.16 3.430375 4.4365 5.1245625 6.79]
y3 = [2.26 3.530375 4.5365 5.0355625 6.89]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 14])
xlabel('Event distance', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')

