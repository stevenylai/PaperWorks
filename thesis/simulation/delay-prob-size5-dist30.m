x = [20 30 40 50 60]
y = [4.83 4.82 5.04 5.65 5.45]
y1 = [10.09 10.7901875 11.27575 11.919875 12.4554375]
y2 = [3.06 4.330375 5.3365 6.0345625 6.69]
y3 = [3.16 4.430375 5.4365 5.9345625 6.79]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([10 70 0 14])
xlabel('Event probablity', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
grid on
%set(h, 'Box', 'on')

