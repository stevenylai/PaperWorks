x=[7 8 9 10 11]
y=[2.3873 3.0984 3.3923 2.8136 1.9045]
y1=[5.907324 9.287798 10.837441 8.526082 5.356769]
y2=[4.8256 8.306 9.705 7.8464 5.0523]
plot(x, y, '-x', x, y1, '-*', x, y2, '-s')
axis([6 12 0 20])
xlabel('Time', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('Opportunistic', 'TED', 'ITS')
grid on
%set(h, 'Box', 'on')
