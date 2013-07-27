x=[7 8 9 10 11]
y1=[19.3686 22.5126 31.1857 28.228 25.2813 ]
y=[14.6256 19.206 28.505 27.4464 24.8523]
plot(x, y, '-x', x, y1, '-*')
axis([6 12 0 40])
xlabel('Time', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('Opportunistic', 'TED')
grid on
%set(h, 'Box', 'on')
