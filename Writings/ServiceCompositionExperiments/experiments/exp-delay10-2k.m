x = [5 10 15 20 25 30]
y1 = [1.26 2.530375 3.5365 4.2345625 4.89 5.87]
y2 = [2.26 2.930375 4.3365 5.1345625 5.19 6.27]
y3 = [2.89 3.9901875 4.97575 5.719875 6.3554375 7.385]
plot(x, y1, '-*', x, y2, '-x', x, y3, '-o')
axis([0 35 0 10])
xlabel('Number of requests', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('LaSeC(k=4)', 'LaSeC(k=2)', 'CEN')
%set(h, 'Box', 'on')

