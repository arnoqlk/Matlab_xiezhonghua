%--------------------------------------------------------------------------
%  第3章  绘图与可视化
%--------------------------------------------------------------------------

%% examp3.1-1
h = line([0 1],[0 1]) 
get(h)

%% examp3.1-2
subplot(1, 2, 1); 
h1 = line([0 1],[0 1]) ;
text(0, 0.5, '未改变线宽') ;
subplot(1, 2, 2);
h2 = line([0 1],[0 1]) ;
set(h2, 'LineWidth', 3)
text(0, 0.5, '已改变线宽') ;

%% examp3.2-1
x = 0 : 0.25 : 2*pi;
y = sin(x);
plot(x, y, '-ro',...
              'LineWidth',2,...
              'MarkerEdgeColor','k',...
              'MarkerFaceColor',[0.49,  1,  0.63],...
              'MarkerSize',12)
xlabel('X');
ylabel('Y'); 

%% examp3.2-2
t = linspace(0,2*pi,60);
x = cos(t);
y = sin(t);
plot(t,x,':','LineWidth',2);
hold on;
plot(t,y,'r-.','LineWidth',3);
plot(x,y,'k','LineWidth',2.5);
axis equal;
xlabel('X');
ylabel('Y');
legend('x = cos(t)','y = sin(t)','单位圆','Location','NorthEast');

%% examp3.2-3
P = [3 1; 1 4]; 
r = 5;
[V, D] = eig(P);
a = sqrt(r/D(1));
b = sqrt(r/D(4));
t = linspace(0, 2*pi, 60);
xy = V*[a*cos(t); b*sin(t)];
plot(xy(1,:),xy(2,:), 'k', 'linewidth', 3);
h = annotation('textarrow',[0.606 0.65],[0.55 0.65]);
set(h, 'string','3x^2+2xy+4y^2 = 5', 'fontsize', 15);
h = title('这是一个椭圆曲线', 'fontsize', 18, 'fontweight', 'bold');
set(h, 'position', [-0.00345622 1.35769 1.00011]);
axis([-1.5 1.5 -1.2 1.7]);
xlabel('X');
ylabel('Y');

%% examp3.2-4
a = [-19.6749   22.2118    5.0905];
x = 0:0.01:1;
y = a(1)+a(2)/2*(x-0.17).^2+a(3)/4*(x-0.17).^4;
plot(x,y);
xlabel('X');
ylabel('Y = f(X)');
text('Interpreter','latex',...
	'String',['$$-19.6749+\frac{22.2118}{2}(x-0.17)^2'...
                '+\frac{5.0905}{4}(x-0.17)^4$$'],'Position',[0.05, -12],...
	'FontSize',12);

%% examp3.2-5
x = linspace(0,2*pi,60);
y = sin(x);
h = plot(x,y);
grid on;
set(h,'Color','k','LineWidth',2);
XTickLabel = {'0','pi/2','pi','3pi/2','2pi'};
set(gca,'XTick',[0:pi/2:2*pi],...
           'XTickLabel',XTickLabel,...
           'TickDir','out');
xlabel('0 \leq \Theta \leq 2\pi');
ylabel('sin(\Theta)'); 
text(8*pi/9,sin(8*pi/9),'\leftarrow sin(8\pi \div 9)',...
        'HorizontalAlignment','left')
axis([0 2*pi -1 1]);

%% examp3.2-6
x = normrnd(0, 1, 1000, 1);
hist(x, 20);
xlabel('样本数据');
ylabel('频数') ;
figure;
cdfplot(x);

%% examp3.2-7
subplot(3, 3, 1);
f = @(x)200*sin(x)./x;
fplot(f, [-20 20]);
title('y = 200*sin(x)/x');

subplot(3, 3, 2);
ezplot('x^2 + y^2 = 1', [-1.1 1.1]);
axis equal;
title('单位圆');

subplot(3, 3, 3);
ezpolar('1+cos(t)');
title('心形图');

subplot(3, 3, 4);
x = [10  10  20  25  35];
name = {'赵', '钱', '孙', '李', '谢'};
explode = [0 0 0 0 1];
pie(x, explode, name)
title('饼图');

subplot(3, 3, 5);
stairs(-2*pi:0.5:2*pi,sin(-2*pi:0.5:2*pi)); 
title('楼梯图');

subplot(3, 3, 6);
stem(-2*pi:0.5:2*pi,sin(-2*pi:0.5:2*pi));
title('火柴杆图');

subplot(3, 3, 7);
Z = eig(randn(20,20));
compass(Z); 
title('罗盘图');

subplot(3, 3, 8); 
theta = (-90:10:90)*pi/180; 
r = 2*ones(size(theta));
[u,v] = pol2cart(theta,r);
feather(u,v);
title('羽毛图');

subplot(3, 3, 9); 
t = (1/16:1/8:1)'*2*pi;
fill(sin(t), cos(t),'r');
axis square;   title('八边形');

%% examp3.3-1
t = linspace(0, 10*pi, 300);
plot3(20*sin(t), 20*cos(t), t, 'r', 'linewidth', 2);
hold on
quiver3(0,0,0,1,0,0,25,'k','filled','LineWidth',2);
quiver3(0,0,0,0,1,0,25,'k','filled','LineWidth',2);
quiver3(0,0,0,0,0,1,40,'k','filled','LineWidth',2);
grid on
xlabel('X'); ylabel('Y'); zlabel('Z');
axis([-25 25 -25 25 0 40]); 
view(-210,30);

%% examp3.3-2
[x,y] = meshgrid(1:4, 2:5)
plot(x, y, 'r',x', y', 'r', x, y, 'k.','markersize',18);
axis([0 5 1 6]);
xlabel('X');  ylabel('Y');

%% examp3.3-3
[X,Y] = meshgrid(-2:.2:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,0.2,0.2);
contour(X,Y,Z) ;
hold on ;
quiver(X,Y,DX,DY) ;
h = get(gca,'Children');
set(h, 'Color','k');

%% examp3.3-4
t = linspace(-pi,pi,20);
[X, Y] = meshgrid(t);
Z = cos(X).*sin(Y);

subplot(2, 2, 1);
mesh(X, Y, Z); 
title('mesh');

subplot(2, 2, 2);
surf(X, Y, Z);
alpha(0.5);
title('surf'); 

subplot(2, 2, 3);
surfl(X, Y, Z);
title('surfl');

subplot(2, 2, 4);
surfc(X, Y, Z);
title('surfc'); 

%% examp3.3-5
% 绘制圆柱面
subplot(2,2,1);
[x,y,z] = cylinder;
surf(x,y,z);
title('圆柱面')

% 绘制哑铃面
subplot(2,2,2);
t = 0:pi/10:2*pi;
[X,Y,Z] = cylinder(2+cos(t));
surf(X,Y,Z);
title('哑铃面')

% 绘制球面，半径为10，球心 (1,1,1)
subplot(2,2,3); 
[x,y,z] = sphere;
surf(10*x+1,10*y+1,10*z+1);
axis equal;
title('球面') 

% 绘制椭球面
subplot(2,2,4);
a=4;
b=3;
t = -b:b/10:b;
[x,y,z] = cylinder(a*sqrt(1-t.^2/b^2),30);
surf(x,y,z);
title('椭球面')

%% examp3.3-6
% 调用ezsurf函数绘制参数方程形式的螺旋面,并设置参数取值范围
ezsurf('u*sin(v)','u*cos(v)', '4*v',[-2*pi,2*pi,-2*pi,2*pi])
axis([-7 7 -7 7 -30 30]);

%% examp3.3-7
% 饼图
subplot(2,3,1);
pie3([2347,1827,2043,3025]);
title('三维饼图');

% 柱状图
subplot(2,3,2);
bar3(magic(4));
title('三维柱状图');

% 火柴杆图
subplot(2,3,3);
y=2*sin(0:pi/10:2*pi);
stem3(y);
title('三维火柴杆图');

% 填充图
subplot(2,3,4);
fill3(rand(3,5),rand(3,5),rand(3,5), 'y' );
title('三维填充图');

% 三维向量场图
subplot(2,3,5); 
[X,Y] = meshgrid(0:0.25:4,-2:0.25:2);
Z = sin(X).*cos(Y);
[Nx,Ny,Nz] = surfnorm(X,Y,Z);
surf(X,Y,Z);
hold on;
quiver3(X,Y,Z,Nx,Ny,Nz,0.5);
title('三维向量场图');
axis([0 4 -2 2 -1 1]);

% 立体切片图（四维图）
subplot(2,3,6);
t = linspace(-2,2,20);
[X,Y,Z] = meshgrid(t,t,t);
V = X.*exp(-X.^2-Y.^2-Z.^2);    
xslice = [-1.2,.8,2];
yslice = 2;
zslice = [-2,0];
slice(X,Y,Z,V,xslice,yslice,zslice);
title('立体切片图（四维图）');

%% examp3.3-8
figure;
[X,Y,Z] = sphere;
surf(X,Y,Z); 
colormap(lines);
shading interp
hold on; 
mesh(2*X,2*Y,2*Z)
hidden off 
axis equal 
axis off

figure; 
surf(X,Y,Z,'FaceColor','r'); 
hold on; 
surf(2*X,2*Y,2*Z,'FaceAlpha',0.4);
axis equal
axis off

%% examp3.3-9
t=0:pi/20:2*pi;
[x,y,z]= cylinder(2+sin(t),100);
surf(x,y,z);
xlabel('X'); ylabel('Y'); zlabel('Z');
set(gca,'color','none');
set(gca,'XColor',[0.5 0.5 0.5]);
set(gca,'YColor',[0.5 0.5 0.5]);
set(gca,'ZColor',[0.5 0.5 0.5]);
shading interp;
colormap(copper);
light('Posi',[-4 -1 0]); 
lighting phong;
material metal; 
hold on;
plot3(-4,-1,0,'p','markersize', 18);
text(-4,-1,0,'光源','fontsize',14,'fontweight','bold');

%% examp3.3-10--------------------------------------------------------------
vert = [0 0 0;0 200 0;200 200 0;200 0 0;0 0 100;...
           0 200 100;200 200 100;200 0 100];
fac = [1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];
view(3);
h = patch('faces',fac,'vertices',vert,'FaceColor','g');
set(h,'FaceAlpha',0.25);
hold on;
[x0,y0,z0] = sphere;
x = 30 + 30*x0; y = 50 + 30*y0; z = 50 + 30*z0;
h1 = surf(x,y,z,'linestyle','none','FaceColor','r','EdgeColor','none');
x = 110 + 30*x0; y = 110 + 30*y0; z = 50 + 30*z0;
h2 = surf(x,y,z,'linestyle','none','FaceColor','b','EdgeColor','none');
x = 110 + 30*x0; y = 30 + 30*y0; z = 50 + 30*z0;
h3 = surf(x,y,z,'linestyle','none','FaceColor','y','EdgeColor','none');
lightangle(45,30);
lighting phong;
axis equal;
xlabel('X'); ylabel('Y'); zlabel('Z');

%% examp3.4-1
x = 0 : 0.25 : 2*pi; 
y = sin(x); 
plot(x, y);
hgexport(gcf,'-clipboard');

%% examp3.4-2
x = 0 : 0.25 : 2*pi; 
y = sin(x); 
h = plot(x, y);
saveas(h,'xiezhh.jpg');

%% examp3.4-3
x = 0 : 0.25 : 2*pi;
y = sin(x);
h = plot(x, y);
print; 
print -dmeta
print -djpeg heping.jpg

%% examp3.5-1
t = linspace(0,10*pi,2000);
x = t.*cos(t);
y = t.*sin(t);
comet(x,y);

%% examp3.5-2
t = linspace(0, 10*pi, 2000);
x = 20*sin(t);
y = 20*cos(t); 
z = t;
comet3(x,y,z)

%% examp3.5-3
sphere;
axis equal; 
axis off;
spinmap(20,1);

%% examp3.5-4
x = linspace(-2,2,100);
[X,Y,Z] = meshgrid(x,x,x); 
V = (X.^2+9/4*Y.^2+Z.^2-1).^3-X.^2.*Z.^3-9/80*Y.^2.*Z.^3; 
p = patch(isosurface(X,Y,Z,V,0));
set(p, 'FaceColor', 'red', 'EdgeColor', 'none');
view(3);
axis equal ; 
axis off; 
light('Posi',[0 -2 3]);
lighting phong
set(gca,'nextplot','replacechildren');
XX = get(p,'XData');
YY = get(p,'YData');
ZZ = get(p,'ZData');

for j = 1:20 
    bili = sin(pi*j/20);
	set(p,'XData',bili*XX,'YData',bili*YY,'ZData',bili*ZZ)    
    F(j) = getframe;
end
movie(F,10)

%% examp3.5-5
mov = avifile('旋转面.avi'); 
y = 1:0.01:2;
z = 3*(y-2).^2;
x = zeros(size(y));
theta = [pi/2,pi/2:pi/20:2.5*pi];
figure;
h = plot3(x,y,z,'k','LineWidth',2);
hold on
quiver3(0,0,0,1,0,0,3,'k','filled','LineWidth',2);
quiver3(0,0,0,0,1,0,3,'k','filled','LineWidth',2);
quiver3(0,0,0,0,0,1,4,'k','filled','LineWidth',2);
text(0,-0.5,4,'Z')
text(0,3.2,0.3,'Y')
text(3.2,0,0.3,'X')
axis equal
axis([-2,2,-2,2,0,4])
axis off
view(145,30);
title('空间曲线绕Z轴生成旋转面','fontsize',12,'fontweight','bold')

for i = 1:length(theta)-1
    [r,alpha1] = meshgrid(y,linspace(theta(i),theta(i+1),10));
    zz = repmat(z,10,1);
    xx = r.*cos(alpha1);
    yy = r.*sin(alpha1);
    surf(xx,yy,zz);
    shading interp
    set(h,'XData',xx(end,:),'YData',yy(end,:),'ZData',zz(end,:))
    drawnow;
    pause(0.05)
    F = getframe(gcf);
    mov = addframe(mov,F);
end
hold off
mov = close(mov);

%% examp3.5-6
filename = 'Ball.gif';
t = linspace(0, 10*pi, 100);
x = [20*sin(t),zeros(1,10)];
y = [20*cos(t),20*ones(1,10)];
z = [t,linspace(10*pi,0,10)];
plot3(x, y, z, 'r', 'linewidth', 2);
hold on
h = plot3(0,20,0, '.' , 'MarkerSize' ,40, 'EraseMode' , 'xor' );
xlabel('X'); ylabel('Y'); zlabel('Z');
axis([-25 25 -25 25 0 40]);
view(-210,30);

for i = 1:length(x)
    set(h, 'xdata' ,x(i), 'ydata' ,y(i), 'zdata' ,z(i));     
    drawnow; 
    pause(0.05)  
    f = getframe(gcf); 
    [IM,map] = frame2im(f);
    if isempty(map)
        [IM,map] = rgb2ind(IM,256);
    end
    if i == 1
        imwrite(IM,map,filename,'gif', 'Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(IM,map,filename,'gif','WriteMode','append','DelayTime',0.1);
    end
end