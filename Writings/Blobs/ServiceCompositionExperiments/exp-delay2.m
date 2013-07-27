x = [5 10 15 20 25 30]
y1 = [2.26 3.530375 4.5365 5.2345625 5.89 6.87]
y2 = [4.89 5.9901875 6.97575 7.719875 8.3554375 9.385]
plot(x, y1, '-*', x, y2, '-o')
axis([0 35 0 10])
xlabel('Number of requests', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('LaSeC', 'CEN')
%set(h, 'Box', 'on')

