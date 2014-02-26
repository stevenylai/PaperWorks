x = [5 10 15 20 25 30];
y1 = [11.2343 14.1215 17.146 20.93825 21.56 24.7890];
y2 = [6.0231 6.96075 9.903 10.8795 11.42175 13.4523];
y3 = [7.0231 7.76075 12.903 12.8795 13.02175 15.0523];
plot(x, y1, '-*', x, y2, '-o', x, y3, '-x')
axis([0 35 0 30])
xlabel('Number of requests', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('CEN', 'LaSeC(k=2)', 'LaSeC(k=4)')
%set(h, 'Box', 'on')

