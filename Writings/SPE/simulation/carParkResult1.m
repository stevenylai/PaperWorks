x=[7 8 9 10 11]
y=[7.1887 11.4499 16.4206 12.5746 7.3989 ]
y1=[6.3054 10.3953 14.3689 10.4219 6.4079]
y2=[5.6054 9.5953 13.7689 9.7219 5.8079]
plot(x, y, '-x', x, y1, '-*', x, y2, '-s')
axis([6 12 0 25])
xlabel('Time', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('Opportunistic', 'TED', 'ITS')
grid on
%set(h, 'Box', 'on')
