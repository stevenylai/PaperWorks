x=[7 8 9 10 11]
y=[7.2981 6.8199 7.1688 6.8956 6.9182]
y1=[6.2664 6.0081 6.1214 6.169 6.2172]
plot(x, y, '-x', x, y1, '-*')
axis([6 12 0 16])
xlabel('Time', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('Opportunistic', 'TED')
grid on
%set(h, 'Box', 'on')
