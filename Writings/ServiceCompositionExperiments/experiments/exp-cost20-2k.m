x = [5 10 15 20 25 30];
y1 = [12.2343 17.1215 20.146 23.93825 25.56 27.7890];
y2 = [8.0231 8.96075 11.903 12.8795 13.42175 15.4523];
y3 = [9.0231 10.06075 13.503 14.2795 14.42175 16.4523];
plot(x, y1, '-*', x, y2, '-o', x, y3, '-x')
axis([0 35 0 30])
xlabel('Number of requests', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('CEN', 'LaSeC(k=2)', 'LaSeC(k=4)')
%set(h, 'Box', 'on')

