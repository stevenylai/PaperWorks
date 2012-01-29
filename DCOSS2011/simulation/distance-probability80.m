x=[10 20 30 40]
y=[89.886 90.286 92.104 92.528]
y1=[68.603 69.527 69.868 69.377]
y2=[60.289 60.666 61.598 61.052]
plot(x, y, '-x', x, y1, '-*', x, y2, '-o')
axis([0 60 10 120])
xlabel('Event Distribution', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'TED-R', 'TED-E')
%set(h, 'Box', 'on')
