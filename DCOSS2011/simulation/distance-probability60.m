x=[10 20 30 40]
y=[88.252 91.211 92.236 92.957]
y1=[54.818 57.048 56.324 56.853]
y2=[45.953 48.481 47.121 48.508]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o')
axis([0 60 10 120])
xlabel('Event Distribution', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
