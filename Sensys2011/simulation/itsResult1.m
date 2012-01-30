x=[7 8 9 10 11]
y=[7.1887 11.4499 16.4206 12.5746 7.3989 ]
y1=[6.3054 10.3953 14.3689 10.4219 6.4079]
plot(x, y, '-x', x, y1, '-*')
axis([6 12 0 20])
xlabel('Time', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('Opportunistic', 'TED')
grid on
%set(h, 'Box', 'on')
