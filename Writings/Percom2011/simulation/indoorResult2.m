x=[7 8 9 10 11]
y1=[6.622 5.9993 6.6536 6.425 6.4036]
y=[5.9575 5.264 5.9743 5.8128 5.782]
plot(x, y, '-x', x, y1, '-*')
axis([6 12 0 16])
xlabel('Time', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('Opportunistic', 'TED')
grid on
%set(h, 'Box', 'on')
