x=[10 15 20 25]
y1=[10.1215 14.146 16.93825 19.56]
y2=[7.96075 11.903 14.8795 17.42175]
plot(x, y1, '-*', x, y2, '-o')
axis([0 35 0 30])
xlabel('Size of SCP', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('LaSeC', 'CEN')
%set(h, 'Box', 'on')

