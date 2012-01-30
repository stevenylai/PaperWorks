x=[10 20 30 40]
y=[90.411 92.2 92.207 91.932]
y1=[41.837 46.44 44.603 44.74]
y2=[32.732 37.121 35.389 35.982]
y3=[27.952 32.594 31.175 31.676]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([0 60 10 120])
xlabel('Event Distribution', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-R', 'TED-E', 'TED-C')
%set(h, 'Box', 'on')
