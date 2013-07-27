x=[7 8 9 10 11]
y=[7.1887 11.4499 16.4206 12.5746 7.3989 ]
y1=[6.3054 10.3953 14.3689 10.4219 6.4079]
y2=[5.8256 9.306 13.705 9.8464 5.0523]
plot(x, y, '-x', x, y1, '-*', x, y2, '-s')
axis([6 12 0 20])
xlabel('Time', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('Opportunistic', 'TED', 'ITS')
grid on
%set(h, 'Box', 'on')
