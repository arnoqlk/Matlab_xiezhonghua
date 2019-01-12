%--------------------------------------------------------------------------
%             读取原始数据，调用nlinfit函数作一元非线性回归
%--------------------------------------------------------------------------

%***************************读取数据，绘制散点图*****************************
HeadData = xlsread('examp19_2_1.xls');
x = HeadData(:, 4);
y = HeadData(:, 9);
plot(x, y, 'k.')
xlabel('年龄(x)')
ylabel('头围(y)')


%***********************调用nlinfit函数作一元非线性回归**********************
HeadData = xlsread('examp19_2_1.xls');
HeadData = sortrows(HeadData, 4);
x = HeadData(:, 4);
y = HeadData(:, 9);
options = statset;
options.Robust = 'on';
[beta,r,J,COVB,mse] = nlinfit(x,y,@HeadCir1,[53,-0.2604,0.6276], options); 
%[beta,r,J,COVB,mse] = nlinfit(x,y,'HeadCir1',[53,-0.2604,0.6276],options);

%HeadCir2 = @(beta, x)beta(1)*exp(beta(2)./(x+beta(3)));
%[beta,r,J,COVB,mse] = nlinfit(x,y,HeadCir2,[53,-0.2604,0.6276],options);
beta
mse


%**************************绘制一元非线性回归曲线****************************
yhat = HeadCir1(beta, x);
figure
plot(x, y, 'k.')
hold on

plot(x, yhat, 'linewidth', 3)
xlabel('年龄(x)')
ylabel('头围(y)')
legend('原始数据散点','非线性回归曲线')


%**************************参数估计值的置信区间*****************************
ci1 = nlparci(beta, r, 'covar', COVB, 'alpha', 0.05) 

ci1 = nlparci(beta, r, 'jacobian', J, 'alpha', 0.05) 


%**************************绘制头围观测值的预测区间**************************
xx =[0:0.1:16]';

[ypred,delta] = nlpredci(@HeadCir1,xx,beta,r,'covar',COVB,'mse',mse, ...
                            'predopt','observation');

yup = ypred + delta;
ydown = ypred - delta;

figure
hold on
h1 = fill([xx; flipud(xx)],[yup; flipud(ydown)],[0.5,0.5,0.5]);
set(h1,'EdgeColor','none','FaceAlpha',0.5);

plot(xx,yup,'r--','LineWidth',2);
plot(xx,ydown,'b-.','LineWidth',2);
plot(xx, ypred, 'k','linewidth', 2)

grid on
ylim([32, 57])
xlabel('年龄(x)')
ylabel('头围(y)')
h2 = legend('预测区间','预测区间上限','预测区间下限','回归曲线');
set(h2, 'Location', 'SouthEast')