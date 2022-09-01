%Velocity data above ballistic limit
xdata=[150,180,250]; %Striking Velocity
ydata=[45,102,184]; %Residual Velocity
%Jonas-Lambert Equation
jltheory=@(x,xdata)x(1)*(xdata.^(x(2))-x(3).^(x(2))).^(1/x(2));
lb=[0,1,70]; %Lower bounds for alpha, p, and V_0.
ub=[1,20,max(xdata)]; %Upper bounds
xo=[.9,2,80]; %Initial Guess for alpha, p, and V_0.
%Least Squares Curve Fit
[x,resnorm,residual,exitflag,output]=lsqcurvefit(jltheory,xo,xdata,ydata,lb,ub);
display(x)
display(resnorm)
display(residual)
display(exitflag)
display(output)
plot(xdata,ydata,'bo','MarkerSize',8,'MarkerFaceColor','r','LineWidth',1.5)
hold on
fplot(@(vi) x(1)*(vi.^x(2)-x(3)^x(2)).^(1/x(2)))
hold on 
AI=[150,180,250,300,400,500]
AR=[101.7,130.9,191.56,234.73,319.73,403]
plot(AI,AR,'k','Marker','d','LineWidth',1.5)
hold off
xlabel('Striking velocity (m/s)',"Color",'k','FontName','Times New Roman','FontWeight','normal', 'FontSize',12)
ylabel('Residual velocity (m/s)',"Color",'k','FontName','Times New Roman','FontWeight','normal', 'FontSize',12)
lgd = legend({'Experimental data[24,25]','Lambert Jonas curve','Hashin(Ansys)model-present work'},'Location','northeast','Orientation','vertical','FontName','Times New Roman','FontSize',10,"Box","off")
H=gca;
H.LineWidth=1.5;
H.FontName='Times New Roman';
H.FontSize=12;

