x=[31 52 69 89]
y1=[2.530375 3.5365 4.2345625 4.89]
y2=[3.9901875 4.97575 5.719875 6.3554375]
plot(x, y1, '-*', x, y2, '-o')
axis([20 100 0 10])
xlabel('Event Probability', 'fontsize',12)
ylabel('Delay','fontsize',12)
legend('TED', 'Naive')
grid on
%set(h, 'Box', 'on')
