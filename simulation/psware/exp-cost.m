x=[32 53 75 90]
y1=[10.1215 14.146 16.93825 19.56]
y2=[7.96075 11.903 14.8795 17.42175]
plot(x, y1, '-*', x, y2, '-o')
axis([20 100 0 30])
xlabel('Event Probability', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('Naive', 'TED')
grid on
%set(h, 'Box', 'on')
