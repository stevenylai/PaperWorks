clear all
close all
r =10;
lower_curvature_interp(:,1) = [0.00011;
                           0.00012;
                           -0.0058;
                            -0.0010;
                            0.00038;
                            0.00062;
                           -0.00012;
                           -0.00049;
                            0.00083;
                            0.00091;
                            0.001;
                            0.00017];
                 y(:,1) = interp(lower_curvature_interp(:,1),r);          
lower_curvature_interp(:,2) = [0.00029;
                           0.00033;
                           0.0045;
                            0.0041;
                           0.0038;
                           0.0016;
                           -0.001;
                           -0.0021;
                           -0.0012;
                           -0.0019;
                           -0.0023;
                           -0.0017];
                        y(:,2) = interp(lower_curvature_interp(:,2),r);  
Color ={'r','g'};
Type =['+','o'];
for ii=1:2
    plot([1:120],y(:,ii),'color',Color{ii},'LineWidth',2); hold on
end
legend('Mode1(4.12Hz)','Mode2(21.4Hz)');
title('Mode Shape Curvatures of Lower Side Sensor Nodes','FontWeight','bold','FontSize',12,...
    'FontName','Times New Roman');
% set(gca, 'XTick', [x_interp(2:end-1)]);
grid;
xlabel('Sensor #','FontWeight','bold','FontSize',12,...
    'FontName','Times New Roman');
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10','11','12'});