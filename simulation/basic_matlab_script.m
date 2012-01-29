x=[]
y=[]
y1=[]
y2=[]
y3=[]
y4=[]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s',  x, y4, '-d')
axis([10 70 0 100])
xlabel('Event Distance', 'fontsize',12)
ylabel('Cost','fontsize',12)
legend('SPT', 'CEDU-1', 'CEDU-2', 'CEDU-3', 'CEDU-4', 'Location', 'Best')
%set(h, 'Box', 'on')
