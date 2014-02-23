x = [5 10 15 20 25 30]
y1 = [2.26 3.530375 4.5365 5.2345625 5.89 6.87]
y2 = [3.26 4.530375 5.5365 6.2345625 6.89 7.87]
y3 = [4.89 5.9901875 6.97575 7.719875 8.3554375 9.385]
plot(x, y1, '-*', x, y2, '-x', x, y3, '-o')
axis([0 35 0 10])
xlabel('Number of requests', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('LaSeC(k=4)', 'LaSeC(k=2)', 'CEN')
%set(h, 'Box', 'on')

