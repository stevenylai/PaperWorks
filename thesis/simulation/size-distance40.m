x=[5 10 15 20 25]
y=[93.384 92.541 91.514 91.301 89.585]
y1=[82.64 81.712 80.515 81.128 79.348]
y2=[73.996 73.194 72.1 72.208 71.595]
y3=[70.055 69.062 68.218 68.246 67.877]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o', x, y3, '-s')
axis([0 30 50 120])
xlabel('Event Size', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-C', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
grid on
