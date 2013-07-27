x=[1 2 3 4 5]
y=[	92.894	90.787	89.385	87.271	89.686	]
y1=[	42.573	43.202	43.827	43.518	43.822	]
plot(x, y, '-x', x, y1, '-*')
axis([0 6 0 120])
xlabel('Time', 'fontsize',12)
ylabel('Message Cost','fontsize',12)
legend('SPT', 'PSWare')
%set(h, 'Box', 'on')
grid on
