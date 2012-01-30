x=[7 8 9 10 11]
y=[19.3686 22.5126 31.1857 28.228 25.2813 ]
y1=[14.6256 19.206 28.505 27.4464 24.8523]
y2=[13.8256 18.306 27.705 26.8464 23.0523]
plot(x, y, '-x', x, y1, '-*', x, y2, '-s')
axis([6 12 0 40])
xlabel('Time', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('Opportunistic', 'TED', 'ITS')
grid on
%set(h, 'Box', 'on')
